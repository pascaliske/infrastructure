# `cloudflared`

## Introduction

[`cloudflared`](https://github.com/cloudflare/cloudflared) is used as upstream DNS server of [Blocky](/cluster/services/blocky/). It provides a DNS-over-HTTPS proxy for Cloudflare. To achieve some kind of high availability, multiple instances are deployed as pods using the replicas value of the Helm chart. Those pods are force to be scheduled onto different nodes using [inter-pod anti-affinity](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#inter-pod-affinity-and-anti-affinity).

As final upstream servers of `cloudflared` the following addresses are configured:

- <https://1.1.1.1/dns-query>
- <https://1.0.0.1/dns-query>


## Created Resources

| Kind                              | Name          |
| --------------------------------- | ------------- |
| [`Namespace`][ref-namespace]      | `cloudflared` |
| [`HelmRelease`][ref-helm-release] | `cloudflared` |

[ref-namespace]: https://kubernetes.io/docs/reference/kubernetes-api/cluster-resources/namespace-v1/
[ref-helm-release]: https://fluxcd.io/docs/components/helm/helmreleases/

## Links

- [Documentation](https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/install-and-setup/tunnel-guide)
- [Helm Chart](https://charts.pascaliske.dev/charts/cloudflared/)
- [GitHub Repository](https://github.com/cloudflare/cloudflared)
