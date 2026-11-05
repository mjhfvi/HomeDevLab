# FluxCD Setup

## Deploy Postgresql Service

```bash
kubectl create namespace database
# kubectl kustomize ..\..\..\database\postgresql\
kubectl --namespace database apply -k ..\..\..\manifests\database\postgresql\
kubectl apply -f HelmRepository.yaml
kubectl apply -f HelmRelease.yaml
```

## Remove Service

```bash
kubectl delete -f HelmRelease.yaml
kubectl delete -f HelmRepository.yaml
kubectl --namespace database delete configmap postgresql-configmap
```
