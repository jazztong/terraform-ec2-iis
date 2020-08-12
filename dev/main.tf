provider "aws" {
  region = "ap-southeast-1"
  assume_role {
    role_arn = "arn:aws:iam::986060684878:role/Admin_Role"
  }
}

module "main" {
  source = "../core"
}

output "address" {
  value = module.main.address
}

output "key" {
  value = module.main.key
}
