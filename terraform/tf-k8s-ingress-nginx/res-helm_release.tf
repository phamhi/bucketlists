
resource "helm_release" "ingress-nginx" {
  name    = var.helm_release_ingress-nginx.name
  chart   = var.helm_release_ingress-nginx.chart
  version = var.helm_release_ingress-nginx.version
  wait    = var.helm_release_ingress-nginx.wait
  timeout = var.helm_release_ingress-nginx.timeout

  namespace = kubernetes_namespace.nginx.metadata[0].name

  dynamic "set" {
    for_each = var.helm_release_ingress-nginx.set
    content {
      name  = set.key
      value = set.value
    }
  }

  dynamic "set" {
    for_each = var.helm_release_ingress-nginx.set_string
    content {
      name  = set.key
      value = set.value
      type  = "string"
    }
  }
}

