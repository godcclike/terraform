variable "infra_env" {
  type        = string
  description = "infrastructure environment"
}

variable "infra_role" {
  type        = string
  description = "infrastructure purpose"
}

variable "instance_type" {
  type        = string
  description = "ec2 instance type"
  default     = "t2.micro"

}

variable "instance_root_device_size" {
  type        = string
  description = "Root block device size in GB"
  default     = "15"
}

variable "subnets" {
  type        = list(any)
  description = "subnet ids"
}
