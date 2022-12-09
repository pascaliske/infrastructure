# Overview

The cluster represents the heart of this project. Since I wanted to keep things lightweight and relatively simple, I chose [K3s](https://k3s.io) as the underlying Kubernetes distribution. The installation of the multi-node cluster is straightforward and is performed by Ansible during the [provisioning state](/provisioning/).

The cluster state is managed by [Flux](https://fluxcd.io) in a [GitOps](https://www.weave.works/technologies/gitops/) based manner. To provide a clean separation of concerns the cluster is divided into several sections reflected as folders in the repository.

![GitOps Workflow Diagram](https://k8s.pascaliske.dev/assets/gitops-workflow.png){ loading=lazy }

The `base` directory serves as an entrypoint from which all other sections are executed. It manages all Flux related components and afterwards reconciles the following [`Kustomization`](https://fluxcd.io/docs/components/kustomize/kustomization/) files in exactly this order:

- [Config](/cluster/config/) — Cluster-wide configuration values
- [CRDs](/cluster/crds/) — Custom Resource Definitions for specific applications
- [Charts](/cluster/charts/) — Helm chart repositories for all applications
- [Core](/cluster/core/) — Crucial core applications which depend on [Config](/cluster/config/), [Charts](/cluster/charts/) & [CRDs](/cluster/crds/)
- [Services](/cluster/services/) — Regular applications which depend on [Config](/cluster/config/), [Charts](/cluster/charts/), [CRDs](/cluster/crds/) & [Core](/cluster/core/)
