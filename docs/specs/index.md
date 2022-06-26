# Specs

## Hardware

The following hardware components are used:

- 3x [Raspberry Pi 4 Model B](https://www.raspberrypi.com/products/raspberry-pi-4-model-b/) (2 GB, 4 GB & 8 GB RAM)
- 3x [Raspberry Pi PoE Hat](https://www.raspberrypi.com/products/poe-plus-hat/) (2x PoE+, 1x PoE)
- 3x [SanDisk Extreme microSDXC](https://www.amazon.de/dp/B07FCMKK5X?ref_=cm_sw_r_cp_ud_dp_4064FB9RN1YDMTAM69ZN) (2x 128 GB, 1x 64 GB)
- 1x [UniFi Switch 8 PoE (60W)](https://store.ui.com/collections/unifi-network-switching/products/unifi-switch-8-60w)
- 1x [GeekPi 6 Layer Cluster Case](https://www.amazon.de/dp/B08614TZ7Q?ref_=cm_sw_r_cp_ud_dp_CS87DZKT38PC9KK1778P)
- 1x [Netcup VPS 1000 G10](https://www.netcup.de/vserver/vps.php) (6 vCores, 8 GB RAM)
- 1x [Synology DiskStation DS920+](https://www.synology.com/en-global/products/DS920+)

!!! note

    The fans of the official PoE hats appear to be very noisy. Therefore I adjusted their temperature thresholds to **70°C** and **80°C**:

    ```toml title="/boot/config.txt"
    dtparam=poe_fan_temp0=70000,poe_fan_temp0_hyst=5000
    dtparam=poe_fan_temp1=80000,poe_fan_temp1_hyst=2000
    ```

## Software

- [Raspberry Pi OS Lite (64-bit)](https://www.raspberrypi.com/software/operating-systems/#raspberry-pi-os-64-bit) / [Ubuntu Server 22.04 LTS](https://ubuntu.com/download/server)
- [Ansible](https://www.ansible.com) from RedHat
- [K3s](https://k3s.io) originally from Rancher, now a CNCF project
- [Flux](https://fluxcd.io) originally from Weaveworks, now a CNCF project
- [SOPS](https://github.com/mozilla/sops) from Mozilla
- [GitHub Actions](https://docs.github.com/actions)

## Networking

### Physical

The Raspberry Pis are all physically connected to a UniFi PoE switch for power and data. The actual communication between all cluster nodes is happening through the [Tailscale](https://tailscale.com/) network.

### Virtual

Inside the cluster the main parts of the networking setup are [CoreDNS](https://github.com/coredns/coredns) and [Traefik](/cluster/core/traefik/).<br>
The following IPs and CIDRs are configured inside K3s:

| Name                      | IP / CIDR      |
| ------------------------- | -------------- |
| Kubernetes Pod IPs        | `10.42.0.0/16` |
| Kubernetes Service IPs    | `10.43.0.0/16` |
| Kubernetes Cluster DNS IP | `10.43.0.10`   |

## DNS

### Internal DNS

All services with a UI running in my cluster have a dedicated subdomain configured. Those domains are managed by [Blocky](/cluster/services/blocky/) which is configured as the main DNS server in my home network. It also performs network-wide ad blocking based on some block lists.

### Dynamic DNS

Since I don't have a static IP address allocated from my ISP, my IP address can change at any point in time. To bypass this circumstance I configured a Kubernetes [`CronJob`](https://kubernetes.io/docs/reference/kubernetes-api/workload-resources/cron-job-v1/) object which performs an DynDNS update for my domain at Cloudflare. The configuration can be found [in the `dyndns` section](/cluster/services/dyndns/).

## Storage

Currently I'm not using anything special as a storage solution for my cluster. The built-in [`local-path-provisioner`](https://github.com/rancher/local-path-provisioner) of K3s is fulfilling any [`PersistentVolumeClaim`](https://kubernetes.io/docs/reference/kubernetes-api/config-and-storage-resources/persistent-volume-claim-v1/) object but I'm [planning to switch to Longhorn](https://github.com/pascaliske/infrastructure/issues/107).

## Hostnames

Every node has configured a hostname which follows a particular naming scheme:

```yaml title="/etc/hostname"
<planet>.iske.cloud
```

As you may have guessed, the planets are taken from the [Star Wars universe](https://namingschemes.com/Star_Wars#Planets).
