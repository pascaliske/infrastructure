# `cert-manager`

## Introduction

[`cert-manager`](https://cert-manager.io) is used to manage certificates inside the cluster. It provides CRDs for automated requests of Let's Encrypt certificates for domains. Right before the certificates reach their expiration date, cert-manager also takes care of renewing them for me.

Due to the fact that the target domains are not reachable outside my home network cert-manager is configured to use the DNS challenge for verifying the ownership.

??? example "Example of kind `Certificate`"

    ```yaml
    apiVersion: cert-manager.io/v1
    kind: Certificate
    metadata:
      name: auth.${DOMAIN}
      namespace: authelia
    spec:
      secretName: auth.${DOMAIN}
      dnsNames:
        - auth.${DOMAIN}
      issuerRef:
        kind: ClusterIssuer
        name: lets-encrypt-production
    ```

## Created Resources

| Kind                                  | Name                                              |
| ------------------------------------- | ------------------------------------------------- |
| [`Namespace`][ref-namespace]          | `cert-manager`                                    |
| [`HelmRelease`][ref-helm-release]     | `cert-manager`                                    |
| [`Secret`][ref-secret]                | `cloudflare-api-token`                            |
| [`ClusterIssuer`][ref-cluster-issuer] | `lets-encrypt-production`, `lets-encrypt-staging` |

[ref-namespace]: https://kubernetes.io/docs/reference/kubernetes-api/cluster-resources/namespace-v1/
[ref-helm-release]: https://fluxcd.io/docs/components/helm/helmreleases/
[ref-secret]: https://kubernetes.io/docs/reference/kubernetes-api/config-and-storage-resources/secret-v1/
[ref-cluster-issuer]: https://cert-manager.io/docs/reference/api-docs/#cert-manager.io/v1.ClusterIssuer

## Links

- [Documentation](https://cert-manager.io/docs/)
- [GitHub Repository](https://github.com/cert-manager/cert-manager)
