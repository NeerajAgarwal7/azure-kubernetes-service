resource "azurerm_kubernetes_cluster" "k8s" {
  name                = "${var.cluster_name}"
  location            = "${var.rg-location}"
  resource_group_name = "${var.rg-name}"
  dns_prefix          = "${var.dns_prefix}"

  linux_profile {
    admin_username = "ubuntu"

    ssh_key {
      key_data = "${file("${var.ssh_public_key}")}"
    }
  }

  agent_pool_profile {
    name            = "default"
    count           = "${var.agent_count}"
    vm_size         = "Standard_D1_v2"
    os_type         = "Linux"
    os_disk_size_gb = 30
    vnet_subnet_id = "${var.subnet-id}"
  }

  service_principal {
    client_id     = "${var.ARM_CLIENT_ID}"
    client_secret = "${var.ARM_CLIENT_SECRET}"
  }

  tags {
    Environment = "Devlopment"
  }
}

