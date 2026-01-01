// SageMaker main.tf
resource "aws_sagemaker_notebook_instance" "main" {
  name          = var.notebook_name
  instance_type = var.instance_type
  role_arn      = var.role_arn
  tags = {
    Name = var.notebook_name
  }
}

resource "aws_sagemaker_model" "main" {
  name               = var.model_name
  execution_role_arn = var.role_arn
  primary_container {
    image = var.model_image
    model_data_url = var.model_data_url
  }
}
