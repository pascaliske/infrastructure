# `system-upgrade`

## Introduction

Rancher's [`system-upgrade-controller`](https://github.com/rancher/system-upgrade-controller) makes it easy to upgrade K3s nodes in an automated way. It introduces a `CustomResourceDefinition` named `Plan` to provide details about an update of a selected range of nodes:

!!! example "Example of kind `Plan`"

    ```yaml title="Plan/system-upgrade/master" linenums="1"
    --8<-- "cluster/core/system-upgrade/plans/master.yaml"
    ```

    1. You can use Renovate Bot to automate upgrades of K3s using plans
    2. Labels and selectors are used to differentiate between control-plane nodes and worker ones

The controller then picks up any `Plan` resource and performs the defined upgrades accordingly inside the cluster. For more information you can check out the [official K3s docs](https://docs.k3s.io/upgrades/automated) or the [GitHub Repository](https://github.com/rancher/system-upgrade-controller).

## Created Resources

| Kind                         | Name               |
| ---------------------------- | ------------------ |
| [`Namespace`][ref-namespace] | `system-upgrade`   |
| [`Plan`][ref-plan]           | `master`, `worker` |

[ref-namespace]: https://kubernetes.io/docs/reference/kubernetes-api/cluster-resources/namespace-v1/
[ref-plan]: https://docs.k3s.io/upgrades/automated#configure-plans

## Links

- [GitHub Repository](https://github.com/rancher/system-upgrade-controller)
- [K3s docs](https://docs.k3s.io/upgrades/automated)
