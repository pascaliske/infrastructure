# `cert-manager`

## Introduction

[`cert-manager`](https://cert-manager.io) is used to manage certificates inside the cluster. It provides CRDs for automated requests of Let's Encrypt certificates for domains. Right before the certificates reach their expiration date, cert-manager also takes care of renewing them for me.

??? example "Example of kind `Certificate`"

    ```yaml
    apiVersion: cert-manager.io/v1
    kind: Certificate
    metadata:
      name: auth.${DOMAIN_INTERNAL}
      namespace: authelia
    spec:
      secretName: auth.${DOMAIN_INTERNAL}
      dnsNames:
        - auth.${DOMAIN_INTERNAL}
      issuerRef:
        kind: ClusterIssuer
        name: lets-encrypt-production
    ```

Due to the fact that the target domains are not reachable outside my home network cert-manager is configured to use the DNS challenge for verifying the ownership.

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

## CLI

`cert-manager` has a great CLI tool to interact with the controller running inside the cluster. The installation guide can be found [here](https://cert-manager.io/docs/usage/cmctl/#installation).

??? example "Example usage of `cert-manager` CLI"

    === "Manually renew certificate(s)"
        ```shell
        $ cmctl renew <certificate>
        ```
        You can find more information on this command in their [docs](https://cert-manager.io/docs/usage/cmctl/#renew).

    === "Get the status of a certificate"
        ```shell
        $ cmctl status certificate -n <namespace> <certificate>
        ```
        You can find more information on this command in their [docs](https://cert-manager.io/docs/usage/cmctl/#status-certificate).

## Links

- [Documentation](https://cert-manager.io/docs/)
- [GitHub Repository](https://github.com/cert-manager/cert-manager)
