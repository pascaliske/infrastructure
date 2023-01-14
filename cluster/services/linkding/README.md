# `linkding`

## Introduction

`linkding` is a great and minimal bookmark service which you can easily self-host. It supports tagging, sharing and automatic internet archive snapshots. It does not require an external database but I set it up with a PostgreSQL database from the [`cloudnative-pg`](/cluster/core/cloudnative-pg/) controller.

## Created Resources

| Kind                                | Name                       |
| ----------------------------------- | -------------------------- |
| [`Namespace`][ref-namespace]        | `linkding`                 |
| [`HelmRelease`][ref-helm-release]   | `linkding`                 |

[ref-namespace]: https://kubernetes.io/docs/reference/kubernetes-api/cluster-resources/namespace-v1/
[ref-helm-release]: https://fluxcd.io/docs/components/helm/helmreleases/

## Links

- [Documentation](https://github.com/sissbruecker/linkding/tree/master/docs)
- [Helm Chart](https://charts.pascaliske.dev/charts/linkding/)
- [GitHub Repository](https://github.com/sissbruecker/linkding)
