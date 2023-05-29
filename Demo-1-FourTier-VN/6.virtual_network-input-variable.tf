variable "VNet_Name" {
  description = "Applicable Azure Virtual Network name"
  default     = "VN"
  type        = string
}

variable "VNet_AddressSpace" {
  description = "Applicable Azure Virtual Network address space"
  default     = ["10.0.0.0/16"]
  type        = list(string)
}

variable "WebSubnetName" {
  description = "Applicable Azure Web subnet name"
  default     = "WebSubnet"
  type        = string
}

variable "WebSubnetAddressSapce" {
  description = "Applicable Azure Web subnet address space"
  default     = ["10.0.1.0/24"]
  type        = list(string)
}

variable "AppSubnetName" {
  description = "Applicable Azure App subnet name"
  default     = "AppSubnet"
  type        = string
}

variable "AppSubnetAddressSapce" {
  description = "Applicable Azure App subnet address space"
  default     = ["10.0.11.0/24"]
  type        = list(string)
}

variable "DBSubnetName" {
  description = "Applicable Azure DB subnet name"
  default     = "DBSubnet"
  type        = string
}

variable "DBSubnetAddressSapce" {
  description = "Applicable Azure DB subnet address space"
  default     = ["10.0.21.0/24"]
  type        = list(string)
}

variable "BastianSubnetName" {
  description = "Applicable Azure Bastian subnet name"
  default     = "BastianSubnet"
  type        = string
}

variable "BastianSubnetAddressSapce" {
  description = "Applicable Azure Bastian subnet address space"
  default     = ["10.0.100.0/24"]
  type        = list(string)
}