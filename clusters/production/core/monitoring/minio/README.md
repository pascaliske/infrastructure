# `minio`

## Introduction

On my Synology NAS there is a [MinIO](https://min.io/) instance running. It is managed by the [Provision playbook](/provisioning/#provisionyml) inside this repo and serves as a `BackupStorageLocation` for [Velero](/cluster/core/velero/). This `Namespace` only contains the monitoring dashboard for it.

## Created Resources

| Kind                          | Name                      |
| ----------------------------- | ------------------------- |
| [`ConfigMap`][ref-config-map] | `grafana-dashboard-minio` |

[ref-config-map]: https://kubernetes.io/docs/reference/kubernetes-api/config-and-storage-resources/config-map-v1/

## Links

- [Documentation](https://docs.min.io/minio/baremetal/)
- [GitHub Repository](https://github.com/minio/minio)
