# Kubernetes Cluster Installation

1. add NFS server for "Persistent Volume" Storage
   1. add folders and set permissions for "Persistent Volume"
2. create kubernetes cluster
3. add network cni for kubernetes cluster
   1. ```sh kubectl apply -f https://github.com/flannel-io/flannel/releases/latest/download/kube-flannel.yml```
   2. in case of issues install RBAC:  ```sh kubectl apply -f https://github.com/flannel-io/flannel/releases/latest/download/kube-flannel-rbac.yml```
4. install matellb
   1. check logs for "kube-proxy", "flannel", "matellb"
5. add storage class for "Persistent Volume" and "Persistent Volume Claim"
6. add "Persistent Volume" and "Persistent Volume Claim" for service you need
7. install services
