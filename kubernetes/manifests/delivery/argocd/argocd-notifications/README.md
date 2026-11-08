# Setup Email Notifications for Argo

This guide will help you set up email notifications for Argo CD using Argo CD Notifications. We will use Gmail as the email service provider, but you can adapt the instructions for other providers as needed.

## Add Argo CD Notifications to your cluster

1. Add the Argo CD Notifications Helm repository:

```bash
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update

helm upgrade --install argocd-notifications argo/argocd-notifications \
  --namespace infrastructure \
  -f values-dev.yaml
```

## Add SMTP Secret

1. Create a Kubernetes secret to store your SMTP credentials. Replace `<your-email>` and `<your-app-password>` with your actual email address and app password.

```bash
kubectl -f argocd-notifications-config.yaml apply
```

## Configure Argo CD Notifications annotations

Add the following annotations to your Argo CD Application manifest to enable email notifications for sync success and failure events:

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  annotations:
    notifications.argoproj.io/subscribe.on-sync-succeeded.email: "devops@octopus-app.com"
    notifications.argoproj.io/subscribe.on-sync-failed.email: "devops@octopus-app.com"
```

## Test Notifications

login in to the argo notifications controller pod:
test the notifications `template` by sending a test email to the specified recipient:

```bash
argocd admin notifications template notify app-sync-succeeded argocd-workflows --recipient email:tzahi@octopus-app.com
```

test the notifications `trigger` by simulating a sync failure event:

```bash
argocd admin notifications trigger run on-sync-failed argocd-workflows
```

## uninstall Argo CD Notifications

To uninstall Argo CD Notifications from your cluster, run the following command:

```bash
helm uninstall argocd-notifications --namespace infrastructure
```

---

You can also subscribe to other events by adding the corresponding annotations. Here are some examples:

notifications.argoproj.io/subscribe.on-deployed.teams: channel-name
notifications.argoproj.io/subscribe.on-health-degraded: channel-name
notifications.argoproj.io/subscribe.on-sync-failed.teams: channel-name
notifications.argoproj.io/subscribe.on-sync-running.teams: channel-name
notifications.argoproj.io/subscribe.on-sync-succeeded.teams: channel-name
