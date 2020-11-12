listen:
  address: :9130
  metricspath: /metrics
unifi:
  address: https://{{ controller_ip }}:8443
  username: metrics
  password: {{ unifi_password }}
  site: Default
  insecure: true
  timeout: 5s
