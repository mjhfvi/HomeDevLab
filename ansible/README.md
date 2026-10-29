# **Ansible**

## [Security & Pre-commit Hooks](./SECURITY.md)

## **Prerequisites**

ubuntu 22.04
python 3.10

## **Setup local Environments For Ansible**

sudo apt-get update
sudo apt-get install ansible sshpass

pip install "Jinja2<3.1"

ansible-galaxy install -r requirements.yaml
ansible-galaxy collection list

## **Ansible Install Options**

**Full Installation**\
ansible-playbook -i inventory.yaml playbook.yaml

**Installation with Tags**\
ansible-playbook -i inventory.yaml playbook.yaml --tags apt-install\
ansible-playbook -i inventory.yaml playbook.yaml --tags ubuntu_setup,docker_setup\
ansible-playbook -i inventory.yaml playbook.yaml --skip-tags apt-install

**Full Installation with Remote Access (Lans)**\
ansible-playbook -i inventory.yaml playbook.yaml --tags kubeadm_remote_access

## **Tags**

### Global Tags to Run Full Setup

| Role | Tag |
| :------- | :------: |
| checklist  | checklist_setup  |
| ubuntu  | ubuntu_setup  |
| docker  | docker_setup  |
| kubernetes  | kubernetes_setup  |
| kubernetes  | kubeadm_setup  |
| helm  | helm_setup  |
| argocd  | argocd_setup  |
| cleanup  | cleanup_setup  |

### Task Spasific Tags

| Checklist | Tag |
| :------- | :------: |
| os_checklist  | run test to check the OS environments  |
| os_gether_facts  | get os facts  |

---

| Ubuntu | Tag |
| :------- | :------: |
| packages_install  | install all recommended packages using APT/PIP  |
| apt_install  | install all recommended packages using APT only  |
| pip_install  | install all recommended packages using PIP only  |
| hostname_update  | update the hostname from inventory value '{{ inventory_hostname }}'  |

---

| Docker | Tag |
| :------- | :------:  |
| docker_apt  | install all recommended packages for Docker APT  |
| docker_config_toml  | update configuration for docker in config.toml file  |

---

| Kubernetes | Tag |
| :------- | :------: |
| kubernetes_apt  | install all recommended packages for Kubernetes using APT  |
| cni-install  | install CNI plugins for the kubernetes cluster  |

---

| kubeadm | Tag |
| :------- | :------: |
| kubeadm_init  | run kubeadm init to initiate the cluster  |
| kubeadm_config  | update configuration for kubernetes  |
| kubeadm_join  | run kubeadm join workflow to build the kubernetes cluster  |
| kubeadm_cni  | install cni tool for kubernetes cluster (cluster networking)  |
| kubeadm_remote_access  | update kubernetes cluster remote access (only work with '--tags') |
| kubeadm_health  | check the kubernetes cluster health status  |

---

| Helm | Tag |
| :------- | :------: |
| helm_install | install helm package for Kubernetes using APT  |
| helm_add_repo | add helm repository  |

---

| Argocd | Tag |
| :------- | :------: |
| argocd_install | install ArgoCD binary (cli) to kubernetes cluster  |
| argocd_service | install ArgoCD microservice to kubernetes cluster  |

---

| Traefik | Tag |
| :------- | :------: |
| Traefik_install | install Traefik microservice Menifast  |

---

| Metallb | Tag |
| :------- | :------: |
| metallb_setup | install Metallb microservice Menifast  |

---

| Cleanup | Tag |
| :------- | :------: |
| none | none |

---

## **Troubleshooting**

if you dont have remote access to the cluster from Lans, you need to run the tag 'kubeadm_remote_access'

### kubelet service

Get logs in real ime

```sh
journalctl -u kubelet.service -f
```

Get log for the past 1 hour

```sh
journalctl -r -u kubelet.service --since "1 hour ago"
```

### Cleanup the Environment (for Testing)

[Cleanup Commands](./CLEANUP.md)
