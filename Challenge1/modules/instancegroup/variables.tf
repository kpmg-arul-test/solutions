variable "project_id" {
  description = "The ID of the project where this VPC will be created"
}

variable "name" {
  description = "The name of the network being created"
}

variable "azs" {
    description = "GCP Availability zones"
    type = map(string)
}

variable "private_subnet" {
  description = "Prrivate subnet self link"
}