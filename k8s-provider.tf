# https://registry.terraform.io/providers/hashicorp/azurerm/latest
# How to use Azure provider / Wie nutzt man den Azure Provider

# Terraform Version (Latest Version can See on Terraform Registry)
# Terraform Version (Letzte Version kann man auf Terraform Registry nachschauen)
terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "3.92.0"
        }
    }
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest
# Login to Azure over Terryform with "az login" in Terminal
# Anmeldung bei Azure über Terryform mit "az login" im Terminal
provider "azurerm" {
    features {}
}

# Resource Group for Location
# Ressourcengruppe für Standort
resource "azurerm_resource_group" "dev-cgi-ac-resource-grp" {
    name     = "dev-cgi-ac-resource-grp"
    location = "Germany West Central"
}