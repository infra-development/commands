export AWS_CA_BUNDLE=/etc/ssl/certs/minio_ca.crt
alias aws="aws --endpoint-url https://mural02.cloud.in.guavus.com:32000"

#List Bucket
aws s3 ls s3://mural02/

aws s3 cp file_name s3://mural02/

#To Remove Bucket
aws s3 rb s3://mural02/

#To Create Bucket
aws s3 mb s3://mural02/

aws configure set aws_access_key_id AZKTNJAHPGEWJNTCIRZIC
aws configure set aws_secret_access_key Hpj98KYEre3or0Fa1qGni9cS3e0bf7vm6AcxB5EDh

#To remove
aws s3 rm s3://mural02/reports/ts/grt-ts
aws s3 rm s3://mural02/reports/grt/ --recursive

aws s3 rm s3://mural02/reports/ --recursive