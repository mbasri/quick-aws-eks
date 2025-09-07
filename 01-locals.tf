#---------------------------------------------------------------------------------------------------
# locals variables
#---------------------------------------------------------------------------------------------------
locals {
  name   = "quick-aws-eks"
  region = "eu-west-3"

  description = "Quick AWS EKS"

  kms_name = local.name
  vpc_name = local.name
  eks_name = local.name

  tags = {
    "Name"        = local.name,
    "Description" = local.description,

    "billing:organisation"      = "mbasri",
    "billing:organisation-unit" = "labs",
    "billing:application"       = "quick-aws-eks",
    "billing:environment"       = "dev",

    "security:compliance"     = "HIPAA",
    "security:data-sensitity" = "1",
    "security:encryption"     = "true",

    "technical:terraform"                     = "true",
    "technical:terraform:scm"                 = "https://gitlab.com/mbasri/quick-aws-eks.git",
    "technical:terraform:required-version"    = "1.12.2",
    "technical:provider:aws:required-version" = "6.4.0"
  }
}
