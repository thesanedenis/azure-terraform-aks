output "host"{
    value                  = module.create_cluster.host
}
output "client_certificate" {

  value    = base64decode(module.create_cluster.client_certificate)
}
output "client_key"{
    value = base64decode(module.create_cluster.client_key)
}
output "cluster_ca_certificate" {
    value = base64decode(module.create_cluster.cluster_ca_certificate)
}


output "k8s" {
    value = data.terraform_remote_state.k8s
}
