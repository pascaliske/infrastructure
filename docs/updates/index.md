# Updates

## Operating System

The underlying cluster nodes can be fully updated by using the following Ansible playbook:

```zsh
# update nodes using ansible (1)
$ yarn run play playbooks/update.yml
```

1. More information on this command can be found in the [provisioning section](/provisioning/#updateyml).

For critical and/or security relevant updates the unattended-upgrades tool is configured on all nodes:

```shell title="/etc/apt/apt.conf.d/50unattended-upgrades"
--8<-- "roles/common/templates/unattended-upgrades/50unattended-upgrades.j2"
```

## Kubernetes

Rancher's [`system-upgrade-controller`](https://github.com/rancher/system-upgrade-controller) is leveraged to update the K3s runtime on every node. See the [implementation details](/cluster/core/system-upgrade/) in the cluster section for more detailed information.

Additionally, Renovate Bot is configured to automatically create Pull Requests for new versions of K3s – you can view an example [here](https://github.com/pascaliske/infrastructure/pull/306).

As soon as a pull request with an K3s update is merged, Flux starts reconciling the `Plan` manifests, the `system-upgrade-controller` detects the new version inside them and starts updating all nodes one by one, starting with the master nodes.

![Renovate Pull Request for K3s dependency](/assets/renovate-pr.png)

## Services

Updates of the running services are also done via Pull Requests by Renovate Bot which fits perfectly into the GitOps based workflow of Flux. It continuously checks the following data sources for new versions and creates Pull Requests to adapt them inside the cluster:

- Container images
- Helm Charts
- GitHub repositories
- GitHub releases
