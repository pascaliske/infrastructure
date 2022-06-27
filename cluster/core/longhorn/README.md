# `longhorn`

## Introduction

[Longhorn](https://longhorn.io) is a cloud native distributed block storage system for Kubernetes built using Kubernetes and container primitives. Some of its notable features are:

- Enterprise-grade distributed storage with no single point of failure
- Incremental snapshot of block storage
- Backup to secondary storage (NFSv4 or S3-compatible object storage) built on efficient change block detection
- Recurring snapshot and backup
- Automated non-disruptive upgrade. You can upgrade the entire Longhorn software stack without disrupting running volumes!
- Intuitive GUI dashboard

## Created Resources

| Kind                              | Name       |
| --------------------------------- | ---------- |
| [`Namespace`][ref-namespace]      | `longhorn` |
| [`HelmRelease`][ref-helm-release] | `longhorn` |

[ref-namespace]: https://kubernetes.io/docs/reference/kubernetes-api/cluster-resources/namespace-v1/
[ref-helm-release]: https://fluxcd.io/docs/components/helm/helmreleases/

## Links

- [Documentation](https://longhorn.io/docs/)
- [GitHub Repository](https://github.com/longhorn/longhorn)
- [Helm Chart](https://github.com/longhorn/charts/tree/master/charts/longhorn)
