module "application_configuration" {
  source = "./vendor/modules/aks//aks/application_configuration"

  namespace             = var.namespace
  environment           = var.environment
  azure_resource_prefix = var.azure_resource_prefix
  service_short         = var.service_short
  config_short          = var.config_short

  config_variables = {
    CMD_DOMAIN            = local.main_web_domain
    CMD_PROTOCOL_USESSL   = true
    CMD_AZURE_CONTAINER   = "file-uploads"
    PGSSLMODE             = local.postgres_ssl_mode
    CMD_IMAGE_UPLOAD_TYPE = "azure"
  }
  secret_variables = {
    CMD_DB_URL                  = module.postgres.url
    CMD_AZURE_CONNECTION_STRING = azurerm_storage_account.file-uploads.primary_blob_connection_string
  }
}

module "web_application" {
  source = "./vendor/modules/aks//aks/application"

  is_web = true

  namespace    = var.namespace
  environment  = var.environment
  service_name = local.service_name

  cluster_configuration_map  = module.cluster_data.configuration_map
  kubernetes_config_map_name = module.application_configuration.kubernetes_config_map_name
  kubernetes_secret_name     = module.application_configuration.kubernetes_secret_name

  docker_image           = "quay.io/hedgedoc/hedgedoc:${local.version}"
  web_external_hostnames = [local.main_web_domain]
  replicas               = var.webapp_replicas
}
