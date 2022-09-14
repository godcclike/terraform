resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name        = "terraform-${var.infra_env}-vpc"
    Project     = "terrform demo"
    Environment = var.infra_env
    ManagedBy   = "terraform"
  }

}

resource "aws_subnet" "public" {
  for_each   = var.public_subnet
  vpc_id     = aws_vpc.vpc.id
  cidr_block = cidrsubnet(aws_vpc.vpc.cidr_block, 4, each.value)
  tags = {
    Name        = "terraform-${var.infra_env}-public-subnet"
    Project     = "terrform demo"
    Environment = var.infra_env
    Subnet      = "${each.key}-${each.value}"
  }

}

resource "aws_subnet" "private" {
  for_each   = var.private_subnet
  vpc_id     = aws_vpc.vpc.id
  cidr_block = cidrsubnet(aws_vpc.vpc.cidr_block, 4, each.value)
  tags = {
    Name        = "terraform-${var.infra_env}-private-subnet"
    Project     = "terrform demo"
    Environment = var.infra_env
    Subnet      = "${each.key}-${each.value}"
  }

}
