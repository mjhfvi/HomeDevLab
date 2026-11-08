# Troubleshooting

## Docker Registry Authentication

```bash
 helm registry login ghcr.io --username gitops-user --password password
```

## Create docker registry secret for pulling images from GitHub Container Registry

```bash
 kubectl -n shared-services create secret docker-registry docker-registry-secret \
  --docker-server=ghcr.io \
  --docker-username=gitops-user \
  --docker-password=password \
  --docker-email=gitops-user@app.com
```

## Delete namespace with finalizer stuck

```bash
NAMESPACE=k8tz
kubectl get namespace $NAMESPACE -o json > $NAMESPACE.json
sed -i -e 's/"kubernetes"//' $NAMESPACE.json
kubectl replace --raw "/api/v1/namespaces/$NAMESPACE/finalize" -f ./$NAMESPACE.json
```
