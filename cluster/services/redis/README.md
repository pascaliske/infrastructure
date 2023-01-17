# `redis`

## Introduction

> The open source, in-memory data store used by millions of developers as a database, cache, streaming engine, and message broker.

Redis is used by multiple services (e.g. [Authelia](/cluser/services/authelia/)) to cache sessions, store short-lived data or as storage between multiple replicas of an application.

## Created Resources

| Kind                              | Name    |
| --------------------------------- | ------- |
| [`Namespace`][ref-namespace]      | `redis` |
| [`HelmRelease`][ref-helm-release] | `redis` |

[ref-namespace]: https://kubernetes.io/docs/reference/kubernetes-api/cluster-resources/namespace-v1/
[ref-helm-release]: https://fluxcd.io/docs/components/helm/helmreleases/

## CLI

Redis provides a CLI tool to interact with the instance. The following commands can be used to access it inside the cluster:

=== "Interactive"

    ```zsh
    kubectl exec -it --namespace redis deploy/redis -- redis-cli
    ```

=== "One-off"

    ```zsh
    kubectl exec -it --namespace redis deploy/redis -- redis-cli <command>
    ```

For more information on the `redis-cli` command itself [visit their docs](https://redis.io/topics/rediscli).

## Links

- [Documentation](https://redis.io/docs/)
- [Helm Chart](https://charts.pascaliske.dev/charts/redis/)
- [GitHub Repository](https://github.com/redis/redis)
