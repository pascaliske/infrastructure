# `unbound`

## Introduction

[`unbound`](https://github.com/NLnetLabs/unbound) is used as upstream DNS server of [Blocky](/cluster/services/blocky/). It provides a validating and caching DNS proxy. To achieve some kind of high availability, multiple instances are deployed as pods using the replicas value of the Helm chart. Those pods are force to be scheduled onto different nodes using [inter-pod anti-affinity](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#inter-pod-affinity-and-anti-affinity).

## Created Resources

| Kind                              | Name      |
| --------------------------------- | --------- |
| [`Namespace`][ref-namespace]      | `unbound` |
| [`HelmRelease`][ref-helm-release] | `unbound` |

[ref-namespace]: https://kubernetes.io/docs/reference/kubernetes-api/cluster-resources/namespace-v1/
[ref-helm-release]: https://fluxcd.io/docs/components/helm/helmreleases/

## Links

- [Documentation](https://unbound.docs.nlnetlabs.nl/en/latest/)
- [Helm Chart](https://charts.pascaliske.dev/charts/unbound/)
- [GitHub Repository](https://github.com/NLnetLabs/unbound)
