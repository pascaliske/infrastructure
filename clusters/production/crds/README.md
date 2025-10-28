# CRDs

Some services need [`CustomResourceDefinition`s](https://kubernetes.io/docs/tasks/extend-kubernetes/custom-resources/custom-resource-definitions/) to provide their functionalities. To prevent race conditions with the actual usage of those definitions, I've extracted the installation into a custom section which will be deployed **before** the [core](/cluster/core/) and [services](/cluster/services/) sections. Inside the corresponding `HelmRelease`s the deployment of CRDs is skipped.
