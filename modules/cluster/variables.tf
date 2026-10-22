variable "project_name" {
  type        = string
  description = "Name of the project"
}

variable "tags" {
  type        = map(any)
  description = "Tags to be added to aws resources"
}

variable "public-subnet-1a" {
  type        = string
  description = "Public subnet in AZ 1a"
}

variable "public-subnet-1b" {
  type        = string
  description = "Public subnet in AZ 1b"
}