# Install aws-ebs-csi-driver, aws-load-balancer-controller

This repository contains Kubernetes manifests and Helmfile definitions used to bootstrap cluster infrastructure and application stacks. The main workflow is:

- Deploy AWS EBS CSI Driver
- Deploy AWS Load Balancer Controller

## Prerequisites

- `kubectl` configured for the target cluster
- `helm` installed
- Cluster permissions to create namespaces and install controllers

## Quick Start

### Deploy AWS EBS CSI Driver

update the `values-dev.yaml` with the correct IAM Role ARN and Account ID for the EBS CSI Driver, then run:

```bash
cd kube-system/aws-ebs-csi-driver
helm repo add aws-ebs-csi-driver https://kubernetes-sigs.github.io/aws-ebs-csi-driver/
helm repo update
helm upgrade --install aws-ebs-csi-driver aws-ebs-csi-driver/aws-ebs-csi-driver -n kube-system -f values-dev.yaml
```

### Deploy AWS Load Balancer Controller

update the `values-dev.yaml` with the correct IAM Role ARN and Account ID for the Load Balancer Controller, then run:

```bash
cd kube-system/aws-load-balancer-controller
helm repo add eks https://aws.github.io/eks-charts
helm repo update
helm upgrade --install aws-load-balancer-controller eks/aws-load-balancer-controller -n kube-system -f values-dev.yaml
```
