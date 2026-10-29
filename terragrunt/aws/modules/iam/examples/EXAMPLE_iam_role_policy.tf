# resource "aws_iam_role_policy" "cdk-hnb659fds-deploy-role-316115107540-us-east-1_default" {
#   name = "default"

#   policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": [
#         "cloudformation:CreateChangeSet",
#         "cloudformation:DeleteChangeSet",
#         "cloudformation:DescribeChangeSet",
#         "cloudformation:DescribeStacks",
#         "cloudformation:ExecuteChangeSet",
#         "cloudformation:CreateStack",
#         "cloudformation:UpdateStack"
#       ],
#       "Effect": "Allow",
#       "Resource": "*",
#       "Sid": "CloudFormationPermissions"
#     },
#     {
#       "Action": [
#         "s3:GetObject*",
#         "s3:GetBucket*",
#         "s3:List*",
#         "s3:Abort*",
#         "s3:DeleteObject*",
#         "s3:PutObject*"
#       ],
#       "Condition": {
#         "StringNotEquals": {
#           "s3:ResourceAccount": "316115107540"
#         }
#       },
#       "Effect": "Allow",
#       "Resource": "*",
#       "Sid": "PipelineCrossAccountArtifactsBucket"
#     },
#     {
#       "Action": [
#         "kms:Decrypt",
#         "kms:DescribeKey",
#         "kms:Encrypt",
#         "kms:ReEncrypt*",
#         "kms:GenerateDataKey*"
#       ],
#       "Condition": {
#         "StringEquals": {
#           "kms:ViaService": "s3.us-east-1.amazonaws.com"
#         }
#       },
#       "Effect": "Allow",
#       "Resource": "*",
#       "Sid": "PipelineCrossAccountArtifactsKey"
#     },
#     {
#       "Action": "iam:PassRole",
#       "Effect": "Allow",
#       "Resource": "arn:aws:iam::316115107540:role/cdk-hnb659fds-cfn-exec-role-316115107540-us-east-1"
#     },
#     {
#       "Action": [
#         "cloudformation:DescribeStackEvents",
#         "cloudformation:GetTemplate",
#         "cloudformation:DeleteStack",
#         "cloudformation:UpdateTerminationProtection",
#         "sts:GetCallerIdentity",
#         "cloudformation:GetTemplateSummary"
#       ],
#       "Effect": "Allow",
#       "Resource": "*",
#       "Sid": "CliPermissions"
#     },
#     {
#       "Action": [
#         "s3:GetObject*",
#         "s3:GetBucket*",
#         "s3:List*"
#       ],
#       "Effect": "Allow",
#       "Resource": [
#         "arn:aws:s3:::cdk-hnb659fds-assets-316115107540-us-east-1",
#         "arn:aws:s3:::cdk-hnb659fds-assets-316115107540-us-east-1/*"
#       ],
#       "Sid": "CliStagingBucket"
#     },
#     {
#       "Action": [
#         "ssm:GetParameter"
#       ],
#       "Effect": "Allow",
#       "Resource": [
#         "arn:aws:ssm:us-east-1:316115107540:parameter/cdk-bootstrap/hnb659fds/version"
#       ],
#       "Sid": "ReadVersion"
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   role = "cdk-hnb659fds-deploy-role-316115107540-us-east-1"
# }

# resource "aws_iam_role_policy" "cdk-hnb659fds-file-publishing-role-316115107540-us-east-1_cdk-hnb659fds-file-publishing-role-default-policy-316115107540-us-east-1" {
#   name = "cdk-hnb659fds-file-publishing-role-default-policy-316115107540-us-east-1"

