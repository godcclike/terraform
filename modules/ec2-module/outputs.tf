output "ec2-eip" {
    value = aws_eip.ubuntu_ip.public_ip  
}

output "ec2-instance-id" {
    value = aws_instance.my-ubuntu.id
  
}