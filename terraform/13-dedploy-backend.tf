//Creating backend-instance-ec2-key
resource "tls_private_key" "template_backend_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "aws_key_pair" "backend-instance-ec2-key" {
  key_name   = "pb_backend_key"
  public_key = tls_private_key.template_backend_key.public_key_openssh
}

//Launch backend instance from sh file
resource "aws_launch_template" "launch-backend" {
  name = "lt-backend"

  instance_type = "t2.micro"

  image_id = "ami-04902260ca3d33422"

  instance_initiated_shutdown_behavior = "terminate"

  update_default_version = true

  key_name = aws_key_pair.backend-instance-ec2-key.key_name

  network_interfaces {
    associate_public_ip_address = false
    subnet_id                   = aws_subnet.public-subnet1.id
    security_groups             = [
      aws_security_group.private-sec-group.id,
      aws_security_group.allow-ssh.id
    ]
  }

  placement {
    availability_zone = "us-east-1a"
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "my-backend-app"
    }
  }

  user_data  = templatefile("files/backend-deploy-data.sh", {
    msql_url      = "jdbc:mysql://${aws_db_instance.mysql.address}:${aws_db_instance.mysql.port}/${aws_db_instance.mysql.name}",
    msql_username = aws_db_instance.mysql.username, msql_password = aws_db_instance.mysql.password
  })
  depends_on = [aws_db_instance.mysql]
}
