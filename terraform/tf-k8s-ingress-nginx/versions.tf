terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "~>1.3"
    }
    kubernetes = {
      version = "~>1.13"
    }
  }
  required_version = ">= 0.14.3"

}

