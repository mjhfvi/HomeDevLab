# Crossplane Setup

Quick guide to deploy Crossplane on Kubernetes with AWS provider using IRSA.
Source: [https://docs.crossplane.io/v2.2/get-started/install/](https://docs.crossplane.io/v2.2/get-started/install/)

## 1. Install Crossplane with Helm

```bash
# Deploy Crossplane
helmfile apply
```

This installs Crossplane from the `crossplane-stable` chart repository with AWS provider pre-configured.

## 2. Create AWS IAM Policy

Create an IAM policy with required permissions for Crossplane to manage AWS resources. Example permissions depend on your use case (S3, RDS, VPC, etc.).

```bash
# Create the policy
aws iam create-policy \
  --policy-name CrossplaneProviderAWS \
  --policy-document file://iam_policy.json
```

## 3. Setup IRSA (IAM Roles for Service Accounts) - TBD

Create an IAM role with trust relationship for the Crossplane service account:

```bash
# Create IAM role with trust policy
aws iam create-role \
  --role-name crossplane-provider-aws \
  --assume-role-policy-document file://trust.json

# Attach the policy
aws iam attach-role-policy \
  --role-name crossplane-provider-aws \
  --policy-arn arn:aws:iam::YOUR_ACCOUNT:policy/CrossplaneProviderAWS
```

Update `trust.json` with your EKS OIDC provider ARN.

## 4. Create AWS Credentials

Apply the AWS Credentials configuration:

```bash
# Apply the AWS Credentials configuration
kubectl apply -f aws-credentials.yaml
```

## 5. Create Upbound Marketplace Providers

Apply the AWS provider configuration:

```bash
# Apply the AWS Provider configuration
kubectl apply -f aws-provider.yaml
```

This creates:

- Provider instance from Upbound marketplace
- ProviderConfig using IRSA credentials (InjectedIdentity) - TBD

### Upbound Marketplace Providers

Browse available providers at [marketplace.upbound.io/providers](https://marketplace.upbound.io/providers)

**Usage:**

1. Find a provider (AWS, Azure, GCP, etc.)
2. Copy the package reference (e.g., `xpkg.upbound.io/crossplane-contrib/provider-aws:v0.55.0`)
3. Create a Provider manifest or add to helmfile values:

```yaml
provider:
  packages:
    - xpkg.upbound.io/crossplane-contrib/provider-aws:v0.55.0
```

## Testing

Test your setup by creating a resource:

```bash
kubectl apply -f test-s3.yaml
```

## References

- [Crossplane Documentation](https://docs.crossplane.io)
- [AWS Provider Docs](https://marketplace.upbound.io/providers/crossplane-contrib/provider-aws)
- [Crossplane on EKS](https://github.com/awslabs/crossplane-on-eks)

## Create RDS Database

open pgadmin and connect to the RDS service using the credentials from the secret created by Crossplane.
create new database for the 'windmill' application.
