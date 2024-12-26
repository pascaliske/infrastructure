# CRDs

Some services need [`CustomResourceDefinition`s](https://kubernetes.io/docs/tasks/extend-kubernetes/custom-resources/custom-resource-definitions/) to provide their functionalities. To prevent race conditions with the actual usage of those definitions, I've extracted the installation into a custom section which will be deployed **before** the [core](/cluster/core/) and [services](/cluster/services/) sections. Inside the corresponding `HelmRelease`s the deployment of CRDs is skipped.

The following services require CRDs which are deployed by this section:

- [`cert-manager`](/cluster/core/cert-manager/)
- [`cloudnative-pg`](/cluster/core/cloudnative-pg/)
- [`kube-prometheus-stack`](/cluster/services/monitoring/kube-prometheus-stack/)
- [`system-upgrade`](/cluster/core/system-upgrade/)
- [`traefik`](/cluster/core/traefik/)
- [`trivy-operator`](/cluster/core/trivy-operator/)
- [`velero`](/cluster/core/velero/)
