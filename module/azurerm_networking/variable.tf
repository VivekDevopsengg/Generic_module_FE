variable "vnetwork" {
  type = map(object({
   vnet_name = string
    location=string
    address_space=list(string)
    rg_name=string
    subnet        = list(object({
                        name             = string
                        address_prefixes = list(string)
                      }))
      }))
  

}