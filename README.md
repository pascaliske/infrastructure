# Network Controller Services

> Docker definition file for home network services.

This repository features a [docker-compose.yml](docker-compose.yml) file for the following services:

- [UniFi Controller](https://www.ui.com/software/) for managing UniFi gear
- [Pi-Hole](https://pi-hole.net/) for blocking ads and malicious domains
- [Cloudflared](https://github.com/cloudflare/cloudflared) for securing all DNS traffic using DNS-over-HTTPS

## Requirements

- [Docker](https://www.docker.com/)
- [`docker-compose`](https://github.com/docker/compose)

## Install

```zsh
git clone https://github.com/pascaliske/network-controller .network && cs .network
docker-compose up --detach
```

## Update

```zsh
docker-compose down
docker-compose pull
docker-compose up --detach --remove-orphans
```

## Usage

```zsh
docker exec -it pihole pihole -h
```

## License

[MIT](LICENSE.md) – © 2019 [Pascal Iske](https://pascal-iske.de)
