resource "azurerm_route_table" "k8s-rt" {
  name                = "k8s-routetable"
  location            = "${var.rg-location}"
  resource_group_name = "${var.rg-name}"

  route {
    name                   = "k8s-route"
    address_prefix         = "10.100.0.0/14"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "10.10.1.1"
  }
}

resource "azurerm_virtual_network" "k8s-vn" {
  name                	= "k8s-network"
  location           	= "${var.rg-location}"
  resource_group_name 	= "${var.rg-name}"
  address_space      	= ["10.1.0.0/16"]
}

resource "azurerm_subnet" "k8s-sub" {
  name                 	= "internal"
  resource_group_name  	= "${var.rg-name}"
  address_prefix       	= "10.1.0.0/24"
  virtual_network_name 	= "${azurerm_virtual_network.k8s-vn.name}"
}

resource "azurerm_subnet_route_table_association" "k8s-rt-association" {
  subnet_id      = "${azurerm_subnet.k8s-sub.id}"
  route_table_id = "${azurerm_route_table.k8s-rt.id}"
}
