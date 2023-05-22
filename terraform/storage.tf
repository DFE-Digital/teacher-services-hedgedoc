data "azurerm_resource_group" "app-resource-group" {
  name = var.rg_name
}

resource "azurerm_storage_account" "file-uploads" {
  name                     = "${var.azure_resource_prefix}${var.service_short}uploads${var.config_short}sa"
  location                 = data.azurerm_resource_group.app-resource-group.location
  resource_group_name      = data.azurerm_resource_group.app-resource-group.name
  account_tier             = "Standard"
  account_replication_type = "GRS"

  lifecycle { ignore_changes = [tags] }
}
