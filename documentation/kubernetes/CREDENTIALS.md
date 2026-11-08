# Services

This section provides instructions for deploying services to the cluster, to enable deployment and management of applications using Deploy.

## add docker registry credentials to the cluster

create namespace for services:

```bash
kubectl create namespace platform
```

Then create a docker registry secret with credentials for GitHub Container Registry, where services images are hosted:

```bash
kubectl create secret docker-registry docker-registry-secret \
  --docker-server=ghcr.io \
  --docker-username=gitops-user \
  --docker-password=<your-github-personal-access-token> \
  --docker-email=gitops-user@app.com \
  --namespace platform
```
