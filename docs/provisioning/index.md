# Provisioning

The hardware in the cluster is fully provisioned and managed using Ansible. Specifically the [provisioning](/provisioning/#provisionyml) and [updating](/provisioning/#updateyml) procedures of all cluster nodes are automated using two separate playbooks.

## Inventory

```ini
--8<-- "inventory"
```

## Playbooks

### `provision.yml`

For a initial and complete provisioning of all nodes the following command can be used:

```shell
$ yarn run play playbooks/provision.yml
```

To only run specific parts of the playbook the `--tags` flag can be appended to the command:

```shell
$ yarn run play playbooks/provision.yml --tags <tag1>[,<tag2>]
```

The following tags are available for usage with `--tags`:

- `masters`
- `workers`
- `common`
- `tailscale`
- `k3s`
- `minio`

### `update.yml`

The update playbook allows me to simply update / patch all nodes:

```shell
$ yarn run play playbooks/update.yml
```

To only run specific parts of the playbook the `--tags` flag can be appended to the command:

```shell
$ yarn run play playbooks/update.yml --tags <tag1>[,<tag2>]
```

The following tags are available for usage with `--tags`:

- `masters`
- `workers`

## Limit

All playbooks can be executed on a limited set of hosts using the `--limit` flag:

```shell
$ yarn run play playbooks/<playbook>.yml --limit <host1>[,<host2>]
```

Any hosts from the inventory can be used with this flag.

## Vault

Some values needed for the above playbooks are stored as an encrypted secrets file using [Ansible Vault](https://docs.ansible.com/ansible/latest/user_guide/vault.html).

To encrypt or decrypt I use the following commands:

=== "Encryption"

    ```shell
    $ yarn run vault:encrypt
    ```

=== "Decryption"

    ```shell
    $ yarn run vault:decrypt
    ```
