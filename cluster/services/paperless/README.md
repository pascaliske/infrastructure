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

Paperless provides [several CLI tools](https://paperless-ng.readthedocs.io/en/latest/administration.html#management-utilities) to interact with the instance. These are the most important ones:

=== "Exporting documents"

    ```zsh
    kubectl exec -it --namespace paperless deploy/paperless -- document_exporter
    ```

    For more information on the `document_exporter` command [visit their docs](https://paperless-ng.readthedocs.io/en/latest/administration.html#document-exporter).

=== "Importing documents"

    ```zsh
    kubectl exec -it --namespace paperless deploy/paperless -- document_importer
    ```

    For more information on the `document_importer` command [visit their docs](https://paperless-ng.readthedocs.io/en/latest/administration.html#document-importer).

=== "Re-tag documents"

    ```zsh
    kubectl exec -it --namespace paperless deploy/paperless -- document_retagger
    ```

    For more information on the `document_retagger` command [visit their docs](https://paperless-ng.readthedocs.io/en/latest/administration.html#document-retagger).

=== "Fetching e-mails"

    ```zsh
    kubectl exec -it --namespace paperless deploy/paperless -- mail_fetcher
    ```

    For more information on the `mail_fetcher` command [visit their docs](https://paperless-ng.readthedocs.io/en/latest/administration.html#fetching-e-mail).

## Links

- [Documentation](https://paperless-ngx.readthedocs.io)
- [Helm Chart](https://charts.pascaliske.dev/charts/paperless/)
- [GitHub Repository](https://github.com/paperless-ngx/paperless-ngx)
