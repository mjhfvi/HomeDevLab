# AWS Load Balancer Controller

SRE quick guide for configuring and validating the AWS Load Balancer Controller on EKS.

[docs.aws.amazon.com/eks/latest/userguide/lbc-helm.html](https://docs.aws.amazon.com/eks/latest/userguide/lbc-helm.html)

## 1) Values used by this chart

From `values-dev.yaml`:

- `clusterName: octopus-prod-01`
- `region: il-central-1`
- `vpcId: vpc-0edff330047283f14`
- `serviceAccount.name: aws-load-balancer-controller`
- `accountId: 110977281067`

## 2) Find required AWS details

Get AWS account ID:

```bash
aws sts get-caller-identity \
  --query Account \
  --output text \
  --profile <AWS_PROFILE>
```

Verify cluster VPC ID (must match `values-dev.yaml`):

```bash
aws eks describe-cluster \
  --name octopus-prod-01 \
  --region il-central-1 \
  --query "cluster.resourcesVpcConfig.vpcId" \
  --output text \
  --profile <AWS_PROFILE>
```

## 3) IAM role name and policy

Common role name in this setup:

- `AmazonEKSLoadBalancerControllerRole`

List matching roles if needed:

```bash
aws iam list-roles \
  --query "Roles[?contains(RoleName, 'LoadBalancer') || contains(RoleName, 'LBC')].RoleName" \
  --output table \
  --profile <AWS_PROFILE>
```

Attach required AWS managed/custom policy according to your environment, then set the service account annotation to:

```text
arn:aws:iam::<ACCOUNT_ID>:role/<ROLE_NAME>
```

## 4) Install using Helm

Add the EKS charts repo:

```bash
helm repo add eks https://aws.github.io/eks-charts
helm repo update
```

Install (or upgrade) the controller in `kube-system` with your local values file:

```bash
helm upgrade --install aws-load-balancer-controller eks/aws-load-balancer-controller \
  --namespace kube-system \
  --create-namespace \
  -f values-dev.yaml
```

## 5) Add iamserviceaccount for AWS Load Balancer Controller

```bash
eksctl create iamserviceaccount \
    --cluster=octopus-dev-01 \
    --namespace=kube-system \
    --name=aws-load-balancer-controller \
    --attach-policy-arn=arn:aws:iam::<ACCOUNT_ID>:policy/AWSLoadBalancerControllerIAMPolicy \
    --region il-central-1 \
    --approve
```

## 6) Deploy

Deploy the controller and validate that the deployment and pods are running:

```bash
helm upgrade --install aws-load-balancer-controller eks/aws-load-balancer-controller \
  --namespace kube-system \
  -f values-dev.yaml
```

you must manually install the CRDs. Run the following command to install the CRDs:

```bash
wget https://raw.githubusercontent.com/aws/eks-charts/master/stable/aws-load-balancer-controller/crds/crds.yaml
kubectl apply -f crds.yaml
```

make sure the AWS IAM policy attached to the controller's service account has the necessary permissions.
You can find the required permissions in the AWS documentation or by reviewing the policy attached to the service account in the AWS Management Console:

https://110977281067-opdwpish.us-east-1.console.aws.amazon.com/iam/home?region=il-central-1#/policies/details/arn%3Aaws%3Aiam%3A%3A110977281067%3Apolicy%2FAWSLoadBalancerControllerIAMPolicy?section=entities_attached

After applying the chart/helm, validate controller readiness:

```bash
kubectl --namespace kube-system get deployment aws-load-balancer-controller
kubectl --namespace kube-system get pods -l app.kubernetes.io/name=aws-load-balancer-controller
```

Check controller logs for AWS/IAM permission issues:

```bash
kubectl --namespace kube-system logs deployment/aws-load-balancer-controller --tail=200
```

## 7) get DNS name of the ALB

login to AWS console and navigate to the EC2 service, then select "Load Balancers" from the left-hand menu. Look for the ALB that was provisioned by the AWS Load Balancer Controller.
The DNS name of the ALB will be listed in the details of the load balancer.

```bash
# List all load balancer ARNs
aws elbv2 describe-load-balancers --query 'LoadBalancers[].LoadBalancerArn' --output text

# Get the DNS name of a specific load balancer by its name
aws elbv2 describe-load-balancers --names <LOAD-BALANCER-NAME> --query "LoadBalancers[0].DNSName" --output text
```

### Uninstall

```bash
helm uninstall aws-load-balancer-controller --namespace kube-system
```
