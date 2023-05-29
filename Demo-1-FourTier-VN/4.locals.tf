locals {
  owners               = var.business_division                         #(Techops)
  environment          = var.environment                               #(Dev)
  resource_name_prefix = "${var.business_division}-${var.environment}" #(Techops-Dev)
  common_tags = {
    owners      = local.owners
    environment = local.environment
  }
}