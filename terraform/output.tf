output "url" {
  value = "https://${module.web_application.hostname}/"
}
output "exernal_url" {
  value = "https://${local.main_web_domain}/"
}
