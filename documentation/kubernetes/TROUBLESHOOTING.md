# Troubleshooting

## Docker Registry Authentication

```bash
 helm registry login ghcr.io --username gitops-user --password password
```

## Create docker registry secret for pulling images from GitHub Container Registry

```bash
 kubectl -n shared-services create secret docker-registry docker-registry-secret \
  --docker-server=ghcr.io \
  --docker-username=gitops-user \
  --docker-password=password \
  --docker-email=gitops-user@app.com
```

## Delete namespace with finalizer stuck

```bash
NAMESPACE=k8tz
kubectl get namespace $NAMESPACE -o json > $NAMESPACE.json
sed -i -e 's/"kubernetes"//' $NAMESPACE.json
kubectl replace --raw "/api/v1/namespaces/$NAMESPACE/finalize" -f ./$NAMESPACE.json
```

# make sure the kubectl is running

sudo systemctl status kubectl

# check status of all the nodes

kubectl describe nodes

# check status of a node

kubectl describe node ops02

kubectl get all --all-namespaces
kubectl api-resources -o wide

# remove node: <https://stackoverflow.com/questions/35757620/how-to-gracefully-remove-a-node-from-kubernetes>

# check why pod in pending

kubectl describe pods

kubectl patch statefulset <statefulset_name> --type='json' -p='[{"op": "replace", "path": "/spec/template/spec/containers/0/image", "value":"<new_image_name>"}]'

example:
kubectl patch statefulset jenkins --type='json' -p='[{"op": "replace", "path": "/spec/template/spec/containers/0/image", "value":"jenkins/jenkins:2.446-alpine-jdk21"}]'

kubectl delete pv pvc-801f9b69-c0ca-4833-8740-b4a7bff96cbf --grace-period=0 --force
kubectl -n jenkins patch pv pvc-801f9b69-c0ca-4833-8740-b4a7bff96cbf -p '{"metadata": {"finalizers": null}}'
kubectl -n jenkins patch pv pvc-9d3bc27c-e590-442d-9772-7efc11cb56d6  --type='json' -p='[{"op": "replace", "path": "/spec/template/spec/containers/0/image", "value":"jenkins/jenkins:2.446-alpine-jdk21"}]'

kubectl expose pod elastic-operator-0 --type=LoadBalancer --port=5601 --target-port=9443 --name=kibana-http -n elastic-system

kubectl port-forward service/quickstart-kb-http 5601

kubectl config set-context --current --namespace=default
kubectl config set-context --current --namespace=elastic

kubectl exec pod/busybox1 -- cat /etc/resolv.conf
kubectl exec pod/busybox1 -- lookup 8.8.8.8

kubectl scale statefulset.apps/jenkins --replicas=1 -n jenkins

kubectl apply -f <https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.3.0/deploy/static/provider/cloud/deploy.yaml>
kubectl get pods --namespace ingress-nginx
kubectl get service ingress-nginx-controller --namespace=ingress-nginx

kubectl -n kubernetes-dashboard get secret kubernetes-dashboard-csrf -o jsonpath="{.data.private.key}" | base64 -d
TOKEN=$(kubectl describe secret -n kube-system $(kubectl get secret -n kube-system | awk '/^cluster-admin-dashboard-sa-token-/{print $1}') | awk '$1=="token:"{print $2}')

kubectl -n kubernetes-dashboard create token dashboard-user

kubectl delete all --all
kubectl delete all --all -n {namespace}

kubectl delete CustomResourceDefinition $(kubectl get CustomResourceDefinition -A | grep "splunk.com" | awk '{print $1}')

# error "The connection to the server localhost:8080 was refused - did you specify the right host or port?"

export KUBECONFIG=/etc/kubernetes/admin.conf
kubectl get nodes

# make sure swap is off

sudo swapon -s
sudo sed -i '/ swap / s/^/#/' /etc/fstab
init 6

# reboot the PC

# kubeadm reissue init token info

kubeadm token create --print-join-command

# source: <https://itnext.io/kubernetes-monitoring-with-prometheus-in-15-minutes-8e54d1de2e13>

## setup lens for Kubernetes

# get kubeconfig information

cat /etc/kubernetes/kubelet.conf

# copy pam file to local folder

/var/lib/kubelet/pki/   C:\Users\owner\AppData\Roaming\Lens\kubeconfigs\var\lib\kubelet\pki

# pull images for kubeadm

kubeadm config images pull

# start kubernetes host cluster

kubeadm init

