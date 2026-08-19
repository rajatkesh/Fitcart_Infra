resource "azurerm_public_ip" "pip" {
    for_each = var.child_pip
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = each.value.allocation_method
}

resource "azurerm_lb" "lb" {
    for_each = var.child_lb
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  frontend_ip_configuration {
    name                 = "frontend_ip"
    public_ip_address_id = azurerm_public_ip.pip[each.value.public_ip_key].id
  }
}