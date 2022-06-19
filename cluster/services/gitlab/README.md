# `gitlab`

## Introduction

## Created Resources

| Kind                                | Name                      |
| ----------------------------------- | ------------------------- |
| [`Namespace`][ref-namespace]        | `gitlab`                  |
| [`HelmRelease`][ref-helm-release]   | `gitlab`                  |
| [`Certificate`][ref-certificate]    | `git.${DOMAINS_EXTERNAL}` |
| [`IngressRoute`][ref-ingress-route] | `dashboard`               |

[ref-namespace]: https://kubernetes.io/docs/reference/kubernetes-api/cluster-resources/namespace-v1/
[ref-helm-release]: https://fluxcd.io/docs/components/helm/helmreleases/
[ref-certificate]: https://cert-manager.io/docs/reference/api-docs/#cert-manager.io/v1.Certificate
[ref-ingress-route]: https://doc.traefik.io/traefik/routing/providers/kubernetes-crd/#kind-ingressroute

## CLI

GitLab provides a CLI tool to interact with the instance. The following command can be used to access it inside the cluster:

```zsh
kubectl exec -it --namespace gitlab deploy/gitlab -- gitlab-backup <task> # tasks: create | restore
```

For more information on the `gitlab-backup` command itself [visit their docs](https://docs.gitlab.com/ee/raketasks/backup_restore.html#back-up-gitlab).

## Links

- [Documentation](https://docs.gitlab.com/ee/)
- [Helm Chart](https://charts.pascaliske.dev/charts/gitlab/)
- [GitLab Repository](https://gitlab.com/gitlab-org/gitlab)
