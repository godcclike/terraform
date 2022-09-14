terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.54.0"
    }
  }
}

provider "aws" {
  region  = "ap-northeast-1"
  profile = "default"

}

module "ec2-module" {
  source                    = "./modules/ec2-module"
  infra_env                 = "dev"
  infra_role                = "web"
  instance_type             = "t2.nano"
  instance_root_device_size = "20"
  subnets = keys(module.vpc-module.vpc-public-subnets)
}

module "vpc-module" {
  source    = "./modules/vpc-module"
  infra_env = "dev"
  vpc_cidr  = "10.0.0.0/17"

}
