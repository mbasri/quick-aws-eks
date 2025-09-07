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

  vpc_cidr = "10.170.32.0/22"

  availability_zones = ["eu-west-3a", "eu-west-3b"]

  public_subnet_cidr  = ["10.170.35.0/26", "10.170.35.64/26"]
  private_subnet_cidr = ["10.170.32.0/24", "10.170.33.0/24"]
  secure_subnet_cidr  = ["10.170.34.0/25", "10.170.34.128/25"]
  vpn_subnet_cidr     = []
  spare_subnet_cidr   = ["10.170.35.192/27", "10.170.35.224/27"]

  tags = local.tags
}
