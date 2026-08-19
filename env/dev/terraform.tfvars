root_rg = {
  "rg1" = {
    name     = "dev-rg28"
    location = "East US 2"
  }
}

root_storage = {
  "storage1" = {
    name                     = "devstorageacct75"
    location                 = "East US 2"
    resource_group_name      = "dev-rg28"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}

root_networking = {
  "network1" = {
    name                = "dev-network"
    resource_group_name = "dev-rg28"
    location            = "East US 2"
    address_space       = ["10.0.0.0/16"]
    dns_servers         = ["10.0.0.4", "10.0.0.5"]
    subnet             = [
      {
        name             = "subnet1"
        address_prefixes = ["10.0.1.0/24"]
      }
    ]
  }
}

root_mssql_servers = {
  "mssql1" = {
    name                         = "dev-mssqlserver28"
    resource_group_name          = "dev-rg28"
    location                     = "Central US"
    version                      = "12.0"
    administrator_login          = "missadministrator"
    administrator_login_password = "thisIsKat11"
    minimum_tls_version          = "1.2"
  }
}

root_mssql_databases = {
  "mssqldb1" = {
    name         = "dev-mssqldb01"
    rg           = "dev-rg28"
    collation    = "SQL_Latin1_General_CP1_CI_AS"
    license_type = "LicenseIncluded"
    max_size_gb  = 2
    sku_name     = "S0"
    enclave_type = "VBS"
  }
}

root_aks_cluster = {
  "aks1" = {
    name                = "dev-akscluster01"
    location            = "East US 2"
    resource_group_name = "dev-rg28"
    dns_prefix          = "devakscluster01"
  }
}

root_aks_nodepool = {
  "nodepool1" = {
    name                  = "devaksnode"
    vm_size               = "standard_d2als_v7"
    node_count            = 1
  }
}

root_lb = {
  "lb1" = {
    name                = "dev-lb01"
    location            = "East US 2"
    resource_group_name = "dev-rg28"
    public_ip_key       = "pip1"
  }
}

root_pip = {
  "pip1" = {
    name                = "dev-pip01"
    location            = "East US 2"
    resource_group_name = "dev-rg28"
    allocation_method   = "Static"
  }
}

root_acr = {
  "acr1" = {
    name                     = "devacr28"
    location                 = "East US 2"
    resource_group_name      = "dev-rg28"
    georeplication_location  = "North Europe"
  }
}

root_application_gateway = {
  "appgw1" = {
    name                = "dev-appgw01"
    location            = "East US 2"
    resource_group_name = "dev-rg28"
    public_ip_key       = "pip1"
  }
}

root_public_ip = {
  "pip1" = {
    name                = "dev-pip02"
    location            = "East US 2"
    resource_group_name = "dev-rg28"
    allocation_method   = "Static"
  }
}