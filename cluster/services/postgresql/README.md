# PostgreSQL

## Introduction

The [`CloudNativePG`](https://cloudnative-pg.io) controller is leveraged to deploy a single-node PostgreSQL cluster inside Kubernetes which is used as a database for various services within the cluster.

> It’s entirely declarative, and directly integrates with the Kubernetes API server to update the state of the cluster — for this reason, it does not require an external failover management tool. — <https://cloudnative-pg.io>

??? example "Example of kind `Cluster`"

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

| Kind                              | Name         |
| --------------------------------- | ------------ |
| [`Namespace`][ref-namespace]      | `postgresql` |
| [`HelmRelease`][ref-helm-release] | `postgresql` |
| [`Cluster`][ref-cluster]          | `postgresql` |

[ref-namespace]: https://kubernetes.io/docs/reference/kubernetes-api/cluster-resources/namespace-v1/
[ref-helm-release]: https://fluxcd.io/docs/components/helm/helmreleases/
[ref-cluster]: https://cloudnative-pg.io/documentation/current/api_reference/#cluster

## Links

- [Documentation](https://cloudnative-pg.io/documentation/current/)
- [Helm Chart](https://github.com/cloudnative-pg/charts/tree/main/charts/cloudnative-pg)
- [GitHub Repository](https://github.com/cloudnative-pg/cloudnative-pg)
