# `traefik-errors`

## Introduction

If for some reason a request to any service fails a custom error page is shown. This is possible due to a `Middleware` and the [`traefik-errors`](https://pascaliske.github.io/docker-traefik-errors/) service. For more information see [here](https://doc.traefik.io/traefik/middlewares/http/errorpages/).

## Created Resources

| Kind                              | Name             |
| --------------------------------- | ---------------- |
| [`Namespace`][ref-namespace]      | `traefik-errors` |
| [`HelmRelease`][ref-helm-release] | `traefik-errors` |

[ref-namespace]: https://kubernetes.io/docs/reference/kubernetes-api/cluster-resources/namespace-v1/
[ref-helm-release]: https://fluxcd.io/docs/components/helm/helmreleases/

## Links

- [Documentation](https://doc.traefik.io/traefik/)
- [GitHub Repository](https://github.com/pascaliske/docker-traefik-errors)
- [Helm Chart](https://charts.pascaliske.dev/charts/traefik-errors/)
