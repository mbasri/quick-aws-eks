#---------------------------------------------------------------------------------------------------
# Create EKS
#---------------------------------------------------------------------------------------------------
module "eks" {
  source = "git::https://gitlab.com/mbasri-terraform/modules/aws/terraform-aws-eks"

  cluster_name    = local.eks_name
  cluster_version = "1.33"

  deletion_protection = false

  subnet_ids              = module.vpc.private_subnet_ids
  endpoint_private_access = false
  endpoint_public_access  = true

  public_access_cidrs = [
    "${chomp(data.http.myip.response_body)}/32"
  ]

  eks_admin_principal_arn = [
    data.aws_caller_identity.current.arn
  ]

  tags = local.tags
}
