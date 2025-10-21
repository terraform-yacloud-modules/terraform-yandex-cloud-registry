data "yandex_client_config" "client" {}

locals {
  folder_id = coalesce(var.folder_id, data.yandex_client_config.client.folder_id)
}

# Create Cloud Registry
resource "yandex_cloudregistry_registry" "this" {
  name        = var.name
  folder_id   = local.folder_id
  description = var.description
  labels      = var.labels
  kind        = var.kind
  type        = var.type

}

# IAM bindings for the registry
resource "yandex_cloudregistry_registry_iam_binding" "this" {
  for_each  = { for idx, binding in var.iam_bindings : idx => binding }
  role      = each.value.role
  members   = each.value.members
  registry_id = var.registry_id == "" ? yandex_cloudregistry_registry.this.id : var.registry_id
}

# IP permissions for the registry
resource "yandex_cloudregistry_registry_ip_permission" "this" {
  count       = var.ip_permissions == null ? 0 : 1
  registry_id = var.registry_id == "" ? yandex_cloudregistry_registry.this.id : var.registry_id
  pull        = var.ip_permissions != null ? var.ip_permissions.pull : []
  push        = var.ip_permissions != null ? var.ip_permissions.push : []
}