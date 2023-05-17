
resource "aws_instance" "instances" {
  ami           = data.aws_ami.ami.image_id
  instance_type =var.instance_type_name
  vpc_security_group_ids  = [ data.aws_security_group.sg.id ]
  tags = {
    Name = var.component_name
  }
}





resource "aws_route53_record" "domain_name" {
  zone_id = "Z0542401RTZBLNQX3LCC"
  name    = "${var.component_name}-dev.devops2510.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.instances.private_ip]
}


resource "null_resource" "null" {

  depends_on = [aws_instance.instances , aws_route53_record.domain_name ]



  provisioner "remote-exec" {

    connection {
      type     = "ssh"
      user     = "centos"
      password = "DevOps321"
      host     = aws_instance.instances.private_ip
    }


    inline = [
      "rm -rf roboshop-shell",
      "git clone https://github.com/tharun2510/roboshop-shell.git",
      "cd roboshop-shell",
      "sudo bash  ${var.component_name}.sh  ${var.password}"
    ]
  }
}


