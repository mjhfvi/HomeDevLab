# Minikube Setup

## Install Docker

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl apt-transport-https ca-certificates gnupg lsb-release
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF

sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io

sudo apt install -y util-linux-extra
sudo usermod -aG docker $USER
newgrp docker

```

## Install Minikube

```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
rm minikube-linux-amd64
minikube version
```

## Start Minikube Service

minikube start --driver=docker --listen-address=0.0.0.0 --apiserver-ips=192.168.200.10 --apiserver-port=8443 --memory=6144

## Check Cluster Configuration

minikube kubectl get all

## Setup local `config` file

copy the config file, for windows os change the path to `c:\users\USERNAME`

```bash
minikube kubectl config view
```

## Get Docker Port for the `config` file

```bash
docker port minikube
```

## update ip address and port line

```txt
https://192.168.200.10:32771
```

copy certificates

```bash
cp ~/.minikube/ ./<local home folder>/.minikube/
```

## Enable Metrics

```bash
minikube addons enable metrics-server
```

---

### Troubleshooting

```bash
minikube stop
minikube delete --purge --all
```
