# Provider configuration
provider "aws" {
  region = "ap-southeast-2"
}

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args        = ["eks", "get-token", "--cluster-name", module.eks.cluster_name]
  }
}

provider "helm" {
  kubernetes {
    host                   = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      command     = "aws"
      args        = ["eks", "get-token", "--cluster-name", module.eks.cluster_name]
    }
  }
}

# VPC Module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = "eks-fargate-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["ap-southeast-2a", "ap-southeast-2b", "ap-southeast-2c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

# EKS Module
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name    = "my-fargate-cluster"
  cluster_version = "1.29"  # Using the latest available version as of April 2024

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  cluster_endpoint_public_access = true

  fargate_profiles = {
    default = {
      name = "default"
      selectors = [
        {
          namespace = "default"
        },
        {
          namespace = "kube-system"
        },
        {
          namespace = "cert-manager"
        },
        {
          namespace = "cattle-system"
        },
        {
          namespace = "ack-system"
        }
      ]
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}

# Wait for EKS
resource "time_sleep" "wait_for_eks" {
  depends_on = [module.eks]
  create_duration = "30s"
}

# cert-manager Installation
resource "helm_release" "cert_manager" {
  name             = "cert-manager"
  repository       = "https://charts.jetstack.io"
  chart            = "cert-manager"
  namespace        = "cert-manager"
  create_namespace = true
  version          = "v1.13.0"  # Using a recent stable version

  set {
    name  = "installCRDs"
    value = "true"
  }

  depends_on = [time_sleep.wait_for_eks]
}

# Wait for cert-manager
resource "time_sleep" "wait_for_cert_manager" {
  depends_on = [helm_release.cert_manager]
  create_duration = "30s"
}

# ACK Installation
resource "helm_release" "ack_s3_controller" {
  name             = "ack-s3-controller"
  repository       = "oci://public.ecr.aws/aws-controllers-k8s"
  chart            = "s3-chart"
  namespace        = "ack-system"
  create_namespace = true

  depends_on = [time_sleep.wait_for_cert_manager]
}

# Rancher Installation
resource "helm_release" "rancher" {
  name             = "rancher"
  repository       = "https://releases.rancher.com/server-charts/latest"
  chart            = "rancher"
  namespace        = "cattle-system"
  create_namespace = true
  version          = "latest"  # This will use the latest version of Rancher

  set {
    name  = "hostname"
    value = "rancher.my-domain.com"
  }

  set {
    name  = "bootstrapPassword"
    value = "admin" # Change this in production
  }

  depends_on = [helm_release.cert_manager, time_sleep.wait_for_cert_manager]
}