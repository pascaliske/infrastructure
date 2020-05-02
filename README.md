# Network Controller Services

> Docker definition file for my home network services.

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT) [![Build Status](https://travis-ci.com/pascaliske/network-controller.svg?branch=master)](https://travis-ci.com/pascaliske/network-controller)

This repository features a [docker-compose.yml](docker-compose.yml) file for the following services:

- [Watchtower](https://github.com/containrrr/watchtower) for updating all services automatically
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

# setup secrets file (for Home Assistant only)
cp home-assistant/secrets.yaml{.example,} && editor home-assistant/secrets.yaml

# start up services
docker-compose up --detach
```

## Update

The integrated watchtower container automatically checks for updates of all containers every night.
To manually update the containers you can use the following commands:

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

## Hardware

The services are currently running inside Docker on a [Raspberry Pi 4 Model B](https://www.raspberrypi.org/products/raspberry-pi-4-model-b/). It has the [official Raspberry Pi PoE-Hat](https://www.raspberrypi.org/products/poe-hat/) attached which powers the Pi using the `802.3af` Power-over-Ethernet standard.

The fan of the PoE hat appears to be very noisy. Therefore I adjusted the temperature thresholds of the fan inside of `/boot/config.txt` to 70°C and 80°C:

```toml
# Fan settings from the official RPi PoE-Hat
dtparam=poe_fan_temp0=70000,poe_fan_temp0_hyst=5000
dtparam=poe_fan_temp1=80000,poe_fan_temp1_hyst=2000
```

## License

[MIT](LICENSE.md) – © 2020 [Pascal Iske](https://pascal-iske.de)
