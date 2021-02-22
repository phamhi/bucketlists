
provider "helm" {
  kubernetes {
    config_path = var.provider_kubernetes.config_path
  }
}

provider "kubernetes" {
  config_path = var.provider_kubernetes.config_path
}
