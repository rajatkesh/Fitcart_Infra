variable "child_mssql_databases" {
  description = "A map of child SQL databases to create"
  type        = map(object({
    name         = string
    collation    = string
    license_type = string
    max_size_gb  = number
    sku_name     = string
    enclave_type = string
  }))
}