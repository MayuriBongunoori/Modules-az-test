locals {
  env         = terraform.workspace
  name_prefix = "${var.project}-${local.env}"
  tags = {
    environment = local.env
    project     = var.project
    managed_by  = "Terraform"
  }
}

