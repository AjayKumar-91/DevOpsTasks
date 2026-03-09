# 🚀 Kubernetes Minikube Setup & Namespace Exploration

![Kubernetes](https://img.shields.io/badge/Kubernetes-Container%20Orchestration-blue?logo=kubernetes)
![Docker](https://img.shields.io/badge/Docker-Containerization-blue?logo=docker)
![Minikube](https://img.shields.io/badge/Minikube-Local%20Kubernetes-green)
![Kubectl](https://img.shields.io/badge/Kubectl-Kubernetes%20CLI-orange)
![License](https://img.shields.io/badge/License-MIT-yellow)

## 📌 Project Overview

This project demonstrates how to **set up a local Kubernetes cluster using Minikube** and explore **Kubernetes namespaces**.

The task includes installing required tools, starting a Kubernetes cluster, creating namespaces, and deploying a sample pod.

This project is part of **DevOps practice to understand container orchestration using Kubernetes.**

---

# 🛠 Tech Stack

| Tool                 | Purpose                      |
| -------------------- | ---------------------------- |
| VirtualBox           | Virtualization for Minikube  |
| WSL (Ubuntu)         | Linux environment on Windows |
| Docker               | Container runtime            |
| Minikube             | Local Kubernetes cluster     |
| Kubectl              | Kubernetes CLI               |
| AWS EC2 *(optional)* | Cloud environment            |

---

# 🏗 Architecture

```
Windows System
      │
      ▼
   WSL (Ubuntu)
      │
      ├── Docker
      ├── Kubectl
      └── Minikube
            │
            ▼
      Kubernetes Cluster
            │
            ▼
        Namespaces
            │
            ▼
          Pods
```

---

# ⚙️ Installation Steps

## 1️⃣ Update System

```bash
sudo apt update && sudo apt upgrade -y
```

---

## 2️⃣ Install Docker

```bash
sudo apt install docker.io -y
sudo service docker start
```

Verify installation:

```bash
docker --version
```

---

## 3️⃣ Install Kubectl

Download kubectl:

```bash
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
```

Make it executable:

```bash
chmod +x kubectl
```

Move to system path:

```bash
sudo mv kubectl /usr/local/bin/
```

Verify:

```bash
kubectl version --client
```

---

## 4️⃣ Install Minikube

```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
```

```bash
sudo install minikube-linux-amd64 /usr/local/bin/minikube
```

Verify installation:

```bash
minikube version
```

---

# 🚀 Start Kubernetes Cluster

Start Minikube:

```bash
minikube start --driver=virtualbox
```

Verify cluster:

```bash
kubectl get nodes
```

Expected output:

```
NAME       STATUS   ROLES           AGE   VERSION
minikube   Ready    control-plane   2m    v1.xx
```

---

# 📦 Kubernetes Namespaces

Namespaces are used to **organize and isolate resources within a Kubernetes cluster**.

---

## List namespaces

```bash
kubectl get namespaces
```

Default namespaces include:

* `default`
* `kube-system`
* `kube-public`
* `kube-node-lease`

---

## Create a Namespace

```bash
kubectl create namespace dev
```

Verify namespace:

```bash
kubectl get namespaces
```

---

## Deploy Pod in Namespace

Run nginx pod inside namespace:

```bash
kubectl run nginx-pod --image=nginx -n dev
```

Check pod:

```bash
kubectl get pods -n dev
```

---

## Delete Namespace

```bash
kubectl delete namespace dev
```

---

# 📊 Useful Commands

Check cluster nodes:

```bash
kubectl get nodes
```

Check all resources in namespace:

```bash
kubectl get all -n dev
```

Open Kubernetes dashboard:

```bash
minikube dashboard
```

---

# ☁️ Alternative Setup (AWS EC2)

If local setup fails, use **AWS EC2 instance**.

Recommended configuration:

```
Instance Type : t2.medium
OS : Ubuntu 22.04
```

Start cluster using Docker driver:

```bash
minikube start --driver=docker
```

---

# 📷 Screenshots

Add screenshots here after completing the task.

Example:

```
screenshots/
 ├── minikube-start.png
 ├── kubectl-nodes.png
 ├── namespace-created.png
 └── pod-running.png
```

---

# 📚 Learning Outcomes

* Kubernetes cluster setup using Minikube
* Working with kubectl CLI
* Understanding Kubernetes namespaces
* Deploying pods in a namespace
* Basic Kubernetes resource management

---

