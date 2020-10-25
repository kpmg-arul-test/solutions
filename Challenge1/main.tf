module "vpc" {
  source                                 = "./modules/vpc"
  name                                   = var.name
  region                                 = var.region
  auto_create_subnetworks                = var.auto_create_subnetworks
  project_id                             = var.project_id
  public-subnet-cidr                     = var.public-subnet-cidr
  private-subnet-cidr                    = var.private-subnet-cidr
  machine_type                           = var.machine_type
  azs                   = var.azs
  global_range          = var.global_range
}

module "lb" {
  source                = "./modules/loadbalancers"
  name                  = var.name
  project_id            = var.project_id
  region                = var.region
  url_map               = module.urlmap.url_map
  enable_http           = var.enable_http
  enable_ssl            = var.enable_ssl  
  elb_custom_labels     = var.elb_custom_labels
  ports                 = var.ports
  source_ranges         = var.source_ranges
  http_port             = var.http_port
  https_port            = var.https_port
  health_check_port     = var.health_check_port 
  backends              = [
              {
                description = "Instance Group for Internal LB",
                group       = module.instancegroup.instancegroup_self_link
              }   
        ]
}


module "urlmap" {
  source                = "./modules/urlmap"
  name                  = var.name
  project_id               = var.project_id
  instancegroup = module.instancegroup.instancegroup_self_link
  module_depends_on = module.instancegroup.instancegroup_id
}

module "instancegroup" {
  source                   = "./modules/instancegroup"
  name                     = var.name
  project_id               = var.project_id
  azs                      = var.azs
  private_subnet        = module.vpc.private_subnet
}


# module "servers" {
#   source                = "./modules/servers"
#   name                  = var.name
#   project_id            = var.project_id
#   region                = var.region
#   azs                   = var.azs
#   machine_type          = var.machine_type
#   web_server_labels     = var.web_server_labels
#   app_server_labels     = var.app_server_labels
#   private_subnet        = module.vpc.private_subnet
# }
