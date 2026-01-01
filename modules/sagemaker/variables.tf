// SageMaker variables.tf
variable "notebook_name" {
  description = "Name of the SageMaker notebook instance"
  type        = string
}

variable "instance_type" {
  description = "Type of SageMaker notebook instance"
  type        = string
}

variable "role_arn" {
  description = "IAM role ARN for SageMaker"
  type        = string
}

variable "model_name" {
  description = "Name of the SageMaker model"
  type        = string
}

variable "model_image" {
  description = "Docker image for the model"
  type        = string
}

variable "model_data_url" {
  description = "S3 URL for model data"
  type        = string
}
