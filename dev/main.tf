provider "aws" {
  region = "ap-southeast-1"
  assume_role {
    role_arn = "arn:aws:iam::986060684878:role/Admin_Role"
  }
}

module "main" {
  source = "../core"
}

output "output" {
  value = module.main.output
}