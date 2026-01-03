# `tailscale-operator`

## Introduction

The Tailscale Operator enables integration of the Kubernetes cluster into the Tailscale network.

## Created Resources

| Kind                              | Name                 |
| --------------------------------- | -------------------- |
| [`Namespace`][ref-namespace]      | `tailscale-operator` |
| [`HelmRelease`][ref-helm-release] | `tailscale-operator` |

[ref-namespace]: https://kubernetes.io/docs/reference/kubernetes-api/cluster-resources/namespace-v1/
[ref-helm-release]: https://fluxcd.io/docs/components/helm/helmreleases/

## Links

- [Documentation](https://tailscale.com/kb/1236/kubernetes-operator)
- [GitHub Repository](https://github.com/tailscale/tailscale)
- [Helm Chart](https://github.com/tailscale/tailscale/tree/main/cmd/k8s-operator/deploy/chart)
