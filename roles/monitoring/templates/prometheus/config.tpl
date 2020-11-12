global:
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

  - job_name: network/cloudflared
    static_configs:
      - targets: ['cloudflared:49312']

  - job_name: network/unifi
    static_configs:
      - targets: ['unifi-exporter:9130']

  - job_name: network/pihole
    static_configs:
      - targets: ['pihole-exporter:9617']

alerting:
  alertmanagers:
    - scheme: http
      static_configs:
        - targets: ['alertmanager:9093']
