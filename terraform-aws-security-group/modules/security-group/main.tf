# resource "aws_security_group" "allow_tls" {
#   name        = "allow_tls"
#   description = "Allow TLS inbound traffic"
#   vpc_id      = aws_vpc.main.id

#   ingress {
#     description      = "TLS from VPC"
#     from_port        = 443
#     to_port          = 443
#     protocol         = "tcp"
#     cidr_blocks      = [aws_vpc.main.cidr_block]
#     ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
#   }

#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }

#   tags = {
#     Name = "allow_tls"
#   }
# }



locals {
  map = {
    "description 0" = {
      port = 80,
      cidr_blocks = ["0.0.0.0/0"],
    }
    "description 1" = {
      port = 81,
      cidr_blocks = ["10.0.0.0/16"],
    }
  }
  map2 = {
    "description 0" = {
      port = 80,
      cidr_blocks = ["0.0.0.0/0"],
    }
    "description 1" = {
      port = 81,
      cidr_blocks = ["10.0.0.0/16"],
    }
  }
}
resource "aws_security_group" "map" {
  name_prefix = "example-"
  #name        = "demo-map-each"
  description = "demo-map-each"
  vpc_id      = "vpc-03ed4eb91272acfdb"

  dynamic "ingress" {
    for_each = local.map
    # normally would be "ingress" here, but we're overriding the name
    iterator = each
    content {
      # now we use each. instead of ingress.
      description = each.key # IE: "description 0"
      from_port   = each.value.port
      to_port     = each.value.port
      protocol    = "tcp"
      cidr_blocks = each.value.cidr_blocks
    }
  }
  dynamic "egress" {
    for_each = local.map2
    # normally would be "ingress" here, but we're overriding the name
    iterator = each
    content {
      # now we use each. instead of ingress.
      description = each.key # IE: "description 0"
      from_port   = each.value.port
      to_port     = each.value.port
      protocol    = "tcp"
      cidr_blocks = each.value.cidr_blocks
    }
  }
    lifecycle {
    create_before_destroy = true
  }
}