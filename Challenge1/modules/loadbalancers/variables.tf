variable "project_id" {
  description = "The project ID to create the resources in."
  type        = string
}

variable "region" {
  description = "GCP region"
  type = string
}

variable "name" {
  description = "Name prefix"
  type        = string
}

variable "url_map" {
  description = "url_map resource to use."
  type        = string
}

variable "enable_ssl" {
  description = "Set to true to enable ssl."
  type        = bool
  default     = false
}

variable "ssl_certificates" {
  description = "SSL certificates required if 'enable_ssl' is 'true'."
  type        = list(string)
  default     = []
}

variable "enable_http" {
  description = "Set to true to enable plain http"
  type        = bool
  default     = true
}

variable "create_dns_entries" {
  description = "For DNS records"
  type        = bool
  default     = false
}

variable "elb_custom_labels" {
  description = "Custom labels for ELB resources"
  type        = map(string)
  default     = {}
}

variable "http_port" {
  description = "HTTP Port"
  type        = string
}

variable "https_port" {
  description = "HTTPS Port"
  type        = string
}

variable "health_check_port" {
  description = "Port to perform health checks"
  type        = number
}

variable "backends" {
  description = "List of backends"
  type        = list(map(string))
}

variable "network" {
  description = "Self link of the VPC network"
  type        = string
  default     = "default"
}

variable "subnetwork" {
  description = "Self link of the VPC subnetwork"
  type        = string
  default     = ""
}

variable "protocol" {
  description = "The protocol for the backend and frontend forwarding rule. TCP or UDP."
  type        = string
  default     = "TCP"
}

variable "ports" {
  description = "Ports for ILB"
  type = list(string)
}

variable "service_label" {
  description = "An optional prefix to the service name for this Forwarding Rule"
  type        = string
  default     = ""
}

variable "network_project" {
  description = "The name of the GCP Project where the network is located"
  type        = string
  default     = ""
}

variable "http_health_check" {
  description = "Set to true if health check is type http"
  type        = bool
  default     = false
}

variable "session_affinity" {
  description = "The session affinity for the backends"
  type        = string
  default     = "NONE"
}

variable "source_tags" {
  description = "List of source tags for traffic between the internal load balancer."
  type        = list(string)
  default     = []
}

variable "target_tags" {
  description = "List of target tags for traffic between the internal load balancer."
  type        = list(string)
  default     = []
}

variable "source_ranges" {
  description = "IP ranges are required for health checks"
  type = list(string)
}

