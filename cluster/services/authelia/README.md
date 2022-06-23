# `authelia`

## Introduction

[Authelia](https://www.authelia.com/) allows me to centralize the authentication part of nearly all deployed services into one neat web portal. It features a complex access control rule system and enables the usage of multi-factor authentication.

For every service which supports user authentication by HTTP headers or complete disablement of authentication, I configured Authelia as authentication layer using a Traefik middleware.

??? example "Example `Middleware` for Traefik"

    ```yaml
    apiVersion: traefik.containo.us/v1alpha1
    kind: Middleware
    metadata:
      name: auth
      namespace: traefik
    spec:
      forwardAuth:
        address: http://authelia.authelia.svc.cluster.local/api/verify?rd=https://auth.${DOMAIN}
        trustForwardHeader: true
        authResponseHeaders:
          - Remote-User
          - Remote-Groups
          - Remote-Name
          - Remote-Email
    ```

??? example "Example usage of `Middleware`"

    In order for the `Middleware` to take effect, it must be added to the middlewares section of any `IngressRoute`:

    ```yaml
          middlewares:
            - name: auth
              namespace: traefik
    ```

Currently Authelia [does not support multi-domain usage](https://github.com/authelia/authelia/issues/1198). Therefore I deployed two instances of Authelia inside my cluster. One for internal services and one for external services. Since the feature [is on the roadmap](https://www.authelia.com/roadmap/active/multi-domain-protection/), it will probably be implemented sometime in the future and both instances can be merged back into one.

## Created Resources

| Kind                                | Name                                        |
| ----------------------------------- | ------------------------------------------- |
| [`Namespace`][ref-namespace]        | `authelia`                                  |
| [`HelmRelease`][ref-helm-release]   | `authelia`, `authelia-external`             |
| [`Certificate`][ref-certificate]    | `auth.${DOMAIN}`, `auth.${DOMAIN_EXTERNAL}` |
| [`IngressRoute`][ref-ingress-route] | `dashboard`, `dashboard-external`           |
| [`ConfigMap`][ref-config-map]       | `users`                                     |
| [`Middleware`][ref-middleware]      | `headers`                                   |

[ref-namespace]: https://kubernetes.io/docs/reference/kubernetes-api/cluster-resources/namespace-v1/
[ref-helm-release]: https://fluxcd.io/docs/components/helm/helmreleases/
[ref-certificate]: https://cert-manager.io/docs/reference/api-docs/#cert-manager.io/v1.Certificate
[ref-ingress-route]: https://doc.traefik.io/traefik/routing/providers/kubernetes-crd/#kind-ingressroute
[ref-config-map]: https://kubernetes.io/docs/reference/kubernetes-api/config-and-storage-resources/config-map-v1/
[ref-middleware]: https://doc.traefik.io/traefik/routing/providers/kubernetes-crd/#kind-middleware

## Links

- [Documentation](https://www.authelia.com/)
- [Helm Chart](https://github.com/authelia/chartrepo/)
- [GitHub Repository](https://github.com/authelia/authelia/)
