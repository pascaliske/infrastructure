# `blocky`

## Introduction

[Blocky](https://0xerr0r.github.io/blocky/) is configured to serve as network wide DNS server and ad blocker. To achieve some kind of high availability, multiple instances are deployed as pods using the replicas value of the Helm chart. As upstream DNS server [`cloudflared`](/cluster/services/cloudflared/) is configured.

For clients to resolve domains using Blocky. Their DNS server setting needs to be set to the IP of one of the cluster nodes. This can be done via DHCP or manually. Alternatively the routers upstream DNS servers can be set to one nodes IP address.

??? example "Example DNS queries"

    ```shell
    # regular dns using dig
    $ dig @<node-ip> pascaliske.dev

    # dns-over-https using dog cli (1)
    $ dog @https://blocky.<domain>/dns-query pascaliske.dev
    ```

    1. Check ouf the `dog` cli tool [here](https://github.com/ogham/dog).

## Created Resources

| Kind                                | Name                                     |
| ----------------------------------- | ---------------------------------------- |
| [`Namespace`][ref-namespace]        | `blocky`                                 |
| [`HelmRelease`][ref-helm-release]   | `blocky`                                 |
| [`Certificate`][ref-certificate]    | `blocky.${DOMAIN_INTERNAL}`                       |
| [`IngressRoute`][ref-ingress-route] | `api`                                    |
| [`ConfigMap`][ref-config-map]       | `blocky-config`, `grafana-dashboard-dns` |

[ref-namespace]: https://kubernetes.io/docs/reference/kubernetes-api/cluster-resources/namespace-v1/
[ref-helm-release]: https://fluxcd.io/docs/components/helm/helmreleases/
[ref-certificate]: https://cert-manager.io/docs/reference/api-docs/#cert-manager.io/v1.Certificate
[ref-ingress-route]: https://doc.traefik.io/traefik/routing/providers/kubernetes-crd/#kind-ingressroute
[ref-config-map]: https://kubernetes.io/docs/reference/kubernetes-api/config-and-storage-resources/config-map-v1/

## CLI

Blocky provides a CLI tool to interact with the instance. The following command can be used to access it inside the cluster:

```zsh
$ kubectl exec -it --namespace blocky deploy/blocky -- ./blocky <command>
```

For more information on the `blocky` command itself [visit their docs](https://0xerr0r.github.io/blocky/interfaces/).

## Links

- [Documentation](https://0xerr0r.github.io/blocky/)
- [Helm Chart](https://github.com/k8s-at-home/charts/tree/master/charts/stable/blocky)
- [GitHub Repository](https://github.com/0xERR0R/blocky)
