# resource "aws_iam_role" "AWS-QuickSetup-ResourceExplorerRole-aoeqn-ap-northeast-1" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "ssm.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   # managed_policy_arns  = ["arn:aws:iam::aws:policy/AWSQuickSetupEnableAREXExecutionPolicy", "arn:aws:iam::aws:policy/AWSSystemsManagerEnableExplorerExecutionPolicy"]
#   max_session_duration = "3600"
#   name                 = "AWS-QuickSetup-ResourceExplorerRole-aoeqn-ap-northeast-1"
#   path                 = "/"

#   tags = {
#     QuickSetupDefinitionID        = "aoeqn"
#     QuickSetupDocument            = "AWSQuickSetupType-ResourceExplorer"
#     QuickSetupDocumentVersionName = "2.0"
#     QuickSetupManagerAccount      = "264647280376"
#     QuickSetupManagerArn          = "arn:aws:ssm-quicksetup:us-east-1:264647280376:configuration-manager/95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerID           = "95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerRegion       = "us-east-1"
#   }

#   tags_all = {
#     QuickSetupDefinitionID        = "aoeqn"
#     QuickSetupDocument            = "AWSQuickSetupType-ResourceExplorer"
#     QuickSetupDocumentVersionName = "2.0"
#     QuickSetupManagerAccount      = "264647280376"
#     QuickSetupManagerArn          = "arn:aws:ssm-quicksetup:us-east-1:264647280376:configuration-manager/95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerID           = "95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerRegion       = "us-east-1"
#   }
# }

# resource "aws_iam_role" "AWS-QuickSetup-ResourceExplorerRole-aoeqn-ap-northeast-2" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "ssm.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   # managed_policy_arns  = ["arn:aws:iam::aws:policy/AWSQuickSetupEnableAREXExecutionPolicy", "arn:aws:iam::aws:policy/AWSSystemsManagerEnableExplorerExecutionPolicy"]
#   max_session_duration = "3600"
#   name                 = "AWS-QuickSetup-ResourceExplorerRole-aoeqn-ap-northeast-2"
#   path                 = "/"

#   tags = {
#     QuickSetupDefinitionID        = "aoeqn"
#     QuickSetupDocument            = "AWSQuickSetupType-ResourceExplorer"
#     QuickSetupDocumentVersionName = "2.0"
#     QuickSetupManagerAccount      = "264647280376"
#     QuickSetupManagerArn          = "arn:aws:ssm-quicksetup:us-east-1:264647280376:configuration-manager/95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerID           = "95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerRegion       = "us-east-1"
#   }

#   tags_all = {
#     QuickSetupDefinitionID        = "aoeqn"
#     QuickSetupDocument            = "AWSQuickSetupType-ResourceExplorer"
#     QuickSetupDocumentVersionName = "2.0"
#     QuickSetupManagerAccount      = "264647280376"
#     QuickSetupManagerArn          = "arn:aws:ssm-quicksetup:us-east-1:264647280376:configuration-manager/95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerID           = "95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerRegion       = "us-east-1"
#   }
# }

# resource "aws_iam_role" "AWS-QuickSetup-ResourceExplorerRole-aoeqn-ap-south-1" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "ssm.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   # managed_policy_arns  = ["arn:aws:iam::aws:policy/AWSQuickSetupEnableAREXExecutionPolicy", "arn:aws:iam::aws:policy/AWSSystemsManagerEnableExplorerExecutionPolicy"]
#   max_session_duration = "3600"
#   name                 = "AWS-QuickSetup-ResourceExplorerRole-aoeqn-ap-south-1"
#   path                 = "/"

#   tags = {
#     QuickSetupDefinitionID        = "aoeqn"
#     QuickSetupDocument            = "AWSQuickSetupType-ResourceExplorer"
#     QuickSetupDocumentVersionName = "2.0"
#     QuickSetupManagerAccount      = "264647280376"
#     QuickSetupManagerArn          = "arn:aws:ssm-quicksetup:us-east-1:264647280376:configuration-manager/95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerID           = "95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerRegion       = "us-east-1"
#   }

#   tags_all = {
#     QuickSetupDefinitionID        = "aoeqn"
#     QuickSetupDocument            = "AWSQuickSetupType-ResourceExplorer"
#     QuickSetupDocumentVersionName = "2.0"
#     QuickSetupManagerAccount      = "264647280376"
#     QuickSetupManagerArn          = "arn:aws:ssm-quicksetup:us-east-1:264647280376:configuration-manager/95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerID           = "95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerRegion       = "us-east-1"
#   }
# }

# resource "aws_iam_role" "AWS-QuickSetup-ResourceExplorerRole-aoeqn-ap-southeast-1" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "ssm.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   # managed_policy_arns  = ["arn:aws:iam::aws:policy/AWSQuickSetupEnableAREXExecutionPolicy", "arn:aws:iam::aws:policy/AWSSystemsManagerEnableExplorerExecutionPolicy"]
#   max_session_duration = "3600"
#   name                 = "AWS-QuickSetup-ResourceExplorerRole-aoeqn-ap-southeast-1"
#   path                 = "/"

#   tags = {
#     QuickSetupDefinitionID        = "aoeqn"
#     QuickSetupDocument            = "AWSQuickSetupType-ResourceExplorer"
#     QuickSetupDocumentVersionName = "2.0"
#     QuickSetupManagerAccount      = "264647280376"
#     QuickSetupManagerArn          = "arn:aws:ssm-quicksetup:us-east-1:264647280376:configuration-manager/95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerID           = "95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerRegion       = "us-east-1"
#   }

#   tags_all = {
#     QuickSetupDefinitionID        = "aoeqn"
#     QuickSetupDocument            = "AWSQuickSetupType-ResourceExplorer"
#     QuickSetupDocumentVersionName = "2.0"
#     QuickSetupManagerAccount      = "264647280376"
#     QuickSetupManagerArn          = "arn:aws:ssm-quicksetup:us-east-1:264647280376:configuration-manager/95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerID           = "95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerRegion       = "us-east-1"
#   }
# }

