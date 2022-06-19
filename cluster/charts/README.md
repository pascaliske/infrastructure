# Charts

All [services](/cluster/services/) inside the cluster are deployed by Flux using [Helm charts](https://helm.sh/docs/topics/charts/). To ensure the existence of all chart repositories before the service reconciliation they're grouped together and applied as a [`Kustomization`](https://fluxcd.io/docs/components/kustomize/kustomization/) dependency for all services.

The following chart repositories will be created as [`HelmRepository` declarations](https://fluxcd.io/docs/components/source/helmrepositories/):

- `authelia` → <https://charts.authelia.com>
- `gitlab` → <https://charts.gitlab.io>
- `grafana` → <https://grafana.github.io/helm-charts>
- `jetstack` → <https://charts.jetstack.io>
- `k8s-at-home` → <https://k8s-at-home.com/charts>
- `keel` → <https://charts.keel.sh>
- `kured` → <https://weaveworks.github.io/kured>
- `pascaliske` → <https://charts.pascaliske.dev>
- `prometheus-community` → <https://prometheus-community.github.io/helm-charts>
- `traefik` → <https://helm.traefik.io/traefik>
- `vector` → <https://helm.vector.dev>
- `vmware-tanzu` → <https://vmware-tanzu.github.io/helm-charts>

Flux checks these helm repositories regularly at the specified intervals of `10m0s` and updates the [`HelmRelease`](https://fluxcd.io/docs/components/helm/helmreleases/) objects accordingly.

??? example "Example of a `HelmRepository` declaration"

    ```yaml
    apiVersion: source.toolkit.fluxcd.io/v1beta2
    kind: HelmRepository
    metadata:
      name: pascaliske
      namespace: flux-system
    spec:
      interval: 10m0s
      url: https://charts.pascaliske.dev
    ```
