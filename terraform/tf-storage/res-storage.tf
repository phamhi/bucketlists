
resource "azurerm_storage_account" "bucketlists" {
  name                     = var.storage_account.name
  resource_group_name      = data.azurerm_resource_group.main.name
  location                 = data.azurerm_resource_group.main.location
  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}



resource "azurerm_storage_container" "tfstate" {
  name                  = var.storage_container.name
  storage_account_name  = azurerm_storage_account.bucketlists.name
  container_access_type = var.storage_container.container_access_type
}

