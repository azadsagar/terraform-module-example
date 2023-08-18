

module "network" {
  source = "git::https://github.com/azadsagar/terraform-aws-network.git?ref=main"

  #VPC Cidr
  ipv4_primary_cidr_block      = var.ipv4_primary_cidr_block
  enable_vpc_flow_logs         = var.enable_vpc_flow_logs
  vpc_flow_logs_default_bucket = var.vpc_flow_logs_default_bucket
  vpc_flow_logs_traffic_type   = var.vpc_flow_logs_traffic_type

  enable_dns_hostnames = var.enable_dns_hostnames

  #Subnet Cidrs and AZS
  azs                       = var.azs
  ipv4_public_subnet_cidrs  = var.ipv4_public_subnet_cidrs
  ipv4_private_subnet_cidrs = var.ipv4_private_subnet_cidrs
  ipv4_db_subnet_cidrs      = var.ipv4_db_subnet_cidrs

  auto_assign_public_ips_to_public_subnet_resources = var.auto_assign_public_ips_to_public_subnet_resources

  use_nat_gateway            = var.use_nat_gateway
  enable_multiaz_nat_gateway = var.enable_multiaz_nat_gateway

  namespace       = "rsystem"
  stage           = "dev"
  additional_tags = var.additional_tags
}

module "basicsg" {
  source = "git::https://github.com/azadsagar/terraform-aws-basicsgs.git?ref=main"
  vpc_id = module.network.vpc.id

  additional_ipv4_cidr_for_app_sg        = var.additional_ipv4_cidr_for_app_sg
  additional_ipv4_cidr_for_db_sg         = var.additional_ipv4_cidr_for_db_sg
  additional_ipv4_cidr_for_web_sg        = var.additional_ipv4_cidr_for_web_sg
  additional_sg_ids_to_whitelist_for_app = var.additional_sg_ids_to_whitelist_for_app
  additional_sg_ids_to_whitelist_for_db  = var.additional_sg_ids_to_whitelist_for_db

  default_db_port = var.default_db_port

  namespace       = "demo"
  stage           = "dev"
  additional_tags = var.additional_tags
}