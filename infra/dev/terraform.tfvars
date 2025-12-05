rg = {
  "rg1" = {
    name       = "new_rg"
    location   = "central india"
    managed_by = "terraform"
    tags       = { "insurance" = "abc" }
  }
}

vnetwork = {
  vnet1 = {
    vnet_name     = "virtualnetwork"
    location      = "central india"
    rg_name       = "new_rg"
    address_space = ["10.0.0.0/16"] # 512 addresses
    subnet = [
      {
        name             = "frontend_subnet"
        address_prefixes = ["10.0.1.0/24"]
      },

      {
        name             = "backend_subnet"
        address_prefixes = ["10.0.2.0/24"]
      }
    ]

  }
}





pips = {
  pip1 = {
    name              = "pip123"
    rg_name           = "new_rg"
    location          = "central india"
    allocation_method = "Static"
    sku               = "Standard"
  }
   pip2 = {
    name              = "pip1234"
    rg_name           = "new_rg"
    location          = "central india"
    allocation_method = "Static"
    sku               = "Standard"
  }
}


 nic= {
  vm1= {
    nic_name            = "firstnic"
    location            = "central india"
    resource_group_name = "new_rg"
    vm_name             = "frontendvm"
    size                = "Standard_D2as_v4"
    admin_username      = "adminiuser"
    admin_password      = "Adminpassword@123"
    virtual_network_name="virtualnetwork"
    subnet_name ="frontend_subnet"
    pip_name ="pip123"
    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
    source_image_reference = {
      publisher = "Canonical"
      offer     = "UbuntuServer"
      sku       = "18.04-LTS"
      version   = "latest"
    }

  }
vm2= {
    nic_name            = "secondnic"
    location            = "central india"
    resource_group_name = "new_rg"
    vm_name             = "backendvm"
    size                = "Standard_D2as_v4"
    admin_username      = "adminiuser"
    admin_password      = "Adminpassword@123"
    virtual_network_name="virtualnetwork"
    subnet_name ="backend_subnet"
    pip_name ="pip1234"
    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
    source_image_reference = {
      publisher = "Canonical"
      offer     = "UbuntuServer"
      sku       = "18.04-LTS"
      version   = "latest"
    }

  }
}

