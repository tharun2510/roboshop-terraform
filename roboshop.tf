data "aws_ami" "ami" {
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners      = [973714476881]
}

data "aws_security_group" "sg" {
  name   = "allow-all"
}


variable "components" {
  default=["frontend","mongodb","mysql"]
}



resource "aws_instance" "instances" {
  count= length(var.components)
  ami           = data.aws_ami.ami.image_id
  instance_type = "t3.micro"
  vpc_security_group_ids  = [ data.aws_security_group.sg.id]
tags = {
    Name = var.components[count.index]
  }
}





