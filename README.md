# Helm template for Next.js application

Default helm template for OneCX Next.js application.

## Add to Next.js apps

Add latest `0.x.x` version.

```yaml
dependencies:
  - name: helm-nextjs-app
    alias: app
    version: ^0
    repository: oci://ghcr.io/onecx/charts
```

### Config maps

- inject_maps - inject custom map environment variables

### Secrets

- env_secrets - map of env key and value which will be put in the secrets `{{ .Release.Name }}-{{ .Values.name | default .Chart.Name }}-env`
