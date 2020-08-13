// Data sources
data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "all" {
  vpc_id = data.aws_vpc.default.id
}

data "aws_instance" "this" {
  instance_id       = module.ec2.id[0]
  get_password_data = true
}
