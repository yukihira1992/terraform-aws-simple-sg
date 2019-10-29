# terraform-aws-simple-sg
Terraform module which creates Security Group on AWS.

## Usage

```hcl-terraform
# Web server allows all http/https traffic.

module "web_server" {
  source = "yukihira1992/simple-sg/aws"

  tags = {
    Name = "web-server"
    Environment = "dev"
  }

  ingress_rules = [
    {
      port = 80
      cidr_blocks = [
        "0.0.0.0/0",
      ]
    },
    {
      port = 443
      cidr_blocks = [
        "0.0.0.0/0",
      ]
    },
  ]
}

# DB server only allows mysql access from Web server.

module "db_server" {
  source = "yukihira1992/simple-sg/aws"

  tags = {
    Name = "db-server"
    Environment = "dev"
  }

  ingress_rules = [
    {
      port = 3306
      security_groups = [
        module.web_server.id,
      ],
    },
  ]
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| name | The name of the security group. | string | `null` | no |
| name_prefix | Creates a unique name beginning with the specified prefix. Conflicts with name. | string | `null` | no |
| description | The security group description. | string | `null` | no |
| ingress_rules | A list of ingress rule mappings. | list(map(string)) | | yes |
| egress_rules | A list of eggress rule mappings. Defaults to allow all traffic. | list(map(string)) | Allow all traffic. | no |
| vpc_id | The VPC ID | string | `null` | no |
| tags | A mapping of tags to assign to the resource. | map(string) | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the security group. |
| arn | The ARN of the security group. |
| name | The name of the security group. |
