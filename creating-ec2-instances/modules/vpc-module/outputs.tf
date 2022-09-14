output "vpc-id" {
  value = aws_vpc.vpc.id
}

output "vpc-cidr" {
  value = aws_vpc.vpc.cidr_block
}

output "vpc-public-subnets" {
    value = {
        for subnet in aws_subnet.public :
        subnet.id => subnet.cidr_block
    }
  
}

output "vpc-private-subnets" {
    value = {
        for subnet in aws_subnet.private :
        subnet.id => subnet.cidr_block
    }
  
}