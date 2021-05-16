provider "azurerm" {
  subscription_id = var.subscription_id
  client_id       = var.serviceprinciple_id
  client_secret   = var.serviceprinciple_key
  tenant_id       = var.tenant_id
  features {}
}

module "create_cluster" {
    source = "../modules/cluster"
    location = "australiaeast"
    kubernetes_version = var.kubernetes_version
    serviceprinciple_key = var.serviceprinciple_key
    serviceprinciple_id = var.serviceprinciple_id
    ssh_key = var.ssh_key
    vm_type = "Standard_D2as_v4"    
}

module "k8s" {
    source                 = "../modules/k8s"
    host                   = module.create_cluster.host
    client_certificate     = base64decode(module.create_cluster.client_certificate)
    client_key             = base64decode(module.create_cluster.client_key)
    cluster_ca_certificate = base64decode(module.create_cluster.cluster_ca_certificate)
}