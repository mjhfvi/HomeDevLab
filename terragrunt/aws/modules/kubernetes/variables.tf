variable "cluster_name" {
  type = string
  description = "The name of the EKS cluster"
  default = "octopus-test-01"
  # validation {
  #   condition     = length(var.cluster_name) > 0
  #   error_message = "The cluster_name variable must not be empty."
  # }
}
