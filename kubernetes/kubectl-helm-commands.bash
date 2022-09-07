#Create Secret from id_rsa file
kubectl create secret generic <sftp-id-secret-name> --from-file=<rsa-key-id-file-path> -n service-iq
kubectl create secret generic sftp-id --from-file=/home/mural/.ssh/id_rsa -n service-iq

#Create Secret from literals
kubectl create secret generic bdr-keys-secret --from-literal=gpg_conv_key=convpassword --from-literal=gpg_sdr_key=sdrpassword

#create secret from file
apiVersion: v1
kind: Secret
metadata:
  name: bdr-keys-secret
type: Opaque
data:
  gpg_conv_password: Y29udnBhc3N3b3JkCg==
  gpg_sdr_password: c2RycGFzc3dvcmQK

kubectl apply -f [file] -n service-iq

#copy content for secret to another file
kubectl -n minio get secret tls-ssl-minio -o go-template='{{index .data "ca.crt"| base64decode}}' | sudo tee /etc/ssl/certs/minio_ca.crt

kubectl -n minio get secret minio-secret -o go-template='{{index .data "accesskey"| base64decode}}'
kubectl -n minio get secret minio-secret -o go-template='{{index .data "secretkey"| base64decode}}'

sudo helm repo update
sudo helm install agg-reports guavus/agg-reports --version="1.0-guavus-60-73e000a" -f run.yaml -n spark-jobs