resource "random_shuffle" "subnets" {
  input        = var.subnets
  result_count = 1
}

resource "aws_instance" "my-ubuntu" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = "OCBC setup"

  root_block_device {
    volume_size = var.instance_root_device_size
  }
  subnet_id = random_shuffle.subnets.result[0]

  tags = {
    Name        = "terraform-${var.infra_env}"
    Role        = var.infra_role
    Project     = "terraform Demo"
    Environment = var.infra_env
    ManagedBy   = "terraform"
  }
}

resource "aws_eip" "ubuntu_ip" {
  vpc = true
  tags = {
    Name        = "terraform-${var.infra_env}-eip"
    Role        = var.infra_role
    Project     = "terraform Demo"
    Environment = var.infra_env
    ManagedBy   = "terraform"
  }
}

resource "aws_eip_association" "ubuntu_ip_assoc" {
  instance_id   = aws_instance.my-ubuntu.id
  allocation_id = aws_eip.ubuntu_ip.id
}
