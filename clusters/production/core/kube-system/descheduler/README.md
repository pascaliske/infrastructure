# `descheduler`

## Introduction

The descheduler for Kubernetes is used to re-balance clusters by evicting pods that can potentially be scheduled on better nodes. It can be configured through a policy configuration.

## Created Resources

| Kind                              | Name          |
| --------------------------------- | ------------- |
| [`Namespace`][ref-namespace]      | `descheduler` |
| [`HelmRelease`][ref-helm-release] | `descheduler` |

[ref-namespace]: https://kubernetes.io/docs/reference/kubernetes-api/cluster-resources/namespace-v1/
[ref-helm-release]: https://fluxcd.io/docs/components/helm/helmreleases/

## Links

- [Documentation](https://github.com/kubernetes-sigs/descheduler)
- [Helm Chart](https://github.com/kubernetes-sigs/descheduler/tree/master/charts/descheduler)
- [GitHub Repository](https://github.com/kubernetes-sigs/descheduler)
