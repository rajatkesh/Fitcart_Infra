variable "child_acr" {
    description = "A map of child ACRs to create"
    type        = map(object({
        name                     = string
        location                 = string
        resource_group_name      = string
        georeplication_location  = string
    }))
}