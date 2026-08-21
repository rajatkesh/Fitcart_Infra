variable "root_rg" {
  description = "A map of root resource groups to create"
  type = map(object({
    name     = string
    location = string
  }))
}

variable "root_storage" {
  description = "A map of root storage accounts to create"
  type = map(object({
    name                     = string
    location                 = string
    resource_group_name      = string
    account_tier             = string
    account_replication_type = string
  }))
}

variable "root_networking" {
  description = "A map of root virtual networks to create"
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    address_space       = list(string)
    dns_servers         = list(string)
    subnet = list(object({
      name             = string
      address_prefixes = list(string)
    }))
  }))
}

variable "root_mssql_servers" {
  description = "A map of root SQL servers to create"
  type = map(object({
    name                         = string
    resource_group_name          = string
    location                     = string
    version                      = string
    administrator_login          = string
    administrator_login_password = string
    minimum_tls_version          = string
  }))
}

variable "root_mssql_databases" {
  description = "A map of root SQL databases to create"
  type = map(object({
    name         = string
    rg           = string
    collation    = string
    license_type = string
    max_size_gb  = number
    sku_name     = string
    enclave_type = string
  }))
}

variable "root_aks_cluster" {
  description = "A map of root AKS clusters to create"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    dns_prefix          = string
  }))
}

variable "root_aks_nodepool" {
  description = "A map of root AKS node pools to create"
  type = map(object({
    name       = string
    vm_size    = string
    node_count = number
  }))
}

variable "root_pip" {
  description = "A map of root public IPs to create"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    allocation_method   = string
  }))
}
variable "root_lb" {
  description = "A map of root load balancers to create"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    public_ip_key       = string
  }))
}

variable "root_acr" {
  description = "A map of root Azure Container Registries to create"
  type = map(object({
    name                    = string
    location                = string
    resource_group_name     = string
    georeplication_location = string
  }))
}

variable "root_application_gateway" {
  description = "A map of root application gateways to create"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    public_ip_key       = string
  }))
}

variable "root_public_ip" {
  description = "A map of root public IPs to create"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    allocation_method   = string
  }))
}