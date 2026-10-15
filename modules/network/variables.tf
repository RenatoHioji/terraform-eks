variable "cidr_block" {
  type        = string
  description = "CIDR network block to be used for VPC"
}

variable "project_name" {
  type        = string
  description = "Name of the project"
}

variable "tags" {
  type        = map(any)
  description = "Tags to be added to aws resources"
}