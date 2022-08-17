module "Capstone_myvpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "PotureddyHari_Capstone_myvpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.11.0/24", "10.0.12.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "Potureddy_Hari_Charan"
  }
}
