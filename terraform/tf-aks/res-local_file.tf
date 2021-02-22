
resource "local_file" "create_kubeconfig" {
  depends_on = [
    azurerm_kubernetes_cluster.bucketlists
  ]
  content  = azurerm_kubernetes_cluster.bucketlists.kube_config_raw
  filename = var.local_file.kubeconfig_path
}