provider "azurerm" {
  version = "=2.0.0"
  features {}
}

resource "azurerm_network_interface" "example" {
  name                = "example-nic"
  location            = "East US"
  resource_group_name = "scalr-demo"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = "cs-public"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "example" {
  name                = "example-machine"
  resource_group_name = "scalr-demo"
  location            = "East US"
  size                = "Standard_F2"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]

  admin_password = "adminuser"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}
