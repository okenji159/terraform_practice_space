module "web_server" {
    source = "./module"
    instance_type_default = "t3.micro"

    instance_name = "example"

}

output "instance_public_dns" {
    value = module.web_server.public_dns
}