helm repo add stakater https://stakater.github.io/stakater-charts

helm upgrade --install terminal stakater/application \
 --namespace management \
 -f values-dev.yaml

helm uninstall terminal --namespace management
