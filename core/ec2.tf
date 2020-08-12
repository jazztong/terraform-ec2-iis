module "ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.13.0"

  instance_count              = 1
  name                        = "${local.app_id}-EC2"
  ami                         = var.ami
  instance_type               = var.instance_type
  cpu_credits                 = "unlimited"
  subnet_id                   = tolist(data.aws_subnet_ids.all.ids)[0]
  vpc_security_group_ids      = [module.security_group.this_security_group_id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.default.key_name
  iam_instance_profile        = aws_iam_instance_profile.profile.name

  user_data_base64 = base64encode(local.user_data)
  tags             = merge({ Name = "${local.app_id}-ec2" }, local.common_tags)
}

resource "aws_key_pair" "default" {
  key_name   = "${local.app_id}-keypair"
  public_key = tls_private_key.key.public_key_openssh

  tags = merge({ Name = "${local.app_id}-keypair" }, local.common_tags)
}

resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}