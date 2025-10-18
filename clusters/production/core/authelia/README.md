# `authelia`

## Introduction

> Authelia is an open-source authentication and authorization server providing two-factor authentication and single sign-on (SSO) for your applications via a web portal. It acts as a companion for reverse proxies by allowing, denying, or redirecting requests.

![authelia screenshot](/assets/authelia.png){ loading=lazy }

[Authelia](https://www.authelia.com/) allows me to centralize the authentication part of nearly all deployed services into one neat web portal. It features a complex access control rule system and enables the usage of multi-factor authentication.

For every service which supports user authentication by HTTP headers or complete disablement of authentication, I configured Authelia as authentication layer using a Traefik middleware.

??? example "Example via Traefik `Middleware`"

    === "`Middleware`"

        First a `Middleware` object needs to be created which defines the `forwardAuth` address and headers:

        ```yaml linenums="1" hl_lines="8-15"
        --8<-- "cluster/core/traefik/middlewares/auth.yaml"
        ```

    === "Usage"

        In order for the `Middleware` to take effect, it must be added to the middlewares section of any `IngressRoute`:

        ```yaml linenums="1" hl_lines="17-18"
        --8<-- "cluster/core/traefik/route.yaml"
        ```

!!! info

    ~~Currently Authelia [does not support multi-domain usage](https://github.com/authelia/authelia/issues/1198). Since the feature [is on the roadmap](https://www.authelia.com/roadmap/active/multi-domain-protection/), it will probably be implemented sometime in the future and both instances can be merged back into one.~~ This feature [ships with `v4.38.0`](https://github.com/authelia/authelia/pull/3754)! 🎉

## Created Resources

| Kind                                | Name                                        |
| ----------------------------------- | ------------------------------------------- |
| [`Namespace`][ref-namespace]        | `authelia`                                  |
| [`HelmRelease`][ref-helm-release]   | `authelia`, `authelia-external`             |
| [`Certificate`][ref-certificate]    | `auth.${DOMAIN_INTERNAL}`, `auth.${DOMAIN_EXTERNAL}` |
| [`IngressRoute`][ref-ingress-route] | `dashboard`, `dashboard-external`           |
| [`ConfigMap`][ref-config-map]       | `authelia-users`                            |
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
