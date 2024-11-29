# resource "aws_security_group" "security" {
#   name = "allow-all"

#   vpc_id = aws_vpc.test_env.vpc-001706d1e717dd2e4

#   ingress {
#     cidr_blocks = [
#       "0.0.0.0/0"
#     ]
#     from_port = 22
#     to_port   = 22
#     protocol  = "tcp"
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = -1
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }                             