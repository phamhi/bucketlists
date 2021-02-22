
resource "azurerm_kubernetes_cluster" "bucketlists" {
  name                       = var.kubernetes_cluster.name
  resource_group_name        = data.azurerm_resource_group.main.name
  location                   = data.azurerm_resource_group.main.location
  dns_prefix                 = var.kubernetes_cluster.dns_prefix
  enable_pod_security_policy = var.kubernetes_cluster.enable_pod_security_policy
  private_cluster_enabled    = var.kubernetes_cluster.private_cluster_enabled
  kubernetes_version         = var.kubernetes_cluster.kubernetes_version

  default_node_pool {
    enable_auto_scaling  = var.kubernetes_cluster.default_node_pool.enable_auto_scaling
    max_pods             = var.kubernetes_cluster.default_node_pool.max_pods
    name                 = var.kubernetes_cluster.default_node_pool.name
    orchestrator_version = var.kubernetes_cluster.default_node_pool.orchestrator_version
    os_disk_size_gb      = var.kubernetes_cluster.default_node_pool.os_disk_size_gb
    type                 = var.kubernetes_cluster.default_node_pool.type
    vm_size              = var.kubernetes_cluster.default_node_pool.vm_size
    node_count           = var.kubernetes_cluster.default_node_pool.node_count
    vnet_subnet_id       = azurerm_subnet.main.id
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

  role_based_access_control {
    enabled = var.kubernetes_cluster.role_based_access_control.enabled
  }

  network_profile {
    dns_service_ip     = var.kubernetes_cluster.network_profile.dns_service_ip
    docker_bridge_cidr = var.kubernetes_cluster.network_profile.docker_bridge_cidr
    load_balancer_sku  = var.kubernetes_cluster.network_profile.load_balancer_sku
    network_plugin     = var.kubernetes_cluster.network_profile.network_plugin
    network_policy     = var.kubernetes_cluster.network_profile.network_policy
    service_cidr       = var.kubernetes_cluster.network_profile.service_cidr
  }
}
