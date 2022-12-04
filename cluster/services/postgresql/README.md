# PostgreSQL

## Introduction

This service provides a single node [`PostgreSQL`](https://www.postgresql.org) cluster which is used as a database for various services within the cluster.
It is deployed using the [`cloudnative-pg`](/cluster/core/cloudnative-pg/) controller.

!!! example "Definition of `Cluster` resource"

    ```yaml
    apiVersion: postgresql.cnpg.io/v1
    kind: Cluster
    metadata:
      name: postgresql
      namespace: postgresql
    spec:
      instances: 1
      primaryUpdateStrategy: unsupervised
      storage:
        size: 1Gi
    ```

## Created Resources

| Kind                         | Name                   |
| ---------------------------- | ---------------------- |
| [`Namespace`][ref-namespace] | `postgresql`           |
| [`Cluster`][ref-cluster]     | `postgresql`           |
| [`Secret`][ref-secret]       | `postgresql-superuser` |

[ref-namespace]: https://kubernetes.io/docs/reference/kubernetes-api/cluster-resources/namespace-v1/
[ref-cluster]: https://cloudnative-pg.io/documentation/current/api_reference/#cluster
[ref-secret]: https://kubernetes.io/docs/reference/kubernetes-api/config-and-storage-resources/secret-v1/

## Links

- [Documentation](https://cloudnative-pg.io/documentation/current/)
- [Helm Chart](https://github.com/cloudnative-pg/charts/tree/main/charts/cloudnative-pg)
- [GitHub Repository](https://github.com/cloudnative-pg/cloudnative-pg)
