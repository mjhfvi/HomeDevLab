# resource "aws_iam_user_policy" "azure-octopus-production_AmazonSesSendingAccess" {
#   name = "AmazonSesSendingAccess"

#   policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "ses:SendRawEmail",
#       "Condition": {
#         "StringEquals": {
#           "ses:FromAddress": "reporter@octopus-app.com"
#         }
#       },
#       "Effect": "Allow",
#       "Resource": "*"
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY

#   user = "azure-octopus-production"
# }
