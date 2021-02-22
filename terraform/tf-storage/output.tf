
output "storageaccount-name" {
  value = azurerm_storage_account.bucketlists.name
}

output "storageaccount-primary_key" {
  value = azurerm_storage_account.bucketlists.primary_access_key
}