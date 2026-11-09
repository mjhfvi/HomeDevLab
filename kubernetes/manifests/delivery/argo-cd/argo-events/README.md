helm repo add argo https://argoproj.github.io/argo-helm
helm repo update

helm upgrade --install argo-events argo/argo-events --namespace infrastructure -f values-dev.yaml

helm uninstall argo-events --namespace infrastructure
