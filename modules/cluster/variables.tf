variable "cluster_name" {
  default = "devops-test"
}

variable "dns_prefix" {
  default = "k8stest"
}

variable "ssh_public_key" {
  default = "~/.ssh/id_rsa.pub"
}

variable "agent_count" {
  default = 3
}

variable "ARM_CLIENT_ID" {
}

variable "ARM_CLIENT_SECRET" {
}

variable "subnet-id" {
}

variable "rg-location" {
}

variable "rg-name" {
}
