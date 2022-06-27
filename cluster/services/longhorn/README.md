# `longhorn`

## Introduction

The web interface of Longhorn is enabled and needs to be accessible by domain. This `Kustomization` creates the required resources for that.

## Created Resources

| Kind                                | Name                 |
| ----------------------------------- | -------------------- |
| [`Certificate`][ref-certificate]    | `longhorn.${DOMAIN}` |
| [`IngressRoute`][ref-ingress-route] | `dashboard`          |

[ref-certificate]: https://cert-manager.io/docs/reference/api-docs/#cert-manager.io/v1.Certificate
[ref-ingress-route]: https://doc.traefik.io/traefik/routing/providers/kubernetes-crd/#kind-ingressroute

## Links

- [Documentation](https://longhorn.io/docs/)
- [GitHub Repository](https://github.com/longhorn/longhorn)
- [Helm Chart](https://github.com/longhorn/charts/tree/master/charts/longhorn)
