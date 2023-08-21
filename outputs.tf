output "vpc" {
  value = {
    id               = module.network.vpc.id
    primary_vpc_cidr = module.network.vpc.primary_vpc_cidr
  }
  description = "returns the map with `id` and `primary_vpc_cidr`. Example accessing vpc id: `module.<modulename>.vpc.id`"
}

output "public_subnet" {
  value = {
    id         = module.network.public_subnet.id
    ipv4_cidrs = module.network.public_subnet.ipv4_cidrs
  }
  description = "returns the map with list of `id` and `ipv4_cidrs`. Example accessing first public subnet id: `module.<modulename>.public_subnet.id[0]`"
}

output "private_subnet" {
  value = {
    id         = module.network.private_subnet.id
    ipv4_cidrs = module.network.private_subnet.ipv4_cidrs
  }
  description = "returns the map with list of `id` and `ipv4_cidrs`. Example accessing first private subnet id: `module.<modulename>.private_subnet.id[0]`"
}

output "db_subnet" {
  value = {
    id         = module.network.db_subnet.id
    ipv4_cidrs = module.network.db_subnet.ipv4_cidrs
  }
  description = "returns the map with list of `id` and `ipv4_cidrs`. Example accessing first db subnet id: `module.<modulename>.db_subnet.id[0]`"
}


output "app_security_group_id" {
  value       = module.basicsg.app_security_group_id
  description = "default application security group id"
}

output "db_security_group_id" {
  value       = module.basicsg.db_security_group_id
  description = "default db security group id"
}

output "web_security_group_id" {
  value       = module.basicsg.web_security_group_id
  description = "default web security group id"
}