#   policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": [
#         "s3:GetObject*",
#         "s3:GetBucket*",
#         "s3:GetEncryptionConfiguration",
#         "s3:List*",
#         "s3:DeleteObject*",
#         "s3:PutObject*",
#         "s3:Abort*"
#       ],
#       "Effect": "Allow",
#       "Resource": [
#         "arn:aws:s3:::cdk-hnb659fds-assets-316115107540-us-east-1",
#         "arn:aws:s3:::cdk-hnb659fds-assets-316115107540-us-east-1/*"
#       ]
#     },
#     {
#       "Action": [
#         "kms:Decrypt",
#         "kms:DescribeKey",
#         "kms:Encrypt",
#         "kms:ReEncrypt*",
#         "kms:GenerateDataKey*"
#       ],
#       "Effect": "Allow",
#       "Resource": "arn:aws:kms:us-east-1:316115107540:key/AWS_MANAGED_KEY"
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   role = "cdk-hnb659fds-file-publishing-role-316115107540-us-east-1"
# }

# resource "aws_iam_role_policy" "cdk-hnb659fds-image-publishing-role-316115107540-us-east-1_cdk-hnb659fds-image-publishing-role-default-policy-316115107540-us-east-1" {
#   name = "cdk-hnb659fds-image-publishing-role-default-policy-316115107540-us-east-1"

#   policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": [
#         "ecr:PutImage",
#         "ecr:InitiateLayerUpload",
#         "ecr:UploadLayerPart",
#         "ecr:CompleteLayerUpload",
#         "ecr:BatchCheckLayerAvailability",
#         "ecr:DescribeRepositories",
#         "ecr:DescribeImages",
#         "ecr:BatchGetImage",
#         "ecr:GetDownloadUrlForLayer"
#       ],
#       "Effect": "Allow",
#       "Resource": "arn:aws:ecr:us-east-1:316115107540:repository/cdk-hnb659fds-container-assets-316115107540-us-east-1"
#     },
#     {
#       "Action": [
#         "ecr:GetAuthorizationToken"
#       ],
#       "Effect": "Allow",
#       "Resource": "*"
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   role = "cdk-hnb659fds-image-publishing-role-316115107540-us-east-1"
# }

# resource "aws_iam_role_policy" "cdk-hnb659fds-lookup-role-316115107540-us-east-1_LookupRolePolicy" {
#   name = "LookupRolePolicy"

#   policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": [
#         "kms:Decrypt"
#       ],
#       "Effect": "Deny",
#       "Resource": "*",
#       "Sid": "DontReadSecrets"
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   role = "cdk-hnb659fds-lookup-role-316115107540-us-east-1"
# }

# resource "aws_iam_role_policy" "ecsTaskExecutionRole_azure_docker_auth" {
#   name = "azure_docker_auth"

#   policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": [
#         "kms:Decrypt",
#         "secretsmanager:GetSecretValue"
#       ],
#       "Effect": "Allow",
#       "Resource": [
#         "arn:aws:secretsmanager:us-east-1:316115107540:secret:prod/azure/acr/octopusapp-xS54We"
#       ]
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   role = "ecsTaskExecutionRole"
# }

# resource "aws_iam_role_policy" "eksctl-videochat-prod-cluster-ServiceRole-ETvSI2P7rWpm_eksctl-videochat-prod-cluster-PolicyCloudWatchMetrics" {
#   name = "eksctl-videochat-prod-cluster-PolicyCloudWatchMetrics"

#   policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": [
#         "cloudwatch:PutMetricData"
#       ],
#       "Effect": "Allow",
#       "Resource": "*"
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   role = "eksctl-videochat-prod-cluster-ServiceRole-ETvSI2P7rWpm"
# }

# resource "aws_iam_role_policy" "eksctl-videochat-prod-cluster-ServiceRole-ETvSI2P7rWpm_eksctl-videochat-prod-cluster-PolicyELBPermissions" {
#   name = "eksctl-videochat-prod-cluster-PolicyELBPermissions"

#   policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": [
#         "ec2:DescribeAccountAttributes",
#         "ec2:DescribeAddresses",
#         "ec2:DescribeInternetGateways"
#       ],
#       "Effect": "Allow",
#       "Resource": "*"
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   role = "eksctl-videochat-prod-cluster-ServiceRole-ETvSI2P7rWpm"
# }
