helm repo add k8sgpt https://charts.k8sgpt.ai/
helm repo update

helm upgrade --install k8sgpt-operator k8sgpt/k8sgpt-operator --namespace management

helm uninstall k8sgpt-operator -n management

setup instructions:
https://medium.com/@krishnadasns/effortless-ai-with-ollama-open-webui-and-k8sgpt-40137d7f14f1
