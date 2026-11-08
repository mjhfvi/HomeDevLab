# AWS EBS CSI Driver

Use this guide to find the correct AWS account ID and IAM role name, then update `values-dev.yaml`.

## 1) Get AWS account ID

```bash
aws sts get-caller-identity \
  --query Account \
  --output text \
  --profile <AWS_PROFILE>
```

## 2) Find the EBS CSI IAM role name

List candidate roles:

```bash
aws iam list-roles \
  --query "Roles[?contains(RoleName, 'EBS') || contains(RoleName, 'CSI')].RoleName" \
  --output table \
  --profile <AWS_PROFILE>
```

Common role name in this setup:

- `AmazonEBSCSIDriverRole`

## 3) Update the role ARN in values file

Edit `values-dev.yaml` and set:

```yaml
controller:
  serviceAccount:
    annotations:
      eks.amazonaws.com/role-arn: arn:aws:iam::<ACCOUNT_ID>:role/<ROLE_NAME>
```

Current dev value in this repo is:

- `arn:aws:iam::11111111111:role/AmazonEKS_EBS_CSI_DriverRole`

## 4) Install using Helm

Add the upstream AWS EBS CSI Helm repo:

```bash
helm repo add aws-ebs-csi-driver https://kubernetes-sigs.github.io/aws-ebs-csi-driver
helm repo update
```

Install (or upgrade) the driver in `kube-system` with your local values file:

```bash
helm upgrade --install aws-ebs-csi-driver aws-ebs-csi-driver/aws-ebs-csi-driver \
  --namespace kube-system \
  -f values-dev.yaml
```

Quick verification:

```bash
kubectl get pods -n kube-system -l app.kubernetes.io/name=aws-ebs-csi-driver
kubectl get csidriver ebs.csi.aws.com
```

## 5) Find the StorageClass in AWS (quick check)

First confirm the StorageClass in the cluster:

```bash
kubectl get storageclass ebs-sc -o yaml
```

Then find EBS volumes created by this StorageClass (tagged as `Name=ebs-sc` in `values-dev.yaml`):

```bash
aws ec2 describe-volumes \
  --filters Name=tag:Name,Values=ebs-sc \
  --query "Volumes[*].[VolumeId,AvailabilityZone,Size,VolumeType,State]" \
  --output table \
  --profile <AWS_PROFILE>
```

## Uninstall

```bash
helm uninstall aws-ebs-csi-driver --namespace kube-system
```
