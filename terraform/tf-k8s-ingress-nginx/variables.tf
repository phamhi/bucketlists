
variable "provider_kubernetes" {
  type = object({
    config_path = string
  })
}

variable "kubernetes_namespace_nginx" {
  type = object({
    name = string
  })
}

#=======================================================================================================================

variable "helm_release_ingress-nginx" {
  type = object({
    name      = string
    chart     = string
    namespace = string
    version   = string
    wait      = bool
    timeout   = number

    set        = map(string)
    set_string = map(string)

  })
}

