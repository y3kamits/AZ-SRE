resource "azurerm_resource_group" "ResourceGroupVN" {
  name     = "${local.resource_name_prefix}-${var.resource_group_name}-${random_string.Random_RG.id}" #(Techops-Dev-Demo-1-FourTier-VN-rndm)
  location = var.resource_group_location
  tags = {
    business_division = var.business_division
    environment       = var.environment
  }

}