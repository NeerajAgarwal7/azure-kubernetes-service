output "kube_config" {
  value = "${module.cluster.kube_config}"
}

output "host" {
  value = "${module.cluster.host}"
}

output "subnet-id" {
  value = "${module.network.subnet-id}"
}
