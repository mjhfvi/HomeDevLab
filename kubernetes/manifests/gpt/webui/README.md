source: https://github.com/open-webui/helm-charts

helm repo add open-webui https://helm.openwebui.com/
helm repo update

helm upgrade --install open-webui open-webui/open-webui --namespace management -f values-dev.yaml

helm uninstall open-webui --namespace management

https://docs.openwebui.com/reference/env-configuration/

---

kubectl --namespace management -f rbac.yaml apply

helm upgrade --install open-webui open-webui/open-webui --namespace management -f values-dev.yaml

helm uninstall open-webui --namespace management

apt update
apt install curl -y
curl -LO https://github.com/k8sgpt-ai/k8sgpt/releases/download/v0.3.24/k8sgpt_amd64.deb
dpkg -i k8sgpt_amd64.deb

k8sgpt auth add --backend localai --model llama3.1 --baseurl http://localhost:11434

k8sgpt auth default -p localai

k8sgpt analyze --explain --backend localai

that is the ingress url for the grafana service in my k8s cluster, use k8sgpt tool
