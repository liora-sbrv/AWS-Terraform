# resource "aws_launch_configuration" "Name" {
#   name                        = "Example"
#   image_id                    = data.aws_ami.example.id
#   instance_type               = var.instance_type
#   associate_public_ip_address = true

#   security_groups = [aws_security_group.allow_tls.id]
#   user_data       = file(var.usr_data_file)
#   key_name        = var.ssh_key_name
# }

# resource "aws_autoscaling_group" "Name1" {
#   name                 = "Example1"
#   max_size             = 1
#   min_size             = 1
#   desired_capacity     = 1
#   force_delete         = false
#   launch_configuration = aws_launch_configuration.name.name
#   vpc_zone_identifier  = [aws_subnet.public_1.id]

#   tag {
#     key                 = "terraform"
#     value               = "yes"
#     propagate_at_launch = true
#   }
# }

# resource "aws_lb" "Name2" {
#   name               = "Example2"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = [aws_security_group.allow_tls.id]
#   subnets            = [aws_subnet.public_1.id, aws_subnet.public_2.id]

#   tags = {
#     Environment = "testing"
#   }
# }

# resource "aws_lb_target_group" "Name3" {
#   name     = "Example3"
#   port     = 80
#   protocol = "HTTP"
#   vpc_id   = aws_vpc.main.id

#   health_check {
#     healthy_threshold   = 3
#     unhealthy_threshold = 3
#     timeout             = 5
#     port                = "traffic-port"
#     path                = "/"
#     matcher             = "200-320" #success codes
#   }
# }

# resource "aws_autoscaling_attachment" "asg_attachment_bar" {
#   autoscaling_group_name = aws_autoscaling_group.Example1.id
#   lb_target_group_arn    = aws_lb_target_group.Example3.arn
# }

# resource "aws_lb_listener" "Name4" {
#   load_balancer_arn = aws_Example2.arn
#   port              = "80"
#   protocol          = "HTTP"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.Example3.arn
#   }
# }

# resource "aws_lb_listener_rule" "listener_1" {
#   listener_arn = aws_lb_listener.listener.arn
#   priority     = 100

#   action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.Example3.arn
#   }

#   condition {
#     path_pattern {
#       values = ["/"]
#     }
#   }
# }

# resource "aws_lb_listener_rule" "listener_2" {
#   listener_arn = aws_lb_listener.listener.arn
#   priority     = 200
#   action {
#     type = "fixed-response"

#     fixed_response {
#       content_type = "text/plain"
#       message_body = "HEALTHY"
#       status_code  = "200"
#     }
#   }

#   condition {
#     path_pattern {
#       values = ["/static/*"]
#     }
#   }
# }
