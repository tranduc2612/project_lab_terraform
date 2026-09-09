resource "aws_instance" "instance" {
  ami                    = var.image
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = var.ec2_security_group_ids
  subnet_id              = var.subnet_id
  tags = {
    Name = var.tag_name
  }
}

resource "aws_eip" "eip_instance" {
  instance = aws_instance.instance.id
  tags = {
    Name = var.tag_name
  }
}