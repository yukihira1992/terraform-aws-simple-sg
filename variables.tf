variable "name" {
  description = "The name of the security group."
  default = null
  type = "string"
}

variable "name_prefix" {
  description = "Creates a unique name beginning with the specified prefix. Conflicts with name."
  default = null
  type = "string"
}

variable "description" {
  description = "The security group description. "
  default = null
  type = "string"
}

variable "ingress_rules" {
  description = "A list of ingress rule mappings."
  type = "list"
}

variable "egress_rules" {
  description = "A list of eggress rule mappings. Defaults to allow all traffic."
  default = [
    {
      port = 0
      protocol = "-1"
    }
  ]
  type = "list"
}

variable "vpc_id" {
  description = "The VPC ID"
  default = null
  type = "string"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  default = {}
  type = "map"
}
