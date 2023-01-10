# `cloudnative-pg`

## Introduction

The [`cloudnative-pg`](https://cloudnative-pg.io) controller is leveraged to deploy multiple [PostgreSQL](https://www.postgresql.org) databases which are used for various services within the cluster.

> It’s entirely declarative, and directly integrates with the Kubernetes API server to update the state of the cluster — for this reason, it does not require an external failover management tool. — <https://cloudnative-pg.io>

??? example "Example of kind `Cluster`"

    ```yaml
    apiVersion: postgresql.cnpg.io/v1
    kind: Cluster
    metadata:
      name: postgresql
      namespace: my-app
    spec:
      instances: 1
      primaryUpdateStrategy: unsupervised
      storage:
        size: 1Gi
      superuserSecret:
          name: postgresql-superuser
        bootstrap:
          initdb:
            database: my-app
            owner: my-app
            secret:
              name: postgresql-user
        monitoring:
          enablePodMonitor: true
    ```

## Created Resources

| Kind                              | Name             |
| --------------------------------- | ---------------- |
| [`Namespace`][ref-namespace]      | `cloudnative-pg` |
| [`HelmRelease`][ref-helm-release] | `cloudnative-pg` |

[ref-namespace]: https://kubernetes.io/docs/reference/kubernetes-api/cluster-resources/namespace-v1/
[ref-helm-release]: https://fluxcd.io/docs/components/helm/helmreleases/

## Links

- [Documentation](https://cloudnative-pg.io/documentation/current/)
- [Helm Chart](https://github.com/cloudnative-pg/charts/tree/main/charts/cloudnative-pg)
- [GitHub Repository](https://github.com/cloudnative-pg/cloudnative-pg)
