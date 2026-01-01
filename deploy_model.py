import boto3
import sagemaker
from sagemaker.model import Model
import os

role = os.environ.get("SAGEMAKER_ROLE_ARN", "arn:aws:iam::YOUR_ACCOUNT_ID:role/YOUR_ROLE")
sagemaker_session = sagemaker.Session()

# Replace with your model artifact and image
model_data = "s3://your-s3-bucket-name/model/model.tar.gz"
image_uri = "your-image-uri"  # e.g., from AutoML or built-in algorithm

model = Model(model_data=model_data,
              image_uri=image_uri,
              role=role,
              sagemaker_session=sagemaker_session)

predictor = model.deploy(instance_type="ml.m5.large", endpoint_name="sales-model-endpoint")

print("Model deployed to SageMaker endpoint: sales-model-endpoint")
