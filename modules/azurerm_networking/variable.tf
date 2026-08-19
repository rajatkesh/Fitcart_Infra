variable "child_networking" {
  description = "A map of child virtual networks to create"
  type        = map(object({
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