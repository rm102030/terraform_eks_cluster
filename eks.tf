module "eks" {
  source                          = "terraform-aws-modules/eks/aws"
  version                         = "18.31.2"
  cluster_name                    = "micluster"
  cluster_version                 = "1.27"
  vpc_id                          = module.vpc.vpc_id
  subnet_ids                      = module.vpc.private_subnets
  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true
 
  eks_managed_node_groups = {
    node-group = {
      desired_capacity = 2
      max_capacity     = 5
      min_capacity     = 2
      instance_types   = ["t3.medium"]
      disk_size        = 20
      subnets          = module.vpc.private_subnets
      tags = {
        Environment = "dev"
        owner       = "ricardo.martinez@pragma.com.co"
      }
    }
  }
  tags = {
    Environment = "dev"
    owner       = "ricardo.martinez@pragma.com.co"
  }
}


module "eks_blueprints_addons" {
  source  = "aws-ia/eks-blueprints-addons/aws"
  version = "~> 1.0" #ensure to update this to the latest/desired version

  cluster_name      = module.eks.cluster_name
  cluster_endpoint  = module.eks.cluster_endpoint
  cluster_version   = module.eks.cluster_version
  oidc_provider_arn = module.eks.cluster_oidc_issuer_url

  eks_addons = {
    aws-ebs-csi-driver = {
      most_recent = true
    }
    coredns = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    snapshot-controller = {
      most_recent = true
    }
  }
  tags = {
    Environment = "dev"
    owner       = "ricardo.martinez@pragma.com.co"
  }
}

