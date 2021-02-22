terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.4"
    }
    local = {
      source = "hashicorp/local"
      version = "~>2.1"
    }
  }
  required_version = ">= 0.14.3"
}

