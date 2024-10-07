terraform {
  required_version = ">= 1.3.7"
  required_providers {
    aws = {
      source = "registry.terraform.io/hashicorp/aws"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.9"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.20"
    }
    time = {
      source  = "hashicorp/time"
      version = ">= 0.9"
    }
  }
}