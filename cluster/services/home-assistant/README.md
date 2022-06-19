# `home-assistant`

## Introduction

## Created Resources

| Kind                                | Name                       |
| ----------------------------------- | -------------------------- |
| [`Namespace`][ref-namespace]        | `paperless`                |
| [`HelmRelease`][ref-helm-release]   | `paperless`                |
| [`Certificate`][ref-certificate]    | `docs.${DOMAINS_EXTERNAL}` |
| [`IngressRoute`][ref-ingress-route] | `dashboard`                |

[ref-namespace]: https://kubernetes.io/docs/reference/kubernetes-api/cluster-resources/namespace-v1/
[ref-helm-release]: https://fluxcd.io/docs/components/helm/helmreleases/
[ref-certificate]: https://cert-manager.io/docs/reference/api-docs/#cert-manager.io/v1.Certificate
[ref-ingress-route]: https://doc.traefik.io/traefik/routing/providers/kubernetes-crd/#kind-ingressroute

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
