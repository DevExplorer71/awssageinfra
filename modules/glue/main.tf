// Glue main.tf
resource "aws_glue_catalog_database" "main" {
  name = var.database_name
}

resource "aws_glue_crawler" "main" {
  name         = var.crawler_name
  database_name = aws_glue_catalog_database.main.name
  role         = var.role_arn
  s3_target {
    path = var.s3_path
  }
}
