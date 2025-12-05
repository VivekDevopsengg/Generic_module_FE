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

module "sqlserver" {
  depends_on = [ module.rg ]
  source = "../../module/azurerm_sql_server"
  sql_server_name= "sqlservernoida"
  resource_group_name = "new_rg"
  location = "central india"
  administrator_login = "aconyxuser"
  administrator_login_password = "administrator@1234"
}

module "sqldb" {
  depends_on = [ module.sqlserver ]
  source = "../../module/azurerm_sql_db"
  db_name ="noidadb"
  sql_server_name = "sqlservernoida"
  resource_group_name = "new_rg"

}