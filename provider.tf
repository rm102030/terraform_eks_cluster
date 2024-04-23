provider "aws" {
  region                   = "us-east-1"
  shared_credentials_files = ["~/.aws/credentials"]
  shared_config_files      = ["~/.aws/config"]
  profile                  = "pragmalab"
  #assume_role {
  #role_arn = "arn:aws:sts::840021737375:assumed-role/AWSReservedSSO_pragma-ps-cloudops-services_b5293a49a161ed83/ricardo.martinez"
  #access_key                  = "your_access_key"
  #secret_key                  = "your_secret_key"
  #skip_requesting_account_id  = true
  #skip_credentials_validation = true
}

