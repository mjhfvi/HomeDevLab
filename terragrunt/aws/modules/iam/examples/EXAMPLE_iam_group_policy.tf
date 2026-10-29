# resource "aws_iam_group_policy" "AWSSESSendingGroupDoNotRename_AmazonSesSendingAccess" {
#   group = "AWSSESSendingGroupDoNotRename"
#   name  = "AmazonSesSendingAccess"

#   policy = <<POLICY
# {
#   "Statement": [
#     {
#       "Action": "ses:SendRawEmail",
#       "Condition": {
#         "ForAnyValue:StringEquals": {
#           "ses:FromAddress": [
#             "do-not-reply@octopus-app.com",
#             "dontreply@octopus-app.com",
#             "noreply@octopus-app.com",
#             "test@octopus-app.com",
#             "github-actions-alert@octopus-app.com"
#           ]
#         }
#       },
#       "Effect": "Allow",
#       "Resource": "*"
#     }
#   ],
#   "Version": "2012-10-17"
# }
# POLICY
# }

# import {
#   to = aws_iam_group_policy.AWSSESSendingGroupDoNotRename_AmazonSesSendingAccess
#   id = "AWSSESSendingGroupDoNotRename"
# }
