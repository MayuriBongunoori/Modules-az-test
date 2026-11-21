terraform {
  backend "azurerm" {
    resource_group_name  = "amexrg"
    storage_account_name = "amexrgsa1"
    container_name       = "statefile"
    key                  = "azure-workspaces-demo/terraform.tfstate"
  }
}