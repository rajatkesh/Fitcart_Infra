module "aks_rg" {
  source   = "../../modules/azurerm_resource_group"
  child_rg = var.root_rg
}

module "aks_storage" {
  source        = "../../modules/azurerm_storage_account"
  depends_on    = [module.aks_rg]
  child_storage = var.root_storage
}

module "aks_networking" {
  source = "../../modules/azurerm_networking"
  depends_on = [module.aks_rg]
  child_networking = var.root_networking
}

module "aks_mssql_server" {
  source = "../../modules/azurerm_sql_server"
  depends_on = [module.aks_rg]
  child_mssql_servers = var.root_mssql_servers
}

module "aks_mssql_database" {
  source = "../../modules/azurerm_sql_database"
  depends_on = [module.aks_mssql_server]
  child_mssql_databases = var.root_mssql_databases
}

module "aks_cluster" {
  source = "../../modules/azurerm_kubernetes_cluster"
  depends_on = [module.aks_rg, module.aks_networking]
  child_aks_cluster = var.root_aks_cluster
}

module "aks_nodepool" {
  source = "../../modules/azurerm_cluster_nodepool"
  depends_on = [module.aks_cluster]
  child_aks_nodepool = var.root_aks_nodepool
}

module "lb" {
  source = "../../modules/azurerm_loadbalancer"
  depends_on = [module.aks_rg]
  child_lb = var.root_lb
  child_pip = var.root_pip
}

module "aks_acr" {
  source = "../../modules/azurerm_acr"
  depends_on = [module.aks_rg]
  child_acr = var.root_acr
}

module "aks_application_gateway" {
  source = "../../modules/azurerm_application_gateway"
  depends_on = [module.aks_rg, module.lb]
  child_application_gateway = var.root_application_gateway
  child_public_ip = var.root_public_ip
}