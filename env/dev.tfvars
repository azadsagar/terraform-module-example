ipv4_primary_cidr_block    = "10.30.0.0/25"
azs                        = ["us-east-1a", "us-east-1b"]
ipv4_public_subnet_cidrs   = ["10.30.0.0/28", "10.30.0.16/28"]
ipv4_private_subnet_cidrs  = ["10.30.0.64/28", "10.30.0.96/28"]
ipv4_db_subnet_cidrs       = ["10.30.0.32/28", "10.30.0.48/28"]
namespace                  = "demo"
stage                      = "dev"
use_nat_gateway            = true
enable_multiaz_nat_gateway = false
enable_vpc_flow_logs       = true

additional_tags = {
  CreateBy = "sagar.barai@velotio.com"
}