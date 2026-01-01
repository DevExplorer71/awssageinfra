// S3 variables.tf
variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "name" {
  description = "Name tag for the S3 bucket"
  type        = string
}
