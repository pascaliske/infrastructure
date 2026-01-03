# `gitlab`

## Introduction

[GitLab](https://about.gitlab.com) is a all-in-one platform to plan, build, secure, and deploy software in a DevOps based manner. It includes a full featured CI/CD toolchain.

I don't want to upload the code of some of my projects to a platform like GitHub for privacy reasons and therefore I use a self-hosted instance of GitLab for these projects. Besides, the setup and maintenance of a GitLab instance was a good exercise for me.

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

!!! tip

    These commands could be perfectly automated using a Kubernetes `CronJob`. You can see an [example](https://github.com/pascaliske/helm-charts/blob/master/charts/gitlab/templates/cronjob.yaml) in my Helm chart for GitLab.

## Links

- [Documentation](https://docs.gitlab.com/ee/)
- [Helm Chart](https://charts.pascaliske.dev/charts/gitlab/)
- [GitLab Repository](https://gitlab.com/gitlab-org/gitlab)
