# Karpenter Node Pools

## GPU Node Pool

Configuration for Karpenter GPU node pool using `Nvidia GPU` instances.

### Prerequisites

- Karpenter installed on the cluster
- Default NodeClass configured

### Apply

```bash
kubectl apply -f karpenter-node-gpu-pool.yaml
```

### Verify

```bash
kubectl get nodepools
kubectl describe nodepool gpu-pool
```

### Delete

```bash
kubectl delete -f karpenter-node-gpu-pool.yaml
```

### Configuration

| Setting | Value |
| --------- | ------- |
| Instance Group | g, p |
| Architecture | amd64 |
| Node Expiry | 72h |
| Consolidation | WhenEmptyOrUnderutilized |

### Notes

pod configuration
add values for gpu resource requests/limits

```yaml
spec:
  template:
    spec:
      tolerations:
        - effect: NoSchedule
          key: nvidia.com/gpu
          operator: Equal
          value: 'true'
  containers:
    - name: gpu-container
        resources:
          limits:
            nvidia.com/gpu: 1
          requests:
            nvidia.com/gpu: 1
```

Refer to the [Karpenter documentation](https://karpenter.sh/docs/) for more details on configuring node pools and GPU resources.
