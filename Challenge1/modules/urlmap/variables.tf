variable "project_id" {
  description = "The ID of the project where this VPC will be created"
}

variable "name" {
  description = "The name of the network being created"
}

variable "instancegroup" {
    description = "Instance group self link"
    type = string    
}

variable "module_depends_on" {
    description = "depending module name"
    type = string    
}