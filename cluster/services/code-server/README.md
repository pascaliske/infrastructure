# `code-server`

## Introduction

[`code-server`](https://coder.com/docs/coder-oss/latest)...

## Created Resources

| Kind                                | Name                      |
| ----------------------------------- | ------------------------- |
| [`Namespace`][ref-namespace]        | `code-server`             |
| [`HelmRelease`][ref-helm-release]   | `code-server`             |
| [`Certificate`][ref-certificate]    | `code.${DOMAIN_EXTERNAL}` |
| [`IngressRoute`][ref-ingress-route] | `dashboard`               |

[ref-namespace]: https://kubernetes.io/docs/reference/kubernetes-api/cluster-resources/namespace-v1/
[ref-helm-release]: https://fluxcd.io/docs/components/helm/helmreleases/
[ref-certificate]: https://cert-manager.io/docs/reference/api-docs/#cert-manager.io/v1.Certificate
[ref-ingress-route]: https://doc.traefik.io/traefik/routing/providers/kubernetes-crd/#kind-ingressroute

## Links

- [Documentation](https://coder.com/docs/coder-oss/latest)
- [Helm Chart](https://charts.pascaliske.dev/charts/code-server/)
- [GitHub Repository](https://github.com/coder/code-server)
