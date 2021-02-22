
resource "azurerm_subnet" "main" {
  name                                           = var.subnet.name
  virtual_network_name                           = azurerm_virtual_network.bucketlists.name
  resource_group_name                            = azurerm_virtual_network.bucketlists.resource_group_name
  address_prefixes                               = var.subnet.address_prefixes
  enforce_private_link_endpoint_network_policies = var.subnet.enforce_private_link_endpoint_network_policies
  enforce_private_link_service_network_policies  = var.subnet.enforce_private_link_service_network_policies
}