# resource "aws_iam_role" "AWS-QuickSetup-ResourceExplorerRole-aoeqn-ap-southeast-2" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "ssm.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   # managed_policy_arns  = ["arn:aws:iam::aws:policy/AWSQuickSetupEnableAREXExecutionPolicy", "arn:aws:iam::aws:policy/AWSSystemsManagerEnableExplorerExecutionPolicy"]
#   max_session_duration = "3600"
#   name                 = "AWS-QuickSetup-ResourceExplorerRole-aoeqn-ap-southeast-2"
#   path                 = "/"

#   tags = {
#     QuickSetupDefinitionID        = "aoeqn"
#     QuickSetupDocument            = "AWSQuickSetupType-ResourceExplorer"
#     QuickSetupDocumentVersionName = "2.0"
#     QuickSetupManagerAccount      = "264647280376"
#     QuickSetupManagerArn          = "arn:aws:ssm-quicksetup:us-east-1:264647280376:configuration-manager/95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerID           = "95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerRegion       = "us-east-1"
#   }

#   tags_all = {
#     QuickSetupDefinitionID        = "aoeqn"
#     QuickSetupDocument            = "AWSQuickSetupType-ResourceExplorer"
#     QuickSetupDocumentVersionName = "2.0"
#     QuickSetupManagerAccount      = "264647280376"
#     QuickSetupManagerArn          = "arn:aws:ssm-quicksetup:us-east-1:264647280376:configuration-manager/95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerID           = "95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerRegion       = "us-east-1"
#   }
# }

# resource "aws_iam_role" "AWS-QuickSetup-ResourceExplorerRole-aoeqn-ca-central-1" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "ssm.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   # managed_policy_arns  = ["arn:aws:iam::aws:policy/AWSQuickSetupEnableAREXExecutionPolicy", "arn:aws:iam::aws:policy/AWSSystemsManagerEnableExplorerExecutionPolicy"]
#   max_session_duration = "3600"
#   name                 = "AWS-QuickSetup-ResourceExplorerRole-aoeqn-ca-central-1"
#   path                 = "/"

#   tags = {
#     QuickSetupDefinitionID        = "aoeqn"
#     QuickSetupDocument            = "AWSQuickSetupType-ResourceExplorer"
#     QuickSetupDocumentVersionName = "2.0"
#     QuickSetupManagerAccount      = "264647280376"
#     QuickSetupManagerArn          = "arn:aws:ssm-quicksetup:us-east-1:264647280376:configuration-manager/95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerID           = "95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerRegion       = "us-east-1"
#   }

#   tags_all = {
#     QuickSetupDefinitionID        = "aoeqn"
#     QuickSetupDocument            = "AWSQuickSetupType-ResourceExplorer"
#     QuickSetupDocumentVersionName = "2.0"
#     QuickSetupManagerAccount      = "264647280376"
#     QuickSetupManagerArn          = "arn:aws:ssm-quicksetup:us-east-1:264647280376:configuration-manager/95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerID           = "95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerRegion       = "us-east-1"
#   }
# }

# resource "aws_iam_role" "AWS-QuickSetup-ResourceExplorerRole-aoeqn-eu-central-1" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "ssm.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   # managed_policy_arns  = ["arn:aws:iam::aws:policy/AWSQuickSetupEnableAREXExecutionPolicy", "arn:aws:iam::aws:policy/AWSSystemsManagerEnableExplorerExecutionPolicy"]
#   max_session_duration = "3600"
#   name                 = "AWS-QuickSetup-ResourceExplorerRole-aoeqn-eu-central-1"
#   path                 = "/"

#   tags = {
#     QuickSetupDefinitionID        = "aoeqn"
#     QuickSetupDocument            = "AWSQuickSetupType-ResourceExplorer"
#     QuickSetupDocumentVersionName = "2.0"
#     QuickSetupManagerAccount      = "264647280376"
#     QuickSetupManagerArn          = "arn:aws:ssm-quicksetup:us-east-1:264647280376:configuration-manager/95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerID           = "95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerRegion       = "us-east-1"
#   }

#   tags_all = {
#     QuickSetupDefinitionID        = "aoeqn"
#     QuickSetupDocument            = "AWSQuickSetupType-ResourceExplorer"
#     QuickSetupDocumentVersionName = "2.0"
#     QuickSetupManagerAccount      = "264647280376"
#     QuickSetupManagerArn          = "arn:aws:ssm-quicksetup:us-east-1:264647280376:configuration-manager/95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerID           = "95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerRegion       = "us-east-1"
#   }
# }

# resource "aws_iam_role" "AWS-QuickSetup-ResourceExplorerRole-aoeqn-eu-north-1" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "ssm.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   # managed_policy_arns  = ["arn:aws:iam::aws:policy/AWSQuickSetupEnableAREXExecutionPolicy", "arn:aws:iam::aws:policy/AWSSystemsManagerEnableExplorerExecutionPolicy"]
#   max_session_duration = "3600"
#   name                 = "AWS-QuickSetup-ResourceExplorerRole-aoeqn-eu-north-1"
#   path                 = "/"

#   tags = {
#     QuickSetupDefinitionID        = "aoeqn"
#     QuickSetupDocument            = "AWSQuickSetupType-ResourceExplorer"
#     QuickSetupDocumentVersionName = "2.0"
#     QuickSetupManagerAccount      = "264647280376"
#     QuickSetupManagerArn          = "arn:aws:ssm-quicksetup:us-east-1:264647280376:configuration-manager/95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerID           = "95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerRegion       = "us-east-1"
#   }

#   tags_all = {
#     QuickSetupDefinitionID        = "aoeqn"
#     QuickSetupDocument            = "AWSQuickSetupType-ResourceExplorer"
#     QuickSetupDocumentVersionName = "2.0"
#     QuickSetupManagerAccount      = "264647280376"
#     QuickSetupManagerArn          = "arn:aws:ssm-quicksetup:us-east-1:264647280376:configuration-manager/95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerID           = "95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerRegion       = "us-east-1"
#   }
# }

