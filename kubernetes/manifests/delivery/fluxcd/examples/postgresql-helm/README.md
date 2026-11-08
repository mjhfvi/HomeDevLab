# FluxCD Setup

```bash
kubectl apply -f namespace.yaml
kubectl apply -f Credentials.yaml
kubectl kustomize .
kubectl apply -k . --namespace postgresql
kubectl apply -f HelmRepository.yaml
kubectl apply -f HelmRelease.yaml
```
