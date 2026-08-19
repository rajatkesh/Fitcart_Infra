data "azurerm_subnet" "data_subnet" {
  name                 = "subnet1"
  virtual_network_name = "dev-network"
  resource_group_name  = "dev-rg28"
}

# data "azurerm_load_balancer" "data_lb" {
#   name                = "dev-lb01"
#   resource_group_name = "dev-rg"
# }
variable "child_public_ip" {
  description = "A map of child public IPs to create"
  type        = map(object({
    name                = string
    resource_group_name = string
    location            = string
    allocation_method   = string
  }))
  
}
resource "azurerm_public_ip" "public_ip" {
    for_each = var.child_public_ip
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method
}

resource "azurerm_application_gateway" "network" {
    for_each = var.child_application_gateway
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "my-gateway-ip-configuration"
    subnet_id = data.azurerm_subnet.data_subnet.id
  }

  frontend_port {
  name = "http-port"
  port = 80
}

frontend_ip_configuration {
  name                 = "frontend_ip"
  public_ip_address_id = azurerm_public_ip.public_ip[each.value.public_ip_key].id
}

backend_address_pool {
  name = "backend-pool"
}

backend_http_settings {
  name                  = "backend-settings"
  cookie_based_affinity = "Disabled"
  path                  = "/path1/"
  port                  = 80
  protocol              = "Http"
  request_timeout       = 60
}

http_listener {
  name                           = "http-listener"
  frontend_ip_configuration_name = "frontend_ip"
  frontend_port_name             = "http-port"
  protocol                       = "Http"
}

  request_routing_rule {
    name                       = "routing-rule"
    priority                   = 9
    rule_type                  = "Basic"
    http_listener_name         = "http-listener"
    backend_address_pool_name  = "backend-pool"
    backend_http_settings_name = "backend-settings"
  }
}