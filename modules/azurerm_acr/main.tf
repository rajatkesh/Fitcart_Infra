resource "azurerm_container_registry" "acr" {
    for_each = var.child_acr
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  sku                 = "Premium"
  admin_enabled       = false
  georeplications {
    location                        = each.value.georeplication_location
    global_endpoint_routing_enabled = true
    zone_redundancy_enabled         = true
  }
}