variable "name" {
  description = "Name of the registry"
  type        = string
}

variable "folder_id" {
  description = <<EOF
    (Optional) The ID of the Yandex Cloud Folder that the resources belongs to.

    Allows to create bucket in different folder.
    It will try to create bucket using IAM-token in provider config, not using access_key.
    If omitted, folder_id specified in provider config and access_key is used.
  EOF
  type        = string
  default     = null
}


variable "description" {
  description = "Description of the registry"
  type        = string
  default     = ""
}

variable "labels" {
  description = "Resource labels as key:value pairs. Maximum of 64 per resource."
  type        = map(string)
  default     = {}
}

variable "properties" {
  description = "Resource properties as key:value pairs. Maximum of 64 per resource."
  type        = map(string)
  default     = {}
}

variable "kind" {
  description = "Kind of the registry"
  type        = string
  default     = "DOCKER"
}

variable "type" {
  description = "Type of the registry"
  type        = string
  default     = "LOCAL"
}

variable "registry_id" {
  description = "ID of the Registry resource to return. If not set, will be created."
  type        = string
  default     = ""
}

variable "iam_bindings" {
  description = "List of IAM bindings to apply to the registry"
  type = list(object({
    role    = string
    members = set(string)
  }))
  default = []
}

variable "ip_permissions" {
  description = "IP permissions for the registry"
  type = object({
    pull = set(string)
    push = set(string)
  })
  default = null
}
