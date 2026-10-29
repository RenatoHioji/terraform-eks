resource "aws_iam_role" "eks_controller_role" {
  name = "${var.project_name}_eks_controller_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = local.oidc_arn
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringEquals = {
            "${local.oidc}:aud" = "sts.amazonaws.com"
            "${local.oidc}:sub" = "system:serviceaccount:kube-system:aws-load-balancer-controller"
          }
        }
      }
    ]
  })

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}_eks_controller_role"
    }
  )

}

resource "aws_iam_role_policy_attachment" "eks_controller_role_attachment" {
  role       = aws_iam_role.eks_controller_role.name
  policy_arn = aws_iam_policy.eks_controller_policy.arn
}

