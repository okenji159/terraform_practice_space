variable "instance_type_default" {}

variable "instance_name" {}

resource "aws_instance" "default_web_server" {
    ami             =   "ami-0c3fd0f5d33134a76"
    instance_type   =   var.instance_type_default
    vpc_security_group_ids = [aws_security_group.for_ec2.id]

    #apacheのインストール
    user_data = file("./module/apache_install.sh")

    tags = {
        Name = var.instance_name
    }
}

output "public_dns" {
    value = aws_instance.default_web_server.public_dns
}