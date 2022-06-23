# `paperless`

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

Paperless provides several CLI tools to interact with the instance. The following commands can be used to access them inside the cluster:

```zsh
kubectl exec -it --namespace paperless deploy/paperless -- document_exporter
kubectl exec -it --namespace paperless deploy/paperless -- document_importer
kubectl exec -it --namespace paperless deploy/paperless -- document_retagger
```

For more information on the commands itself [visit their docs](https://paperless-ng.readthedocs.io/en/latest/administration.html#management-utilities).

## Links

- [Documentation](https://paperless-ngx.readthedocs.io)
- [Helm Chart](https://charts.pascaliske.dev/charts/paperless/)
- [GitHub Repository](https://github.com/paperless-ngx/paperless-ngx)
