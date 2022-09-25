module "network" {
  source        = "/home/mostafa/Documents/network"
  vpc_cidr      = var.vpc_cidr
  cidr_public1  = var.cidr_public1
  cidr_public2  = var.cidr_public2
  cidr_private1 = var.cidr_private1
  cidr_private2 = var.cidr_private2
  region        = var.region
  AZ1           = var.AZ1
  AZ2           = var.AZ2
}