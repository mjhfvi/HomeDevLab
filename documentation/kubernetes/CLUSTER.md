# source: <https://computingforgeeks.com/deploy-kubernetes-cluster-on-ubuntu-with-kubeadm/>

# kubeadm - a CLI tool that will install and configure the various components of a cluster in a standard way

# kubelet - a system service/program that runs on all nodes and handles node-level operations

# kubectl - a CLI tool used for issuing commands to the cluster through its API Server

install ubuntu 24.10
<https://hbayraktar.medium.com/how-to-install-kubernetes-cluster-on-ubuntu-22-04-step-by-step-guide-7dbf7e8f5f99>

# remove older docker version

sudo apt-get purge -y docker*containerd* runc && sudo apt autoremove -y

# setup your OS

sudo apt-get update && sudo apt-get install -y apt-transport-https gnupg2 curl gnupg-agent software-properties-common

# add google repository for docker

curl -fsSL <https://download.docker.com/linux/ubuntu/gpg> | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] <https://download.docker.com/linux/ubuntu> $(lsb_release -cs) stable"

# add google repository for kubernetes

curl -s <https://packages.cloud.google.com/apt/doc/apt-key.gpg> | sudo apt-key add -
echo "deb <https://apt.kubernetes.io/> kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list

# disable firewall

systemctl stop ufw.service
systemctl disable ufw.service

# Disable local swap

sudo swapoff -a
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

# install kubernetes

sudo apt-get update && sudo apt install -y kubeadm kubectl kubelet

# Configure sysctl

sudo modprobe overlay
sudo modprobe br_netfilter

sudo tee /etc/sysctl.d/kubernetes.conf<<EOF
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
EOF

sudo sysctl --system

# install the 19.03 version for kubernetes 1.20.2 # check the repository versions 'apt-cache madison docker-ce'

sudo apt-get update && sudo apt-get install -y docker-ce=5:19.03.14~3-0~ubuntu-focal docker-ce-cli=5:19.03.14~3-0~ubuntu-focal containerd.io

# change cgdriver to systemd (fix install error in kubeadm)

# Create required directories

sudo mkdir -p /etc/systemd/system/docker.service.d

# Create daemon json config file

sudo tee /etc/docker/daemon.json <<EOF
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2"
}
EOF

# Start and enable Services

sudo systemctl daemon-reload
sudo systemctl restart docker
sudo systemctl enable docker

# check docker installed version

docker --version

# check if the dicker service is enabled

systemctl status docker.service

# enable the docker service if its not enable

# systemctl enable docker.service

# reload and restart systemctl

# sudo systemctl daemon-reload

# sudo systemctl restart docker

# start kubernetes host cluster

kubeadm init

# add node to kubernetes cluster host from the host setup

# kubeadm join 192.168.50.71:6443 --token xxx --discovery-token-ca-cert-hash sha256:xxx

# start using your cluster, you need to run the following as a regular user

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Install the Calico network plugin

curl <https://docs.projectcalico.org/manifests/calico.yaml> -O
kubectl apply -f calico.yaml

# check nodes on host

kubectl get nodes

# check pods on host

kubectl get pods --all-namespaces

# keep packages from updating

sudo apt-mark hold docker-ce docker-ce-cli kubelet kubeadm kubectl

------------------------------------------------------------------------------------------------------------

# NotReady error in kubernetes

kubectl apply -f "<https://cloud.weave.works/k8s/net?k8s-version=$(kubectl> version | base64 | tr -d '\n')"

# wait for 1-2 min and test the cluster

kubectl describe nodes

# check nodes on host

kubectl get nodes

------------------------------------------------------------------------------------------------------------

# kubeadm reset pr clear up settings

kubeadm reset

# source: <https://computingforgeeks.com/deploy-kubernetes-cluster-on-ubuntu-with-kubeadm/>

# kubeadm - a CLI tool that will install and configure the various components of a cluster in a standard way

# kubelet - a system service/program that runs on all nodes and handles node-level operations

# kubectl - a CLI tool used for issuing commands to the cluster through its API Server

# remove older docker version

sudo apt-get purge -y docker*containerd* runc && sudo apt autoremove -y

# setup your OS

sudo apt-get update && sudo apt-get install -y apt-transport-https gnupg2 curl gnupg-agent software-properties-common

# add google repository for docker

curl -fsSL <https://download.docker.com/linux/ubuntu/gpg> | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] <https://download.docker.com/linux/ubuntu> $(lsb_release -cs) stable"

# add google repository for kubernetes

