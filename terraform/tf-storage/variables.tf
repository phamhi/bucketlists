
variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}

variable "resource_group" {
  type = object({
    name = string
  })
}

variable "storage_account" {
  type = object({
    name = string
  })
}

variable "storage_container" {
  type = object({
    name                  = string
    container_access_type = string
  })
}
