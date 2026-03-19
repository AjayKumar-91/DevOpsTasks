# Step 1: Prerequisites Setup

## 1. Install Required Tools

# eksctl
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin

# kubectl
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin

# AWS CLI
sudo apt install awscli -y

## Configure AWS

<img width="1715" height="235" alt="image" src="https://github.com/user-attachments/assets/da6c0d07-63d5-4615-8cf5-cb4a20704a71" />

## used commands

curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.19.6/2021-01-05/bin/linux/amd64/kubectl

chmod +x ./kubectl

sudo mv ./kubectl /usr/local/bin

curl --silent  --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp

sudo mv /tmp/eksctl /usr/local/bin

sudo apt install zip -y

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

unzip awscliv2.zip

sudo ./aws/install

eksctl create cluster --name K8s --region us-east-1 --node-type m7i-flex.large

eksctl delete cluster --region us-east-1 --name K8s

kubectl create deployment nginx --image=nginx:latest --port=80

kubectl expose deployment nginx --type=LoadBalancer --port=80

kubectl get svc

<img width="1916" height="832" alt="image" src="https://github.com/user-attachments/assets/6595a468-a1e0-49de-81ee-be74b6b20830" />

<img width="1910" height="662" alt="image" src="https://github.com/user-attachments/assets/3e97e9ca-2fb1-4031-9bf1-7cde7dd2cb45" />

<img width="1918" height="628" alt="image" src="https://github.com/user-attachments/assets/bb02f78e-f1c6-41be-923b-5c7c23bc5b67" />
