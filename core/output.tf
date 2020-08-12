output "address" {
  value = {
    public_ip : module.ec2.public_ip
  }
}

output "key" {
  value = tls_private_key.key.private_key_pem
}
