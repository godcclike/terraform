variable "infra_env" {
  type        = string
  description = "infrastructure environment"
}

variable "vpc_cidr" {
  type        = string
  description = "The IP Range to use for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet" {
  type        = map(number)
  description = "Map of AZ to a number that should be used for public subnets"
  default = {
    "ap-northeast-1a" = 1
    "ap-northeast-1c" = 2
  }

}

variable "private_subnet" {
  type        = map(number)
  description = "Map of AZ to a number that should be used for private subnets"
  default = {
    "ap-northeast-1a" = 3
    "ap-northeast-1c" = 4
  }

}
