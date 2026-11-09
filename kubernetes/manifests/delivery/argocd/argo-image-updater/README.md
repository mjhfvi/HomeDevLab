# ArgoCD Configuration

This directory contains the Argo CD configuration

## Deploy ArgoCD to the cluster using Helm

Add helm repository:

```bash
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update
```

Install ArgoCD using Helm:

Configure Argocd Image Updater to use the GitHub Container Registry credentials stored in the `ghcr-registry-secret` secret in the `infrastructure` namespace.

```bash
kubectl create secret docker-registry ghcr-registry-secret \
  --namespace infrastructure \
  --docker-server=ghcr.io \
  --docker-username=<github_username> \
  --docker-password=<github_token> \
  --docker-email=<email_address>
```

**Example:**

```bash
kubectl create secret docker-registry ghcr-registry-secret \
  --namespace infrastructure \
  --docker-server=ghcr.io \
  --docker-username=octopusappdev \
  --docker-password=<github_token> \
  --docker-email="gitops-user@octopus-app.com"
```

add argocd image configuration

```bash
helm upgrade --install argocd-image-updater argo/argocd-image-updater \
  --namespace infrastructure \
  -f values-dev.yaml
```

add argocd image RBAC configuration

```bash
kubectl -f configurations/argocd-image-updater-rbac.yaml apply
```

add argocd image ImageUpdater custom resource (CR) configuration

```bash
kubectl -f configurations/argocd-image-updater-dev.yaml apply
```

## Uninstall ArgoCD Image Updater

```bash
helm uninstall argocd-image-updater --namespace infrastructure
```

## Cleanup ArgoCD Image Updater RBAC and CRD configurations

```bash
kubectl delete crd imageupdaters.argocd-image-updater.argoproj.io
kubectl delete role argocd-image-updater-metrics-auth-role --namespace infrastructure
kubectl delete rolebinding argocd-image-updater-metrics-auth-rolebinding --namespace infrastructure

```

## Testing

```bash
kubectl --namespace octopus-ai get imageupdaters.argocd-image-updater.argoproj.io argocd-image-updater
kubectl --namespace octopus-ai describe imageupdaters.argocd-image-updater.argoproj.io argocd-image-updater
```

### Run cli in pod

```bash
/manager test "ghcr.io/octopusappdev/octopus-ai-agents" --registries-conf-path=/app/config/registries.conf
```

---

helm repo add argocd-rbac-operator https://argoproj-labs.github.io/argocd-rbac-operator/

helm install argocd-rbac-operator argocd-rbac-operator/argocd-rbac-operator --namespace infrastructure --set argocd.namespace=infrastructure --set namespace.nameOverride=infrastructure

helm uninstall argocd-rbac-operator --namespace argocd-rbac-operator-system
helm uninstall argocd-rbac-operator --namespace infrastructure
