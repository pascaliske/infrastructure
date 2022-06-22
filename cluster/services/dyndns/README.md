# `dyndns`

## Introduction

Sometimes I need to securely access my home infrastructure while I'm away. For this, I use a VPN connection with a memorable address, which is ensured by using DynDNS. This service in-turn runs [a very small container](https://pascaliske.github.io/docker-cloudflare-dyndns/) as a [CronJob](https://kubernetes.io/docs/reference/kubernetes-api/workload-resources/cron-job-v1/) which updates the according DNS record with my current public IP allocated to me by my provider.

## Created Resources

| Kind                              | Name     |
| --------------------------------- | -------- |
| [`Namespace`][ref-namespace]      | `dyndns` |
| [`HelmRelease`][ref-helm-release] | `dyndns` |

[ref-namespace]: https://kubernetes.io/docs/reference/kubernetes-api/cluster-resources/namespace-v1/
[ref-helm-release]: https://fluxcd.io/docs/components/helm/helmreleases/

## Links

- [Documentation](https://coder.com/docs/coder-oss/latest)
- [Helm Chart](https://charts.pascaliske.dev/charts/code-server/)
- [GitHub Repository](https://github.com/coder/code-server)
