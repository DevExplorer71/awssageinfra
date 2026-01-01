import boto3
import sagemaker
from sagemaker.predictor import Predictor
import json

endpoint_name = "sales-model-endpoint"  # Update if needed

predictor = Predictor(endpoint_name=endpoint_name)

# Example payload
payload = {
    "feature1": 123,
    "feature2": 456,
    # ... add all required features
}

response = predictor.predict(json.dumps(payload))
print("Prediction response:", response)
