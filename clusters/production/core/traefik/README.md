# `traefik`

## Introduction

[Traefik](https://traefik.io/traefik/) is used as ingress controller for the cluster. To allow more flexible configurations I disabled the built-in Traefik installation of K3s using their configuration file (which is [provisioned using Ansible](/provisioning/)) and installed it separately with a custom `HelmRelease` found in this `Namespace`.

```yaml title="/etc/rancher/k3s/config.yaml"
disable:
  - traefik
```

Traefik provides a custom resource definition [`IngressRoute`](https://doc.traefik.io/traefik/routing/providers/kubernetes-crd/#kind-ingressroute) for routing ingress traffic from the outside world to [`Service`](https://kubernetes.io/docs/reference/kubernetes-api/service-resources/service-v1/) objects inside the cluster. Additionally Traefik provides a custom resource definition to implement [`Middleware`](https://doc.traefik.io/traefik/routing/providers/kubernetes-crd/#kind-middleware) objects which allow you to modify the requests and responses of your ingress objects.

??? example "Example of kind `IngressRoute`"

    ```yaml
    apiVersion: traefik.io/v1alpha1
    kind: IngressRoute
    metadata:
      name: dashboard
      namespace: authelia
    spec:
      entryPoints:
        - https
      routes:
        - kind: Rule
          match: Host(`auth.${DOMAIN_INTERNAL}`)
          services:
            - kind: Service
              name: authelia
              namespace: authelia
              port: 80
          middlewares:
            - name: security
              namespace: traefik
      tls:
        secretName: auth.${DOMAIN_INTERNAL}
    ```

??? example "Example of kind `Middleware`"

    ```yaml
    apiVersion: traefik.io/v1alpha1
    kind: Middleware
    metadata:
      name: headers
      namespace: authelia
    spec:
      headers:
        browserXssFilter: true
        customFrameOptionsValue: SAMEORIGIN
        customResponseHeaders:
          Cache-Control: no-store
          Pragma: no-cache
    ```

The dashboard of Traefik is enabled and needs to be accessible by domain. This `Kustomization` creates the required resources for that. It also creates a `ServiceMonitor` for the prometheus operator to pick up and monitor the traefik instance.

## Created Resources

| Kind                                    | Name                |
| --------------------------------------- | ------------------- |
| [`Namespace`][ref-namespace]            | `traefik`           |
| [`HelmRelease`][ref-helm-release]       | `traefik`           |
| [`Service`][ref-service]                | `traefik-metrics`   |
| [`Certificate`][ref-certificate]        | `traefik.${DOMAIN_INTERNAL}` |
| [`IngressRoute`][ref-ingress-route]     | `dashboard`         |
| [`ServiceMonitor`][ref-service-monitor] | `traefik`           |

[ref-namespace]: https://kubernetes.io/docs/reference/kubernetes-api/cluster-resources/namespace-v1/
[ref-helm-release]: https://fluxcd.io/docs/components/helm/helmreleases/
[ref-service]: https://kubernetes.io/docs/reference/kubernetes-api/service-resources/service-v1/
[ref-certificate]: https://cert-manager.io/docs/reference/api-docs/#cert-manager.io/v1.Certificate
[ref-ingress-route]: https://doc.traefik.io/traefik/routing/providers/kubernetes-crd/#kind-ingressroute
[ref-service-monitor]: https://prometheus-operator.dev/docs/operator/api/#servicemonitor

## Links

- [Documentation](https://doc.traefik.io/traefik/)
- [GitHub Repository](https://github.com/traefik/traefik/)
- [Helm Chart](https://github.com/traefik/traefik-helm-chart/)
