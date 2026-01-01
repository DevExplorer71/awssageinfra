# AWS Sales Data ML Pipeline (Terraform)

## Project Overview
This project provisions AWS infrastructure using Terraform modules to automate a machine learning workflow for sales data. It is designed to:
- Ingest sales data from an external API
- Store the data in AWS S3
- Use AWS Glue to catalog and prepare the data
- Train and deploy a machine learning model using AWS SageMaker

## Modules
- **S3**: Stores raw sales data as CSV files
- **Glue**: Catalogs and prepares data for ML (ETL)
- **IAM**: Manages permissions for Glue and SageMaker
- **SageMaker**: Trains and deploys ML models


## End-to-End Workflow
1. **Provision Infrastructure**
   - Clone this repo
   - Configure your AWS credentials
   - Run `terraform init` and `terraform apply` to create resources

2. **Ingest Data from API**
   - Run `ingest_sales_data.py` to fetch sales data from your API, save as CSV, and upload to S3

3. **Catalog Data with Glue**
   - Glue crawler will scan the S3 bucket and create a table in the Glue Data Catalog
   - (Optional) Use Glue jobs for further ETL/transformations

4. **Train Model with SageMaker**
   - Run `train_model.py` to start an AutoML job on the sales data in S3

5. **Deploy Model to SageMaker Endpoint**
   - Run `deploy_model.py` to deploy the trained model to a SageMaker endpoint

6. **Get Predictions**
   - Run `predict.py` to send new data to the endpoint and receive predictions

## Notes
- **Glue** is used for data cataloging and ETL. It does not store data, but helps organize and prepare it for ML.
- **SageMaker** handles model training and deployment. You can use built-in algorithms or AutoML.
- IAM roles are required for Glue and SageMaker to access S3 and other resources.

## Customization
- Adjust module variables in Terraform to fit your data and ML requirements
- Add scripts for data ingestion and model training as needed


## Example Workflow
1. Run `ingest_sales_data.py` to fetch and upload sales data to S3
2. Glue crawler catalogs S3 data → Table available for ML
3. Run `train_model.py` to train model on cataloged data
4. Run `deploy_model.py` to deploy model to SageMaker endpoint
5. Run `predict.py` to get predictions from the endpoint

---

For questions or enhancements, open an issue or contact the maintainer.
