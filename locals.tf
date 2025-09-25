locals {
  network_interface_names = ["nic-1", "nic-2"]
  nic_subnet_map = {
    "nic-1" = azurerm_subnet.internal["subnet1"].id
    "nic-2" = azurerm_subnet.internal["subnet2"].id
  }
}