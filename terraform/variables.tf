#--------------ECR----------------------
variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "name" {
  type        = string
  description = "Name of the repository"
}

variable "image_tag_mutability" {
  type        = string
  description = "The tag mutability setting for the repository. Must be one of: MUTABLE or IMMUTABLE"
  default     = "MUTABLE"
}

variable "scan_on_push" {
  type        = bool
  description = "Indicates whether images are scanned after being pushed to the repository (true) or not scanned (false)"
  default     = true
}
