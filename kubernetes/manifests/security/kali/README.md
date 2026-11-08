helm repo add kali https://simonmisencik.github.io/helm-charts

helm repo update

helm install kali kali/kali --namespace management

helm uninstall kali --namespace management

helm upgrade --install kali stakater/application  \
  --namespace management \
  -f values-dev.yaml

user: kasm_user
password: password
