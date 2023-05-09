resource "aws_instance" "frontend" {
  ami           = data.aws_ami.devops_practice_ami.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "frontend"

  }
}

output "frontend_pulic_ip" {
 value = aws_instance.frontend.instance_type
}


data "aws_ami" "devops_practice_ami" {
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners      = [973714476881]
}