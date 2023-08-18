## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.2.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_basicsg"></a> [basicsg](#module\_basicsg) | ./modules/basic-sgs | n/a |
| <a name="module_network"></a> [network](#module\_network) | ./modules/network | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_ipv4_cidr_for_app_sg"></a> [additional\_ipv4\_cidr\_for\_app\_sg](#input\_additional\_ipv4\_cidr\_for\_app\_sg) | Additional IPv4 CIDR block to whitelist for App Security Group | `list(string)` | `[]` | no |
| <a name="input_additional_ipv4_cidr_for_db_sg"></a> [additional\_ipv4\_cidr\_for\_db\_sg](#input\_additional\_ipv4\_cidr\_for\_db\_sg) | Additional IPv4 CIDR block to whitelist for DB Security Group | `list(string)` | `[]` | no |
| <a name="input_additional_ipv4_cidr_for_web_sg"></a> [additional\_ipv4\_cidr\_for\_web\_sg](#input\_additional\_ipv4\_cidr\_for\_web\_sg) | Additional IPv4 CIDR block to whitelist for Web Security Group | `list(string)` | `[]` | no |
| <a name="input_additional_sg_ids_to_whitelist_for_app"></a> [additional\_sg\_ids\_to\_whitelist\_for\_app](#input\_additional\_sg\_ids\_to\_whitelist\_for\_app) | Additional list of Security Groups to whitelist for App Security Group | `list(string)` | `[]` | no |
| <a name="input_additional_sg_ids_to_whitelist_for_db"></a> [additional\_sg\_ids\_to\_whitelist\_for\_db](#input\_additional\_sg\_ids\_to\_whitelist\_for\_db) | Additional list of Security Groups to whitelist for DB Security Group | `list(string)` | `[]` | no |
| <a name="input_additional_tags"></a> [additional\_tags](#input\_additional\_tags) | Tags as Key/Value pair map. These tags are attached all the resources created by module | `map(string)` | `{}` | no |
| <a name="input_auto_assign_public_ips_to_public_subnet_resources"></a> [auto\_assign\_public\_ips\_to\_public\_subnet\_resources](#input\_auto\_assign\_public\_ips\_to\_public\_subnet\_resources) | When set to true, resources created in public subnets will be associated with public ip address by default. Default is to true. This can be overriden during the individual resources creation like EC2 | `bool` | `true` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS Region where resources will be created | `string` | `"us-east-1"` | no |
| <a name="input_azs"></a> [azs](#input\_azs) | Availability Zones as list, default is empty. If not provided, AZs will be autoassigned during subnet creation | `list(string)` | `[]` | no |
| <a name="input_default_db_port"></a> [default\_db\_port](#input\_default\_db\_port) | Default Port to be used by ingress rule for DB Subnet | `number` | `5432` | no |
| <a name="input_enable_dns_hostnames"></a> [enable\_dns\_hostnames](#input\_enable\_dns\_hostnames) | This allows your resources to be accessed via aws allocated internal dns names, default is true | `bool` | `true` | no |
| <a name="input_enable_multiaz_nat_gateway"></a> [enable\_multiaz\_nat\_gateway](#input\_enable\_multiaz\_nat\_gateway) | Weather to create multiple NAT Gateways per AZ for high availability. Default is set to false. Number of NAT Gateways Created are equal to the numebr AZS available or Public subnet, Whichever is less | `bool` | `false` | no |
| <a name="input_enable_vpc_flow_logs"></a> [enable\_vpc\_flow\_logs](#input\_enable\_vpc\_flow\_logs) | Enables VPC Flow logs. Default is false. You should enable this for audit and compliance | `bool` | `false` | no |
| <a name="input_ipv4_db_subnet_cidrs"></a> [ipv4\_db\_subnet\_cidrs](#input\_ipv4\_db\_subnet\_cidrs) | List of IPv4 CIDR Block for DB subnets. Default is empty list, No DB subnets will be created | `list(string)` | `[]` | no |
| <a name="input_ipv4_primary_cidr_block"></a> [ipv4\_primary\_cidr\_block](#input\_ipv4\_primary\_cidr\_block) | Primary VPC CIDR Block. Example 10.30.0.0/16 | `string` | n/a | yes |
| <a name="input_ipv4_private_subnet_cidrs"></a> [ipv4\_private\_subnet\_cidrs](#input\_ipv4\_private\_subnet\_cidrs) | List of IPv4 CIDR Block for Private subnets. Default is empty list, No private subnets will be created | `list(string)` | `[]` | no |
| <a name="input_ipv4_public_subnet_cidrs"></a> [ipv4\_public\_subnet\_cidrs](#input\_ipv4\_public\_subnet\_cidrs) | List of IPv4 CIDR Block for Public subnets. Default is empty list, No public subnets will be created | `list(string)` | `[]` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace used as one of the combination for tags prefix. Usually goes to Name tag | `string` | `"example"` | no |
| <a name="input_stage"></a> [stage](#input\_stage) | Stage used as one of the combination for tags prefix. Usually goes to Name tag and helps identify environment. Default is set to `dev` | `string` | `"dev"` | no |
| <a name="input_use_nat_gateway"></a> [use\_nat\_gateway](#input\_use\_nat\_gateway) | If NAT gateway should be created be Private subnet. Default is set to true | `bool` | `true` | no |
| <a name="input_vpc_flow_logs_default_bucket"></a> [vpc\_flow\_logs\_default\_bucket](#input\_vpc\_flow\_logs\_default\_bucket) | VPC flow logs bucket to be used, if `enable_vpc_flow_logs` is set to `true`. If not set bucket name will be prefixed by `${local.tag_prefix}-${data.aws_caller_identity.this.account_id}` | `string` | `""` | no |
| <a name="input_vpc_flow_logs_traffic_type"></a> [vpc\_flow\_logs\_traffic\_type](#input\_vpc\_flow\_logs\_traffic\_type) | The type of traffic to capture. Valid values: `ACCEPT`, `REJECT`, `ALL` | `string` | `"ALL"` | no |

## Outputs

No outputs.
