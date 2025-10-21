output "registry_id" {
  description = "ID of the created registry"
  value       = yandex_cloudregistry_registry.this.id
}

output "registry_name" {
  description = "Name of the created registry"
  value       = yandex_cloudregistry_registry.this.name
}

output "registry_folder_id" {
  description = "Folder ID of the registry"
  value       = yandex_cloudregistry_registry.this.folder_id
}

output "registry_status" {
  description = "Status of the registry"
  value       = yandex_cloudregistry_registry.this.status
}

output "registry_created_at" {
  description = "Creation timestamp of the registry"
  value       = yandex_cloudregistry_registry.this.created_at
}

output "iam_binding_ids" {
  description = "IDs of created IAM bindings"
  value       = keys(yandex_cloudregistry_registry_iam_binding.this)
}

output "ip_permission_id" {
  description = "ID of the IP permission resource"
  value       = length(yandex_cloudregistry_registry_ip_permission.this) > 0 ? yandex_cloudregistry_registry_ip_permission.this[0].id : ""
}