# `home-assistant`

## Introduction

[Home Assistant](https://home-assistant.io) is my home automation platform of choice. It offers [many integrations](https://www.home-assistant.io/integrations/) and is easily [configurable](https://www.home-assistant.io/docs/configuration/). It runs completely local, is privacy-focused and has companion mobile apps.

Most of my home automation stuff is ZigBee based which requires a small USB ZigBee Gateway stick: [ConBee II](https://phoscon.de/en/conbee2). This stick is plugged into an external Raspberry Pi running `ser2net`. The Home Assistant pod can access the ZigBee coordinator via TCP/IP.

The configuration files of my Home Assistant instance are stored and managed inside [another dedicated GitHub repository](https://github.com/pascaliske/home-assistant). Only the secrets are managed by this repository.

## Created Resources

| Kind                                | Name                                                                                        |
| ----------------------------------- | ------------------------------------------------------------------------------------------- |
| [`Namespace`][ref-namespace]        | `home-assistant`                                                                            |
| [`HelmRelease`][ref-helm-release]   | `home-assistant`                                                                            |
| [`ConfigMap`][ref-config-map]       | `grafana-dashboard-batteries`, `grafana-dashboard-climate`, `grafana-dashboard-fuel-prices` |
| [`Secret`][ref-secret]              | `secrets`, `monitoring-auth`, `github-registry`                                             |

[ref-namespace]: https://kubernetes.io/docs/reference/kubernetes-api/cluster-resources/namespace-v1/
[ref-helm-release]: https://fluxcd.io/docs/components/helm/helmreleases/
[ref-config-map]: https://kubernetes.io/docs/reference/kubernetes-api/config-and-storage-resources/config-map-v1/
[ref-secret]: https://kubernetes.io/docs/reference/kubernetes-api/config-and-storage-resources/secret-v1/

## CLI

Home Assistant provides a CLI tool to interact with the instance. The following command can be used to access them inside the cluster:

```zsh
kubectl exec -it --namespace home-assistant deploy/home-assistant -- hass --script <script>
```

??? example
    ```zsh
    kubectl exec -it --namespace home-assistant deploy/home-assistant -- hass --script check_config
    ```

For more information on the `hass` command itself [visit their docs](https://www.home-assistant.io/docs/tools/hass/).

## Links

- [Documentation](https://www.home-assistant.io/docs/)
- [Helm Chart](https://github.com/k8s-at-home/charts/tree/master/charts/stable/home-assistant)
- [GitHub Repository](https://github.com/home-assistant/core)
