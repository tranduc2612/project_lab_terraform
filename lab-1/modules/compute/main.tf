resource "aws_instance" "this" {
	ami           = var.image_id
	instance_type = var.instance_type
    tags = {
        Name = "test-instance"
    }
    key_name = var.key_name
    vpc_security_group_ids = var.sg_ec2_ids

}

resource "aws_eip" "demo-eip" {
  instance = aws_instance.this.id
}