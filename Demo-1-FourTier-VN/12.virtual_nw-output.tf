#Virtual network name outout
output "Virtual_Network_Name" {
  description = "Virtual Network Name"
  value       = azurerm_virtual_network.VNet.name
}
#Virtual network id outout
output "Virtual_Network_ID" {
  description = "Virtual Network ID"
  value       = azurerm_virtual_network.VNet.id
}
#Web subnet name 
output "Web_subnet_Name" {
  description = "Web Subnet Name"
  value       = azurerm_subnet.Web_subnet.name
}
#Web subnet id outout
output "Web_subnet_ID" {
  description = "Web Subnet ID"
  value       = azurerm_subnet.Web_subnet.id
}
#Web securty group name output
output "Web_Security_Group_Name" {
  description = "Web Security Group Name"
  value       = azurerm_network_security_group.Web_security_group.name
}
#Web securty group id output
output "Web_Security_Group_ID" {
  description = "Web Security Group ID"
  value       = azurerm_network_security_group.Web_security_group.id
}
