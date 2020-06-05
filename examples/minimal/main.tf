provider "azurerm" {
  version = "~>2.0"
  features {}
}

resource "random_string" "resource_group_name_prefix" {
  length    = 5
  special   = false
  lower     = true
  min_lower = 5
}

resource "azurerm_resource_group" "test_group" {
  name     = "rg-log-analytics-minimal-test-${random_string.resource_group_name_prefix.result}"
  location = "uksouth"
}

module "terraform-azurerm-log-analytics" {
  source              = "../"
  resource_group_name = azurerm_resource_group.test_group.name
}
