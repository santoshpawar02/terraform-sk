module "dev_sq_1" {
  source        = "../modules/sg"
  vpc_id        = module.dev_vpc_1.vpc_name
  vpc_name      = module.dev_vpc_1.vpc_id
  environment   = module.dev_vpc_1.environment
  ingress_value = ["80", "8080", "443", "8443", "22", "3306", "1900", "1443"]
}
