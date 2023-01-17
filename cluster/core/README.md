# Core

This section contains crucial core services which are required by all other [services](/cluster/services/), for example the ingress controller. The services are grouped inside folders by their namespaces and will be deployed before any other service is reconciliated.

The following services are deployed by this section:

- [`system-upgrade`](/cluster/core/system-upgrade/)
- [`flux-system`](/cluster/core/flux-system/)
- [`kured`](/cluster/core/kured/)
- [`traefik`](/cluster/core/traefik/)
- [`traefik-errors`](/cluster/core/traefik-errors/)
- [`cert-manager`](/cluster/core/cert-manager/)
- [`cloudnative-pg`](/cluster/core/cloudnative-pg/)
- [`crowdsec`](/cluster/core/crowdsec/)
- [`velero`](/cluster/core/velero/)
- [`trivy-operator`](/cluster/core/trivy-operator/)