# resource "aws_iam_role" "AWS-QuickSetup-ResourceExplorerRole-aoeqn-eu-west-1" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "ssm.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   # managed_policy_arns  = ["arn:aws:iam::aws:policy/AWSQuickSetupEnableAREXExecutionPolicy", "arn:aws:iam::aws:policy/AWSSystemsManagerEnableExplorerExecutionPolicy"]
#   max_session_duration = "3600"
#   name                 = "AWS-QuickSetup-ResourceExplorerRole-aoeqn-eu-west-1"
#   path                 = "/"

#   tags = {
#     QuickSetupDefinitionID        = "aoeqn"
#     QuickSetupDocument            = "AWSQuickSetupType-ResourceExplorer"
#     QuickSetupDocumentVersionName = "2.0"
#     QuickSetupManagerAccount      = "264647280376"
#     QuickSetupManagerArn          = "arn:aws:ssm-quicksetup:us-east-1:264647280376:configuration-manager/95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerID           = "95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerRegion       = "us-east-1"
#   }

#   tags_all = {
#     QuickSetupDefinitionID        = "aoeqn"
#     QuickSetupDocument            = "AWSQuickSetupType-ResourceExplorer"
#     QuickSetupDocumentVersionName = "2.0"
#     QuickSetupManagerAccount      = "264647280376"
#     QuickSetupManagerArn          = "arn:aws:ssm-quicksetup:us-east-1:264647280376:configuration-manager/95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerID           = "95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerRegion       = "us-east-1"
#   }
# }

# resource "aws_iam_role" "AWS-QuickSetup-ResourceExplorerRole-aoeqn-eu-west-2" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "ssm.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   # managed_policy_arns  = ["arn:aws:iam::aws:policy/AWSQuickSetupEnableAREXExecutionPolicy", "arn:aws:iam::aws:policy/AWSSystemsManagerEnableExplorerExecutionPolicy"]
#   max_session_duration = "3600"
#   name                 = "AWS-QuickSetup-ResourceExplorerRole-aoeqn-eu-west-2"
#   path                 = "/"

#   tags = {
#     QuickSetupDefinitionID        = "aoeqn"
#     QuickSetupDocument            = "AWSQuickSetupType-ResourceExplorer"
#     QuickSetupDocumentVersionName = "2.0"
#     QuickSetupManagerAccount      = "264647280376"
#     QuickSetupManagerArn          = "arn:aws:ssm-quicksetup:us-east-1:264647280376:configuration-manager/95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerID           = "95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerRegion       = "us-east-1"
#   }

#   tags_all = {
#     QuickSetupDefinitionID        = "aoeqn"
#     QuickSetupDocument            = "AWSQuickSetupType-ResourceExplorer"
#     QuickSetupDocumentVersionName = "2.0"
#     QuickSetupManagerAccount      = "264647280376"
#     QuickSetupManagerArn          = "arn:aws:ssm-quicksetup:us-east-1:264647280376:configuration-manager/95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerID           = "95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerRegion       = "us-east-1"
#   }
# }

# resource "aws_iam_role" "AWS-QuickSetup-ResourceExplorerRole-aoeqn-eu-west-3" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "ssm.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   # managed_policy_arns  = ["arn:aws:iam::aws:policy/AWSQuickSetupEnableAREXExecutionPolicy", "arn:aws:iam::aws:policy/AWSSystemsManagerEnableExplorerExecutionPolicy"]
#   max_session_duration = "3600"
#   name                 = "AWS-QuickSetup-ResourceExplorerRole-aoeqn-eu-west-3"
#   path                 = "/"

#   tags = {
#     QuickSetupDefinitionID        = "aoeqn"
#     QuickSetupDocument            = "AWSQuickSetupType-ResourceExplorer"
#     QuickSetupDocumentVersionName = "2.0"
#     QuickSetupManagerAccount      = "264647280376"
#     QuickSetupManagerArn          = "arn:aws:ssm-quicksetup:us-east-1:264647280376:configuration-manager/95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerID           = "95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerRegion       = "us-east-1"
#   }

#   tags_all = {
#     QuickSetupDefinitionID        = "aoeqn"
#     QuickSetupDocument            = "AWSQuickSetupType-ResourceExplorer"
#     QuickSetupDocumentVersionName = "2.0"
#     QuickSetupManagerAccount      = "264647280376"
#     QuickSetupManagerArn          = "arn:aws:ssm-quicksetup:us-east-1:264647280376:configuration-manager/95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerID           = "95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerRegion       = "us-east-1"
#   }
# }

# resource "aws_iam_role" "AWS-QuickSetup-ResourceExplorerRole-aoeqn-sa-east-1" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "ssm.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   # managed_policy_arns  = ["arn:aws:iam::aws:policy/AWSQuickSetupEnableAREXExecutionPolicy", "arn:aws:iam::aws:policy/AWSSystemsManagerEnableExplorerExecutionPolicy"]
#   max_session_duration = "3600"
#   name                 = "AWS-QuickSetup-ResourceExplorerRole-aoeqn-sa-east-1"
#   path                 = "/"

#   tags = {
#     QuickSetupDefinitionID        = "aoeqn"
#     QuickSetupDocument            = "AWSQuickSetupType-ResourceExplorer"
#     QuickSetupDocumentVersionName = "2.0"
#     QuickSetupManagerAccount      = "264647280376"
#     QuickSetupManagerArn          = "arn:aws:ssm-quicksetup:us-east-1:264647280376:configuration-manager/95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerID           = "95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerRegion       = "us-east-1"
#   }

#   tags_all = {
#     QuickSetupDefinitionID        = "aoeqn"
#     QuickSetupDocument            = "AWSQuickSetupType-ResourceExplorer"
#     QuickSetupDocumentVersionName = "2.0"
#     QuickSetupManagerAccount      = "264647280376"
#     QuickSetupManagerArn          = "arn:aws:ssm-quicksetup:us-east-1:264647280376:configuration-manager/95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerID           = "95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerRegion       = "us-east-1"
#   }
# }

# resource "aws_iam_role" "AWS-QuickSetup-ResourceExplorerRole-aoeqn-us-east-1" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "ssm.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   # managed_policy_arns  = ["arn:aws:iam::aws:policy/AWSQuickSetupEnableAREXExecutionPolicy", "arn:aws:iam::aws:policy/AWSSystemsManagerEnableExplorerExecutionPolicy"]
#   max_session_duration = "3600"
#   name                 = "AWS-QuickSetup-ResourceExplorerRole-aoeqn-us-east-1"
#   path                 = "/"

