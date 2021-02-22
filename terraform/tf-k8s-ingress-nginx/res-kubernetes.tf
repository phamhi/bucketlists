
resource "kubernetes_namespace" "nginx" {
  metadata {
    name = var.kubernetes_namespace_nginx.name
  }
}
