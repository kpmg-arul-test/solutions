variable "project_id" {
  description = "Project ID"
  type = string
}

variable "region" {
  description = "GCP Region"
  type = string
}

variable "sa_file_path" {
  description = "service account file path"
}

variable "azs" {
  description = "availability zones."
  type        = map(string)
  default = {
		zone0 = "us-central1-a",
		zone1 = "us-central1-b",
    zone2 = "us-central1-c",
		zone3 = "us-central1-f"
	}
}

variable "public-subnet-cidr" {
  type        = string
  description = "Public subnet cidr"
}

variable "private-subnet-cidr" {
  type        = string
  description = "Private Subnet cidr"
}


variable "name" {
  description = "The name prefix"
  type        = string
}

variable "auto_create_subnetworks" {
  type        = bool
  description = "flag for creating automatic subnets"
}

variable "routes" {
  type        = list(map(string))
  description = "List of routes being created in this VPC"
  default     = []
}

variable "description" {
  type        = string
  description = "An optional description of this resource. The resource must be recreated to modify this field."
  default     = ""
}

variable "machine_type" {
  description = "GCP VM instance machine type."
  type        = string
  default     = "f1-micro"
}

variable "web_server_labels" {
  description = "List of labels to attach to the webservers."
  type        = map
}

variable "app_server_labels" {
  description = "List of labels to attach to the app severs."
  type        = map
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

variable "ip_address" {
  description = "IP address of the load balancer"
  type        = string
  default     = ""
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

variable "global_range" {
  description = "External cidr range"
  type = string
}

variable "sql_instance_size" {
  default     = "db-f1-micro"
  description = "Size of Cloud SQL instances"
}

variable "sql_disk_type" {
  default     = "PD_SSD"
  description = "Cloud SQL instance disk type"
}

variable "sql_disk_size" {
  default     = "10"
  description = "Storage size in GB"
}

variable "sql_require_ssl" {
  default     = "false"
  description = "Enforce SSL connections"
}

variable "sql_master_zone" {
  default     = "a"
  description = "Zone of the Cloud SQL master (a, b, ...)"
}

variable "sql_replica_zone" {
  default     = "b"
  description = "Zone of the Cloud SQL replica (a, b, ...)"
}

variable "sql_connect_retry_interval" {
  default     = 60
  description = "The number of seconds between connect retries."
}

variable "sql_user" {
  default     = "admin"
  description = "Username of the host to access the database"
}

variable "sql_pass" {
  description = "Password of the host to access the database"
}

variable "availability_type" {
  default = {
    prod = "REGIONAL"
    dev  = "ZONAL"
  }

  description = "Availability type for HA"
}