module "eks" {
  source                          = "terraform-aws-modules/eks/aws"
  version                         = "~> 19.0"
  cluster_name                    = "micuster"
  cluster_version                 = "1.28"
  vpc_id                          = module.vpc.vpc_id
  subnet_ids                      = module.vpc.private_subnets
  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true

  cluster_addons = {
    coredns = {
      resolver_conflict = "OVERWRITE"
    }
    vpc-cni = {
      resolver_conflict = "OVERWRITE"
    }
    coredns = {
      resolver_conflict = "OVERWRITE"
    }
    kube-proxy = {
      resolver_conflict = "OVERWRITE"
    }
    csi = {
      resolver_conflict = "OVERWRITE"
    }

    manage_aws_auth_configmap = true
    #aws_auth_roles =
    aws_auth_users = [
      {
        userarn  = data.aws_iam_user.ricardomartinez.arn,
        username = "daevops",
        groups   = ["system:masters"],
      }
    ]



    eks_eks_managed_node_groups = {
      node-group = {
        desired_capacity = 1
        max_capacity     = 1
        min_capacity     = 1
        instance_types   = ["t3.medium"]
        disk_size        = 20
        subnets          = module.vpc.private_subnets
        tags = {
          Environment = "dev"
        }
      }
    }
    tags = {
      Environment = "dev"
    }
  }
}   