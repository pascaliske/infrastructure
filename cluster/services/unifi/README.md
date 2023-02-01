# `unifi`

## Introduction

The UniFi ecosystem is a great and valuable choice if you want to level up your home network from consumer grade hardware to a more professional one.

Both their switches and access points are awesome products and can be managed from a single pane of glass: the UniFi controller software. It can easily be self-hosted thanks to [@jacobalberty](https://github.com/jacobalberty/unifi-docker).

## Created Resources

| Kind                                | Name           |
| ----------------------------------- | -------------- |
| [`Namespace`][ref-namespace]        | `homer`        |
| [`HelmRelease`][ref-helm-release]   | `homer`        |
| [`Certificate`][ref-certificate]    | `${DOMAIN_INTERNAL}`    |
| [`IngressRoute`][ref-ingress-route] | `dashboard`    |

[ref-namespace]: https://kubernetes.io/docs/reference/kubernetes-api/cluster-resources/namespace-v1/
[ref-helm-release]: https://fluxcd.io/docs/components/helm/helmreleases/
[ref-certificate]: https://cert-manager.io/docs/reference/api-docs/#cert-manager.io/v1.Certificate
[ref-ingress-route]: https://doc.traefik.io/traefik/routing/providers/kubernetes-crd/#kind-ingressroute

## Links

- [Helm Chart](https://github.com/k8s-at-home/charts/tree/master/charts/stable/unifi)
- [GitHub Repository](https://github.com/jacobalberty/unifi-docker)
