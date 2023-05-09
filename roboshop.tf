resource "aws_instance" "frontend" {
  ami           = data.aws_ami.devops_practice_ami.image_id
  instance_type = "t3.micro"
  vpc_security_group_ids  = [ data.aws_security_group.test.id]
tags = {
    Name = "frontend"

  }
}


output "frontend_pulic_ip" {
 value = aws_instance.frontend
}


data "aws_ami" "devops_practice_ami" {
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners      = [973714476881]
}


data "aws_security_group" "test" {
name   = "allow-all"
}

output "aws_security" {
  value = data.aws_security_group
}