# Terraform state will be stored in S3
terraform {
  backend "s3" {
    bucket = "mkzielak-aws-3"
    key    = "terraform.tfstate"
    region = "eu-west-3"
  }
}

# Use AWS Terraform provider
provider "aws" {
  region = "u-west-3"
}

# Create EC2 instance
resource "aws_instance" "my-test-instance" {
  ami                    = "${var.ami}"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${aws_security_group.default.id}"]
  source_dest_check      = false
  instance_type          = "${var.instance_type}"

  tags {
    Name = "terraform-default"
  }
}

# Create Security Group for EC2
resource "aws_security_group" "default" {
  name = "terraform-default-sg"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