#   tags = {
#     QuickSetupDefinitionID        = "aoeqn"
#     QuickSetupDocument            = "AWSQuickSetupType-ResourceExplorer"
#     QuickSetupDocumentVersionName = "2.0"
#     QuickSetupManagerAccount      = "264647280376"
#     QuickSetupManagerArn          = "arn:aws:ssm-quicksetup:us-east-1:264647280376:configuration-manager/95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerID           = "95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerRegion       = "us-east-1"
#   }

#   tags_all = {
#     QuickSetupDefinitionID        = "aoeqn"
#     QuickSetupDocument            = "AWSQuickSetupType-ResourceExplorer"
#     QuickSetupDocumentVersionName = "2.0"
#     QuickSetupManagerAccount      = "264647280376"
#     QuickSetupManagerArn          = "arn:aws:ssm-quicksetup:us-east-1:264647280376:configuration-manager/95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerID           = "95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerRegion       = "us-east-1"
#   }
# }

# resource "aws_iam_role" "AWS-QuickSetup-ResourceExplorerRole-aoeqn-us-east-2" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "ssm.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   # managed_policy_arns  = ["arn:aws:iam::aws:policy/AWSQuickSetupEnableAREXExecutionPolicy", "arn:aws:iam::aws:policy/AWSSystemsManagerEnableExplorerExecutionPolicy"]
#   max_session_duration = "3600"
#   name                 = "AWS-QuickSetup-ResourceExplorerRole-aoeqn-us-east-2"
#   path                 = "/"

#   tags = {
#     QuickSetupDefinitionID        = "aoeqn"
#     QuickSetupDocument            = "AWSQuickSetupType-ResourceExplorer"
#     QuickSetupDocumentVersionName = "2.0"
#     QuickSetupManagerAccount      = "264647280376"
#     QuickSetupManagerArn          = "arn:aws:ssm-quicksetup:us-east-1:264647280376:configuration-manager/95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerID           = "95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerRegion       = "us-east-1"
#   }

#   tags_all = {
#     QuickSetupDefinitionID        = "aoeqn"
#     QuickSetupDocument            = "AWSQuickSetupType-ResourceExplorer"
#     QuickSetupDocumentVersionName = "2.0"
#     QuickSetupManagerAccount      = "264647280376"
#     QuickSetupManagerArn          = "arn:aws:ssm-quicksetup:us-east-1:264647280376:configuration-manager/95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerID           = "95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerRegion       = "us-east-1"
#   }
# }

# resource "aws_iam_role" "AWS-QuickSetup-ResourceExplorerRole-aoeqn-us-west-1" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "ssm.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   # managed_policy_arns  = ["arn:aws:iam::aws:policy/AWSQuickSetupEnableAREXExecutionPolicy", "arn:aws:iam::aws:policy/AWSSystemsManagerEnableExplorerExecutionPolicy"]
#   max_session_duration = "3600"
#   name                 = "AWS-QuickSetup-ResourceExplorerRole-aoeqn-us-west-1"
#   path                 = "/"

#   tags = {
#     QuickSetupDefinitionID        = "aoeqn"
#     QuickSetupDocument            = "AWSQuickSetupType-ResourceExplorer"
#     QuickSetupDocumentVersionName = "2.0"
#     QuickSetupManagerAccount      = "264647280376"
#     QuickSetupManagerArn          = "arn:aws:ssm-quicksetup:us-east-1:264647280376:configuration-manager/95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerID           = "95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerRegion       = "us-east-1"
#   }

#   tags_all = {
#     QuickSetupDefinitionID        = "aoeqn"
#     QuickSetupDocument            = "AWSQuickSetupType-ResourceExplorer"
#     QuickSetupDocumentVersionName = "2.0"
#     QuickSetupManagerAccount      = "264647280376"
#     QuickSetupManagerArn          = "arn:aws:ssm-quicksetup:us-east-1:264647280376:configuration-manager/95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerID           = "95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerRegion       = "us-east-1"
#   }
# }

# resource "aws_iam_role" "AWS-QuickSetup-ResourceExplorerRole-aoeqn-us-west-2" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "ssm.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   # managed_policy_arns  = ["arn:aws:iam::aws:policy/AWSQuickSetupEnableAREXExecutionPolicy", "arn:aws:iam::aws:policy/AWSSystemsManagerEnableExplorerExecutionPolicy"]
#   max_session_duration = "3600"
#   name                 = "AWS-QuickSetup-ResourceExplorerRole-aoeqn-us-west-2"
#   path                 = "/"

#   tags = {
#     QuickSetupDefinitionID        = "aoeqn"
#     QuickSetupDocument            = "AWSQuickSetupType-ResourceExplorer"
#     QuickSetupDocumentVersionName = "2.0"
#     QuickSetupManagerAccount      = "264647280376"
#     QuickSetupManagerArn          = "arn:aws:ssm-quicksetup:us-east-1:264647280376:configuration-manager/95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerID           = "95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerRegion       = "us-east-1"
#   }

#   tags_all = {
#     QuickSetupDefinitionID        = "aoeqn"
#     QuickSetupDocument            = "AWSQuickSetupType-ResourceExplorer"
#     QuickSetupDocumentVersionName = "2.0"
#     QuickSetupManagerAccount      = "264647280376"
#     QuickSetupManagerArn          = "arn:aws:ssm-quicksetup:us-east-1:264647280376:configuration-manager/95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerID           = "95a4fa74-cf70-431a-9134-03d92d14b2d2"
#     QuickSetupManagerRegion       = "us-east-1"
#   }
# }

