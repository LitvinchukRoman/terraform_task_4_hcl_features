resource "azurerm_virtual_network" "main" {
  name                = "${var.prefix}-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_subnet" "internal" {
  for_each = {
    subnet1 = "10.0.1.0/24"
    subnet2 = "10.0.2.0/24"
    subnet3 = "10.0.3.0/24"
  }

  name                 = each.key
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [each.value]
}

resource "azurerm_network_interface" "main" {
  for_each = { for name in local.network_interface_names : name => name }

  name                = each.key
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = local.nic_subnet_map[each.key]
    private_ip_address_allocation = "Dynamic"
  }
}