project_id = "silken-network-252121"
region = "us-central1"
sa_file_path = "silken-network-terraform-sa.json"
name = "arul-test"
public-subnet-cidr = "10.2.1.0/24"
private-subnet-cidr = "10.2.2.0/24"
machine_type = "f1-micro"
web_server_labels = {
  "environment" = "dev"
  "application" = "webserver"
}
app_server_labels = {
  "environment" = "dev"
  "application" = "appserver"
}
auto_create_subnetworks  =  false
enable_http           = true
enable_ssl            = false
elb_custom_labels     = {

    }
health_check_port = "80"
http_port         = "80"
https_port        = "443"
ports             = ["80","443"]
source_ranges     = ["10.2.1.0/24"]
global_range      = "0.0.0.0/0"
