<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_template"></a> [template](#provider\_template) | n/a |
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | >= 0.13 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [yandex_compute_disk.boot](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_disk) | resource |
| [yandex_compute_instance.this](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_instance) | resource |
| [yandex_vpc_security_group.this](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_security_group) | resource |
| [template_file.this](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [yandex_dns_zone.dns_zone](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/data-sources/dns_zone) | data source |
| [yandex_dns_zone.ipv6_dns_zone](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/data-sources/dns_zone) | data source |
| [yandex_dns_zone.nat_dns_zone](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/data-sources/dns_zone) | data source |
| [yandex_vpc_subnet.this](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/data-sources/vpc_subnet) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allocate_ipv4"></a> [allocate\_ipv4](#input\_allocate\_ipv4) | (Optional) Allocate an IPv4 address for the interface. The default value is true. | `bool` | `true` | no |
| <a name="input_allocate_ipv6"></a> [allocate\_ipv6](#input\_allocate\_ipv6) | (Optional) If true, allocate an IPv6 address for the interface. The address will be automatically assigned from the specified subnet. | `bool` | `false` | no |
| <a name="input_allocate_nat"></a> [allocate\_nat](#input\_allocate\_nat) | (Optional) Provide a public address, for instance, to access the internet over NAT. | `bool` | `false` | no |
| <a name="input_allow_stopping_for_update"></a> [allow\_stopping\_for\_update](#input\_allow\_stopping\_for\_update) | (Optional) Custom user-data for compute instance. | `bool` | `false` | no |
| <a name="input_boot_disk"></a> [boot\_disk](#input\_boot\_disk) | (Required) The boot disk for the instance. | `map` | `{}` | no |
| <a name="input_create_default_security_group"></a> [create\_default\_security\_group](#input\_create\_default\_security\_group) | (Optional) - Create default security group. | `bool` | `false` | no |
| <a name="input_default_security_group_egress"></a> [default\_security\_group\_egress](#input\_default\_security\_group\_egress) | (Optional) - A list of egress rules to create with default security group. | `list` | `[]` | no |
| <a name="input_default_security_group_ingress"></a> [default\_security\_group\_ingress](#input\_default\_security\_group\_ingress) | (Optional) - A list of ingress rules to create with default security group. | `list` | `[]` | no |
| <a name="input_dns_record"></a> [dns\_record](#input\_dns\_record) | (Optional) List of configurations for creating ipv4 DNS records. The structure is documented below. | `map` | `{}` | no |
| <a name="input_ipv4_private_address"></a> [ipv4\_private\_address](#input\_ipv4\_private\_address) | (Optional) The private IP address to assign to the instance. If empty, the address will be automatically assigned from the specified subnet. | `any` | `null` | no |
| <a name="input_ipv6_dns_record"></a> [ipv6\_dns\_record](#input\_ipv6\_dns\_record) | (Optional) List of configurations for creating ipv6 DNS records. The structure is documented below. | `map` | `{}` | no |
| <a name="input_ipv6_private_address"></a> [ipv6\_private\_address](#input\_ipv6\_private\_address) | (Optional) The private IPv6 address to assign to the instance. If empty, the address will be automatically assigned from the specified subnet. | `any` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | (Optional) Resource name. | `any` | `null` | no |
| <a name="input_nat_dns_record"></a> [nat\_dns\_record](#input\_nat\_dns\_record) | (Optional) List of configurations for creating ipv4 NAT DNS records. The structure is documented below. | `map` | `{}` | no |
| <a name="input_nat_public_ip_address"></a> [nat\_public\_ip\_address](#input\_nat\_public\_ip\_address) | (Optional) Provide a public address, for instance, to access the internet over NAT. | `any` | `null` | no |
| <a name="input_password"></a> [password](#input\_password) | (Optional) Provide password for creation on instance with cloud-init for user. | `string` | `""` | no |
| <a name="input_platform_id"></a> [platform\_id](#input\_platform\_id) | (Optional) The type of virtual machine to create. The default is 'standard-v1'. | `any` | `null` | no |
| <a name="input_resources"></a> [resources](#input\_resources) | (Required) Compute resources that are allocated for the instance. | `map` | `{}` | no |
| <a name="input_ssh_key"></a> [ssh\_key](#input\_ssh\_key) | (Optional) Provide public ssh\_key to assign to user on compute instance. | `string` | `""` | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | (Optional) Custom user-data for compute instance. | `string` | `""` | no |
| <a name="input_user_groups"></a> [user\_groups](#input\_user\_groups) | (Optional) Provide groups to assign to user on compute instance. | `string` | `"sudo"` | no |
| <a name="input_username"></a> [username](#input\_username) | (Optional) Provide username for creation on instance with cloud-init. | `string` | `""` | no |
| <a name="input_vpc_security_groups"></a> [vpc\_security\_groups](#input\_vpc\_security\_groups) | (Optional) - Assign security groups to instance. | `list` | `[]` | no |
| <a name="input_vpc_subnet_name"></a> [vpc\_subnet\_name](#input\_vpc\_subnet\_name) | (Required) VPC subnet to place the instance. | `any` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | (Optional) The availability zone where the virtual machine will be created. If it is not provided, the default provider folder is used. | `any` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_yandex_compute_disk_boot"></a> [yandex\_compute\_disk\_boot](#output\_yandex\_compute\_disk\_boot) | n/a |
| <a name="output_yandex_compute_instance"></a> [yandex\_compute\_instance](#output\_yandex\_compute\_instance) | n/a |
| <a name="output_yandex_vpc_security_group"></a> [yandex\_vpc\_security\_group](#output\_yandex\_vpc\_security\_group) | n/a |
<!-- END_TF_DOCS -->