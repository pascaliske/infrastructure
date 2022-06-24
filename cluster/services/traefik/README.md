# `traefik`

## Introduction

The web interface of traefik is enabled and needs to be accessible by domain. This `Kustomization` creates the required resources for that. It also creates a `ServiceMonitor` for the prometheus operator to pick up and monitor the traefik instance.

## Created Resources

| Kind                                    | Name                |
| --------------------------------------- | ------------------- |
| [`Certificate`][ref-certificate]        | `traefik.${DOMAIN}` |
| [`IngressRoute`][ref-ingress-route]     | `dashboard`         |
| [`ServiceMonitor`][ref-service-monitor] | `traefik`           |

[ref-certificate]: https://cert-manager.io/docs/reference/api-docs/#cert-manager.io/v1.Certificate
[ref-ingress-route]: https://doc.traefik.io/traefik/routing/providers/kubernetes-crd/#kind-ingressroute
[ref-service-monitor]: https://prometheus-operator.dev/docs/operator/api/#servicemonitor

## Links

- [Documentation](https://doc.traefik.io/traefik/)
- [GitHub Repository](https://github.com/traefik/traefik/)
- [Helm Chart](https://github.com/traefik/traefik-helm-chart/)
