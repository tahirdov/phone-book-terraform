resource "aws_autoscaling_group" "autoscaling-group-backend" {
  name = "autoscaling-group-backend-app"

  vpc_zone_identifier = [aws_subnet.private-subnet1.id, aws_subnet.private-subnet2.id]
  desired_capacity    = 2
  max_size            = 10
  min_size            = 2

  target_group_arns = [
    aws_lb_target_group.load-balancer-target-group-backend.arn
  ]

  health_check_grace_period = 60

  protect_from_scale_in = false

  launch_template {
    id      = aws_launch_template.launch-backend.id
    version = "$Latest"
  }

  tag {
    key                 = "scaling-group"
    propagate_at_launch = true
    value               = "auto-scaling-app"
  }
}

resource "aws_autoscaling_policy" "scale_app_backend" {
  name        = "requests_count_scaling_policy"
  policy_type = "TargetTrackingScaling"

  autoscaling_group_name = aws_autoscaling_group.autoscaling-group-backend.name

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ALBRequestCountPerTarget"
      resource_label         = format("%s/%s", aws_lb.auto-load-balancer-backend.arn, aws_lb_target_group.load-balancer-target-group-backend.arn_suffix)
    }

    target_value = 30
  }
}
