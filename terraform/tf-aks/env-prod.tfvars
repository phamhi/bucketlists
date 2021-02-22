
resource_group = {
  name = "azurepoc"
}

virtual_network = {
  name          = "bucketlists-vnet"
  address_space = ["10.0.0.0/8"]
}

subnet = {
  name                                           = "aks-subnet"
  address_prefixes                               = ["10.0.1.0/24"]
  enforce_private_link_endpoint_network_policies = true
  enforce_private_link_service_network_policies  = false
}

kubernetes_cluster = {
  name                       = "bucketlists-aks"
  dns_prefix                 = "bucketlists-aks-dns"
  enable_pod_security_policy = false
  private_cluster_enabled    = false
  kubernetes_version         = "1.18.14"

  default_node_pool = {
    enable_auto_scaling  = false
    max_pods             = 100
    name                 = "pool0"
    node_count           = 1
    orchestrator_version = "1.18.14"
    os_disk_size_gb      = 100
    type                 = "VirtualMachineScaleSets"
    vm_size              = "Standard_B2s"
  }

  role_based_access_control = {
    enabled = true
  }

  network_profile = {
    dns_service_ip     = "172.20.20.20"
    docker_bridge_cidr = "172.17.0.1/16"
    load_balancer_sku  = "Standard"
    network_plugin     = "azure"
    network_policy     = "calico"
    service_cidr       = "172.20.0.0/16"
  }
}

local_file = {
  kubeconfig_path = "./output/bucketlists.k8s-config.yaml"
}