curl -s <https://packages.cloud.google.com/apt/doc/apt-key.gpg> | sudo apt-key add -
echo "deb <https://apt.kubernetes.io/> kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list

# disable firewall

systemctl stop ufw.service
systemctl disable ufw.service

# Disable local swap

sudo swapoff -a
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

# install kubernetes

sudo apt-get update && sudo apt install -y kubeadm kubectl kubelet

# Configure sysctl

sudo modprobe overlay
sudo modprobe br_netfilter

sudo tee /etc/sysctl.d/kubernetes.conf<<EOF
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
EOF

sudo sysctl --system

# install the 19.03 version for kubernetes 1.20.2 # check the repository versions 'apt-cache madison docker-ce'

sudo apt-get update && sudo apt-get install -y docker-ce=5:19.03.14~3-0~ubuntu-focal docker-ce-cli=5:19.03.14~3-0~ubuntu-focal containerd.io

# change cgdriver to systemd (fix install error in kubeadm)

# Create required directories

sudo mkdir -p /etc/systemd/system/docker.service.d

# Create daemon json config file

sudo tee /etc/docker/daemon.json <<EOF
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2"
}
EOF

# Start and enable Services

sudo systemctl daemon-reload
sudo systemctl restart docker
sudo systemctl enable docker

# check docker installed version

docker --version

# check if the dicker service is enabled

systemctl status docker.service

# enable the docker service if its not enable

# systemctl enable docker.service

# reload and restart systemctl

# sudo systemctl daemon-reload

# sudo systemctl restart docker

# add node to kubernetes cluster host from the host setup

kubeadm join 192.168.50.71:6443 --token XXX \
    --discovery-token-ca-cert-hash sha256:XXX

# check if kubectl service is running

sudo systemctl status kubelet.service

# keep packages from updating

sudo apt-mark hold docker-ce docker-ce-cli kubelet kubeadm kubectl

cat <<EOF | sudo tee /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list
deb <http://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_20.10/> /
EOF
cat <<EOF | sudo tee /etc/apt/sources.list.d/devel:kubic:libcontainers:stable:cri-o:1.20.list
deb <http://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable:/cri-o:/1.20/xUbuntu_20.04/> /
EOF

curl -L <https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_20.10/Release.key> | sudo apt-key --keyring /etc/apt/trusted.gpg.d/libcontainers.gpg add -
curl -L <https://download.opensuse.org/repositories/devel:kubic:libcontainers:stable:cri-o:1.20/xUbuntu_20.04/Release.key> | sudo apt-key --keyring /etc/apt/trusted.gpg.d/libcontainers-cri-o.gpg add -

sudo apt-get update
sudo apt-get install cri-o cri-o-runc=1.19

sudo systemctl daemon-reload
sudo systemctl start crio

# fix error detected "cgroupfs" as the Docker cgroup driver. Create the .conf file to load the modules at bootup

cat <<EOF | sudo tee /etc/modules-load.d/crio.conf
overlay
br_netfilter
EOF

cat <<EOF | sudo tee /etc/modules-load.d/containerd.conf
overlay
br_netfilter
EOF

## install cri-o for kubernetes cluster

# install cri-o for kubernetes

export OS=xUbuntu_20.04
export VERSION=1.18
echo "deb <https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/$OS/> /" > /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list
echo "deb <http://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable:/cri-o:/$VERSION/$OS/> /" > /etc/apt/sources.list.d/devel:kubic:libcontainers:stable:cri-o:$VERSION.list

curl -L <https://download.opensuse.org/repositories/devel:kubic:libcontainers:stable:cri-o:$VERSION/$OS/Release.key> | apt-key add -
curl -L <https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/$OS/Release.key> | apt-key add -

apt update
apt install -y cri-o cri-o-runc

sudo systemctl daemon-reload
sudo systemctl start crio

cat <<EOF | sudo tee /etc/crio/crio.conf.d/02-cgroup-manager.conf
[crio.runtime]
conmon_cgroup = "pod"
cgroup_manager = "cgroupfs"
EOF

## install network CNI plugin

# source: <https://docs.projectcalico.org/getting-started/kubernetes/hardway/install-cni-plugin>

curl -L -o /opt/cni/bin/calico <https://github.com/projectcalico/cni-plugin/releases/download/v3.16.6/calico-amd64>
chmod 755 /opt/cni/bin/calico
curl -L -o /opt/cni/bin/calico-ipam <https://github.com/projectcalico/cni-plugin/releases/download/v3.16.6/calico-ipam-amd64>
chmod 755 /opt/cni/bin/calico-ipam

mkdir -p /etc/cni/net.d/
