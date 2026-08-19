variable "child_pip" {
    description = "A map of child public IPs to create"
    type        = map(object({
    name                = string
    location            = string
    resource_group_name = string
    allocation_method   = string
    }))
}
variable "child_lb" {
    description = "A map of child load balancers to create"
    type        = map(object({
    name                = string
    location            = string
    resource_group_name = string
    public_ip_key     = string
}))
}