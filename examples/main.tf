provider "aws" {
  region = "ap-northeast-1"
}

module "sg" {
  source = "../"

  tags = {
    Name = "example"
    Environment = "dev"
  }

  ingress_rules = [
    {
      port = 80
      cidr_blocks = [
        "192.168.1.0/24",
        "172.16.10.0/24",
      ]
    },
    {
      port = 443
      cidr_blocks = [
        "192.168.1.0/24",
        "172.16.10.0/24",
      ]
    },
  ]
}
