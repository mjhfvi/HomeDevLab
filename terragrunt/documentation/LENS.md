# Lens Setup Guide (Windows)

## AWS CLI & SSO Configuration

1. Download and install AWS CLI:
   <https://awscli.amazonaws.com/AWSCLIV2.msi>

2. Configure AWS SSO:
   aws configure sso
   - SSO session name: octopusapp_dev
   - SSO start URL: <https://octopusapp.awsapps.com/start/#>
   - SSO region: us-east-1
   - SSO registration scopes: sso:account:access

## EKS Configuration

Update kubeconfig for EKS:
aws eks update-kubeconfig --name=dev-01 --profile=AdministratorAccess --region=us-east-1 --alias=cluster-dev-01

## Kubelogin Installation (Linux/macOS)

1. Download kubelogin:
   curl -LO <https://github.com/Azure/kubelogin/releases/download/v0.2.10/kubelogin-linux-amd64.zip>

2. Unzip and move binary:
   unzip kubelogin-linux-amd64.zip
   cd bin/linux_amd64
   sudo mv kubelogin /usr/local/bin/

## AKS Credentials Setup

Get AKS credentials:
az aks get-credentials --resource-group <your-resource-group> --name <your-cluster-name> --admin
