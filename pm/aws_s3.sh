export AWS_ACCESS_KEY_ID=$(dev.AWS_ACCESS_KEY_ID)
export AWS_SECRET_ACCESS_KEY=$(dev.AWS_SECRET_ACCESS_KEY)
aws s3 --region ap-southeast-1 cp