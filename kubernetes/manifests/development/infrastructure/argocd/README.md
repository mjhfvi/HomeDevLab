# ArgoCD Configuration

This directory contains the Argo CD configuration

## Deploy ArgoCD to the cluster using Helm

Add helm repository:

```bash
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update
```

Install ArgoCD using Helm:

```bash
helm upgrade --install argocd argo/argo-cd \
  --namespace infrastructure \
  -f values-dev.yaml
```

using version 9.4.10 of the chart:

```bash
helm upgrade --install argocd argo/argo-cd \
  --namespace infrastructure \
  -f values-dev.yaml \
  --version 9.4.10
```

### Login to ArgoCD

To retrieve the initial admin password, run the following command:

```bash
kubectl --namespace infrastructure get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```

Login to the ArgoCD UI using the retrieved password and the username `admin`. The ArgoCD UI should be accessible at the domain specified in `values-dev.yaml` (e.g., `argocd.eks-dev-il.octopus-cloud.com`).

## Connecting a Repository

### Prerequisites

- Access to the ArgoCD UI
- Git repository credentials

### Steps

1. Navigate to **Settings** → **Repositories** in the ArgoCD UI
2. Click **Connect Repository**
3. Configure the repository with the following settings:

    | Setting               | Value                                              |
    | --------------------- | -------------------------------------------------- |
    | **Connection Method** | Via HTTPS                                          |
    | **Type**              | git                                                |
    | **Repository URL**    | `https://github.com/octopusappdev/octopus-dev.git` |
    | **Project**           | octopus                                            |
    | **Name**              | octopus-dev                                        |
    | **Username**          | `gitops-user@octopus-app.com`                      |
    | **Password**          | gitops-user token (stored in Excel file in Teams)  |

4. Click **Connect**

## Files

| File                | Description                        |
| ------------------- | ---------------------------------- |
| `chart.yaml`        | Helm chart definition              |
| `helmfile.yaml`     | Helmfile configuration             |
| `ingressroute.yaml` | Traefik IngressRoute for ArgoCD UI |
| `Values.yaml`       | Helm values override               |

### CLI Connect to ArgoCD Server

argocd login <ARGOCD_DOMAIN_NAME> example: argocd login argocd.eks-dev-il.local.com

argocd app create -f argocd.yaml

## Add ArgoCD Project

```bash
argocd proj create --file configuration\projects.yaml --grpc-web
```

## Add ArgoCD Repositories

```bash
kubectl --namespace infrastructure -f configuration\repositories.yaml apply
```

## Add ArgoCD Repository - Testing CLI

```bash
argocd repo add https://github.com/octopusappdev/devops-kubernetes-clusters-manifests --username git --password secret --grpc-web
```

## Upgrade ArgoCD Application

```bash
helm --namespace infrastructure upgrade argocd argo/argo-cd -f values-dev.yaml
```

## Uninstall ArgoCD

```bash
helm uninstall argocd --namespace infrastructure
```