# resource "aws_iam_role" "AWSReservedSSO_AdministratorAccess_05a77cc33e2d3f53" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": [
#         "sts:AssumeRoleWithSAML",
#         "sts:TagSession"
#       ],
#       "Condition": {
#         "StringEquals": {
#           "SAML:aud": "https://signin.aws.amazon.com/saml"
#         }
#       },
#       "Effect": "Allow",
#       "Principal": {
#         "Federated": "arn:aws:iam::316115107540:saml-provider/AWSSSO_ca263ac15e58df49_DO_NOT_DELETE"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   # managed_policy_arns  = ["arn:aws:iam::aws:policy/AdministratorAccess"]
#   max_session_duration = "43200"
#   name                 = "AWSReservedSSO_AdministratorAccess_05a77cc33e2d3f53"
#   path                 = "/aws-reserved/sso.amazonaws.com/"
# }

# resource "aws_iam_role" "AWSServiceRoleForAmazonEKS" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "eks.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   description          = "Allows Amazon EKS to call AWS services on your behalf."
#   # managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AmazonEKSServiceRolePolicy"]
#   max_session_duration = "3600"
#   name                 = "AWSServiceRoleForAmazonEKS"
#   path                 = "/aws-service-role/eks.amazonaws.com/"
# }

# resource "aws_iam_role" "AWSServiceRoleForAmazonEKSNodegroup" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "eks-nodegroup.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   description          = "This policy allows Amazon EKS to create and manage Nodegroups"
#   # managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AWSServiceRoleForAmazonEKSNodegroup"]
#   max_session_duration = "3600"
#   name                 = "AWSServiceRoleForAmazonEKSNodegroup"
#   path                 = "/aws-service-role/eks-nodegroup.amazonaws.com/"
# }

# resource "aws_iam_role" "AWSServiceRoleForAmazonQDeveloper" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "q.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   # managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AWSServiceRoleForAmazonQDeveloper"]
#   max_session_duration = "3600"
#   name                 = "AWSServiceRoleForAmazonQDeveloper"
#   path                 = "/aws-service-role/q.amazonaws.com/"
# }

# resource "aws_iam_role" "AWSServiceRoleForAmazonSSM" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "ssm.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   description          = "Provides access to AWS Resources managed or used by Amazon SSM."
#   # managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AmazonSSMServiceRolePolicy"]
#   max_session_duration = "3600"
#   name                 = "AWSServiceRoleForAmazonSSM"
#   path                 = "/aws-service-role/ssm.amazonaws.com/"
# }

# resource "aws_iam_role" "AWSServiceRoleForAutoScaling" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "autoscaling.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   description          = "Default Service-Linked Role enables access to AWS Services and Resources used or managed by Auto Scaling"
#   # managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AutoScalingServiceRolePolicy"]
#   max_session_duration = "3600"
#   name                 = "AWSServiceRoleForAutoScaling"
#   path                 = "/aws-service-role/autoscaling.amazonaws.com/"
# }

# resource "aws_iam_role" "AWSServiceRoleForCloudFormationStackSetsOrgMember" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "member.org.stacksets.cloudformation.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   description          = "Service linked role for CloudFormation StackSets (Organization Member)"
#   # managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/CloudFormationStackSetsOrgMemberServiceRolePolicy"]
#   max_session_duration = "3600"
#   name                 = "AWSServiceRoleForCloudFormationStackSetsOrgMember"
#   path                 = "/aws-service-role/member.org.stacksets.cloudformation.amazonaws.com/"
# }

# resource "aws_iam_role" "AWSServiceRoleForECS" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "ecs.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   description          = "Policy to enable Amazon ECS to manage your EC2 instances and related resources."
#   # managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AmazonECSServiceRolePolicy"]
#   max_session_duration = "3600"
#   name                 = "AWSServiceRoleForECS"
#   path                 = "/aws-service-role/ecs.amazonaws.com/"
# }

# resource "aws_iam_role" "AWSServiceRoleForElasticLoadBalancing" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "elasticloadbalancing.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   description          = "Allows ELB to call AWS services on your behalf."
#   # managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AWSElasticLoadBalancingServiceRolePolicy"]
#   max_session_duration = "3600"
#   name                 = "AWSServiceRoleForElasticLoadBalancing"
#   path                 = "/aws-service-role/elasticloadbalancing.amazonaws.com/"
# }

# resource "aws_iam_role" "AWSServiceRoleForGlobalAccelerator" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "globalaccelerator.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   description          = "Allows Global Accelerator to call AWS services on customer's behalf"
#   # managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AWSGlobalAcceleratorSLRPolicy"]
#   max_session_duration = "3600"
#   name                 = "AWSServiceRoleForGlobalAccelerator"
#   path                 = "/aws-service-role/globalaccelerator.amazonaws.com/"
# }

# resource "aws_iam_role" "AWSServiceRoleForOrganizations" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "organizations.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   description          = "Service-linked role used by AWS Organizations to enable integration of other AWS services with Organizations."
#   # managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AWSOrganizationsServiceTrustPolicy"]
#   max_session_duration = "3600"
#   name                 = "AWSServiceRoleForOrganizations"
#   path                 = "/aws-service-role/organizations.amazonaws.com/"
# }

# resource "aws_iam_role" "AWSServiceRoleForResourceExplorer" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "resource-explorer-2.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   # managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AWSResourceExplorerServiceRolePolicy"]
#   max_session_duration = "3600"
#   name                 = "AWSServiceRoleForResourceExplorer"
#   path                 = "/aws-service-role/resource-explorer-2.amazonaws.com/"
# }

# resource "aws_iam_role" "AWSServiceRoleForSSMQuickSetup" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "ssm-quicksetup.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   # managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/SSMQuickSetupRolePolicy"]
#   max_session_duration = "3600"
#   name                 = "AWSServiceRoleForSSMQuickSetup"
#   path                 = "/aws-service-role/ssm-quicksetup.amazonaws.com/"
# }

# resource "aws_iam_role" "AWSServiceRoleForSSO" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "sso.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   description          = "Service-linked role used by AWS SSO to manage AWS resources, including IAM roles, policies and SAML IdP on your behalf."
#   # managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AWSSSOServiceRolePolicy"]
#   max_session_duration = "3600"
#   name                 = "AWSServiceRoleForSSO"
#   path                 = "/aws-service-role/sso.amazonaws.com/"
# }

