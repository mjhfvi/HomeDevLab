# Lens Setup Guide (Windows)

## AWS CLI & SSO Configuration

1. Download and install AWS CLI:
   [AWS CLI Installation Guide](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)

2. Configure AWS SSO:
   aws configure sso
   - SSO Session Name: name
   - SSO Start URL: [https://account.awsapps.com/start/#](https://account.awsapps.com/start/#)
   - SSO Region: us-east-1
   - SSO Registration Scopes: sso:account:access

## Kubelogin Installation (Linux/macOS)

1. Download kubelogin:
   curl -LO [https://github.com/Azure/kubelogin/releases/download/v0.2.10/kubelogin-linux-amd64.zip](https://github.com/Azure/kubelogin/releases/download/v0.2.10/kubelogin-linux-amd64.zip)

2. Unzip and move binary:
   unzip kubelogin-linux-amd64.zip
   cd bin/linux_amd64
   sudo mv kubelogin /usr/local/bin/

## Configure Lens for AWS EKS

### EKS Configuration

#### Update kubeconfig for EKS

aws eks update-kubeconfig --name=dev-01 --profile=AdministratorAccess --region=us-east-1 --alias=aws-cluster-dev-01

### AKS Credentials Setup

#### Get AKS credentials

az aks get-credentials --resource-group [your-resource-group] --name [your-cluster-name] --admin
