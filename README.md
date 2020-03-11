# Network Controller Services

> Docker definition file for my home network services.

This repository features a [docker-compose.yml](docker-compose.yml) file for the following services:

- [UniFi Network Management Controller](https://www.ui.com/software/) for managing UniFi gear
- [Pi-Hole](https://pi-hole.net) for blocking ads and malicious domains network-wide
- [Cloudflared](https://github.com/cloudflare/cloudflared) for securing all DNS traffic using [DNS-over-HTTPS](https://en.m.wikipedia.org/wiki/DNS_over_HTTPS)

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
# shut down services
docker-compose down

# pull updates
docker-compose pull

# start up services
docker-compose up --detach --remove-orphans
```

## CLIs

### The `pihole` command

```zsh
docker exec -it pihole pihole <command>
```

## License

[MIT](LICENSE.md) – © 2019 [Pascal Iske](https://pascal-iske.de)
