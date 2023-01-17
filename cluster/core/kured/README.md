# `kured`

## Introduction

[Kured](https://github.com/weaveworks/kured) is a Kubernetes `DaemonSet` that performs safe automatic node reboots when the need to do so is indicated by the package management system of the underlying OS.

- Watches for the presence of a reboot sentinel file e.g. `/var/run/reboot-required` or the successful run of a sentinel command.
- Utilizes a lock in the API server to ensure only one node reboots at a time
- Optionally defers reboots in the presence of active Prometheus alerts or selected pods
- Cordons & drains worker nodes before reboot, uncordoning them after

## Created Resources

| Kind                              | Name    |
| --------------------------------- | ------- |
| [`Namespace`][ref-namespace]      | `kured` |
| [`HelmRelease`][ref-helm-release] | `kured` |

[ref-namespace]: https://kubernetes.io/docs/reference/kubernetes-api/cluster-resources/namespace-v1/
[ref-helm-release]: https://fluxcd.io/docs/components/helm/helmreleases/

## Links

- [GitHub Repository](https://github.com/weaveworks/kured)
