terraform {
  backend "gcs" {
    bucket = "arul-test"
    prefix = "kpmg"
    credentials = "silken-network-terraform-sa.json"
  }
}