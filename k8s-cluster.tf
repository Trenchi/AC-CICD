# Create and Starts K8s Cluster on Microsoft Azure / Erstellt und startet ein K8s Cluster auf Microsoft Azure

resource "azurerm_kubernetes_cluster" "dev-cgi-ac-k8s" {
    name                = "dev-cgi-ac-k8s"
    location            = azurerm_resource_group.dev-cgi-ac-resource-grp.location
    resource_group_name = azurerm_resource_group.dev-cgi-ac-resource-grp.name
    dns_prefix          = "dns-dev-cgi-ac-k8s"

    default_node_pool {
        name       = "devcgiacnp"
        node_count = 2
        vm_size    = "Standard_DS2_v2"
    }

    identity {
        type = "SystemAssigned"
    }

    provisioner "local-exec" {
        # command = "powershell.exe -File ./deploy.ps1"
        command = "bash -c 'chmod +x ./deploy.sh && ./deploy.sh'"
    }
}