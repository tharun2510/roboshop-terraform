module "roboshop"  {
  for_each = var.components
  source = "./module"
  components_name=each.value["name"]
  instance_type_name=each.value["instance_type"]
  password=lookup(each.value,"password","null")

}