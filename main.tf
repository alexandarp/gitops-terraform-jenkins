# Create EC2 instance
resource "aws_instance" "bastion-manager" {
  ami                    = var.ami
  count                  = var.instance_count
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.bastion-sg.id]
  source_dest_check      = false
  instance_type          = var.instance_type

  tags = {
    Name = format("%s-manager", var.environments_name)
  }
}

# Create Security Group for EC2.
resource "aws_security_group" "bastion-sg" {
  name = format("%s-sg", var.environments_name)

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.ip_home
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ip_home
  }
}
