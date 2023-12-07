# Infrastructure

> Flux based GitOps repository for my home lab infrastructure.

[![Branch checks](https://img.shields.io/github/checks-status/pascaliske/infrastructure/main?style=flat-square)](https://github.com/pascaliske/infrastructure) [![Pipeline (linting)](https://img.shields.io/github/actions/workflow/status/pascaliske/infrastructure/linting.yml?branch=main&label=linting&style=flat-square)](https://github.com/pascaliske/infrastructure/actions/workflows/linting.yml) [![Pipeline (docs)](https://img.shields.io/github/actions/workflow/status/pascaliske/infrastructure/docs.yml?branch=main&label=docs&style=flat-square)](https://github.com/pascaliske/infrastructure/actions/workflows/docs.yml) ![GitHub commit activity](https://img.shields.io/github/commit-activity/m/pascaliske/infrastructure?style=flat-square) [![GitHub Last Commit](https://img.shields.io/github/last-commit/pascaliske/infrastructure?style=flat-square)](https://github.com/pascaliske/infrastructure/commits/main) ![GitHub top language](https://img.shields.io/github/languages/top/pascaliske/infrastructure?style=flat-square) ![GitHub repo size](https://img.shields.io/github/repo-size/pascaliske/infrastructure?style=flat-square) [![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=flat-square)](https://opensource.org/licenses/MIT)

![Kubernetes](https://img.shields.io/badge/kubernetes-%23326ce5.svg?style=flat-square&logo=kubernetes&logoColor=white) ![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=flat-square&logo=terraform&logoColor=white) ![Ansible](https://img.shields.io/badge/ansible-%231A1918.svg?style=flat-square&logo=ansible&logoColor=white)

## Requirements

- [Task](https://taskfile.dev) to execute all required commands
- [Node.js](https://nodejs.org) + [Yarn](https://yarnpkg.com) (for local repository management only)
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) to provision the cluster nodes with common settings, Tailscale and K3s
- [Terraform](https://www.terraform.io/) to deploy all external DNS records
- [Flux](https://fluxcd.io/docs/installation/) which manages and updates the cluster state

## Installation

The cluster can be set up using the following commands:

```zsh
# clone the repo to your local machine
$ git clone https://github.com/pascaliske/infrastructure

# install needed dependencies
$ task install

# setup ansible vault file (one-time)
$ task vault:setup

# provision nodes using ansible (1)
$ task cluster:provision

# bootstrap flux cluster
$ task cluster:bootstrap -- \
    --owner=$GITHUB_USER \ # required flag (2)
    --repository=$GITHUB_REPO \ # required flag (3)
    --branch=main
```

1. More information on the following command can be found in the [provisioning section](/provisioning/#provisionyml).
2. Ensure you either fill in your GitHub username or you make it available as an environment variable.
3. Name of the repository to hold the declarative cluster state. If it does not exists yet, it will automatically be created by Flux.

## Updates

Most updates inside this project are automated. Take a look at the [update section](/updates/) for detailed information on this topic.

## Thanks

A big thank you goes to these awesome people and their projects who inspired me to do this project:

- [onedr0p/home-ops](https://github.com/onedr0p/home-ops)
- [nicholaswilde/home-cluster](https://github.com/nicholaswilde/home-cluster)
- [billimek/k8s-gitops](https://github.com/billimek/k8s-gitops)

Also I want to thank you the awesome [`k8s-at-home` community](https://github.com/k8s-at-home/) for all their work on [their Helm Charts](https://github.com/k8s-at-home/charts) which helped me a lot.

## License

[MIT](LICENSE.md) – © 2023 [Pascal Iske](https://pascaliske.dev)
