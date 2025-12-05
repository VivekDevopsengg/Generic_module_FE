variable "rg" {
    type = map(object({
        name = string
        location =string
        managed_by= optional(string)
        tags= optional(map(string))
    }))
  
}

variable "vnetwork" {
  type = map(object({
    vnet_name     = string
    location      = string
    rg_name       = string
    address_space = list(string)
    subnet       = list(object({
                        name             = string
                        address_prefixes = list(string)
                      }))
      }))
  
}

variable "pips" {
  type = map(object({   
    location      = string
    rg_name     = string
    allocation_method= string
    name = string
    sku=string
  }))
}

variable "nic" {
  type = map(object({
    nic_name            = string
    location            = string
    resource_group_name = string
    vm_name             = string
    size                = string
    admin_username      = string
    admin_password      = string
    virtual_network_name=string
    subnet_name =string
    pip_name =string
    os_disk = object({
      caching              = string
      storage_account_type = string
    })
    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })

  }))

}
