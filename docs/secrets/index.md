# Secrets

Almost any service needs some kind of secret value at runtime. In order to store those secrets safely inside the Git repository I use **Mozilla SOPS** which is [natively supported by Flux](https://fluxcd.io/flux/guides/mozilla-sops/) – more precisely, I use [`age`](https://age-encryption.org) as an algorithm for encryption.

## Prerequisites

It is required to have SOPS and `age` installed on your machine. You can use `brew` for that:

```sh
$ brew install sops age
```

You also need to [generate a key](https://fluxcd.io/flux/guides/mozilla-sops/#encrypting-secrets-using-age) for `age` and [enable the Flux controllers to decrypt](https://fluxcd.io/flux/guides/mozilla-sops/#configure-in-cluster-secrets-decryption) your secrets.

## Workflow

Let's assume you want to deploy an application which needs the following secret to connect to a database:

```yaml title="db-user.sops.yaml" linenums="1"
apiVersion: v1
kind: Secret
metadata:
  name: postgresql-user
  namespace: my-app
type: kubernetes.io/basic-auth
stringData:
  username: my-app
  password: $uper$ecret123
```

To store the secret safely in the Git repository, you would do the following:

1. You create the secret manifest locally and name it e.g. `db-user.sops.yaml`
2. [Encrypt](#encryption) the file using SOPS & `age`
3. Specify the secret inside the `Deployment` as you normally would
4. Commit the files to the Git repository

As soon as the commit is pushed to the Git repository, the following happens inside the cluster:

1. `source-controller` pulls the changes from Git
2. `kustomize-controller` loads the `age` keys from the `sops-age` secret
3. `kustomize-controller` decrypts your secret and applies it on the cluster

## Commands

### Encryption

The following commands allow you to encrypt any YAML or JSON file and store it inside the Git repository:

=== "Kubernetes `Secret`"

    ```shell
    $ task sops:encrypt:secret -- path/to/my/secret.sops.yaml
    ```

=== "Generic YAML"

    ```shell
    $ task sops:encrypt:generic -- path/to/my/secret.sops.yaml
    ```

### Decryption

If you need to modify the secret value later on, you can decrypt it locally – as long as the private age key exists on your machine:

=== "Kubernetes `Secret`"

    ```shell
    $ task sops:decrypt:secret -- path/to/my/secret.sops.yaml
    ```

=== "Generic YAML"

    ```shell
    $ task sops:decrypt:generic -- path/to/my/secret.sops.yaml
    ```
