//Creating backend-instance-ec2-key
resource "tls_private_key" "template_frontend_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "aws_key_pair" "frontend-instance-ec2-key" {
  key_name   = "pb_frontend_key"
  public_key = tls_private_key.template_frontend_key.public_key_openssh
}

//Launch Frontend instance
resource "aws_launch_template" "launch-frontend" {
  name          = "lt-frontend"
  instance_type = "t2.micro"

  image_id = "ami-04902260ca3d33422"

  instance_initiated_shutdown_behavior = "terminate"

  update_default_version = true

  key_name = aws_key_pair.frontend-instance-ec2-key.key_name

  network_interfaces {
    associate_public_ip_address = true

    security_groups = [
      aws_security_group.pub-sec-group.id,
      aws_security_group.allow-ssh.id
    ]
  }

  placement {
    availability_zone = "us-east-1a"
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "my-frontend-app"
    }
  }

  user_data = templatefile("files/frontend-deploy-data.sh", {
    backend_url = aws_lb_listener.http_backend.arn
  })
}