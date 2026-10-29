# Deploy RedisInsight

This directory contains Helm values overrides for RedisInsight.

## Prerequisites

- `kubectl` configured for the target cluster
- `helm` installed
- Cluster permissions to create resources in the target namespace

## 1) Review `values-dev.yaml`

Before deployment, review/update:

- `ingress.hosts`
- `ingress.enabled`
- `volume.enabled`

Current dev ingress host:

- `redisinsight.eks-dev-il.octopus-cloud.com`

## 2) Add Helm repository

add Redis Helm repository:

```bash
helm repo add redisinsight https://helm.redis.io
helm repo update
```

## 3) Deploy with Helm

From this folder (`management/redisinsight`), run:

```bash
helm upgrade --install redisinsight redisinsight/redisinsight \
  --namespace management \
  -f values-dev.yaml
```

## 4) Verify deployment

```bash
kubectl -n management get pods
kubectl -n management get svc
kubectl -n management get ingress
```

## Optional: uninstall

```bash
helm uninstall redisinsight -n management
```

## Notes

- This folder contains values files; the chart is pulled from the Redis Helm repository.
- If you need persisted local settings for RedisInsight, set `volume.enabled: true` and configure storage options in values.
