# Overview

Since I wanted to keep things lightweight and relatively simple, I chose [K3s](https://k3s.io) as Kubernetes distribution. The installation is straightforward and is performed by Ansible during the [provisioning state](/provisioning/).

To allow more flexible configurations I disabled the built-in Traefik installation of K3s using their configuration file and installed it separately [using a `HelmRelease`](/cluster/core/traefik/):

```yaml title="/etc/rancher/k3s/config.yaml"
disable:
  - traefik
```

The cluster state is managed by [Flux](https://fluxcd.io) in a [GitOps](https://www.weave.works/technologies/gitops/) based manner. To provide a clean separation of concerns the cluster is divided into several sections reflected as folders in the repository.

The `base` directory serves as an entrypoint from which all other sections are executed. It manages all Flux related components and afterwards reconciles the following [`Kustomization`](https://fluxcd.io/docs/components/kustomize/kustomization/) files in exactly this order:

- [Config](/cluster/config/) – Cluster-wide configuration values
- [Charts](/cluster/charts/) – Helm chart repositories for all applications
- [Core](/cluster/core/) – Crucial core applications; depends on [Charts](/cluster/charts/) & [Config](/cluster/config/)
- [Services](/cluster/services/) – Regular applications; depends on [Charts](/cluster/charts/), [Config](/cluster/config/) & [Core](/cluster/core/)
