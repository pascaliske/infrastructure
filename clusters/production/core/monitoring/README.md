# `monitoring`

This `Namespace` groups together all monitoring related resources. [`kube-prometheus-stack`](https://github.com/prometheus-operator/kube-prometheus) and the [Prometheus Operator](https://github.com/prometheus-operator/prometheus-operator) represent the base of the entire monitoring stack and scrape all targets regularly. [Grafana](https://grafana.com/grafana/) is used to visualize those scraped data in multiple application-specific dashboards.

![Visualization of monitoring flow](/assets/monitoring-flow.jpg){ loading=lazy }

The following resources belong to this `Namespace` and are deployed in alphabetical order:

- [`fritzbox-exporter`](/cluster/services/monitoring/fritzbox-exporter/)
- [`kube-prometheus-stack`](/cluster/services/monitoring/kube-prometheus-stack/)
- [`loki`](/cluster/services/monitoring/loki/)
- [`magicmirror`](/cluster/services/monitoring/magicmirror/)
- [`minio`](/cluster/services/monitoring/minio/)
- [`redis-exporter`](/cluster/services/monitoring/redis-exporter/)
- [`speedtest-exporter`](/cluster/services/monitoring/speedtest-exporter/)
- [`unifi-poller`](/cluster/services/monitoring/unifi-poller/)
- [`vector`](/cluster/services/monitoring/vector/)
