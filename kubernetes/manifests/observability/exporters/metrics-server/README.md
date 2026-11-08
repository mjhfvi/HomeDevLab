# Metrics-Server Documentation

## Setup Helm Charts

### GitHub Project [GitHub](https://github.com/kubernetes-sigs/metrics-server)

### Values on [Artifacthub.io](https://artifacthub.io/packages/helm/metrics-server/metrics-server)

### Chart Values on [Github.com](https://github.com/kubernetes-sigs/metrics-server/blob/master/charts/metrics-server/values.yaml)

### Tested Version [v0.7.2]

## Installation

## Create Namespace

```sh
kubectl create ns metrics
```

### Helmfile

```sh
helmfile apply helmfile.yaml
```

### Port Forward (For Testing)

```sh
kubectl port-forward -n metrics-server --address 0.0.0.0 $(kubectl get pods -n metrics-server --selector "app.kubernetes.io/name=metrics-server" --output=name) 10008:8200
```

```cmd
add to hosts file 'x.x.x.x metrics-server.localhost.local'
```

## Troubleshooting
