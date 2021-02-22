
variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}

variable "resource_group" {
  type = object({
    name = string
  })
}

variable "virtual_network" {
  type = object({
    name          = string
    address_space = list(string)
  })
}

variable "subnet" {
  type = object({
    name                                           = string
    address_prefixes                               = list(string)
    enforce_private_link_endpoint_network_policies = bool
    enforce_private_link_service_network_policies  = bool
  })
}

variable "kubernetes_cluster" {
  type = object({
    name                       = string
    dns_prefix                 = string
    enable_pod_security_policy = bool
    private_cluster_enabled    = bool
    kubernetes_version         = string

    default_node_pool = object({
      enable_auto_scaling  = bool
      max_pods             = number
      name                 = string
      node_count           = number
      orchestrator_version = string
      os_disk_size_gb      = number
      type                 = string
      vm_size              = string
    })

    role_based_access_control = object({
      enabled = bool
    })

    network_profile = object({
      dns_service_ip     = string
      docker_bridge_cidr = string
      load_balancer_sku  = string
      network_plugin     = string
      network_policy     = string
      service_cidr       = string
    })
  })
}

variable "local_file" {
  type = object({
    kubeconfig_path = string
  })
}