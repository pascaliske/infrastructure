# `uptime-kuma`

## Introduction

## Created Resources

| Kind                                | Name               |
| ----------------------------------- | ------------------ |
| [`Namespace`][ref-namespace]        | `uptime-kuma`      |
| [`HelmRelease`][ref-helm-release]   | `uptime-kuma`      |
| [`Certificate`][ref-certificate]    | `status.${DOMAIN}` |
| [`IngressRoute`][ref-ingress-route] | `dashboard`        |

[ref-namespace]: https://kubernetes.io/docs/reference/kubernetes-api/cluster-resources/namespace-v1/
[ref-helm-release]: https://fluxcd.io/docs/components/helm/helmreleases/
[ref-certificate]: https://cert-manager.io/docs/reference/api-docs/#cert-manager.io/v1.Certificate
[ref-ingress-route]: https://doc.traefik.io/traefik/routing/providers/kubernetes-crd/#kind-ingressroute

## Links

- [Documentation](https://github.com/louislam/uptime-kuma/wiki)
- [Helm Chart](https://charts.pascaliske.dev/charts/uptime-kuma/)
- [GitHub Repository](https://github.com/louislam/uptime-kuma)