# if 'Found multiple CRI sockets' error then,   kubeadm init --cri-socket /var/run/crio/crio.sock

cp cni.kubeconfig /etc/cni/net.d/calico-kubeconfig
chmod 600 /etc/cni/net.d/calico-kubeconfig

## miniKube setup

# source: <https://minikube.sigs.k8s.io/docs/start/>

curl -LO <https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb>
sudo dpkg -i minikube_latest_amd64.deb

### Delete Resources Stuck in 'Terminating' Status #source: <https://stackoverflow.com/questions/52369247/namespace-stuck-as-terminating-how-i-removed-it/66118514#66118514>

export RESOURCE=namespaces
export RESOURCENAME=

echo kubectl patch $RESOURCE $RESOURCENAME -p '{"metadata":{"finalizers":null}}'

kubectl patch $RESOURCE $RESOURCENAME -p '{"metadata":{"finalizers":null}}'
kubectl get namespaces

OR

kubectl get namespaces
export NAMESPACE=platform
kubectl get namespace $NAMESPACE -o json > $NAMESPACE-tempfile.json

# remove from json '"finalizers": [ "kubernetes"]'

kubectl replace --raw "/api/v1/namespaces/$NAMESPACE/finalize" -f ./$NAMESPACE-tempfile.json
kubectl get namespaces

OR

NS=`kubectl get pvc | grep Terminating | awk 'NR==1 {print $1}'` && kubectl get namespace "$NS" -o json   | tr -d "\n" | sed "s/\"finalizers\": \[[^]]\+\]/\"finalizers\": []/"   | kubectl replace --raw /api/v1/namespaces/$NS/finalize -f -
echo $NS

export RESOURCE=namespaces
kubectl patch $RESOURCE $NS --type='json' -p='[{"op": "replace", "path": "/spec/template/spec/containers/0/image", "value":"<new_image_name>"}]'

example:
kubectl patch statefulset jenkins --type='json' -p='[{"op": "replace", "path": "/spec/template/spec/containers/0/image", "value":"jenkins/jenkins:2.446-alpine-jdk21"}]'

journalctl -u kubelet
sudo apt install nfs-kernel-server telnet

mkdir -p ~/nfsshare/storage
sudo cp /etc/exports /etc/exports.backup && sudo cp /etc/nfs.conf /etc/nfs.conf.backup

sudo vi /etc/exports
sudo vi /etc/nfs.conf
/home/tzahi/storage *(rw,fsid=0,async,no_subtree_check,no_auth_nlm,insecure,no_root_squash)

sudo exports -a OR sudo exportfs -a
sudo systemctl status nfs-kernel-server.service
sudo systemctl restart nfs-kernel-server.service
sudo systemctl status nfs-kernel-server.service

# Troubleshooting Linux

ip a
export SERVER_IP=172.22.54.208
showmount -e $SERVER_IP
sudo exportfs -av
rpcinfo -p $SERVER_IP
sudo cat /proc/fs/nfsd/versions
sudo showmount --exports %SERVER_IP%

telnet $SERVER_IP 2049

# Mount Share Linux

sudo mkdir /mnt/test_share
sudo mount -t nfs $SERVER_IP:/home/tzahi/nfsshare/storage/ /mnt/test_share
sudo umount /mnt/test_share

# Troubleshooting Windows

ipconfig
set SERVER_IP=192.168.50.50
showmount -e %SERVER_IP%
telnet %SERVER_IP% 2049
rpcinfo -p %SERVER_IP%

# Mount Share Windows

mount 172.22.54.208:/home/tzahi/nfsshare/storage/ S:

# get nfs version

sudo mount -t nfs 172.22.54.208:/home/tzahi/storage/ /home/tzahi/test_share
mount -v | grep /mnt/test_share
sudo umount /home/tzahi/test_share

# NFS Version 4 test

sudo mount -t nfs -o nfsvers=4.1 172.22.54.208:/home/tzahi/storage/ /home/tzahi/test_share

## NFS CSI driver for Kubernetes | Source: <https://github.com/kubernetes-csi/csi-driver-nfs/blob/master/docs/install-csi-driver-v4.9.0.md>

# <https://kubernetes.io/docs/concepts/storage/storage-classes/#nfs>

curl -skSL <https://raw.githubusercontent.com/kubernetes-csi/csi-driver-nfs/v4.9.0/deploy/install-driver.sh> | bash -s v4.9.0 --

kubectl -n kube-system get pod -o wide -l app=csi-nfs-controller
