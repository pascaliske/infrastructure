# Network Controller Services

> Docker definition file for home network services.

This repository features a [docker-compose.yml](docker-compose.yml) file for the following services:

- [UniFi Controller](https://www.ui.com/software/)
- [Pi-Hole](https://pi-hole.net/) including its web interface
- [Cloudflared](https://github.com/cloudflare/cloudflared) for DNS-over-HTTPS

## Requirements

- [Docker](https://www.docker.com/)
- [`docker-compose`](https://github.com/docker/compose)

## Install

```zsh
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
