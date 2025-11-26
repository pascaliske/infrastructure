# `speedtest-exporter`

## Introduction

This exporter runs an internet speed test every time Prometheus scrapes it. The speed test is performed by the well known [speedtest.net](https://www.speedtest.net) by Ookla.

## Created Resources

| Kind                              | Name                         |
| --------------------------------- | ---------------------------- |
| [`HelmRelease`][ref-helm-release] | `speedtest-exporter`         |
| [`ConfigMap`][ref-config-map]     | `grafana-dashboard-internet` |

[ref-helm-release]: https://fluxcd.io/docs/components/helm/helmreleases/
[ref-config-map]: https://kubernetes.io/docs/reference/kubernetes-api/config-and-storage-resources/config-map-v1/

## Links

- [Documentation](https://docs.miguelndecarvalho.pt/projects/speedtest-exporter/)
- [GitHub Repository](https://github.com/MiguelNdeCarvalho/speedtest-exporter/)
- [Helm Chart](https://github.com/k8s-at-home/charts/tree/master/charts/stable/speedtest-exporter)
