<!-- helm repo add chrome https://ot-container-kit.github.io/helm-charts

helm install chrome chrome/web

helm upgrade --install chrome chrome/web  \
  --namespace management \
  -f values-dev.yaml -->

helm repo add stakater https://stakater.github.io/stakater-charts

helm upgrade --install terminal stakater/application \
 --namespace management \
 -f values-dev.yaml
