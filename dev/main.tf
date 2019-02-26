provider "azurerm" {
    version = "~>1.5"
}

resource "azurerm_resource_group" "k8s" {
  name     = "${var.resource_group_name}"
  location = "${var.location}"
}

module "network" {
  source	= "../modules/network"
  rg-location	= "${azurerm_resource_group.k8s.location}"
  rg-name	= "${azurerm_resource_group.k8s.name}"
}

module "cluster" {
  source	= "../modules/cluster"
  rg-location   = "${azurerm_resource_group.k8s.location}"
  rg-name       = "${azurerm_resource_group.k8s.name}"
  subnet-id	= "${module.network.subnet-id}"
  ARM_CLIENT_ID	= "${var.id}"
  ARM_CLIENT_SECRET	= "${var.secret}"
}
