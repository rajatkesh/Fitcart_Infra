resource "azurerm_mssql_database" "aks_mssql_db" {
    for_each = var.child_mssql_databases
  name         = each.value.name
  server_id    = data.azurerm_mssql_server.aks_mssql.id
  collation    = each.value.collation
  license_type = each.value.license_type
  max_size_gb  = each.value.max_size_gb
  sku_name     = each.value.sku_name
  enclave_type = each.value.enclave_type

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = false
  }
}