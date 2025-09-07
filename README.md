<!-- BEGIN_TF_DOCS -->
# Quick AWS EKS

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Terraform project which create VPC, KMS and EKS resource on AWS from scratch.

## *Create and destroy the infrastructure*

### 1. Create infrastructure

```shell
git clone https://github.com/mbasri/quick-aws-eks.git
cd quick-aws-eks
terraform init
terraform apply
```

### 2. Destroy infrastructure

```shell
git clone https://github.com/mbasri/quick-aws-eks.git
cd quick-aws-eks
terraform init
terraform destroy
```

## Update kubeconfig file

```bash
# Select AWS default profile
export AWS_DEFAULT_PROFILE=

# Update kubeconfig
aws eks update-kubeconfig --name my-eks-name
```

## Deploy ArgoCD

```bash
# Install ArgoCD
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Get ArgoCD admin password
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo

# Initialize Port Forwarding
kubectl -n argocd port-forward svc/argocd-server 8080:443
```

## Deploy Cluster Autoscaler

```bash
# Install Cluster Autoscaler
curl -LO https://raw.githubusercontent.com/kubernetes/autoscaler/refs/tags/cluster-autoscaler-1.33.0/cluster-autoscaler/cloudprovider/aws/examples/cluster-autoscaler-autodiscover.yaml
sed -i 's/<YOUR CLUSTER NAME>/--><YOUR_CLUSTER_NAME><--/g' cluster-autoscaler-autodiscover.yaml
kubectl apply -f cluster-autoscaler-autodiscover.yaml

# Deploy Pod Identity for cluster-autoscaler
eksctl create podidentityassociation \
--cluster my-eks-name \
--namespace kube-system \
--service-account-name cluster-autoscaler \
--role-arn --><ROLE_ARN><--

# Restart cluster-autoscaler Deployment
kubectl rollout restart deployment cluster-autoscaler -n kube-system
```

## *Generate docs*

