terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = ">= 5.25.0"
    }
  }

resource "aws_instance" "ec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = aws_subnet.public-subnet.id
  vpc_security_group_ids = [aws_security_group.security-group.id]
  iam_instance_profile = aws_iam_instance_profile.instance-profile.name
  root_block_device {
    volume_size = 30
  }

 
  tags = {
    Name = var.instance_name
  }
}
}

  