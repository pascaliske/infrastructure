# Specs

## Hardware

The following hardware components are used:

- 3x [Raspberry Pi 4 Model B](https://www.raspberrypi.com/products/raspberry-pi-4-model-b/) (2 GB, 4 GB & 8 GB RAM)
- 3x [Raspberry Pi PoE Hat](https://www.raspberrypi.com/products/poe-plus-hat/) (2x PoE+, 1x PoE)
- 3x [SanDisk Extreme microSDXC](https://www.amazon.de/dp/B07FCMKK5X?ref_=cm_sw_r_cp_ud_dp_4064FB9RN1YDMTAM69ZN) (2x 128 GB, 1x 64 GB)
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

- [Raspberry Pi OS Lite (64-bit)](https://www.raspberrypi.com/software/operating-systems/#raspberry-pi-os-64-bit)
- [Ansible](https://www.ansible.com) from RedHat
- [K3s](https://k3s.io) from Rancher
- [Flux](https://fluxcd.io) originally from Weaveworks, now a CNCF project
- [SOPS](https://github.com/mozilla/sops) from Mozilla
- [GitHub Actions](https://docs.github.com/actions)

## Hostnames

All nodes have configured a hostname which follows a particular naming scheme:

```yaml title="/etc/hostname"
<planet>.iske.cloud
```

The planets are taken from the [Star Wars universe](https://namingschemes.com/Star_Wars#Planets).
