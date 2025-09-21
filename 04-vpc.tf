#---------------------------------------------------------------------------------------------------
# VPC
#---------------------------------------------------------------------------------------------------
module "vpc" {
  source = "git::https://gitlab.com/mbasri-terraform/modules/aws/terraform-aws-vpc?ref=v1.8.0"

  vpc_name = local.vpc_name

  kms_arn = module.kms.key_arn

  enable_nat_gateway = true

  enable_system_logs = true
  enable_spot_logs   = true

  enable_cloudwatch_vpc_flow_logs = false
  bucket_arn_vpc_flow_logs        = null
  bucket_arn_resolvers_logs       = null

  vpc_cidr = "10.0.0.0/22"

  availability_zones = ["eu-west-3a", "eu-west-3b", "eu-west-3c"]

  public_subnet_cidr  = ["10.0.0.0/25", "10.0.0.128/25", "10.0.1.0/25"]
  private_subnet_cidr = ["10.0.1.128/25", "10.0.2.0/25", "10.0.2.128/25"]
  secure_subnet_cidr  = []
  vpn_subnet_cidr     = []
  spare_subnet_cidr   = ["10.0.3.0/24"]

  tags = local.tags
}
