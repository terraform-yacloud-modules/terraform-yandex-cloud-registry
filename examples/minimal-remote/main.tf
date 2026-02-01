resource "yandex_iam_service_account" "registry" {
  name = "registry"
}

module "cloud_registry" {
  source = "../../"
  name   = "minimal-remote-registry"

  # Необязательные параметры со значениями по умолчанию
  description = "Minimal Remote registry example"
  labels = {
    environment = "test"
  }
  properties = {
    source                = "@docker-hub"
    # lockbox secret id
    authorizationSecretId = "e6q206l88p2k4rhd34ta"
    authorizationUsername = "dockerhub-username"
    authorizationType     = "BASIC"
  }

  kind = "DOCKER"
  type = "REMOTE"

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
