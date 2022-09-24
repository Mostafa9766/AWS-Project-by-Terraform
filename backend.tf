terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket001"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "statefilelock"
  }
}