variable "project_id" {
  description = "Project ID"
  type = string
}

variable "region" {
  description = "GCP Region"
  type = string
}

variable "azs" {
  description = "availability zones."
  type        = map(string)
}

variable "name" {
  description = "Web server name."
  type        = string
}

variable "machine_type" {
  description = "instance machine type."
  type        = string
}

variable "web_server_labels" {
  description = "webservers labels"
  type        = map
}

variable "app_server_labels" {
  description = "appsevers labels"
  type        = map
}

variable "private_subnet" {
  description = "Prrivate subnet self link"
}