variable "app_env" {
  description = "Environment flag"
  type        = string
  default     = "dev"
}

variable "app_id" {
  description = "Application ID"
  type        = string
  default     = "IIS"
}

variable "ami" {
  description = "Amazon Linux AMI"
  type        = string
  default     = "ami-003ad59a0b2b3c98f"
}

variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "t2.small"
}

variable "tags" {
  description = "tags applied to all resources"
  type        = map(string)
  default = {
    Project    = "MyProject"
    Department = "MyDeprt"
    Team       = "MyTeam"
    Company    = "MyCompany"
  }
}