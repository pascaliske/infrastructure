# `velero`

## Introduction

[Velero](https://velero.io/) is used to easily backup all cluster internal resources. It provides CRDs for creating [manual](https://velero.io/docs/v1.9/api-types/backup/) or [scheduled](https://velero.io/docs/v1.9/api-types/schedule/) backups.

Currently I've scheduled Velero to create a backup automatically every Sunday at 3am. As [`BackupStorageLocation`](https://velero.io/docs/v1.9/api-types/backupstoragelocation/) I configured a completely separate and self-hosted instance of [Minio](https://min.io) running on my Synology NAS.

## Created Resources

| Kind                              | Name     |
| --------------------------------- | -------- |
| [`Namespace`][ref-namespace]      | `velero` |
| [`HelmRelease`][ref-helm-release] | `velero` |

[ref-namespace]: https://kubernetes.io/docs/reference/kubernetes-api/cluster-resources/namespace-v1/
[ref-helm-release]: https://fluxcd.io/docs/components/helm/helmreleases/

## CLI

Velero has a great CLI tool to interact with the controller running inside the cluster. The installation guide can be found [here](https://velero.io/docs/v1.9/basic-install/#install-the-cli).

??? example "Example usage of Velero CLI"

    === "Create a manual backup"

        ```shell
        $ velero backup create <name>
        ```

    === "List backups"

        ```shell
        $ velero backup list
        ```

    === "Restore a backup"

        ```shell
        $ velero restore create <name> --from-backup <backup>
        ```

## Links

- [Documentation](https://velero.io/docs/)
- [GitHub Repository](https://github.com/vmware-tanzu/velero)
- [Helm Chart](https://github.com/vmware-tanzu/helm-charts)
