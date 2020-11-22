version: '3.7'
services:
  # maintenance
  watchtower:
    image: containrrr/watchtower:latest
    container_name: watchtower
    restart: always
    environment:
      TZ: {{ timezone }}
      WATCHTOWER_SCHEDULE: '0 0 0 * * *'
      WATCHTOWER_CLEANUP: 'true'
      WATCHTOWER_NOTIFICATIONS: slack
      WATCHTOWER_NOTIFICATION_SLACK_HOOK_URL: {{ watchtower_slack_hook_url }}
      WATCHTOWER_NOTIFICATION_SLACK_IDENTIFIER: watchtower
      WATCHTOWER_NOTIFICATION_SLACK_CHANNEL: '#hosting'
      WATCHTOWER_DEBUG: '{{ watchtower_debug | default(false) }}'
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
  dozzle:
    image: amir20/dozzle:latest
    container_name: dozzle
    restart: always
    depends_on:
      - pihole
    ports:
      - 9001:8080
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
  portainer:
    image: portainer/portainer-ce:latest
    container_name: portainer
    restart: unless-stopped
    depends_on:
      - pihole
    command: -H unix:///var/run/docker.sock --no-analytics --ssl --sslcert /data/fullchain.pem --sslkey /data/privkey.pem
    ports:
      - '9000:9000'
      - '8000:8000'
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - portainer:/data

  # monitoring
  prometheus:
    image: prom/prometheus:latest
    container_name: prometheus
    restart: unless-stopped
    ports:
      - '9090:9090'
    environment:
      TZ: {{ timezone }}
    volumes:
      - prometheus:/prometheus
      - '{{ root_path }}/prometheus:/etc/prometheus'
    command:
      - '--config.file=/etc/prometheus/prometheus.yml'
      - '--storage.tsdb.path=/prometheus'
      - '--storage.tsdb.retention.time=168h'
      - '--web.enable-lifecycle'
    extra_hosts:
      - 'dockerhost:172.20.0.1'
  alertmanager:
    image: prom/alertmanager:latest
    container_name: alertmanager
    restart: unless-stopped
    depends_on:
      - prometheus
    expose:
      - 9093
    volumes:
      - '{{ root_path }}/alertmanager:/etc/alertmanager'
    command:
      - '--config.file=/etc/alertmanager/config.yml'
      - '--storage.path=/alertmanager'
  pushgateway:
    image: prom/pushgateway:latest
    container_name: pushgateway
    restart: unless-stopped
    depends_on:
      - prometheus
    expose:
      - 9091
  grafana:
    image: grafana/grafana:latest
    container_name: grafana
    restart: unless-stopped
    depends_on:
      - prometheus
    ports:
      - '3000:3000'
    environment:
      TZ: {{ timezone }}
      GF_SECURITY_ADMIN_USER: {{ grafana_user }}
      GF_SECURITY_ADMIN_PASSWORD: {{ grafana_password }}
      GF_USERS_ALLOW_SIGN_UP: 'false'
      GF_INSTALL_PLUGINS: grafana-piechart-panel
    volumes:
      - grafana:/var/lib/grafana
      - '{{ root_path }}/grafana/provisioning:/etc/grafana/provisioning'
  node-exporter:
    image: prom/node-exporter:latest
    container_name: node-exporter
    restart: unless-stopped
    expose:
      - 9100
    volumes:
      - /:/rootfs:ro
      - /proc:/host/proc:ro
      - /sys:/host/sys:ro
    command:
      - '--path.procfs=/host/proc'
      - '--path.rootfs=/rootfs'
      - '--path.sysfs=/host/sys'
      - '--collector.filesystem.ignored-mount-points=^/(sys|proc|dev|host|etc)($$|/)'
  unifi-exporter:
    image: golift/unifi-poller:latest
    container_name: unifi-exporter
    restart: unless-stopped
    depends_on:
      - unifi
    expose:
      - 9130
    volumes:
      - '{{ root_path }}/unifi-exporter/unifi-poller.conf:/config/unifi-poller.conf'
    extra_hosts:
      - 'dockerhost:172.20.0.1'
  pihole-exporter:
    image: ekofr/pihole-exporter:0.0.10
    container_name: pihole-exporter
    restart: unless-stopped
    depends_on:
      - pihole
    expose:
      - 9617
    environment:
      PIHOLE_HOSTNAME: pihole
      PIHOLE_PASSWORD: {{ pi_hole_password }}
  fritzbox-exporter:
    image: sealife/fritzbox-exporter:latest
    container_name: fritzbox-exporter
    restart: unless-stopped
    expose:
      - 8765
    environment:
      FRITZ_HOST: {{ router_ip }}
      FRITZ_USER: {{ fritzbox_user }}
      FRITZ_PASS: {{ fritzbox_password }}
  speedtest-exporter:
    image: shrunbr/speedtest-exporter-arm:latest
    container_name: speedtest-exporter
    restart: unless-stopped
    expose:
      - 9112

  # services
  unifi:
    image: ryansch/unifi-rpi:latest
    container_name: unifi
    restart: unless-stopped
    depends_on:
      - pihole
    network_mode: host
    volumes:
      - '{{ root_path }}/unifi/config:/var/lib/unifi'
      - '{{ root_path }}/unifi/log:/usr/lib/unifi/logs'
      - '{{ root_path }}/unifi/log2:/var/log/unifi'
      - '{{ root_path }}/unifi/run:/usr/lib/unifi/run'
      - '{{ root_path }}/unifi/run2:/run/unifi'
      - '{{ root_path }}/unifi/work:/usr/lib/unifi/work'
  pihole:
    image: pihole/pihole:latest
    container_name: pihole
    restart: unless-stopped
    depends_on:
      - cloudflared
    ports:
      - '53:53/tcp'
      - '53:53/udp'
      - '67:67/udp'
      - '80:80/tcp'
      - '443:443/tcp'
    environment:
      ServerIP: {{ controller_ip }}
      TZ: {{ timezone }}
      VIRTUAL_PORT: 80
      DNS1: 172.20.0.2#5053
      DNS2: 'no'
      DNS_FQDN_REQUIRED: 'true'
      WEBPASSWORD: {{ pi_hole_password }}
      CONDITIONAL_FORWARDING: 'true'
      CONDITIONAL_FORWARDING_IP: {{ router_ip }}
      CONDITIONAL_FORWARDING_DOMAIN: fritz.box
      PROXY_LOCATION: pihole
      WEBUIBOXEDLAYOUT: traditional
      TEMPERATUREUNIT: c
    volumes:
      - '{{ root_path }}/pihole/etc-pihole/:/etc/pihole/'
      - '{{ root_path }}/pihole/etc-dnsmasq.d/:/etc/dnsmasq.d/'
    dns:
      - 127.0.0.1
      - 1.1.1.1
    networks:
      default:
        ipv4_address: 172.20.0.3
    cap_add:
      - NET_ADMIN
  cloudflared:
    image: crazymax/cloudflared:latest
    container_name: cloudflared
    restart: unless-stopped
    ports:
      - '5053:5053/udp'
      - '49312:49312/tcp'
    environment:
      TZ: {{ timezone }}
      TUNNEL_DNS_UPSTREAM: https://1.1.1.1/dns-query,https://1.0.0.1/dns-query
    networks:
      default:
        ipv4_address: 172.20.0.2
  homeassistant:
    image: homeassistant/home-assistant:stable
    container_name: homeassistant
    restart: unless-stopped
    depends_on:
      - pihole
    network_mode: host
    environment:
      TZ: {{ timezone }}
    volumes:
      - /etc/localtime:/etc/localtime:ro
      - '{{ root_path }}/home-assistant:/config'
    devices:
      - /dev/ttyACM0:/dev/ttyACM0
networks:
  default:
    ipam:
      config:
        - subnet: 172.20.0.0/24
          gateway: 172.20.0.1
volumes:
  prometheus:
  grafana:
  portainer:
