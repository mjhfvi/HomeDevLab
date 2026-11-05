# FluxCD Setup

## Deploy Redis Service

```bash
kubectl create namespace database
kubectl --namespace database apply -k ..\..\..\manifests\database\redis\
kubectl apply -f HelmRepository.yaml
kubectl apply -f HelmRelease.yaml
```

## Remove Service

```bash
kubectl delete -f HelmRelease.yaml
kubectl delete -f HelmRepository.yaml
kubectl --namespace database delete configmap redis-configmap
```
