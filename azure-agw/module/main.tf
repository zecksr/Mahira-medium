data "terraform_remote_state" "app-gateway-subnet" {
backend = "azurerm"
config = {
resource_group_name  = "terraform-state"
storage_account_name = "<your storage account name>"
container_name       = "terragruntbackned"
key                  = "${var.env_name}/${var.local_dir}/${var.location}/${var.account_name}/subnets/terraform.tfstate"
}
}
data "terraform_remote_state" "rg" {
backend = "azurerm"
config = {
resource_group_name  = "terraform-state"
storage_account_name = "<your storage account name>"
container_name       = "terragruntbackned"
key                  = "${var.env_name}/${var.local_dir}/${var.location}/${var.account_name}/resource-group/terraform.tfstate"
}
}
data "terraform_remote_state" "controller-vm-nic" {
backend = "azurerm"
config = {
resource_group_name  = "terraform-state"
storage_account_name = "<your storage account name>"
container_name       = "terragruntbackned"
key                  = "${var.env_name}/${var.local_dir}/${var.location}/${var.account_name}/vms/controller-vm/terraform.tfstate"
}
}
data "terraform_remote_state" "agent-vm-nic" {
backend = "azurerm"
config = {
resource_group_name  = "terraform-state"
storage_account_name = "<your storage account name>"
container_name       = "terragruntbackned"
key                  = "${var.env_name}/${var.local_dir}/${var.location}/${var.account_name}/vms/agent-vm/terraform.tfstate"
}
}
resource "azurerm_public_ip" "app-gateway-public-ip" {
name                = "app-gateway-public-ip-${var.project_name}-${var.env_name}"
resource_group_name = data.terraform_remote_state.rg.outputs.rg_name
location            = var.location
allocation_method   = "Static"
sku                 = "Standard"
}
resource "azurerm_application_gateway" "app-gateway" {
name                = "appgateway-${var.project_name}-${var.env_name}"
resource_group_name = data.terraform_remote_state.rg.outputs.rg_name
location            = var.location
sku {
name     = "Standard_v2"
tier     = "Standard_v2"
}
autoscale_configuration {
min_capacity = 0
max_capacity = 10
}
gateway_ip_configuration {
name      = "gateway-ip-configuration-${var.project_name}-${var.env_name}"
subnet_id = data.terraform_remote_state.app-gateway-subnet.outputs.app_gateway_subnet_id
}
frontend_port {
name = "http-frontend-port-${var.project_name}-${var.env_name}"
port = 80
}
frontend_port {
name = "https-frontend-port-${var.project_name}-${var.env_name}"
port = 443
}
frontend_ip_configuration {
name                 = "frontend-ip-configuration-${var.project_name}-${var.env_name}"
public_ip_address_id = azurerm_public_ip.app-gateway-public-ip.id
}
backend_address_pool {
name = "backend-address-pool-${var.project_name}-${var.env_name}"
}
ssl_certificate {
name                = "${var.project_name}-kyvt-${var.env_name}"
data                = filebase64("your wild card key")
}
backend_http_settings {
name                  = "backend-https-setting-${var.project_name}-${var.env_name}"
cookie_based_affinity = "Disabled"
#path                  = "/"
port                  = 443
protocol              = "Https"
request_timeout       = 60
}
backend_http_settings {
name                  = "backend-http-setting-${var.project_name}-${var.env_name}"
cookie_based_affinity = "Disabled"
#path                  = "/"
port                  = 80
protocol              = "Http"
request_timeout       = 60
}
http_listener {
name                           = "http-listener-${var.project_name}-${var.env_name}"
frontend_ip_configuration_name = "frontend-ip-configuration-${var.project_name}-${var.env_name}"
frontend_port_name             = "http-frontend-port-${var.project_name}-${var.env_name}"
protocol                       = "Http"
}
http_listener {
name                           = "https-listener-${var.project_name}-${var.env_name}"
frontend_ip_configuration_name = "frontend-ip-configuration-${var.project_name}-${var.env_name}"
frontend_port_name             = "https-frontend-port-${var.project_name}-${var.env_name}"
protocol                       = "Https"
ssl_certificate_name           = "${var.project_name}-kyvt-${var.env_name}"
}
request_routing_rule {
name                       = "routing-rule-${var.project_name}-${var.env_name}"
rule_type                  = "Basic"
http_listener_name         = "http-listener-${var.project_name}-${var.env_name}"
backend_address_pool_name  = "backend-address-pool-${var.project_name}-${var.env_name}"
backend_http_settings_name = "backend-http-setting-${var.project_name}-${var.env_name}"
}
request_routing_rule {
name                       = "routing-rule-https-${var.project_name}-${var.env_name}"
rule_type                  = "Basic"
http_listener_name         = "https-listener-${var.project_name}-${var.env_name}"
backend_address_pool_name  = "backend-address-pool-${var.project_name}-${var.env_name}"
backend_http_settings_name = "backend-https-setting-${var.project_name}-${var.env_name}"
}
}

## Allow Application Gateway to point to a specific network interface

resource "azurerm_network_interface_application_gateway_backend_address_pool_association" "controller_vm_backend_pool" {
network_interface_id    = data.terraform_remote_state.controller-vm-nic.outputs.controller_vm_nic_id
ip_configuration_name   = data.terraform_remote_state.controller-vm-nic.outputs.controller_vm_ip_configuration_name
backend_address_pool_id = azurerm_application_gateway.app-gateway.backend_address_pool[0].id
}
resource "azurerm_network_interface_application_gateway_backend_address_pool_association" "agent_vm_backend_pool" {
network_interface_id    = data.terraform_remote_state.agent-vm-nic.outputs.agent_vm_nic_id
ip_configuration_name   = data.terraform_remote_state.agent-vm-nic.outputs.agent_vm_ip_configuration_name
backend_address_pool_id = azurerm_application_gateway.app-gateway.backend_address_pool[0].id
}

