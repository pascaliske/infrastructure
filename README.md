# Network Controller Services

> Docker definition file for my home network services.

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT) [![Build Status](https://travis-ci.com/pascaliske/network-controller.svg?branch=master)](https://travis-ci.com/pascaliske/network-controller)

This repository features a [docker-compose.yml](docker-compose.yml) file for the following services:

- [Portainer](https://www.portainer.io) for managing all following services
- [UniFi Controller](https://www.ui.com/software/) for managing all UniFi network gear
- [Pi-Hole](https://pi-hole.net) for blocking ads and malicious domains network-wide
- [Cloudflared](https://github.com/cloudflare/cloudflared) for securing all DNS traffic using [DNS-over-HTTPS](https://en.m.wikipedia.org/wiki/DNS_over_HTTPS)
- [Home Assistant](https://home-assistant.io) as Home Automation hub

## Requirements

- [Docker](https://docs.docker.com/install/) + [`docker-compose`](https://docs.docker.com/compose/install/)

## Install

```zsh
# clone the repo
git clone https://github.com/pascaliske/network-controller ~/network && cd ~/network

# setup secret env variables
cp .env{.example,} && editor .env

# start up services
docker-compose up --detach
```

## Update

```zsh
# pull service updates
docker-compose pull

# re-create services
docker-compose up --detach --remove-orphans
```

## Service CLIs

### The `pihole` command

```zsh
docker exec -it pihole pihole <command>
```

For more information on the pihole command itself [visit their docs](https://docs.pi-hole.net/core/pihole-command/).

### The `hass` command

```zsh
docker exec -it home-assistant hass -h
```

For more information on the hass command itself [visit their docs](https://www.home-assistant.io/docs/tools/hass/).

## License

[MIT](LICENSE.md) – © 2020 [Pascal Iske](https://pascal-iske.de)
