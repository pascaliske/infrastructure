# Infrastructure

> Configurations for most of my services.

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=flat-square)](https://opensource.org/licenses/MIT) [![Pipeline (config-check)](https://img.shields.io/github/workflow/status/pascaliske/infrastructure/Config%20Check/master?label=config-check&style=flat-square)](https://github.com/pascaliske/infrastructure/actions) [![Pipeline (linting)](https://img.shields.io/github/workflow/status/pascaliske/infrastructure/Linting/master?label=linting&style=flat-square)](https://github.com/pascaliske/infrastructure/actions) [![GitHub Last Commit](https://img.shields.io/github/last-commit/pascaliske/infrastructure?style=flat-square)](https://github.com/pascaliske/infrastructure)

This repository contains the configurations for most of my services:

- [Traefik](https://traefik.io) reverse proxy for all services
- [Authelia](https://www.authelia.com) as SSO platform for all services
- [Homer](https://github.com/bastienwirtz/homer) as service dashboard
- [Prometheus](https://prometheus.io) for collecting service metrics
- [Grafana](https://grafana.com/) for querying and displaying metrics data
- [UniFi Controller](https://www.ui.com/software/) for managing all UniFi network gear
- [Pi-Hole](https://pi-hole.net) for blocking ads and malicious domains network-wide
- [Cloudflared](https://github.com/cloudflare/cloudflared) for securing all DNS traffic using [DNS-over-HTTPS](https://en.m.wikipedia.org/wiki/DNS_over_HTTPS)
- [GitLab](https://about.gitlab.com/) as DevOps platform (including GitLab Runner)
- [Home Assistant](https://home-assistant.io), an Home Automation platform
- [Code Server](https://github.com/cdr/code-server), an in-browser VS Code instance
- [Linkding](https://github.com/sissbruecker/linkding), an self-hosted bookmark service
- [Paperless](https://github.com/jonaswinkler/paperless-ng) as document index and management platform

It also includes the following maintenance containers:

- [Watchtower](https://github.com/containrrr/watchtower) for updating all services automatically

## Requirements

- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- [Docker](https://docs.docker.com/install/) + [`docker-compose`](https://docs.docker.com/compose/install/)

## Install

```zsh
# clone the repo to your local machine
git clone https://github.com/pascaliske/infrastructure

# install needed dependencies
yarn install

# provision target group using ansible
yarn run play playbooks/{group}/configure.yml

# ssh into target host
yarn run ssh {hostname}

# start up services
docker-compose up --detach
```

## Update

The integrated watchtower container automatically checks for updates of all containers every night.
To manually update the containers you can use the following commands:

```zsh
# ssh into target host
yarn run ssh {hostname}

# pull image updates
docker-compose pull

# re-create containers
docker-compose up --detach --remove-orphans
```

## Service CLIs

### The `gitlab-backup` command

```zsh
docker exec gitlab gitlab-backup <task> # tasks: create | restore
```

For more information on the `gitlab-backup` command itself [visit their docs](https://docs.gitlab.com/ee/raketasks/backup_restore.html#back-up-gitlab).

### The `pihole` command

```zsh
docker exec pihole pihole <command>
```

For more information on the `pihole` command itself [visit their docs](https://docs.pi-hole.net/core/pihole-command/).

### The `hass` command

```zsh
docker exec homeassistant hass -h
```

For more information on the `hass` command itself [visit their docs](https://www.home-assistant.io/docs/tools/hass/).

### The `paperless` management utilities

```zsh
kubectl exec -it -n paperless deploy/paperless -- document_exporter
kubectl exec -it -n paperless deploy/paperless -- document_importer
kubectl exec -it -n paperless deploy/paperless -- document_retagger
```

For more information on the commands itself [visit their docs](https://paperless-ng.readthedocs.io/en/latest/administration.html#management-utilities).

## Hardware (Group Network)

The network services are currently running inside Docker on a [Raspberry Pi 4 Model B](https://www.raspberrypi.org/products/raspberry-pi-4-model-b/). It has the [official Raspberry Pi PoE-Hat](https://www.raspberrypi.org/products/poe-hat/) attached which powers it using the `802.3af` Power-over-Ethernet standard.

The fan of the PoE hat appears to be very noisy. Therefore I adjusted the temperature thresholds of the fan inside of `/boot/config.txt` to 70°C and 80°C:

```toml
# Fan settings from the official RPi PoE-Hat
dtparam=poe_fan_temp0=70000,poe_fan_temp0_hyst=5000
dtparam=poe_fan_temp1=80000,poe_fan_temp1_hyst=2000
```

## License

[MIT](LICENSE.md) – © 2021 [Pascal Iske](https://pascaliske.dev)
