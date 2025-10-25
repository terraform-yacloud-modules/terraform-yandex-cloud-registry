resource "yandex_iam_service_account" "registry" {
  name = "registry"
}

module "cloud_registry" {
  source = "../../"
  name   = "minimal-registry"

  # Необязательные параметры со значениями по умолчанию
  description = "Minimal registry example"
  labels = {
    environment = "test"
  }
  kind = "DOCKER"
  type = "LOCAL"

  # Пример IAM-привязки
  iam_bindings = [
    {
      role = "editor"
      members = [
        "serviceAccount:${yandex_iam_service_account.registry.id}"
      ]
    }
  ]

}
