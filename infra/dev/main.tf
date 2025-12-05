module "rg" {
  source = "../../module/azurerm_rGroup"
  rg = var.rg
}

module "vnet_module" {
  source     = "../../module/azurerm_networking"
  depends_on = [module.rg]
  vnetwork      = var.vnetwork
}

module "pips" {
depends_on = [ module.rg ]
  source = "../../module/azurerm_public_ip"
  pips = var.pips
}

module "vm"{
  depends_on = [ module.vnet_module,module.pips ]
  source = "../../module/Azurerm_compute"
  nic = var.nic
}