# Core

This section contains crucial core services which are required by all other [services](/cluster/services/), for example the ingress controller. The services are grouped inside folders by their namespaces and will be deployed before any other service is reconciliated.

The following services are deployed by this section:

- [`authelia`](/cluster/core/authelia/)
- [`cert-manager`](/cluster/core/cert-manager/)
- [`cloudflare-operator`](/cluster/core/cloudflare-operator/)
- [`cloudnative-pg`](/cluster/core/cnpg-system/cloudnative-pg/)
- [`crowdsec`](/cluster/core/crowdsec/)
- [`flux-system`](/cluster/core/flux-system/)
- [`kube-system`](/cluster/core/kube-system/)
- [`local-path-storage`](/cluster/core/local-path-storage/)
- [`metallb`](/cluster/core/metallb/)
- [`monitoring`](/cluster/core/monitoring/)
- [`redis-operator`](/cluster/core/redis-operator/)
- [`silence-operator`](/cluster/core/silence-operator/)
- [`system-upgrade`](/cluster/core/system-upgrade/)
- [`tailscale-operator`](/cluster/core/tailscale-operator/)
- [`traefik`](/cluster/core/traefik/)
- [`traefik-errors`](/cluster/core/traefik-errors/)
- [`trivy-operator`](/cluster/core/trivy-operator/)
- [`uptime-kuma`](/cluster/core/uptime-kuma/)
- [`velero`](/cluster/core/velero/)
