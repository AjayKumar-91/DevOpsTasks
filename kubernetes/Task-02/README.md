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
