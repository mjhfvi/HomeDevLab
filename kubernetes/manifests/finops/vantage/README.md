# Deploy Vantage Kubernetes Agent

## Prerequisites

- `kubectl` configured for the target cluster
- `helm` installed
- Access to the target namespace

## 1) Configure `values-dev.yaml`

Update the required fields in `values-dev.yaml`:

```yaml
agent:
  token: "<VANTAGE_TOKEN>"
  clusterID: "<CLUSTER_ID>"
```

- For the token value, ask it from `Tal Shimoni` or your Vantage administrator.
- For the cluster ID, you can use any unique identifier for your cluster (e.g., `aws-dev-01-il-central-1`).

## 2) Install/Upgrade with Helm

add the Vantage Helm repository if you haven't already:

```bash
helm repo add vantage https://vantage-sh.github.io/helm-charts
helm repo update
```

From this folder (`observability/vantage`), run:

```bash
helm upgrade --install vantage vantage/vantage-kubernetes-agent \
  --namespace observability \
  -f values-dev.yaml
```

## 3) Verify deployment

```bash
kubectl --namespace observability get pods
kubectl --namespace observability get svc
```

## Notes

- If you deploy to another namespace, update the `--namespace` flag accordingly.
- Keep `agent.token` out of source control if you switch to a real token file or secret-based setup.

## Uninstall

To uninstall the agent:

```bash
helm uninstall vantage --namespace observability
```

## Deploy with ArgoCD

```bash
argocd app create --file argocd.yaml --grpc-web
```
