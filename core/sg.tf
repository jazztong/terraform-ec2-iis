module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 3.0"

  name        = "${local.app_id}-SG"
  description = "Security group for usage with EC2 instance"
  vpc_id      = data.aws_vpc.default.id

  #   ingress_with_self = [
  #     { rule = "docker-swarm-mngmt-tcp" },
  #     { rule = "docker-swarm-node-tcp" },
  #     { rule = "docker-swarm-node-udp" },
  #     { rule = "docker-swarm-overlay-udp" },
  #   ]

  ingress_with_cidr_blocks = [
    { rule = "http-80-tcp", cidr_blocks = "0.0.0.0/0" },
    { rule = "http-8080-tcp", cidr_blocks = "0.0.0.0/0" },
    { rule = "all-icmp", cidr_blocks = "0.0.0.0/0" },
    { rule = "ssh-tcp", cidr_blocks = "0.0.0.0/0" },
    { rule = "rdp-tcp", cidr_blocks = "0.0.0.0/0" },
  ]

  egress_rules = ["all-all"]
  tags         = merge({ Name = "${local.app_id}-sg" }, local.common_tags)
}
