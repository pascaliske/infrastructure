# Infrastructure

> Flux based GitOps repository for my home lab infrastructure.

[![Branch checks](https://img.shields.io/github/checks-status/pascaliske/infrastructure/master?style=flat-square)](https://github.com/pascaliske/infrastructure) [![Pipeline (linting)](https://img.shields.io/github/workflow/status/pascaliske/infrastructure/Linting/master?label=linting&style=flat-square)](https://github.com/pascaliske/infrastructure/actions/workflows/linting.yml) [![Pipeline (docs)](https://img.shields.io/github/workflow/status/pascaliske/infrastructure/Build%20Docs/master?label=docs&style=flat-square)](https://github.com/pascaliske/infrastructure/actions/workflows/docs.yml) ![GitHub commit activity](https://img.shields.io/github/commit-activity/m/pascaliske/infrastructure?style=flat-square) [![GitHub Last Commit](https://img.shields.io/github/last-commit/pascaliske/infrastructure?style=flat-square)](https://github.com/pascaliske/infrastructure) ![GitHub repo size](https://img.shields.io/github/repo-size/pascaliske/infrastructure?style=flat-square) [![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=flat-square)](https://opensource.org/licenses/MIT)

## Requirements

- [Node.js](https://nodejs.org/) + [Yarn](https://yarnpkg.com) (for local repository management only)
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) to provision the cluster nodes with common settings, Tailscale and K3s
- [Terraform](https://www.terraform.io/) to deploy all external DNS records
- [Flux](https://fluxcd.io/docs/installation/) which manages and updates the cluster state

## Installation

The cluster can be set up using the following commands:

```zsh
# clone the repo to your local machine
$ git clone https://github.com/pascaliske/infrastructure

# install needed dependencies
$ yarn install

# provision nodes using ansible (1)
$ yarn run play playbooks/provision.yml

# bootstrap flux cluster
$ flux bootstrap github \
    --owner=$GITHUB_USER \ # required flag (2)
    --repository=$GITHUB_REPO \ # required flag (3)
    --branch=master \
    --path=./cluster/base \
    --personal
```

1. More information on the following command can be found in the [provisioning section](/provisioning/#provisionyml).
2. Ensure you either fill in your GitHub username or you make it available as an environment variable.
3. Name of the repository to hold the declarative cluster state. If it does not exists yet, it will automatically be created by Flux.

## Updates

Flux is configured to take care of automatic updates of all images.

The underlying cluster nodes can be updated using the following Ansible playbook:

```zsh
# update nodes using ansible (1)
$ yarn run play playbooks/update.yml
```

1. More information on this command can be found in the [provisioning section](/provisioning/#updateyml).

## Thanks

A big thank you goes to these awesome people and their projects who inspired me to do this project:

- [onedr0p/home-ops](https://github.com/onedr0p/home-ops)
- [nicholaswilde/home-cluster](https://github.com/nicholaswilde/home-cluster)
- [billimek/k8s-gitops](https://github.com/billimek/k8s-gitops)

Also I want to thank you the awesome [`k8s-at-home` community](https://github.com/k8s-at-home/) for all their work on [their Helm Charts](https://github.com/k8s-at-home/charts) which helped me a lot.

## License

[MIT](LICENSE.md) – © 2022 [Pascal Iske](https://pascaliske.dev)
