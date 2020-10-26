# kpmgarultest   

## Challenge1 Prerequisites   

### Setting Credentials
1. Create terraform Service Account in Project (where we want to deploy resources)   
1. Create key.json and down load the file and store in project root directory   
1. Configure key.json in credential field of procider.tf and backend.tf   

### Create GCS bucket   
1. Create bucket in Google cloud storage in the same project   
1. use that bucket name in backend.tf   

### Create terraform workspace   
1. Create terraform workspace dev    
   ``` terraform workspace new dev ```   
1. Select terraform workspace dev   
   ``` terraform workspace select dev ```   

### Three tier architetcure   
1. Http loadbalancer will receive requeust and forward to managed instance groups  where web servers are running   
1. Webservers forward request to appservers   
1. Appservers are connected to Cloud SQL database   

###  Terraform commands   
```   
terraform init    
terraform plan -out plan.out   
terraform apply -auto-approve  plan.out    
terraform destroy -auto-approve   
```   

### Note   
1. db password should be entered when running terraform commands   
1. In actual production enviornment this should be managed with secret management tools like Hashicorp vault    


## Challenge2   
1. This is done for GCP cloud provider    
1. As per requirement the python script is written to get metadata inside GCP VM instance    
