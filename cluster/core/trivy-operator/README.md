# `trivy-operator`

## Introduction

The `trivy-operator` leverages trivy security tools by incorporating their outputs into Kubernetes CRDs (Custom Resource Definitions) and from there, making security reports accessible through the Kubernetes API. This way users can find and view the risks that relate to different resources in what we call a Kubernetes-native way.

The operator automatically updates security reports in response to workload and other changes on the cluster, generating the following reports:

- Vulnerability Scans: Automated vulnerability scanning for Kubernetes workloads.
- ConfigAudit Scans: Automated configuration audits for Kubernetes resources with predefined rules or custom Open Policy Agent (OPA) policies.
- Exposed Secret Scans: Automated secret scans which find and detail the location of exposed Secrets within your cluster.
- RBAC Scans: Role Based Access Control scans provide detailed information on the access rights of the different resources installed.
- K8s core component infra assessment scan Kubernetes infra core components (etcd,apiserver,scheduler,controller-manager and etc) setting and configuration.
- Compliance reports NSA, CISA Kubernetes Hardening Guidance v1.1 cybersecurity technical report is produced.

## Created Resources

| Kind                              | Name             |
| --------------------------------- | ---------------- |
| [`Namespace`][ref-namespace]      | `trivy-operator` |
| [`HelmRelease`][ref-helm-release] | `trivy-operator` |

[ref-namespace]: https://kubernetes.io/docs/reference/kubernetes-api/cluster-resources/namespace-v1/
[ref-helm-release]: https://fluxcd.io/docs/components/helm/helmreleases/

## Links

- [Documentation](https://aquasecurity.github.io/trivy-operator/)
- [GitHub Repository](https://github.com/aquasecurity/trivy-operator)
- [Helm Chart](https://github.com/aquasecurity/trivy-operator/tree/main/deploy/helm)
