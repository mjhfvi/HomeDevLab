# FluxCD Setup

## Deploy Jenkins Service

```bash
kubectl create namespace automation
kubectl --namespace automation apply -k ..\..\..\manifests\automation\jenkins\
kubectl apply -f HelmRepository.yaml
kubectl apply -f HelmRelease.yaml
```

## Remove Service

```bash
kubectl delete -f HelmRelease.yaml
kubectl delete -f HelmRepository.yaml
kubectl --namespace automation delete configmap jenkins-configmap
kubectl --namespace automation delete secrets jenkins-credentials
```
