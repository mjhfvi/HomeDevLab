# Deploy k8tz

## Install Helm Chart

```bash
helm repo add k8tz https://k8tz.github.io/k8tz/
helm repo update
```

## Install k8tz in the `system` namespace

```bash
helm upgrade --install k8tz k8tz/k8tz --namespace system --values ./values.yaml
```

## Uninstall k8tz

```bash
helm uninstall k8tz --namespace system
```
