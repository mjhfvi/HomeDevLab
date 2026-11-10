# <font color="orange">Home Development Lab</font>

## 📌 <font color="purple">Overview</font>

This repository is designed to deploy a kali linux distribution for kubernetes for network debugging in docker container using helm

## 🧰 <font color="purple">Projects list in Helmfile</font>

**kali linux**: deploy kali linux desktop pod in kubernetes\
**VSCode**: deploy VSCode desktop pod in kubernetes\
**Chromium**: deploy Chromium browser pod in kubernetes\
**Terminal**: deploy Terminal pod in kubernetes

## 🎯 <font color="purple">Key Features</font>

- **helm Chart**: deploy applications and desktop environment with web UI over HTTP

## 🛠️ <font color="purple">Tech Stack</font>

- **helm**: Helm
- **helm Chart**: Helefile

## 🔧 <font color="purple">Setup & Installation</font>

### Prerequisites

Ensure you have the following tools installed:

- Docker
- Kubernetes
- Helm
- Helmfile
- Argo-CD
- Ansible
- Terraform
- Terragrunt

## 🏃 <font color="purple">Run Deployment</font>

### Helm

cd charts/**'Project Name'**\

helm install **'Project Name'** --values=values.yaml .

🌋 Cleanup\
helm uninstall **'Project Name'**

### Helmfile

cd ./helmfile

helmfile apply -f helmfile-**'Project Name'**.yml

🌋 Cleanup

helmfile delete -f helmfile-**'Project Name'**.yml

## 🔒 <font color="purple">Security Controls Implemented</font>

## ⚙️ <font color="purple">Future Enhancements</font>

## 📡 <font color="purple">Projects & Acknowledgments</font>

This project relies on various open-source tools and services. \
A huge thanks to the amazing projects that make this possible:

- [linuxserver](https://github.com/linuxserver)
- [raonigabriel](https://github.com/raonigabriel/web-terminal)

If your project benefits from these technologies, consider supporting their development! 🚀

## 📧 <font color="purple">Contact</font>

For any questions or collaboration opportunities, reach out via [LinkedIn](https://www.linkedin.com/in/mjhfvi) or email at `mjhfvi@gmail.com`.
