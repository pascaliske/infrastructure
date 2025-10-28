# `vikunja`

## Introduction

> The open-source, self-hostable to-do app.

Notes and to-do lists play a big role in my daily job. They help me to structure and speed up my work. [Recently](https://github.com/pascaliske/infrastructure/pull/344) I made the switch from simple text files to Vikunja. With it's multiple types of views and many options to enrich to-dos with metadata I hope to be even more productive than before.

## Created Resources

| Kind                              | Name                                      |
| --------------------------------- | ----------------------------------------- |
| [`Namespace`][ref-namespace]      | `vikunja`                                 |
| [`HelmRelease`][ref-helm-release] | `vikunja`                                 |
| [`Cluster`][ref-cluster]          | `postgresql`                              |
| [`Secret`][ref-secret]            | `postgresql-superuser`, `postgresql-user` |

[ref-namespace]: https://kubernetes.io/docs/reference/kubernetes-api/cluster-resources/namespace-v1/
[ref-helm-release]: https://fluxcd.io/docs/components/helm/helmreleases/
[ref-cluster]: https://cloudnative-pg.io/documentation/current/api_reference/#cluster
[ref-secret]: https://kubernetes.io/docs/reference/kubernetes-api/config-and-storage-resources/secret-v1/

## Links

- [Documentation](https://vikunja.io/docs)
- [Helm Chart](https://charts.pascaliske.dev/charts/vikunja/)
- [Git Repositories](https://code.vikunja.io)
