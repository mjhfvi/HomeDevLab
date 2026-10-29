# Configure Kubernetes Cluster

## Configure AWS EKS Cluster

This guide helps the SRE team add an AWS EKS cluster to [Lens](https://k8slens.dev/), the Kubernetes IDE, for cluster management and troubleshooting.

---

### Prerequisites

- AWS CLI installed and configured
- IAM permissions for EKS access
- Lens installed on your workstation

---

### 1. Configure AWS CLI

Set up your AWS credentials and profile:

```powershell
aws configure list-profiles
aws configure --profile <your_profile>
```

If using SSO:

```powershell
aws configure sso
```

```sh
Set "SSO session Name": octopus_dev (or any name you want)
SSO start URL [None]: https://octopusapp.awsapps.com/start/#
SSO region [None]: us-east-1
SSO registration scopes [sso:account:access]: sso:account:access

Select AWS Account: octopusapp_dev, aws_dev@octopus-app.com (110977281067)
Default client Region [us-east-1]: us-east-1
CLI default output format (json if not specified) [json]: json
Profile name [AdministratorAccess-110977281067]: AdministratorAccess-110977281067
```

Verify your identity:

```powershell
aws sts get-caller-identity --profile <your_profile>
```

---

### 2. List and Select EKS Cluster

```powershell
aws eks list-clusters --region <region> --profile <your_profile>
```

---

### 3. Update kubeconfig for EKS

This adds the EKS cluster context to your local kubeconfig file:

```powershell
aws eks update-kubeconfig --region <region> --name <cluster_name> --alias <alias_name> --profile <your_profile>
```

---

### Add 'storageclass' to Cluster

in path 'devops.onprem.infrastructure\aws-ebs-csi-driver' run 'kubectl apply -f storageclass.yaml'

<!-- update value "eks.amazonaws.com/role-arn"
run "devops.onprem.infrastructure\aws-ebs-csi-driver\helmfile.yaml" -->

### 4. Add Cluster to Lens

1. Open Lens.
2. Click **+ Add Cluster**.
3. Select **Kubeconfig** and browse to your kubeconfig file (usually at `~/.kube/config`).
4. Select the EKS cluster context you just added.
5. Click **Add Cluster**.

Lens will now connect to your EKS cluster. You can view nodes, pods, logs, and manage resources.

---

## Configure Azure AKS Cluster

```sh
az aks get-credentials --resource-group <your-resource-group> --name <your-cluster-name> --admin
```

## Install kubelogin (example for Linux/macOS)

```sh
curl -LO https://github.com/Azure/kubelogin/releases/download/v0.2.10/kubelogin-linux-amd64.zip # Replace X with the latest version
unzip kubelogin-linux-amd64.zip
cd bin/linux_amd64
sudo mv kubelogin /usr/local/bin/
```

## Troubleshooting

- Ensure your AWS credentials are valid and have EKS access.
- If Lens cannot connect, verify your kubeconfig and network connectivity.
- For multiple clusters, repeat steps 2-4 for each cluster.

---

**For questions or issues, contact the SRE team or refer to the [Lens documentation](https://docs.k8slens.dev/).**
