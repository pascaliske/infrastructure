# Provisioning

The hardware in the cluster is fully provisioned and managed using Ansible. Specifically the [provisioning](/provisioning/#provisionyml) and [updating](/provisioning/#updateyml) procedures of all cluster nodes are automated using two separate playbooks.

## Inventory

Inside this file all hosts for the cluster and their connection details are defined.

```ini
--8<-- "ansible/inventory"
```

## Playbooks

### `provision.yml`

??? abstract "TL;DR — `ansible/playbooks/provision.yml`"

    ```yaml linenums="1"
    --8<-- "ansible/playbooks/provision.yml"
    ```

For a initial and complete provisioning of all nodes the following command can be used:

```shell
$ task cluster:provision
```

To only run specific parts of the playbook the `--tags` flag can be appended to the command:

```shell
$ task cluster:provision -- --tags <tag1>[,<tag2>]
```

The following tags are available for usage with `--tags`:

- `masters`
- `workers`
- `common`
- `tailscale`
- `k3s`
- `minio`

### `update.yml`

??? abstract "TL;DR — `ansible/playbooks/update.yml`"

    ```yaml linenums="1"
    --8<-- "ansible/playbooks/update.yml"
    ```

The update playbook allows me to simply update / patch all nodes:

```shell
$ task cluster:update
```

To only run specific parts of the playbook the `--tags` flag can be appended to the command:

```shell
$ task cluster:update -- --tags <tag1>[,<tag2>]
```

The following tags are available for usage with `--tags`:

- `masters`
- `workers`

## Limit

Both playbooks can be executed on a limited set of hosts using the `--limit` flag:

```shell
$ task cluster:<provision|update> -- --limit <host1>[,<host2>]
```

Any hosts from the [inventory](#inventory) can be used with this flag.

## Vault

Some values needed for the above playbooks are stored as an encrypted secrets file using [Ansible Vault](https://docs.ansible.com/ansible/latest/user_guide/vault.html).

To encrypt or decrypt I use the following commands:

=== "Encryption"

    ```shell
    $ task vault:encrypt
    ```

=== "Decryption"

    ```shell
    $ task vault:decrypt
    ```
