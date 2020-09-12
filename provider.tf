provider "aws" {
  version                 = ">=2.0"
  region                  = "us-east-1"
  shared_credentials_file = "C:/Users/bprajapati/.aws/credentials"
  profile                 = "cnative"
}


provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
  load_config_file       = false
  #version                = "~> 1.10"
}

provider "helm" {
  version        = "~> 0.9"
  install_tiller = true
}
