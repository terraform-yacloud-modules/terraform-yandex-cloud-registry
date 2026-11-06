data "yandex_client_config" "current" {}

data "yandex_resourcemanager_folder" "current" {
  folder_id = data.yandex_client_config.current.folder_id
}

resource "yandex_iam_service_account" "registry" {
  name = "registry"
}

# Lockbox secret with Docker Hub credentials used by the remote registry.
resource "yandex_lockbox_secret" "dockerhub" {
  name = "minimal-remote-registry-dockerhub"
}

resource "yandex_lockbox_secret_version" "dockerhub" {
  secret_id = yandex_lockbox_secret.dockerhub.id

  entries {
    key        = "value"
    text_value = "dockerhub-password"
  }
}

# Cloud Registry reads the secret as its data-plane service agent, so the agent
# needs access to the secret payload.
data "yandex_iam_service_agent" "cloud_registry_data_plane" {
  service_id      = "cloud-registry"
  microservice_id = "data-plane"
  cloud_id        = data.yandex_resourcemanager_folder.current.cloud_id
}

resource "yandex_lockbox_secret_iam_binding" "cloud_registry_data_plane" {
  secret_id = yandex_lockbox_secret.dockerhub.id
  role      = "lockbox.payloadViewer"
  members   = ["serviceAccount:${data.yandex_iam_service_agent.cloud_registry_data_plane.id}"]
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
    authorizationSecretId = yandex_lockbox_secret.dockerhub.id
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

  depends_on = [
    yandex_lockbox_secret_version.dockerhub,
    yandex_lockbox_secret_iam_binding.cloud_registry_data_plane,
  ]
}
