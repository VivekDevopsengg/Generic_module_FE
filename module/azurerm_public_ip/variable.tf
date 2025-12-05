variable "pips" {
  type = map(object({   
    location      = string
    rg_name      = string
    allocation_method= string
    name = string
     sku=string
  }))
}
