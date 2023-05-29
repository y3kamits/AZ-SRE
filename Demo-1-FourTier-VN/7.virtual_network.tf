resource "azurerm_virtual_network" "VNet" {
  name                = "${local.resource_name_prefix}-${var.VNet_Name}"
  address_space       = var.VNet_AddressSpace
  resource_group_name = azurerm_resource_group.ResourceGroupVN.name
  location            = azurerm_resource_group.ResourceGroupVN.location
  tags                = local.common_tags
}