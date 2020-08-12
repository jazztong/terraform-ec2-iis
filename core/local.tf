locals {
  user_data = file("${path.module}/tmpl/user-data")
}

locals {
  app_id       = "${lower(var.app_id)}-${lower(var.app_env)}"
  app_id_lower = lower(var.app_id)
  common_tags = merge(
    {
      CreateBy = "Terraform"
      Env      = var.app_env
    },
    var.tags
  )
}