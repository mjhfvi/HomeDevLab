# Kubernetes Cluster

## Kubernetes Cluster Setup

run 'kubernetes_cluster.sh' with -h to get help

## Troubleshooting

### Get podCIDR Information

kubectl get nodes -o jsonpath='{.items[*].spec.podCIDR}'

### Backup Node to file

kubectl get node $(hostname) -o yaml > $(hostname).yaml

### Patch podCIDR Node Data

kubectl patch node $(hostname) -p '{"spec":{"podCIDR":"10.96.0.0/16"}}'

### delete node (ONLY IF YOU NEED TO RESTORE THE NODE)

kubectl get node $(hostname) -o json | jq 'del(.spec.podCIDR)' |(kubectl delete node $(hostname) && kubectl create -f -)

### Restore Node from Backup File

kubectl create -f $(hostname).yaml

### Get Pod IP address

kubectl get pods -o jsonpath='{range .items[*]}{.status.podIP}{"\n"}{end}'
