# `vaultwarden`

## Introduction

## Created Resources

| Kind                                | Name               |
| ----------------------------------- | ------------------ |
| [`Namespace`][ref-namespace]        | `vaultwarden`      |
| [`HelmRelease`][ref-helm-release]   | `vaultwarden`      |
| [`Certificate`][ref-certificate]    | `vault.${DOMAIN}`  |
| [`IngressRoute`][ref-ingress-route] | `dashboard`        |

[ref-namespace]: https://kubernetes.io/docs/reference/kubernetes-api/cluster-resources/namespace-v1/
[ref-helm-release]: https://fluxcd.io/docs/components/helm/helmreleases/
[ref-certificate]: https://cert-manager.io/docs/reference/api-docs/#cert-manager.io/v1.Certificate
[ref-ingress-route]: https://doc.traefik.io/traefik/routing/providers/kubernetes-crd/#kind-ingressroute

## Links

- [Documentation](https://github.com/dani-garcia/vaultwarden/wiki)
- [Helm Chart](https://github.com/k8s-at-home/charts/tree/master/charts/stable/vaultwarden)
- [GitHub Repository](https://github.com/dani-garcia/vaultwarden)
