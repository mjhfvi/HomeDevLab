resource "aws_ses_configuration_set" "main" {
    name                       = "my-first-configuration-set"
    region                     = "us-east-1"
    reputation_metrics_enabled = "true"
    sending_enabled            = "true"
}

resource "aws_ses_domain_identity" "main" {
    domain = "octopus-app.com"
    region = "us-east-1"
}

resource "aws_ses_email_identity" "main" {
    email  = "reporter@octopus-app.com"
    region = "us-east-1"
}

# import {
#     to = aws_ses_configuration_set.main
#     id = "my-first-configuration-set"
# }
# import {
#     to = aws_ses_domain_identity.main
#     id = "octopus-app.com"
# }
# import {
#     to = aws_ses_email_identity.main
#     id = "reporter@octopus-app.com"
# }