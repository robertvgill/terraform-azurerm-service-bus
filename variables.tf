## naming
variable "department" {
  description = "Specifies the name of the department."
  type        = list(string)
  default     = []
}

variable "projectname" {
  description = "Specifies the name of the project."
  type        = list(string)
  default     = []
}

variable "environment" {
  description = "Specifies the name of the environment."
  type        = list(string)
  default     = []
}

variable "region_mapping" {
  description = "Specifies the name of the region."
  type        = list(string)
  default     = []
}

## resource group
variable "rg_resource_group_name" {
  description = "The name of the resource group in which to create the storage account."
  type        = string
  default     = null
}

variable "rg_location" {
  description = "Specifies the supported Azure location where the resource should be created."
  type        = string
  default     = null
}

## service bus
variable "sb_servicebus_create" {
  description = "Controls if ServiceBus Namespace should be created."
  type        = bool
  default     = false
}

variable "sb_namespace_name" {
  description = "Specifies the name of the ServiceBus Namespace resource . Changing this forces a new resource to be created."
  default     = null
}

variable "sb_namespace_sku" {
  description = "Defines which tier to use. Options are basic, standard or premium."
  default     = null
}

variable "sb_namespace_capacity" {
  description = "Specifies the capacity. When sku is Premium, capacity can be 1, 2, 4 or 8. When sku is Basic or Standard, capacity can be 0 only."
  default     = 0
}

variable "sb_redundency" {
  description = "Whether or not this resource is zone redundant. sku needs to be Premium. Defaults to false."
  default     = false
}

variable "sb_queues" {
  description = "List of queues to create."
  type        = list(string)
  default     = []
}

variable "sb_topics" {
  description = "List of topics to create."
  type        = list(string)
  default     = []
}

variable "sb_servicebus_subscription_max_delivery_count" {
  description = "The maximum number of deliveries."
  type        = number
  default     = null
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}