# resource "aws_iam_role" "AWSServiceRoleForServiceQuotas" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "servicequotas.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   description          = "A service-linked role is required for Service Quotas to access your service limits."
#   # managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/ServiceQuotasServiceRolePolicy"]
#   max_session_duration = "3600"
#   name                 = "AWSServiceRoleForServiceQuotas"
#   path                 = "/aws-service-role/servicequotas.amazonaws.com/"
# }

# resource "aws_iam_role" "AWSServiceRoleForSupport" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "support.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   description          = "Enables resource access for AWS to provide billing, administrative and support services"
#   # managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AWSSupportServiceRolePolicy"]
#   max_session_duration = "3600"
#   name                 = "AWSServiceRoleForSupport"
#   path                 = "/aws-service-role/support.amazonaws.com/"
# }

# resource "aws_iam_role" "AWSServiceRoleForTrustedAdvisor" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "trustedadvisor.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   description          = "Access for the AWS Trusted Advisor Service to help reduce cost, increase performance, and improve security of your AWS environment."
#   # managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AWSTrustedAdvisorServiceRolePolicy"]
#   max_session_duration = "3600"
#   name                 = "AWSServiceRoleForTrustedAdvisor"
#   path                 = "/aws-service-role/trustedadvisor.amazonaws.com/"
# }

# resource "aws_iam_role" "AmazonEKSLoadBalancerControllerRole" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRoleWithWebIdentity",
#       "Condition": {
#         "StringEquals": {
#           "oidc.eks.us-east-1.amazonaws.com/id/EB362341AD0C96778FE2CE879BA73D64:aud": "sts.amazonaws.com",
#           "oidc.eks.us-east-1.amazonaws.com/id/EB362341AD0C96778FE2CE879BA73D64:sub": "system:serviceaccount:kube-system:aws-load-balancer-controller"
#         }
#       },
#       "Effect": "Allow",
#       "Principal": {
#         "Federated": "arn:aws:iam::316115107540:oidc-provider/oidc.eks.us-east-1.amazonaws.com/id/EB362341AD0C96778FE2CE879BA73D64"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   # managed_policy_arns  = ["arn:aws:iam::316115107540:policy/AWSLoadBalancerControllerIAMPolicy"]
#   max_session_duration = "3600"
#   name                 = "AmazonEKSLoadBalancerControllerRole"
#   path                 = "/"

#   tags = {
#     "alpha.eksctl.io/cluster-name"                = "videochat-prod"
#     "alpha.eksctl.io/eksctl-version"              = "0.167.0"
#     "alpha.eksctl.io/iamserviceaccount-name"      = "kube-system/aws-load-balancer-controller"
#     "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "videochat-prod"
#   }

#   tags_all = {
#     "alpha.eksctl.io/cluster-name"                = "videochat-prod"
#     "alpha.eksctl.io/eksctl-version"              = "0.167.0"
#     "alpha.eksctl.io/iamserviceaccount-name"      = "kube-system/aws-load-balancer-controller"
#     "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "videochat-prod"
#   }
# }

# resource "aws_iam_role" "AmazonEKS_EBS_CSI_DriverRole" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRoleWithWebIdentity",
#       "Condition": {
#         "StringEquals": {
#           "oidc.eks.us-east-1.amazonaws.com/id/EB362341AD0C96778FE2CE879BA73D64:aud": "sts.amazonaws.com",
#           "oidc.eks.us-east-1.amazonaws.com/id/EB362341AD0C96778FE2CE879BA73D64:sub": "system:serviceaccount:kube-system:ebs-csi-controller-sa"
#         }
#       },
#       "Effect": "Allow",
#       "Principal": {
#         "Federated": "arn:aws:iam::316115107540:oidc-provider/oidc.eks.us-east-1.amazonaws.com/id/EB362341AD0C96778FE2CE879BA73D64"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   # managed_policy_arns  = ["arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"]
#   max_session_duration = "3600"
#   name                 = "AmazonEKS_EBS_CSI_DriverRole"
#   path                 = "/"

#   tags = {
#     "alpha.eksctl.io/cluster-name"                = "videochat-prod"
#     "alpha.eksctl.io/eksctl-version"              = "0.167.0"
#     "alpha.eksctl.io/iamserviceaccount-name"      = "kube-system/ebs-csi-controller-sa"
#     "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "videochat-prod"
#   }

#   tags_all = {
#     "alpha.eksctl.io/cluster-name"                = "videochat-prod"
#     "alpha.eksctl.io/eksctl-version"              = "0.167.0"
#     "alpha.eksctl.io/iamserviceaccount-name"      = "kube-system/ebs-csi-controller-sa"
#     "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "videochat-prod"
#   }
# }

# resource "aws_iam_role" "OrganizationAccountAccessRole" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "AWS": "arn:aws:iam::264647280376:root"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   # managed_policy_arns  = ["arn:aws:iam::aws:policy/AdministratorAccess"]
#   max_session_duration = "3600"
#   name                 = "OrganizationAccountAccessRole"
#   path                 = "/"
# }

# resource "aws_iam_role" "aikido-security-readonly-AikidoSecurityRole-tNeokSc2Y6wp" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Condition": {
#         "StringEquals": {
#           "sts:ExternalId": "aikido-9453"
#         }
#       },
#       "Effect": "Allow",
#       "Principal": {
#         "AWS": "arn:aws:iam::881830977366:role/service-role/lambda-aws-cloud-findings-role-uox26vzd"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   # managed_policy_arns  = ["arn:aws:iam::316115107540:policy/aikido-security-readonly-AikidoSecurityAuditPolicy-mfCeyGh1fBNW", "arn:aws:iam::aws:policy/SecurityAudit"]
#   max_session_duration = "3600"
#   name                 = "aikido-security-readonly-AikidoSecurityRole-tNeokSc2Y6wp"
#   path                 = "/"
# }

# resource "aws_iam_role" "cdk-hnb659fds-cfn-exec-role-316115107540-us-east-1" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "cloudformation.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   # managed_policy_arns  = ["arn:aws:iam::aws:policy/AdministratorAccess"]
#   max_session_duration = "3600"
#   name                 = "cdk-hnb659fds-cfn-exec-role-316115107540-us-east-1"
#   path                 = "/"
# }

