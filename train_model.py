import boto3
import sagemaker
from sagemaker import AutoML
import os

# Set up SageMaker session and role
sagemaker_session = sagemaker.Session()
role = os.environ.get("SAGEMAKER_ROLE_ARN", "arn:aws:iam::YOUR_ACCOUNT_ID:role/YOUR_ROLE")

# S3 location of input data
input_data = "s3://your-s3-bucket-name/sales_data.csv"  # Update as needed

# Start AutoML job
automl = AutoML(role=role,
                target_attribute_name="target_column",  # Replace with your target column
                sagemaker_session=sagemaker_session)

automl.fit(inputs=input_data, job_name="sales-automl-job")

print("AutoML job started. Check SageMaker console for progress.")
