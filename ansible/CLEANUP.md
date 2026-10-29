# Cleanup

## Remove all the Kubernetes, Docker Packages

sudo kubeadm reset --force
sudo etcdctl rm --recursive registry
sudo crictl images
sudo crictl rmi --all
sudo apt remove kube* docker* container* -y
sudo apt autoremove -y
sudo rm -R /etc/kubernetes/ /var/lib/etcd /var/lib/kubelet ~/.kube/ /var/lib/cni/ /etc/cni/ /run/flannel /var/lib/containerd /etc/crictl.yaml /etc/containerd/config.toml
sudo systemctl stop kubelet.service
sudo systemctl unmask kubelet
sudo systemctl disable kubelet.service
sudo rm /lib/systemd/system/kubelet.service
sudo systemctl reset-failed
sudo systemctl daemon-reload
sudo systemctl restart containerd
sudo systemctl restart kubelet.service

sudo ifconfig cni0 down
sudo ip link delete cni0
sudo ifconfig flannel.1 down
sudo ip link delete flannel.1
sudo ifconfig docker0 downsudo
sudo brctl delbr cni0

sudo init 6
