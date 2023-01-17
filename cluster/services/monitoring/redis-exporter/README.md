# `redis-exporter`

## Introduction

This exporter extracts analytics data from [Redis](/cluster/services/redis/) and provides that as Prometheus readable metrics.

## Created Resources

| Kind                              | Name                        |
| --------------------------------- | --------------------------- |
| [`HelmRelease`][ref-helm-release] | `prometheus-redis-exporter` |

[ref-helm-release]: https://fluxcd.io/docs/components/helm/helmreleases/

## Links

- [GitHub Repository](https://github.com/oliver006/redis_exporter)
- [Helm Chart](https://github.com/prometheus-community/helm-charts/tree/main/charts/prometheus-redis-exporter)
