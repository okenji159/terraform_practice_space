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

resource "aws_instance" "test" {
    ami             =   "ami-0c3fd0f5d33134a76"
    instance_type   =   local.example_instance_type

    /*
    #apacheのインストール
    user_data = <<EOF
        #!/bin/bash
        yum install -y httpd
        systemctl start httpd.service
    EOF
    */

    tags = {
        Name = "example"
    }
}