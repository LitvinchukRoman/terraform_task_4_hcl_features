variable "network_interface_names" {
  default = ["nic-1", "nic-2"]
}

variable "security_rules" {
  type = list(object({
    name                   = string
    priority               = number
    direction              = string
    access                 = string
    protocol               = string
    source_port_range      = string
    destination_port_range = string
  }))
  default = [
    {
      name                   = "SSH"
      priority               = 1001
      direction              = "Inbound"
      access                 = "Allow"
      protocol               = "Tcp"
      source_port_range      = "*"
      destination_port_range = "22"
    },
    {
      name                   = "HTTP"
      priority               = 1002
      direction              = "Inbound"
      access                 = "Allow"
      protocol               = "Tcp"
      source_port_range      = "*"
      destination_port_range = "80"
    }
  ]
}