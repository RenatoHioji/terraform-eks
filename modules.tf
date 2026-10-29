module "eks_network" {
  source       = "./modules/network"
  cidr_block   = var.cidr_block
  project_name = var.project_name
  tags         = local.tags
}

module "eks_cluster" {
  source           = "./modules/cluster"
  project_name     = var.project_name
  tags             = local.tags
  public-subnet-1a = module.eks_network.subnet_public_1a
  public-subnet-1b = module.eks_network.subnet_public_1b
}

module "eks_manage_node_group" {
  source            = "./modules/manage-node-group"
  project_name      = var.project_name
  cluster_name      = module.eks_cluster.cluster_name
  subnet_private_1a = module.eks_network.subnet_private_1a
  subnet_private_1b = module.eks_network.subnet_private_1b
  tags              = local.tags
}

module "eks_load_balancer_controller" {
  source       = "./modules/load_balancer_controller"
  project_name = var.project_name
  tags         = local.tags
}