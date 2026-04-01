# Overview

The cluster represents the heart of this project. As Kubernetes distribution I'm using [Talos](https://www.talos.dev).

State inside the cluster is managed by [Flux](https://fluxcd.io) in a [GitOps](https://about.gitlab.com/topics/gitops/) based manner. To provide a clean separation of concerns the cluster is divided into several sections reflected as folders in the repository.

![GitOps Workflow Diagram](/assets/gitops-workflow.png){ loading=lazy }

The [`base`](/cluster/base/) directory serves as an entrypoint from which all other sections are executed. It is called by the Flux Operator which manages the Flux instance and it's related components. Afterwards the following [`Kustomization`](https://fluxcd.io/docs/components/kustomize/kustomization/) overlays are reconciled in exactly this order:

- [`overlays/crds.yaml`](/cluster/crds/) — Custom Resource Definitions for specific applications
- [`overlays/charts.yaml`](/cluster/charts/) — Helm chart repositories for all applications
- [`overlays/config.yaml`](/cluster/config/) — Cluster-wide configuration values
- [`overlays/core.yaml`](/cluster/core/) — Core applications which depend on [`overlays/config.yaml`](/cluster/config/), [`overlays/charts.yaml`](/cluster/charts/) & [`overlays/crds.yaml`](/cluster/crds/)
- [`overlays/services.yaml`](/cluster/services/) — Regular applications which depend on [`overlays/config.yaml`](/cluster/config/), [`overlays/charts.yaml`](/cluster/charts/), [`overlays/crds.yaml`](/cluster/crds/) & [`overlays/core.yaml`](/cluster/core/)
