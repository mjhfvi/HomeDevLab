# Homepage (Management)

Homepage dashboard deployment for the `management` namespace.

Reference docs:
- https://gethomepage.dev/configs/settings/

## Files in this folder

- `values-dev.yaml`: Helm values (ingress, env, bookmarks, widgets).
- `values.yaml`: base values.
- `argocd.yaml`: Argo CD `Application` manifest.

## Prerequisites

- Kubernetes context points to the target cluster.
- `helm`, `kubectl`, and `argocd` CLIs are installed.
- Namespace `management` exists (or allow Helm to create it).

## Option 1: Deploy with Helm (manual)

```bash
helm repo add homepage https://unknowniq.github.io/helm-charts/
helm repo update

helm upgrade --install homepage homepage/homepage \
  --namespace management \
  --create-namespace \
  -f values-dev.yaml
```

## Option 2: Deploy with Argo CD (GitOps)

Create the Argo CD app from this folder manifest:

```bash
argocd app create --file argocd.yaml --grpc-web
```

If the app already exists, sync it:

```bash
argocd app sync homepage --grpc-web
```

## Validate deployment

```bash
kubectl --namespace management get pods
kubectl --namespace management get svc
kubectl --namespace management get ingress
```

Expected ingress host in `values-dev.yaml`:

```text
urls.eks-dev-il.octopus-cloud.com
```

## Update configuration

1. Edit `values-dev.yaml`.
2. Apply changes:

```bash
helm upgrade --install homepage homepage/homepage \
  --namespace management \
  -f values-dev.yaml
```

For Argo CD-managed deployments, commit and push the values change, then sync:

```bash
argocd app sync homepage --grpc-web
```

## Uninstall

Helm-managed install:

```bash
helm uninstall homepage --namespace management
```

Argo CD-managed install:

```bash
argocd app delete homepage --grpc-web
```
