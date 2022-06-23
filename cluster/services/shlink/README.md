# `shlink`

## Introduction

## Created Resources

| Kind                                | Name                       |
| ----------------------------------- | -------------------------- |
| [`Namespace`][ref-namespace]        | `shlink`                   |
| [`HelmRelease`][ref-helm-release]   | `shlink`                   |
| [`Certificate`][ref-certificate]    | `go.${DOMAINS_EXTERNAL}`   |
| [`IngressRoute`][ref-ingress-route] | `dashboard`                |

[ref-namespace]: https://kubernetes.io/docs/reference/kubernetes-api/cluster-resources/namespace-v1/
[ref-helm-release]: https://fluxcd.io/docs/components/helm/helmreleases/
[ref-certificate]: https://cert-manager.io/docs/reference/api-docs/#cert-manager.io/v1.Certificate
[ref-ingress-route]: https://doc.traefik.io/traefik/routing/providers/kubernetes-crd/#kind-ingressroute

## CLI

Shlink provides a CLI tool to interact with the instance. The following command can be used to access it inside the cluster:

```zsh
kubectl exec -it --namespace shlink deploy/shlink -- shlink <command>
```

??? example "Examples"
    === "Generate Short URL"

        ```zsh
        kubectl exec -it --namespace shlink deploy/shlink -- shlink short-url:generate <url> [--custom-slug=<slug>]
        ```

    === "List URLs"

        ```zsh
        kubectl exec -it --namespace shlink deploy/shlink -- shlink short-url:list [--tags=<tag1>,<tag2>]
        ```

    === "Import"

        ```zsh
        kubectl exec -it --namespace shlink deploy/shlink -- shlink short-url:import <source>
        ```

For more information on the commands itself [visit their docs](https://shlink.io/documentation/command-line-interface/).

## Links

- [Documentation](https://paperless-ngx.readthedocs.io)
- [Helm Chart](https://charts.pascaliske.dev/charts/paperless/)
- [GitHub Repository](https://github.com/paperless-ngx/paperless-ngx)
