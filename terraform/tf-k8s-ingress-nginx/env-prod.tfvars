
provider_kubernetes = {
  config_path = "./kube_configs/bucketlists.k8s-config.yaml"
}

kubernetes_namespace_nginx = {
  name = "nginx"
}

#=======================================================================================================================

helm_release_ingress-nginx = {
  name  = "ingress-nginx"
  chart = "./charts/ingress-nginx-3.23.0"
  namespace = "nginx"
  version   = "" # local chart
  wait      = false
  timeout   = 300

  set = {
    "controller.replicaCount" = "1"
    #
    # client source IP preservation (see https://docs.microsoft.com/en-us/azure/aks/ingress-internal-ip)
    "controller.service.externalTrafficPolicy" = "Local"
    #
  }

  set_string = {
    "defaultBackend.nodeSelector.beta\\.kubernetes\\.io/os" = "linux"
    "controller.nodeSelector.beta\\.kubernetes\\.io/os"     = "linux"
  }
}
