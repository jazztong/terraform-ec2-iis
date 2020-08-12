locals {
  role_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM",
    "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
  ]
}

resource "aws_iam_instance_profile" "profile" {
  name = "${local.app_id}-EC2-Profile"
  role = aws_iam_role.role.name
}

resource "aws_iam_role_policy_attachment" "attachment" {
  count = length(local.role_policy_arns)

  role       = aws_iam_role.role.name
  policy_arn = element(local.role_policy_arns, count.index)
}

resource "aws_iam_role_policy" "ec2_inline_policy" {
  name   = "${local.app_id}-EC2-Inline-Policy"
  role   = aws_iam_role.role.id
  policy = jsonencode(
    {
    "Version": "2012-10-17",
    "Statement": [
        {
        "Effect": "Allow",
        "Action": [
            "ssm:GetParameter"
        ],
        "Resource": "*"
        }
    ]
    }
    )
}

resource "aws_iam_role" "role" {
  name = "${local.app_id}-EC2-Role"
  path = "/"

  assume_role_policy = jsonencode(
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
  )
}