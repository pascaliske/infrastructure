# `paperless`

## Introduction

> A community-supported supercharged version of paperless: scan, index and archive all your physical documents.

Paperless-ngx is a document management system that transforms your physical documents into a searchable online archive so you can keep, well, less paper – although I still keep almost all documents in paper form.

Some of it's features are:

- Performs OCR on your documents, adds selectable text to image only documents and adds tags, correspondents and document types to your documents.
- Full text search helps you find what you need.
- Email processing: Paperless adds documents from your email accounts.
- Machine learning powered document matching.
- [More features can be found on their GitHub repository](https://github.com/paperless-ngx/paperless-ngx#features)

![Paperless screenshot](https://k8s.pascaliske.dev/assets/paperless.png){ loading=lazy }

## Created Resources

| Kind                                | Name                       |
| ----------------------------------- | -------------------------- |
| [`Namespace`][ref-namespace]        | `paperless`                |
| [`HelmRelease`][ref-helm-release]   | `paperless`                |

[ref-namespace]: https://kubernetes.io/docs/reference/kubernetes-api/cluster-resources/namespace-v1/
[ref-helm-release]: https://fluxcd.io/docs/components/helm/helmreleases/

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
