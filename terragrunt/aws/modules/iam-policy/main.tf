# module "iam_policy" {
#   source  = "cloudposse/iam-policy/aws"
#   # Cloud Posse recommends pinning every module to a specific version
#   # version = "x.x.x"

#   iam_policy = [{
#     version = "2012-10-17"
#     policy_id = "example"
#     statements = [
#       {
#         sid       = "ListMyBucket"
#         effect    = "Allow"
#         actions   = ["s3:ListBucket"]
#         resources = ["arn:aws:s3:::test"]
#         conditions = [
#           {
#             test     = "StringLike"
#             variable = "cloudwatch:namespace"
#             values   = ["x-*"]
#           },
#         ]
#       },
#       {
#         sid       = "WriteMyBucket"
#         effect    = "Allow"
#         actions   = ["s3:PutObject", "s3:GetObject", "s3:DeleteObject"]
#         resources = ["arn:aws:s3:::test/*"]
#         conditions = [
#           {
#             test     = "StringLike"
#             variable = "cloudwatch:namespace"
#             values   = ["x-*"]
#           },
#         ]
#       }
#     ]
#   }]

# data "aws_iam_policy_document" "assume_role" {
#   statement {
#     actions = ["sts:AssumeRole"]

#     principals {
#       type        = "Service"
#       identifiers = ["ec2.amazonaws.com"]
#     }
#   }
# }

# resource "aws_iam_role" "example" {
#   name               = "hello_role"
#   assume_role_policy = data.aws_iam_policy_document.assume_role.json

#   inline_policy {
#     name = "test_policy"

#     policy = module.iam_policy.json
#   }
# }