# state.tf
terraform {
  backend "s3" {
    bucket  = "terraform-state-deploy"
    key     = "site2/terraform-state"
    region  = "sa-east-1"
    encrypt = false
    use_lockfile = true
  }
}
