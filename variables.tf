variable "name" {
  description = "The name of the security group."
  default = null
  type = string
}

variable "name_prefix" {
  description = "Creates a unique name beginning with the specified prefix. Conflicts with name."
  type = string
  default = null
}

variable "description" {
  description = "The security group description. "
  type = string
  default = null
}

variable "ingress_rules" {
  description = "A list of ingress rule mappings."
}

variable "egress_rules" {
  description = "A list of eggress rule mappings. Defaults to allow all traffic."
  default = [
    {
      port = 0
      protocol = "-1"
      cidr_blocks = [
        "0.0.0.0/0",
      ]
      security_groups = []
    }
  ]
}

variable "vpc_id" {
  description = "The VPC ID"
  default = null
  type = string
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  default = {}
  type = map(string)
}
