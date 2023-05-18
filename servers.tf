module "DBservers" {
  for_each           = var.DBservers
  source             = "./module"
  component_name     = each.value["name"]
  instance_type_name = each.value["instance_type"]
  password           = lookup(each.value, "password", "null")
  env                = var.env
  provisioner        = "yes"
}




module "APPservers"  {
  for_each = var.APPservers
  source = "./module"
  component_name=each.value["name"]
  instance_type_name=each.value["instance_type"]
  password=lookup(each.value,"password","null")
  env=var.env
  provisioner="no"
}