```shell
terraform-docs -c .terraform-docs.yml .
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.12.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 6.4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.4.0 |
| <a name="provider_http"></a> [http](#provider\_http) | 3.5.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks"></a> [eks](#module\_eks) | git::https://gitlab.com/mbasri-terraform/modules/aws/terraform-aws-eks | n/a |
| <a name="module_kms"></a> [kms](#module\_kms) | git::https://gitlab.com/mbasri-terraform/modules/aws/terraform-aws-kms | v1.4.0 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | git::https://gitlab.com/mbasri-terraform/modules/aws/terraform-aws-vpc | v1.8.0 |

## Resources

| Name | Type |
|------|------|
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/6.4.0/docs/data-sources/caller_identity) | data source |
| [http_http.myip](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_access_entry_admin_arn"></a> [cluster\_access\_entry\_admin\_arn](#output\_cluster\_access\_entry\_admin\_arn) | EKS Access Entry ARN for admin user |
| <a name="output_cluster_certificate_authority_data"></a> [cluster\_certificate\_authority\_data](#output\_cluster\_certificate\_authority\_data) | Base64 encoded certificate data required to communicate with the EKS cluster |
| <a name="output_cluster_endpoint"></a> [cluster\_endpoint](#output\_cluster\_endpoint) | Endpoint of the EKS cluster |
| <a name="output_cluster_iam_role_arn"></a> [cluster\_iam\_role\_arn](#output\_cluster\_iam\_role\_arn) | IAM role ARN created by the module for EKS cluster |
| <a name="output_cluster_iam_role_name"></a> [cluster\_iam\_role\_name](#output\_cluster\_iam\_role\_name) | IAM role name created by the module for EKS cluster |
| <a name="output_cluster_iam_role_unique_id"></a> [cluster\_iam\_role\_unique\_id](#output\_cluster\_iam\_role\_unique\_id) | IAM role unique ID created by the module for EKS cluster |
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | ID of the EKS cluster |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | Name of the EKS cluster |
| <a name="output_cluster_platform_version"></a> [cluster\_platform\_version](#output\_cluster\_platform\_version) | Platform version of the EKS cluster |
| <a name="output_cluster_status"></a> [cluster\_status](#output\_cluster\_status) | Status of the EKS cluster |
| <a name="output_cluster_version"></a> [cluster\_version](#output\_cluster\_version) | Kubernetes version of the EKS cluster |
| <a name="output_default_security_group_id"></a> [default\_security\_group\_id](#output\_default\_security\_group\_id) | The ID of the VPC default security group |
| <a name="output_key_alias_arn"></a> [key\_alias\_arn](#output\_key\_alias\_arn) | The Amazon Resource Name (ARN) of the key alias |
| <a name="output_key_alias_name"></a> [key\_alias\_name](#output\_key\_alias\_name) | Name of the key alis |
| <a name="output_key_arn"></a> [key\_arn](#output\_key\_arn) | The Amazon Resource Name (ARN) of the key |
| <a name="output_key_id"></a> [key\_id](#output\_key\_id) | Name of the key |
| <a name="output_key_policy"></a> [key\_policy](#output\_key\_policy) | The IAM resource policy set on the key |
| <a name="output_launch_template_arn"></a> [launch\_template\_arn](#output\_launch\_template\_arn) | ARN of the created Launch Template |
| <a name="output_launch_template_id"></a> [launch\_template\_id](#output\_launch\_template\_id) | ID of the created Launch Template |
| <a name="output_launch_template_latest_version"></a> [launch\_template\_latest\_version](#output\_launch\_template\_latest\_version) | Latest version of the created Launch Template |
| <a name="output_nat_gateway_public_ips"></a> [nat\_gateway\_public\_ips](#output\_nat\_gateway\_public\_ips) | Private IP of NAT Gateway |
| <a name="output_ondemand_node_group_arn"></a> [ondemand\_node\_group\_arn](#output\_ondemand\_node\_group\_arn) | ARN of the OnDemand EKS Node Group |
| <a name="output_ondemand_node_group_id"></a> [ondemand\_node\_group\_id](#output\_ondemand\_node\_group\_id) | ID of the OnDemand EKS Node Group |
| <a name="output_private_subnet_cidr"></a> [private\_subnet\_cidr](#output\_private\_subnet\_cidr) | List of cidr\_blocks of private subnets |
| <a name="output_private_subnet_ids"></a> [private\_subnet\_ids](#output\_private\_subnet\_ids) | List of IDs of private subnets |
| <a name="output_public_subnet_cidr"></a> [public\_subnet\_cidr](#output\_public\_subnet\_cidr) | List of cidr\_blocks of public subnets |
| <a name="output_public_subnet_ids"></a> [public\_subnet\_ids](#output\_public\_subnet\_ids) | List of IDs of public subnets |
| <a name="output_region"></a> [region](#output\_region) | The Name of the region |
| <a name="output_secure_subnet_cidr"></a> [secure\_subnet\_cidr](#output\_secure\_subnet\_cidr) | List of cidr\_blocks of secure subnets |
| <a name="output_secure_subnet_ids"></a> [secure\_subnet\_ids](#output\_secure\_subnet\_ids) | List of IDs of secure subnets |
| <a name="output_spot_logs_cwl_id"></a> [spot\_logs\_cwl\_id](#output\_spot\_logs\_cwl\_id) | The IDs of the cloudwatch logs for Spot logging |
| <a name="output_spot_node_group_arn"></a> [spot\_node\_group\_arn](#output\_spot\_node\_group\_arn) | ARN of the Spot EKS Node Group |
| <a name="output_spot_node_group_id"></a> [spot\_node\_group\_id](#output\_spot\_node\_group\_id) | ID of the Spot EKS Node Group |
| <a name="output_system_logs_cwl_id"></a> [system\_logs\_cwl\_id](#output\_system\_logs\_cwl\_id) | The IDs of the cloudwatch logs for VM system logs |
| <a name="output_vpc_cidr_blocks"></a> [vpc\_cidr\_blocks](#output\_vpc\_cidr\_blocks) | The CIDR block of the VPC |
| <a name="output_vpc_flow_logs_cwl_id"></a> [vpc\_flow\_logs\_cwl\_id](#output\_vpc\_flow\_logs\_cwl\_id) | The ID of the cloudwatch logs for VPC flow logs |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the VPC |

## *Author*

* [**Mohamed BASRI**](https://github.com/mbasri)

## *License*

This is free and unencumbered software released into the public domain - see the [LICENSE](./LICENSE) file for details

<!-- END_TF_DOCS -->