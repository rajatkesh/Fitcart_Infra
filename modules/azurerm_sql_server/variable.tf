variable "child_mssql_servers" {
  description = "A map of child SQL servers to create"
  type        = map(object({
    name                = string
    resource_group_name = string
    location            = string
    version             = string
    administrator_login = string
    administrator_login_password = string
    minimum_tls_version = string
  }))
}