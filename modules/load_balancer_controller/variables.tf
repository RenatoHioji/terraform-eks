variable "project_name" {
  type        = string
  description = "Name of the project"
}

variable "tags" {
  type        = map(any)
  description = "Tags to be added to aws resources"
}

variable "oidc" {
  type        = string
  description = "oidc"
}