# `uptime-kuma`

## Introduction

![Infrastructure status page](/assets/status-page.png){ loading=lazy }

In addition to a [dashboard](/cluster/services/homer), each homelab needs a status page. Uptime Kuma is a great candidate for this. It provides a minimal but beautiful interface, can be hichly customized and every major notification platform is supported. One minor issue is the lack of support for a programmatic way to configure monitors, [but hopefully this will be added some time in the future](https://github.com/louislam/uptime-kuma/issues/118)...

## Created Resources

| Kind                                | Name               |
| ----------------------------------- | ------------------ |
| [`Namespace`][ref-namespace]        | `uptime-kuma`      |
| [`HelmRelease`][ref-helm-release]   | `uptime-kuma`      |

[ref-namespace]: https://kubernetes.io/docs/reference/kubernetes-api/cluster-resources/namespace-v1/
[ref-helm-release]: https://fluxcd.io/docs/components/helm/helmreleases/

## Links

- [Documentation](https://github.com/louislam/uptime-kuma/wiki)
- [Helm Chart](https://charts.pascaliske.dev/charts/uptime-kuma/)
- [GitHub Repository](https://github.com/louislam/uptime-kuma)