# resource "aws_iam_role" "cdk-hnb659fds-deploy-role-316115107540-us-east-1" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "AWS": "arn:aws:iam::316115107540:root"
#       }
#     }
#   ],
#   "Version": "2008-10-17"
# }
# POLICY

#   # inline_policy {
#   #   name   = "default"
#   #   policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"cloudformation:CreateChangeSet\",\"cloudformation:DeleteChangeSet\",\"cloudformation:DescribeChangeSet\",\"cloudformation:DescribeStacks\",\"cloudformation:ExecuteChangeSet\",\"cloudformation:CreateStack\",\"cloudformation:UpdateStack\"],\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"CloudFormationPermissions\"},{\"Action\":[\"s3:GetObject*\",\"s3:GetBucket*\",\"s3:List*\",\"s3:Abort*\",\"s3:DeleteObject*\",\"s3:PutObject*\"],\"Condition\":{\"StringNotEquals\":{\"s3:ResourceAccount\":\"316115107540\"}},\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"PipelineCrossAccountArtifactsBucket\"},{\"Action\":[\"kms:Decrypt\",\"kms:DescribeKey\",\"kms:Encrypt\",\"kms:ReEncrypt*\",\"kms:GenerateDataKey*\"],\"Condition\":{\"StringEquals\":{\"kms:ViaService\":\"s3.us-east-1.amazonaws.com\"}},\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"PipelineCrossAccountArtifactsKey\"},{\"Action\":\"iam:PassRole\",\"Effect\":\"Allow\",\"Resource\":\"arn:aws:iam::316115107540:role/cdk-hnb659fds-cfn-exec-role-316115107540-us-east-1\"},{\"Action\":[\"cloudformation:DescribeStackEvents\",\"cloudformation:GetTemplate\",\"cloudformation:DeleteStack\",\"cloudformation:UpdateTerminationProtection\",\"sts:GetCallerIdentity\",\"cloudformation:GetTemplateSummary\"],\"Effect\":\"Allow\",\"Resource\":\"*\",\"Sid\":\"CliPermissions\"},{\"Action\":[\"s3:GetObject*\",\"s3:GetBucket*\",\"s3:List*\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:s3:::cdk-hnb659fds-assets-316115107540-us-east-1\",\"arn:aws:s3:::cdk-hnb659fds-assets-316115107540-us-east-1/*\"],\"Sid\":\"CliStagingBucket\"},{\"Action\":[\"ssm:GetParameter\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:ssm:us-east-1:316115107540:parameter/cdk-bootstrap/hnb659fds/version\"],\"Sid\":\"ReadVersion\"}]}"
#   # }

#   max_session_duration = "3600"
#   name                 = "cdk-hnb659fds-deploy-role-316115107540-us-east-1"
#   path                 = "/"

#   tags = {
#     "aws-cdk:bootstrap-role" = "deploy"
#   }

#   tags_all = {
#     "aws-cdk:bootstrap-role" = "deploy"
#   }
# }

# resource "aws_iam_role" "cdk-hnb659fds-file-publishing-role-316115107540-us-east-1" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "AWS": "arn:aws:iam::316115107540:root"
#       }
#     }
#   ],
#   "Version": "2008-10-17"
# }
# POLICY

#   # inline_policy {
#   #   name   = "cdk-hnb659fds-file-publishing-role-default-policy-316115107540-us-east-1"
#   #   policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"s3:GetObject*\",\"s3:GetBucket*\",\"s3:GetEncryptionConfiguration\",\"s3:List*\",\"s3:DeleteObject*\",\"s3:PutObject*\",\"s3:Abort*\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:s3:::cdk-hnb659fds-assets-316115107540-us-east-1\",\"arn:aws:s3:::cdk-hnb659fds-assets-316115107540-us-east-1/*\"]},{\"Action\":[\"kms:Decrypt\",\"kms:DescribeKey\",\"kms:Encrypt\",\"kms:ReEncrypt*\",\"kms:GenerateDataKey*\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:kms:us-east-1:316115107540:key/AWS_MANAGED_KEY\"}]}"
#   # }

#   max_session_duration = "3600"
#   name                 = "cdk-hnb659fds-file-publishing-role-316115107540-us-east-1"
#   path                 = "/"

#   tags = {
#     "aws-cdk:bootstrap-role" = "file-publishing"
#   }

#   tags_all = {
#     "aws-cdk:bootstrap-role" = "file-publishing"
#   }
# }

# resource "aws_iam_role" "cdk-hnb659fds-image-publishing-role-316115107540-us-east-1" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "AWS": "arn:aws:iam::316115107540:root"
#       }
#     }
#   ],
#   "Version": "2008-10-17"
# }
# POLICY

#   # inline_policy {
#   #   name   = "cdk-hnb659fds-image-publishing-role-default-policy-316115107540-us-east-1"
#   #   policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"ecr:PutImage\",\"ecr:InitiateLayerUpload\",\"ecr:UploadLayerPart\",\"ecr:CompleteLayerUpload\",\"ecr:BatchCheckLayerAvailability\",\"ecr:DescribeRepositories\",\"ecr:DescribeImages\",\"ecr:BatchGetImage\",\"ecr:GetDownloadUrlForLayer\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:ecr:us-east-1:316115107540:repository/cdk-hnb659fds-container-assets-316115107540-us-east-1\"},{\"Action\":[\"ecr:GetAuthorizationToken\"],\"Effect\":\"Allow\",\"Resource\":\"*\"}]}"
#   # }

#   max_session_duration = "3600"
#   name                 = "cdk-hnb659fds-image-publishing-role-316115107540-us-east-1"
#   path                 = "/"

#   tags = {
#     "aws-cdk:bootstrap-role" = "image-publishing"
#   }

#   tags_all = {
#     "aws-cdk:bootstrap-role" = "image-publishing"
#   }
# }

# resource "aws_iam_role" "cdk-hnb659fds-lookup-role-316115107540-us-east-1" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "AWS": "arn:aws:iam::316115107540:root"
#       }
#     }
#   ],
#   "Version": "2008-10-17"
# }
# POLICY

