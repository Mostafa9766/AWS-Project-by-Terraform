output "myvpcid" {
  value = module.network.myvpcid
}
output "private_key" {
  value     = tls_private_key.pk.private_key_pem
  sensitive = true
}