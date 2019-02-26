output "rs-name" {
  value = "${azurerm_resource_group.k8s.name}"
}

output "rs-location" {
  value = "${azurerm_resource_group.k8s.location}"
}
