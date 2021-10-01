variable tags {
  type = object({
    environment = string
    source      = string
  })

  description = "Tags object used to tag resources."
}

// variable client_id {
//     #client_id = 
// }
// variable client_secret {
//     #client_secret = 
// }

variable virtual_network_subnet_name {}
variable virtual_network {}
variable virtual_network_resource_group {}


variable node_count {
    default = 3
}

variable vm_size {}

variable max_pods {}

variable orchestrator_version {}

variable network_policy {}

variable kubernetes_version {}

// variable dns_service_ip {}

// variable docker_bridge_cidr {} 

// variable  service_cidr {}

variable outbound_type {
    default = "userDefinedRouting"
}

variable load_balancer_sku {
    default = "standard"
}

variable dns_prefix {
    default = "k8stest"
}

variable cluster_name {
    default = "k8stest"
}

variable resource_group_name {
    default = "azure-k8stest"
}

variable location {
    default = "southcentralus"
}

