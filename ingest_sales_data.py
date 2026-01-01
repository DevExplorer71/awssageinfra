import requests
import pandas as pd
import boto3
import os

def fetch_sales_data(api_url):
    response = requests.get(api_url)
    response.raise_for_status()
    return response.json()

def save_to_csv(data, filename):
    df = pd.DataFrame(data)
    df.to_csv(filename, index=False)

def upload_to_s3(filename, bucket, object_name=None):
    s3 = boto3.client('s3')
    if object_name is None:
        object_name = os.path.basename(filename)
    s3.upload_file(filename, bucket, object_name)

if __name__ == "__main__":
    API_URL = "https://api.example.com/sales"  # Replace with your API endpoint
    CSV_FILE = "sales_data.csv"
    S3_BUCKET = "your-s3-bucket-name"  # Replace with your S3 bucket name

    # Step 1: Fetch data from API
    sales_data = fetch_sales_data(API_URL)

    # Step 2: Save data to CSV
    save_to_csv(sales_data, CSV_FILE)

    # Step 3: Upload CSV to S3
    upload_to_s3(CSV_FILE, S3_BUCKET)

    print(f"Sales data ingested and uploaded to S3 bucket: {S3_BUCKET}")
