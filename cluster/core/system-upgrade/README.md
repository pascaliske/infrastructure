# `system-upgrade`

## Introduction

Rancher's [`system-upgrade-controller`](https://github.com/rancher/system-upgrade-controller) makes it easy to upgrade K3s nodes in an automated way. It introduces a `CustomResourceDefinition` named `Plan` to provide details about an update of a selected range of nodes:

!!! example "Example of kind `Plan`"

    ```yaml
    apiVersion: upgrade.cattle.io/v1
    kind: Plan
    metadata:
      name: master
      namespace: system-upgrade
    spec:
      # renovate: datasource=github-releases depName=k3s-io/k3s (1)
      version: "v1.25.3+k3s1" # target version (2)
      serviceAccountName: system-upgrade
      concurrency: 1
      cordon: true
      nodeSelector:
        matchExpressions:
          # only control-plane nodes (3)
          - key: node-role.kubernetes.io/control-plane
            operator: Exists
      upgrade:
        image: rancher/k3s-upgrade
    ```

    1. You can use Renovate Bot to automate upgrades of K3s using plans
    2. Choose any version from the official K3s repository here
    3. A node label is used here to differentiate between control-plane nodes and regular ones

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
