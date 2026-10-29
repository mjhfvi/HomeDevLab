helm repo add cert-manager <https://charts.jetstack.io>
helm repo update
helm install cert-manager cert-manager/cert-manager --namespace infrastructure -f values.yaml
