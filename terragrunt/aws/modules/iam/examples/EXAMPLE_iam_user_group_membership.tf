# resource "aws_iam_user_group_membership" "github-002F-AWSSESSendingGroupDoNotRename" {
#   groups = ["AWSSESSendingGroupDoNotRename"]
#   user   = "github"
# }

# resource "aws_iam_user_group_membership" "octopus-app-website-002F-AWSSESSendingGroupDoNotRename" {
#   groups = ["AWSSESSendingGroupDoNotRename"]
#   user   = "octopus-app-website"
# }

# resource "aws_iam_user_group_membership" "ses-smtp-user-002E-development-002F-AWSSESSendingGroupDoNotRename" {
#   groups = ["AWSSESSendingGroupDoNotRename"]
#   user   = "ses-smtp-user.development"
# }

# resource "aws_iam_user_group_membership" "ses-smtp-user-002E-xerox-printer-office-002F-AWSSESSendingGroupDoNotRename" {
#   groups = ["AWSSESSendingGroupDoNotRename"]
#   user   = "ses-smtp-user.xerox-printer-office"
# }

# import {
#   to = aws_iam_user_group_membership.github-002F-AWSSESSendingGroupDoNotRename
#   id = ""
# }

# import {
#   to = aws_iam_user_group_membership.octopus-app-website-002F-AWSSESSendingGroupDoNotRename
#   id = ""
# }

# import {
#   to = aws_iam_user_group_membership.ses-smtp-user-002E-development-002F-AWSSESSendingGroupDoNotRename
#   id = ""
# }

# import {
#   to = aws_iam_user_group_membership.ses-smtp-user-002E-xerox-printer-office-002F-AWSSESSendingGroupDoNotRename
#   id = ""
# }
