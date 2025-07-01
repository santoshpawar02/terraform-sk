module "dev_ec2_1" {
  source      = "../modules/compute"
  environment = module.dev_vpc_1.environment
  amis = {
    us-east-1 = "ami-020cba7c55df1f615"
  us-east-2 = "ami-0d1b5a8c13042c939" }
  aws_region      = var.aws_region
  public_subnets  = module.dev_vpc_1.public-subnet.id
  private_subnets = module.dev_vpc_1.private-subnet.id
  sg_id           = module.dev_sq_1.id
  vpc_name        = module.dev_vpc_1.vpc_name
  key_name        = "secops-key"
}
