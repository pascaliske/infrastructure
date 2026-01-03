# `silence-operator`

## Introduction

The Silence Operator automates the management of Alertmanager silences using Kubernetes Custom Resources.

## Created Resources

| Kind                              | Name               |
| --------------------------------- | ------------------ |
| [`Namespace`][ref-namespace]      | `silence-operator` |
| [`HelmRelease`][ref-helm-release] | `silence-operator` |

[ref-namespace]: https://kubernetes.io/docs/reference/kubernetes-api/cluster-resources/namespace-v1/
[ref-helm-release]: https://fluxcd.io/docs/components/helm/helmreleases/

## Links

- [Documentation](https://github.com/giantswarm/silence-operator)
- [GitHub Repository](https://github.com/giantswarm/silence-operator)
- [Helm Chart](https://github.com/giantswarm/silence-operator/tree/main/helm/silence-operator)
