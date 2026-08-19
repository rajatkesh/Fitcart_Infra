data "azurerm_mssql_server" "aks_mssql" {
  name                = "dev-mssqlserver28"
  resource_group_name = "dev-rg28"
}