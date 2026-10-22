resource "aws_eks_cluster" "eks_cluster" {
  name     = "${var.project_name}-cluster"
  role_arn = aws_iam_role.eks_cluster_role.arn

  version = "1.35"

  vpc_config {
    subnet_ids = [
      var.public-subnet-1a,
      var.public-subnet-1b
    ]
    endpoint_public_access  = true
    endpoint_private_access = true
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_role_attachment,
  ]

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-eks_cluster"
    }
  )
}