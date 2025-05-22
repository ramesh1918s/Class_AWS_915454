terraform {
  backend "s3" {
    bucket         = "rambucketdevops6"
    key            = "terraform/state.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock-table"   # optional for state locking
  }
}
