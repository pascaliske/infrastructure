# Config

This section provides global configuration values for all [services](/cluster/services/), e.g. the cluster internal domain.

It creates a `ConfigMap` object called `cluster-settings` with regular values and a `Secret` object called `cluster-secrets` containing secret values. The latter is encrypted in-place using Mozillas [SOPS](https://github.com/mozilla/sops) tool.

[See this guide](https://fluxcd.io/docs/guides/mozilla-sops/) for more information on the usage of SOPS in combination with Flux.
