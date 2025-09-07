#---------------------------------------------------------------------------------------------------
# KMS
#---------------------------------------------------------------------------------------------------
output "key_arn" {
  description = "The Amazon Resource Name (ARN) of the key"
  value       = module.kms.key_arn
}

output "key_id" {
  description = "Name of the key"
  value       = module.kms.key_id
}

output "key_alias_arn" {
  description = "The Amazon Resource Name (ARN) of the key alias"
  value       = module.kms.key_alias_arn
}

output "key_alias_name" {
  description = "Name of the key alis"
  value       = module.kms.key_alias_name
}

output "key_policy" {
  description = "The IAM resource policy set on the key"
  value       = module.kms.key_policy
}

#---------------------------------------------------------------------------------------------------
# VPC
#---------------------------------------------------------------------------------------------------
output "region" {
  description = "The Name of the region"
  value       = module.vpc.region
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "vpc_cidr_blocks" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_blocks
}

output "nat_gateway_public_ips" {
  description = "Private IP of NAT Gateway"
  value       = module.vpc.nat_gateway_public_ips
}

output "public_subnet_ids" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnet_ids
}

output "public_subnet_cidr" {
  description = "List of cidr_blocks of public subnets"
  value       = module.vpc.public_subnet_cidr
}

output "private_subnet_ids" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnet_ids
}

output "private_subnet_cidr" {
  description = "List of cidr_blocks of private subnets"
  value       = module.vpc.private_subnet_cidr
}

output "secure_subnet_ids" {
  description = "List of IDs of secure subnets"
  value       = module.vpc.secure_subnet_ids
}

output "secure_subnet_cidr" {
  description = "List of cidr_blocks of secure subnets"
  value       = module.vpc.secure_subnet_cidr
}

output "default_security_group_id" {
  description = "The ID of the VPC default security group"
  value       = module.vpc.default_security_group_id
}

output "system_logs_cwl_id" {
  description = "The IDs of the cloudwatch logs for VM system logs"
  value       = module.vpc.system_logs_cwl_id
}

output "spot_logs_cwl_id" {
  description = "The IDs of the cloudwatch logs for Spot logging"
  value       = module.vpc.spot_logs_cwl_id
}

output "vpc_flow_logs_cwl_id" {
  description = "The ID of the cloudwatch logs for VPC flow logs"
  value       = module.vpc.vpc_flow_logs_cwl_id
}

#---------------------------------------------------------------------------------------------------
# EKS
#---------------------------------------------------------------------------------------------------
# IAM Role
output "cluster_iam_role_name" {
  description = "IAM role name created by the module for EKS cluster"
  value       = module.eks.cluster_iam_role_name
}

output "cluster_iam_role_arn" {
  description = "IAM role ARN created by the module for EKS cluster"
  value       = module.eks.cluster_iam_role_arn
}

output "cluster_iam_role_unique_id" {
  description = "IAM role unique ID created by the module for EKS cluster"
  value       = module.eks.cluster_iam_role_unique_id
}

# EKS Cluster
output "cluster_name" {
  description = "Name of the EKS cluster"
  value       = module.eks.cluster_name
}

output "cluster_id" {
  description = "ID of the EKS cluster"
  value       = module.eks.cluster_id
}

output "cluster_endpoint" {
  description = "Endpoint of the EKS cluster"
  value       = module.eks.cluster_endpoint
}

output "cluster_certificate_authority_data" {
  description = "Base64 encoded certificate data required to communicate with the EKS cluster"
  value       = module.eks.cluster_certificate_authority_data
}

output "cluster_version" {
  description = "Kubernetes version of the EKS cluster"
  value       = module.eks.cluster_version
}

output "cluster_platform_version" {
  description = "Platform version of the EKS cluster"
  value       = module.eks.cluster_platform_version
}

output "cluster_status" {
  description = "Status of the EKS cluster"
  value       = module.eks.cluster_status
}

# EKS Access
output "cluster_access_entry_admin_arn" {
  description = "EKS Access Entry ARN for admin user"
  value       = module.eks.cluster_access_entry_admin_arn
}

# Launch Template
output "launch_template_id" {
  description = "ID of the created Launch Template"
  value       = module.eks.launch_template_id
}

output "launch_template_arn" {
  description = "ARN of the created Launch Template"
  value       = module.eks.launch_template_arn
}

output "launch_template_latest_version" {
  description = "Latest version of the created Launch Template"
  value       = module.eks.launch_template_latest_version
}

# Node Group
output "spot_node_group_arn" {
  description = "ARN of the Spot EKS Node Group"
  value       = module.eks.spot_node_group_arn
}

output "spot_node_group_id" {
  description = "ID of the Spot EKS Node Group"
  value       = module.eks.spot_node_group_id
}

output "ondemand_node_group_arn" {
  description = "ARN of the OnDemand EKS Node Group"
  value       = module.eks.ondemand_node_group_arn
}

output "ondemand_node_group_id" {
  description = "ID of the OnDemand EKS Node Group"
  value       = module.eks.ondemand_node_group_id
}
