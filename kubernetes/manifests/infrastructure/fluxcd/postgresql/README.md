# FluxCD Setup

```bash
kubectl create namespace database
# kubectl kustomize ..\..\..\database\postgresql\
kubectl --namespace database apply -k ..\..\..\database\postgresql\
kubectl apply -f HelmRepository.yaml
kubectl apply -f HelmRelease.yaml
```
