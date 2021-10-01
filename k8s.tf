

data "azurerm_subnet" "aks_subnet" {
  name                 = var.virtual_network_subnet_name
  virtual_network_name = var.virtual_network
  resource_group_name  = var.virtual_network_resource_group
  
}

resource "azurerm_kubernetes_cluster" "k8s" {
    name                = var.cluster_name
    location            = var.location
    resource_group_name = var.resource_group_name
    dns_prefix          = var.dns_prefix
    kubernetes_version  = var.kubernetes_version


    default_node_pool {
        name                 = "default"
        node_count           = var.node_count
        vm_size              = var.vm_size
        max_pods             = var.max_pods
        vnet_subnet_id       = data.azurerm_subnet.aks_subnet.id
        orchestrator_version = var.orchestrator_version
    }

    identity {
    type = "SystemAssigned"
  }
    
    
    // service_principal {
    //     client_id     = var.client_id
    //     client_secret = var.client_secret
    // }
   
    role_based_access_control {
        enabled = true
    
    }

    network_profile {
        network_plugin      = "azure"
        network_policy      = var.network_policy
        // dns_service_ip      = var.dns_service_ip 
        // docker_bridge_cidr  = var.docker_bridge_cidr 
        // service_cidr        = var.service_cidr
        outbound_type       = var.outbound_type 
        load_balancer_sku   = var.load_balancer_sku
    }

    tags = {
        Environment = "Development"
    }
}