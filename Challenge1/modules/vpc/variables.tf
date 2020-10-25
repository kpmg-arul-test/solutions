variable "project_id" {
  description = "The ID of the project where this VPC will be created"
}

variable "region" {
  description = "GCP region"
  type = string
}

variable "name" {
  description = "The name of the network being created"
}

variable "auto_create_subnetworks" {
  type        = bool
  description = "flag for creating automatic subnets"
}

variable "public-subnet-cidr" {
  type        = string
  description = "Public subnet cidr"
}

variable "private-subnet-cidr" {
  type        = string
  description = "Private Subnet cidr"
}

variable "machine_type" {
  description  = "Machine type"
  type = string
} 

variable "azs"  {
  description  = "Availability Zones"
  type = map(string)
}

variable "global_range" {
  description = "External cidr range"
  type = string
}
