#Generic input vaiables

#Business division
variable "business_division" {
  description = "Applicable Business division vairable within organization"
  type        = string
  #default     = "TechOps"
}

#Environment Variables
variable "environment" {
  description = "Application environment variable within organization"
  type        = string
  #default     = "Dev"
}

#Azure reource group name variable
variable "resource_group_name" {
  description = "Applicable Azure resource group name"
  type        = string
  #default     = "Demo-1-FourTier-VN"
}

#Azure resource location variable
variable "resource_group_location" {
  description = "Applicable Azure resource location"
  type        = string
  #default     = "eastus2"
}   