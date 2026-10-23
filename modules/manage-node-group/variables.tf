variable "project_name" {
  type        = string
  description = "Name of the project"
}

variable "tags" {
  type        = map(any)
  description = "Tags to be added to aws resources"
}

variable "cluster_name" {
  type        = string
  description = "Name of cluster name to create mng"
}

variable "subnet_private_1a" {
  type        = string
  description = "Subnet ID to use in mng"
}

variable "subnet_private_1b" {
  type        = string
  description = "Subnet ID to use in mng"
}