# Core

This section contains crucial core services which are required by all other [services](/cluster/services/), for example an ingress controller. The services are grouped inside folders by their namespaces and will be deployed before any other service is reconciliated.

The following services are deployed by this section:

- [`flux-system`](/cluster/core/flux-system/)
- [`kured`](/cluster/core/kured/)
- [`traefik`](/cluster/core/traefik/)
- [`cert-manager`](/cluster/core/cert-manager/)
- [`velero`](/cluster/core/velero/)
