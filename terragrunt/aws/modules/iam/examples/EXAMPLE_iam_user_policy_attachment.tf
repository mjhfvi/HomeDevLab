# resource "aws_iam_user_policy_attachment" "external_s3_octopuscloud_full_access" {
#   policy_arn = "arn:aws:iam::316115107540:policy/s3_octopuscloud_full_access"
#   user       = "external"
# }

# import {
#   to = aws_iam_user_policy_attachment.external_s3_octopuscloud_full_access
#   id = "external"
# }
