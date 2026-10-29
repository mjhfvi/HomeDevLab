resource "helm_release" "charts-infrastructure" {
  for_each   = local.helm_charts

  name       = each.key
  chart      = each.value.chart
  repository = each.value.repository
  version    = each.value.version
  namespace  = each.value.namespace

  create_namespace = true

  values = [
    file("../../devops-kubernetes-clusters-manifests/infrastructure/${each.key}/values-dev.yaml"),
    # file("${path.module}/values/common.yaml"),
    # file("${path.module}/values/${each.key}-overrides.yaml")
    # yamlencode({ replicaCount = 3 })
  ]
}

locals {
  helm_charts = {
    argocd = {
      chart      = "argo-cd"
      repository = "https://argoproj.github.io/argo-helm"
      version    = "9.4.17"
      namespace  = "infrastructure"
    },
    traefik = {
      chart      = "traefik"
      repository = "https://traefik.github.io/charts"
      version    = "39.0.7"
      namespace  = "infrastructure"
    }
  }
}

