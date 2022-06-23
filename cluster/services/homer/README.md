# `homer`

## Introduction

Every homelab needs its own dashboard! I chose `homer` because it has a clean and minimal user interface and is completely stateless, making it a perfect solution for my cluster.

![Demo dashboard](https://raw.github.com/bastienwirtz/homer/main/docs/screenshot.png){ loading=lazy }

## Created Resources

| Kind                                | Name           |
| ----------------------------------- | -------------- |
| [`Namespace`][ref-namespace]        | `homer`        |
| [`HelmRelease`][ref-helm-release]   | `homer`        |
| [`Certificate`][ref-certificate]    | `${DOMAIN}`    |
| [`IngressRoute`][ref-ingress-route] | `dashboard`    |
| [`ConfigMap`][ref-config-map]       | `homer-config` |

[ref-namespace]: https://kubernetes.io/docs/reference/kubernetes-api/cluster-resources/namespace-v1/
[ref-helm-release]: https://fluxcd.io/docs/components/helm/helmreleases/
[ref-certificate]: https://cert-manager.io/docs/reference/api-docs/#cert-manager.io/v1.Certificate
[ref-ingress-route]: https://doc.traefik.io/traefik/routing/providers/kubernetes-crd/#kind-ingressroute
[ref-config-map]: https://kubernetes.io/docs/reference/kubernetes-api/config-and-storage-resources/config-map-v1/

## Links

- [Documentation](https://0xerr0r.github.io/blocky)
- [Helm Chart](https://github.com/k8s-at-home/charts/tree/master/charts/stable/blocky)
- [GitHub Repository](https://github.com/0xERR0R/blocky)
