# `traefik`

## Introduction

[Traefik](https://traefik.io/traefik/) is used as ingress controller for the cluster. I disabled the default installation and installed it separately to enable more flexible configurations. Traefik provides a custom resource definition [`IngressRoute`](https://doc.traefik.io/traefik/routing/providers/kubernetes-crd/#kind-ingressroute) for routing ingress traffic from the outside world to [`Service`](https://kubernetes.io/docs/reference/kubernetes-api/service-resources/service-v1/) objects inside the cluster. Additionally Traefik provides a custom resource definition to implement [`Middleware`](https://doc.traefik.io/traefik/routing/providers/kubernetes-crd/#kind-middleware) objects which allow you to modify the requests and responses of your ingress objects.

??? example "Example of kind `IngressRoute`"

    ```yaml
    apiVersion: traefik.containo.us/v1alpha1
    kind: IngressRoute
    metadata:
      name: dashboard
      namespace: authelia
    spec:
      entryPoints:
        - https
      routes:
        - kind: Rule
          match: Host(`auth.${DOMAIN}`)
          services:
            - kind: Service
              name: authelia
              namespace: authelia
              port: 80
          middlewares:
            - name: security
              namespace: traefik
      tls:
        secretName: auth.${DOMAIN}
    ```

??? example "Example of kind `Middleware`"

    ```yaml
    apiVersion: traefik.containo.us/v1alpha1
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

## Created Resources

| Kind                              | Name              |
| --------------------------------- | ----------------- |
| [`Namespace`][ref-namespace]      | `traefik`         |
| [`HelmRelease`][ref-helm-release] | `traefik`         |
| [`Service`][ref-service]          | `traefik-metrics` |

[ref-namespace]: https://kubernetes.io/docs/reference/kubernetes-api/cluster-resources/namespace-v1/
[ref-helm-release]: https://fluxcd.io/docs/components/helm/helmreleases/
[ref-service]: https://kubernetes.io/docs/reference/kubernetes-api/service-resources/service-v1/

## Links

- [Documentation](https://doc.traefik.io/traefik/)
- [GitHub Repository](https://github.com/traefik/traefik/)
- [Helm Chart](https://github.com/traefik/traefik-helm-chart/)
