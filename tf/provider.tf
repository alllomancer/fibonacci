terraform {
  backend "s3" {
    bucket = "YOUR-BUCKET"
    key    = "YOUR-KEY"
    region = "AWS_REGION"
  }
}

provider "aws" {
  region = var.region
  #  shared_credentials_file = "$HOME/.aws/credentials"
  #  profile = "default"
}
