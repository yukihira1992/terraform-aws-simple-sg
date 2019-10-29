resource "aws_security_group" "this" {
  name = var.name
  name_prefix = var.name_prefix
  description = var.description
  vpc_id = var.vpc_id
  tags = var.tags

  dynamic "ingress" {
    for_each = [for rule in var.ingress_rules: {
      from_port = lookup(rule, "from_port", lookup(rule, "port", 0))
      to_port = lookup(rule, "to_port", lookup(rule, "port", 0))
      protocol = lookup(rule, "protocol", "tcp")
      cidr_blocks = lookup(rule, "cidr_blocks", [])
      security_groups = lookup(rule, "security_groups", [])
    }]

    content {
      from_port = ingress.value.from_port
      to_port = ingress.value.to_port
      protocol = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
      security_groups = ingress.value.security_groups
    }
  }

  dynamic "egress" {
    for_each = [for rule in var.egress_rules: {
      from_port = lookup(rule, "from_port", lookup(rule, "port", 0))
      to_port = lookup(rule, "to_port", lookup(rule, "port", 0))
      protocol = lookup(rule, "protocol", "tcp")
      cidr_blocks = lookup(rule, "cidr_blocks", [
        "0.0.0.0/0",
      ])
      security_groups = lookup(rule, "security_groups", [])
    }]

    content {
      from_port = egress.value.from_port
      to_port = egress.value.to_port
      protocol = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
      security_groups = egress.value.security_groups
    }
  }
}
