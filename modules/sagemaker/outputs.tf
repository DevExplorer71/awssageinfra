// SageMaker outputs.tf
output "notebook_instance_id" {
  description = "The ID of the SageMaker notebook instance"
  value       = aws_sagemaker_notebook_instance.main.id
}

output "model_name" {
  description = "The name of the SageMaker model"
  value       = aws_sagemaker_model.main.name
}
