output "output" {
  value = {
    public_ip : module.ec2.public_ip
    password : rsadecrypt(data.aws_instance.this.password_data, tls_private_key.key.private_key_pem)
  }
}

output "key" {
  value = tls_private_key.key.private_key_pem
}
