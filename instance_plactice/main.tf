/*
#instance_typeの変数化
variable "example_instance_type" {
    default = "t3.micro"
}
*/

#locals変数でのinstance_typeの変数化
locals {
    example_instance_type = "t3.micro"
}

/*
#datasourceで最新のamiを取得
data "aws_ami" "recent_ami_id" {
    most_recent = true
    owners = ["amazon"]

    filter {
        name = "name"
        values = ["amazon2-ami-hvm-2.0.????????-x86_64-gp2"]
    }

    filter {
        name = "state"
        values = ["available"]
    }
}
*/

resource "aws_instance" "test" {
    ami             =   "ami-0c3fd0f5d33134a76"
    instance_type   =   local.example_instance_type
    vpc_security_group_ids = [aws_security_group.for_ec2.id]

    #apacheのインストール
    user_data = file("./apache_install.sh")

    tags = {
        Name = "example"
    }
}

output "example_instance_id" {
    value = aws_instance.test.public_dns
}