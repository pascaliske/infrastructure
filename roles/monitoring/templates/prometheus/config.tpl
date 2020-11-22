global:
  scrape_timeout: 20s
  scrape_interval: 30s
  evaluation_interval: 30s

rule_files:
  - 'alert.rules'

scrape_configs:
  - job_name: prometheus
    static_configs:
      - targets: ['prometheus:9090']

  - job_name: pushgateway
    honor_labels: true
    static_configs:
      - targets: ['pushgateway:9091']

  - job_name: network/node
    static_configs:
      - targets: ['node-exporter:9100']

  - job_name: network/dockerhost
    static_configs:
      - targets: ['dockerhost:9323']

  - job_name: network/docker
    static_configs:
      - targets: ['cadvisor:8080']

  - job_name: network/cloudflared
    static_configs:
      - targets: ['cloudflared:49312']

  - job_name: network/unifi
    static_configs:
      - targets: ['unifi-exporter:9130']

  - job_name: network/pihole
    static_configs:
      - targets: ['pihole-exporter:9617']

  - job_name: network/fritzbox
    static_configs:
      - targets: ['fritzbox-exporter:8765']

  - job_name: network/speedtest
    scrape_interval: 5m
    scrape_timeout: 5m
    static_configs:
      - targets: ['speedtest-exporter:9112']

  - job_name: network/homeassistant
    metrics_path: /api/prometheus
    bearer_token: '{{ home_assistant_access_token }}'
    scheme: https
    tls_config:
      insecure_skip_verify: true
    static_configs:
      - targets: ['dockerhost:8123']

alerting:
  alertmanagers:
    - scheme: http
      static_configs:
        - targets: ['alertmanager:9093']
