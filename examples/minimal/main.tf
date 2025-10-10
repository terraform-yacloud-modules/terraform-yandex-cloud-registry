resource "yandex_iam_service_account" "registry" {
  name = "registry"
}

module "cloud_registry" {
  source    = "../../"
  name      = "minimal-registry"

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
      role    = "editor"
      members = [
        "serviceAccount:${yandex_iam_service_account.registry.id}"
      ]
    }
  ]

  # Пример разрешений по IP
  ip_permissions = {
    pull = ["192.0.2.0/24"]
    push = toset([])
  }

  # Таймауты (опционально)
  timeouts = {
    create = "10m"
    update = "10m"
    delete = "10m"
  }
}