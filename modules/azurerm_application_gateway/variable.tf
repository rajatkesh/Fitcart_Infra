variable "child_application_gateway" {
  description = "A map of child application gateways to create"
  type        = map(object({
    name                = string
    location            = string
    resource_group_name = string
    public_ip_key   = string
  })) 
}