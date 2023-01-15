# `code-server`

## Introduction

> Run VS Code on any machine anywhere and access it in the browser.

What if I need to change some values in an HelmRelease?

[`code-server`](https://coder.com/docs/code-server/latest) enables me to do this on-the-fly with an iPad. It is deployed with a single replica and a CronJob which automatically updates all given repositories periodically.

## Created Resources

| Kind                                | Name                      |
| ----------------------------------- | ------------------------- |
| [`Namespace`][ref-namespace]        | `code-server`             |
| [`HelmRelease`][ref-helm-release]   | `code-server`             |

[ref-namespace]: https://kubernetes.io/docs/reference/kubernetes-api/cluster-resources/namespace-v1/
[ref-helm-release]: https://fluxcd.io/docs/components/helm/helmreleases/

## Links

- [Documentation](https://coder.com/docs/code-server/latest)
- [Helm Chart](https://charts.pascaliske.dev/charts/code-server/)
- [GitHub Repository](https://github.com/coder/code-server)
