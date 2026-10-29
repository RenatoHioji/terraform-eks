locals {
  oidc     = replace(var.oidc, "https://", "")
  oidc_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/${local.oidc}"
}