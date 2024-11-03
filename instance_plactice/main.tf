resource "aws_instance" "test" {
    ami             =   "ami-0c3fd0f5d33134a76"
    instance_type   =   "t3.micro"
}