#   # inline_policy {
#   #   name   = "LookupRolePolicy"
#   #   policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"kms:Decrypt\"],\"Effect\":\"Deny\",\"Resource\":\"*\",\"Sid\":\"DontReadSecrets\"}]}"
#   # }

#   # managed_policy_arns  = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
#   max_session_duration = "3600"
#   name                 = "cdk-hnb659fds-lookup-role-316115107540-us-east-1"
#   path                 = "/"

#   tags = {
#     "aws-cdk:bootstrap-role" = "lookup"
#   }

#   tags_all = {
#     "aws-cdk:bootstrap-role" = "lookup"
#   }
# }

# resource "aws_iam_role" "ecsInstanceRole" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "ec2.amazonaws.com"
#       },
#       "Sid": ""
#     }
#   ],
#   "Version": "2008-10-17"
# }
# POLICY

#   # managed_policy_arns  = ["arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"]
#   max_session_duration = "3600"
#   name                 = "ecsInstanceRole"
#   path                 = "/"
# }

# resource "aws_iam_role" "ecsTaskExecutionRole" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "ecs-tasks.amazonaws.com"
#       },
#       "Sid": ""
#     }
#   ],
#   "Version": "2008-10-17"
# }
# POLICY

#   # inline_policy {
#   #   name   = "azure_docker_auth"
#   #   policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"kms:Decrypt\",\"secretsmanager:GetSecretValue\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:secretsmanager:us-east-1:316115107540:secret:prod/azure/acr/octopusapp-xS54We\"]}]}"
#   # }

#   # managed_policy_arns  = ["arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"]
#   max_session_duration = "3600"
#   name                 = "ecsTaskExecutionRole"
#   path                 = "/"
# }

# resource "aws_iam_role" "eksClusterRole" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "eks.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   max_session_duration = "3600"
#   name                 = "eksClusterRole"
#   path                 = "/"
# }

# resource "aws_iam_role" "eksctl-videochat-prod-cluster-ServiceRole-ETvSI2P7rWpm" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "eks.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   # inline_policy {
#   #   name   = "eksctl-videochat-prod-cluster-PolicyCloudWatchMetrics"
#   #   policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"cloudwatch:PutMetricData\"],\"Effect\":\"Allow\",\"Resource\":\"*\"}]}"
#   # }

#   # inline_policy {
#   #   name   = "eksctl-videochat-prod-cluster-PolicyELBPermissions"
#   #   policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"ec2:DescribeAccountAttributes\",\"ec2:DescribeAddresses\",\"ec2:DescribeInternetGateways\"],\"Effect\":\"Allow\",\"Resource\":\"*\"}]}"
#   # }

#   # managed_policy_arns  = ["arn:aws:iam::aws:policy/AmazonEKSClusterPolicy", "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"]
#   max_session_duration = "3600"
#   name                 = "eksctl-videochat-prod-cluster-ServiceRole-ETvSI2P7rWpm"
#   path                 = "/"

#   tags = {
#     Name                                          = "eksctl-videochat-prod-cluster/ServiceRole"
#     "alpha.eksctl.io/cluster-name"                = "videochat-prod"
#     "alpha.eksctl.io/cluster-oidc-enabled"        = "false"
#     "alpha.eksctl.io/eksctl-version"              = "0.167.0"
#     "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "videochat-prod"
#   }

#   tags_all = {
#     Name                                          = "eksctl-videochat-prod-cluster/ServiceRole"
#     "alpha.eksctl.io/cluster-name"                = "videochat-prod"
#     "alpha.eksctl.io/cluster-oidc-enabled"        = "false"
#     "alpha.eksctl.io/eksctl-version"              = "0.167.0"
#     "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "videochat-prod"
#   }
# }

# resource "aws_iam_role" "eksctl-videochat-prod-nodegroup-ng-NodeInstanceRole-HGSh4pd42USR" {
#   assume_role_policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "ec2.amazonaws.com"
#       }
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   # managed_policy_arns  = ["arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly", "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy", "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy", "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"]
#   max_session_duration = "3600"
#   name                 = "eksctl-videochat-prod-nodegroup-ng-NodeInstanceRole-HGSh4pd42USR"
#   path                 = "/"

#   tags = {
#     Name                                          = "eksctl-videochat-prod-nodegroup-ng-06a865b4/NodeInstanceRole"
#     "alpha.eksctl.io/cluster-name"                = "videochat-prod"
#     "alpha.eksctl.io/eksctl-version"              = "0.167.0"
#     "alpha.eksctl.io/nodegroup-name"              = "ng-06a865b4"
#     "alpha.eksctl.io/nodegroup-type"              = "managed"
#     "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "videochat-prod"
#   }

#   tags_all = {
#     Name                                          = "eksctl-videochat-prod-nodegroup-ng-06a865b4/NodeInstanceRole"
#     "alpha.eksctl.io/cluster-name"                = "videochat-prod"
#     "alpha.eksctl.io/eksctl-version"              = "0.167.0"
#     "alpha.eksctl.io/nodegroup-name"              = "ng-06a865b4"
#     "alpha.eksctl.io/nodegroup-type"              = "managed"
#     "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "videochat-prod"
#   }
# }

# resource "aws_iam_role" "stacksets-exec-f8c37c7813649e5c07a06313b11876b3" {
#   assume_role_policy = <<POLICY
# {
#   "Id": "stacksets-exec-f8c37c7813649e5c07a06313b11876b3-assume-role-policy",
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Effect": "Allow",
#       "Principal": {
#         "AWS": "arn:aws:iam::264647280376:role/aws-service-role/stacksets.cloudformation.amazonaws.com/AWSServiceRoleForCloudFormationStackSetsOrgAdmin"
#       },
#       "Sid": "1"
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   description          = "Role created by AWSCloudFormation StackSets"
#   # managed_policy_arns  = ["arn:aws:iam::aws:policy/AdministratorAccess"]
#   max_session_duration = "3600"
#   # name                 = "stacksets-exec-f8c37c7813649e5c07a06313b11876b3"
#   name_prefix          = "stacksets-exec-f8c37c"
#   path                 = "/"
# }
