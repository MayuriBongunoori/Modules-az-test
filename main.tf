module "resource_group" {
  source   = "git::https://github.com/MayuriBongunoori/Modules-az.git//resourcegroup?ref=v1.0.0"
  name     = "${local.name_prefix}-rg"
  location = var.location
  tags     = local.tags
}

module "network" {
  source               = "git::https://github.com/MayuriBongunoori/Modules-az.git//network?ref=v1.0.0"
  name_prefix          = local.name_prefix
  vnet_address_space   = var.vnet_address_space
  subnet_address_space = var.subnet_address_space
  resource_group       = module.resource_group.resource_group_name
  location             = module.resource_group.location
  tags                 = local.tags
}

module "virtual_machine" {
  source         = "git::https://github.com/MayuriBongunoori/Modules-az.git//virtualmachinesref=v1.0.0"
  name_prefix    = local.name_prefix
  resource_group = module.resource_group.resource_group_name
  vm_count       = var.vm_count
  subnet_id      = module.network.subnet_id
  location       = module.resource_group.location
  vm_size        = var.vm_size

  admin_username = var.admin_username
  admin_password = var.admin_password
  tags           = local.tags
}

module "storage_account" {
  source                 = "git::https://github.com/MayuriBongunoori/Modules-az.git//storageaccount?ref=v1.0.0"
  env                    = local.env
  resource_group_name    = module.resource_group.resource_group_name
  location               = module.resource_group.location
  storage_account_count  = var.storage_account_count
  storage_account_prefix = var.storage_account_prefix
  tags                   = local.tags
}