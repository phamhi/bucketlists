
resource "azurerm_virtual_network" "bucketlists" {
  name                = var.virtual_network.name
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
  address_space       = var.virtual_network.address_space
}
