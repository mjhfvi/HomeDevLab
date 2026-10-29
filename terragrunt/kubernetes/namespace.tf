# resource "kubernetes_namespace_v1" "main" {

#   for_each = local.namespaces

#   metadata {
#     # annotations = {
#     #   name = "example-annotation"
#     # }

#     # labels = {
#     #   label = "value"
#     # }

#     name     = each.value
#   }
# }

# locals {
#   namespaces = toset(["databases", "infrastructure", "management", "observability", "octopus-ai", "octopus-integrations", "octopus-microservices", "octopus-platform", "octopus-presentation", "octopus-videochat", "shared-services"])
# }

# terraform import kubernetes_namespace_v1.main management
# terraform import 'kubernetes_namespace_v1.main["databases"]' databases
# terraform import 'kubernetes_namespace_v1.main["infrastructure"]' infrastructure
