# Yandex Cloud <RESOURCE> Terraform module

Terraform module which creates Yandex Cloud <RESOURCE> resources.

## Examples

Examples codified under
the [`examples`](https://github.com/terraform-yacloud-modules/terraform-yandex-module-template/tree/main/examples) are intended
to give users references for how to use the module(s) as well as testing/validating changes to the source code of the
module. If contributing to the project, please be sure to make any appropriate updates to the relevant examples to allow
maintainers to test your changes and to keep the examples up to date for users. Thank you!

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## License

Apache-2.0 Licensed.
See [LICENSE](https://github.com/terraform-yacloud-modules/terraform-yandex-module-template/blob/main/LICENSE).

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | >= 0.72.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | >= 0.72.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [yandex_cloudregistry_registry.this](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/cloudregistry_registry) | resource |
| [yandex_cloudregistry_registry_iam_binding.this](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/cloudregistry_registry_iam_binding) | resource |
| [yandex_cloudregistry_registry_ip_permission.this](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/cloudregistry_registry_ip_permission) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | Description of the registry | `string` | `""` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | ID of the folder that the registry belongs to | `string` | n/a | yes |
| <a name="input_iam_bindings"></a> [iam\_bindings](#input\_iam\_bindings) | List of IAM bindings to apply to the registry | <pre>list(object({<br/>    role    = string<br/>    members = set(string)<br/>  }))</pre> | `[]` | no |
| <a name="input_ip_permissions"></a> [ip\_permissions](#input\_ip\_permissions) | IP permissions for the registry | <pre>object({<br/>    pull = set(string)<br/>    push = set(string)<br/>  })</pre> | `null` | no |
| <a name="input_kind"></a> [kind](#input\_kind) | Kind of the registry | `string` | `"DOCKER"` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Resource labels as key:value pairs. Maximum of 64 per resource. | `map(string)` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the registry | `string` | n/a | yes |
| <a name="input_registry_id"></a> [registry\_id](#input\_registry\_id) | ID of the Registry resource to return. If not set, will be created. | `string` | `""` | no |
| <a name="input_timeouts"></a> [timeouts](#input\_timeouts) | Timeout settings for create, update, delete operations | <pre>object({<br/>    create = string<br/>    update = string<br/>    delete = string<br/>  })</pre> | `null` | no |
| <a name="input_type"></a> [type](#input\_type) | Type of the registry | `string` | `"LOCAL"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_iam_binding_ids"></a> [iam\_binding\_ids](#output\_iam\_binding\_ids) | IDs of created IAM bindings |
| <a name="output_ip_permission_id"></a> [ip\_permission\_id](#output\_ip\_permission\_id) | ID of the IP permission resource |
| <a name="output_registry_created_at"></a> [registry\_created\_at](#output\_registry\_created\_at) | Creation timestamp of the registry |
| <a name="output_registry_folder_id"></a> [registry\_folder\_id](#output\_registry\_folder\_id) | Folder ID of the registry |
| <a name="output_registry_id"></a> [registry\_id](#output\_registry\_id) | ID of the created registry |
| <a name="output_registry_name"></a> [registry\_name](#output\_registry\_name) | Name of the created registry |
| <a name="output_registry_status"></a> [registry\_status](#output\_registry\_status) | Status of the registry |
<!-- END_TF_DOCS -->