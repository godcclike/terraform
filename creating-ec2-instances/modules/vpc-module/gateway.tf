resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name        = "terraform-${var.infra_env}-igw"
    Project     = "terrform demo"
    Environment = var.infra_env
    VPC         = aws_vpc.vpc.id
    ManagedBy   = "terraform"
  }

}
resource "aws_eip" "nat_eip" {

  vpc = true

  tags = {
    Name        = "terraform-${var.infra_env}-eip"
    Project     = "terrform demo"
    Environment = var.infra_env
    VPC         = aws_vpc.vpc.id
    ManagedBy   = "terraform"
  }

}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.nat_eip.id

  subnet_id = aws_subnet.public[element(keys(aws_subnet.public), 0)].id

  tags = {
    Name        = "terraform-${var.infra_env}-ngw"
    Project     = "terrform demo"
    Environment = var.infra_env
    VPC         = aws_vpc.vpc.id
    ManagedBy   = "terraform"
  }

}

