# Charts

All [services](/cluster/services/) inside the cluster are deployed by Flux using [Helm charts](https://helm.sh/docs/topics/charts/). To ensure the existence of all chart repositories before the service reconciliation they're grouped together and applied as a [`Kustomization`](https://fluxcd.io/docs/components/kustomize/kustomization/) dependency for all services.
Flux checks these helm repositories regularly at the specified intervals of `10m0s` and updates the [`HelmRelease`](https://fluxcd.io/docs/components/helm/helmreleases/) objects accordingly.

??? example "Example of a `HelmRepository` declaration"

    ```yaml
    apiVersion: source.toolkit.fluxcd.io/v1
    kind: HelmRepository
    metadata:
      name: pascaliske
      namespace: flux-system
    spec:
      interval: 10m0s
      url: https://charts.pascaliske.dev
    ```
