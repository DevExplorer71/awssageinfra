module "s3" {
  source      = "./modules/s3"
  bucket_name = var.s3_bucket_name
  name        = var.s3_name
}

module "iam" {
  source              = "./modules/iam"
  role_name           = var.iam_role_name
  assume_role_policy  = var.iam_assume_role_policy
}

module "sagemaker" {
  source         = "./modules/sagemaker"
  notebook_name  = var.sagemaker_notebook_name
  instance_type  = var.sagemaker_instance_type
  role_arn       = module.iam.role_arn
  model_name     = var.sagemaker_model_name
  model_image    = var.sagemaker_model_image
  model_data_url = var.sagemaker_model_data_url
}

module "glue" {
  source        = "./modules/glue"
  database_name = var.glue_database_name
  crawler_name  = var.glue_crawler_name
  role_arn      = module.iam.role_arn
  s3_path       = module.s3.bucket_arn
}
