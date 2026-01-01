// Glue variables.tf
variable "database_name" {
  description = "Name of the Glue database"
  type        = string
}

variable "crawler_name" {
  description = "Name of the Glue crawler"
  type        = string
}

variable "role_arn" {
  description = "IAM role ARN for Glue"
  type        = string
}

variable "s3_path" {
  description = "S3 path for Glue crawler"
  type        = string
}
