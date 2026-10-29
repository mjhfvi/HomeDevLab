# AWS Authentication

This guide provides step-by-step instructions to set up your Terragrunt project using WSL2, configure AWS and Azure SSO login, and manage CLI tools.

## Prerequisites

Ensure you are using **WSL2** and have the following CLI tools installed:

### Install CLI Tools via apt

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y unzip curl jq
```

```bash
sudo apt update && sudo apt upgrade -y

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

```bash
sudo apt install -y gnupg software-properties-common

wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update
sudo apt install -y terraform
```

```bash
TERRAGRUNT_VERSION=$(curl -s https://api.github.com/repos/gruntwork-io/terragrunt/releases/latest | grep tag_name | cut -d '"' -f 4)
wget https://github.com/gruntwork-io/terragrunt/releases/download/${TERRAGRUNT_VERSION}/terragrunt_linux_amd64

chmod +x terragrunt_linux_amd64
sudo mv terragrunt_linux_amd64 /usr/local/bin/terragrunt
```

## AWS CLI Access Keys

Use the following commands to set up your AWS profiles:

**Terraform Backend - S3 Bucket Access**
AWS Account: octopusapp_devops (557690578013) [557690578013_AdministratorAccess]
Profile name: octopus_devops

```bash
aws configure set --profile octopus_devops aws_access_key_id xxxxxxxxxxxxxx
aws configure set --profile octopus_devops aws_secret_access_key xxxxxxxxxxxxxx
aws configure set --profile octopus_devops aws_session_token "xxxxxxxxxxxxxx"
aws configure set --profile octopus_devops region us-east-1
```

**AWS Environments: production**
AWS Account: octopusapp (316115107540) [316115107540_AdministratorAccess]
Profile name: octopus_prod

```bash
aws configure set --profile octopus_prod aws_access_key_id xxxxxxxxxxxxxx
aws configure set --profile octopus_prod aws_secret_access_key xxxxxxxxxxxxxx
aws configure set --profile octopus_prod aws_session_token "xxxxxxxxxxxxxx"
aws configure set --profile octopus_prod region us-east-1
```

**notes** You can check your Profile information in folder ~/.aws/, print the 'config' and 'credentials' files

Set your active profile:

```bash
export AWS_PROFILE=octopus_prod
```

> **Note:** AWS tokens have an expiration time. You may need to re-authenticate and update your `aws_access_key_id` and `aws_secret_access_key` if using long-lived credentials.

## AWS CLI SSO Configuration Guide

This guide explains how to set up and use **AWS SSO (IAM Identity Center)** with the AWS CLI.
Reference: [AWS Docs](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-sso.html#sso-configure-profile-token-auto-sso)

---

### Configure SSO Profile

Run the following command:

```bash
aws configure sso --use-device-code --no-browser
```

Example setup:

```bash
SSO session name (Recommended): octopus_devops
SSO start URL [None]: https://octopusapp.awsapps.com/start/#
SSO region [None]: us-east-1
SSO registration scopes [sso:account:access]:
```

> The CLI will give you a **link** and a **code**.
> Open the link in your browser and enter the code to complete the login.
> After this step, you’ll be asked to choose your AWS account and role.
> Finally, give your profile a name (example: `octopusapp`).

```bash
select profile: octopusapp, aws_prod@octopus-app.com (316115107540)
Default client Region [None]: us-east-1
CLI default output format (json if not specified) [None]: json
``

---

### Default Session Duration

The default session duration is typically 1 hour.

[Set session duration for AWS accounts](https://docs.aws.amazon.com/singlesignon/latest/userguide/howtosessionduration.html)


Ensure your Azure CLI is configured with the same SSO credentials used for AWS if applicable.

## Re-issuing AWS SSO Token

If your session expires, re-authenticate using:

```bash
aws sso login --profile <profile-name> --use-device-code --no-browser
```

✅ Done! You now have AWS CLI configured with SSO.

---

## Troubleshooting

### Get the Profile Information

You can now run AWS CLI commands using your profile:

```bash
aws sts get-caller-identity --profile octopus_devops
```

Output should show your AWS Account ID and role.

- **SSO Login Fails**: Ensure your CLI tools are up to date and that you're using the correct profile name.
- **Permission Denied**: Verify that your IAM roles and SSO permissions are correctly configured.
- **Expired Token**: Run `aws sso login` again and re-export your profile.
- **Missing CLI Tools**: Reinstall using the links or apt commands above.

### Test connection to AWS

```bash
export AWS_PROFILE=octopus_devops
aws s3 ls

aws s3 ls --profile octopus_devops
```

## CleanUp

to remove any terraform OR terragrunt cache files or folder

```bash
find . -type d -name ".terraform" -exec rm -rf "{}" \;
find . -type f -name ".terraform.lock.hcl" -exec rm -f {} \;
find . -type d -name ".terragrunt-cache" -exec rm -rf "{}" \;
```

unset the 'AWS_PROFILE' environment variables

```bash
unset AWS_PROFILE
```
