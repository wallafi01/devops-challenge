module "vpc" {
  source = "./modules/vpc"
  vpc_id = module.vpc.vpc_id
}

module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
}

module "ec2-resources" {
  source = "./modules/ec2"
  key_pair = var.key_pair
  name_ec2 = var.instance_name
  instance_type = var.instance_type
  vpc_id = module.vpc.vpc_id
  security_group_id = module.sg.security_group_id
  public_subnet_id = module.vpc.public_subnet_id

}