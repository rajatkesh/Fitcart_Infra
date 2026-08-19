data "azurerm_kubernetes_cluster" "aks_cluster" {
    name                = "dev-akscluster01"
    resource_group_name = "dev-rg28"
}