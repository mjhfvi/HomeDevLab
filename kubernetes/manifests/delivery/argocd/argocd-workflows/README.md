helm repo add argo https://argoproj.github.io/argo-helm

Install ArgoCD using Helm:

```bash
helm upgrade --install argo-workflows argo/argo-workflows \
  --namespace infrastructure \
  -f values-dev.yaml
```

uninstall ArgoCD using Helm:

```bash
helm uninstall argo-workflows --namespace infrastructure
```

To get the token for the Argo Workflows server, run:

```bash
kubectl --namespace infrastructure create token argo-workflows-server
```

create namespace for Argo Workflows to run workflows:

```bash
kubectl create namespace argo-workflows
```

create service account for Argo Workflows to run workflows:

```bash
kubectl -f configurations/argo-workflows.yaml apply
```


create a workflow to test the installation:

```bash
kubectl apply -f argo-workflows/hello-world.yaml
```
