# Docker Task-3 – Custom Nginx Image with Docker Compose

## Project Description

Create a **custom Docker image for Nginx** and deploy it using **Docker Compose** with a **bind mount volume at `/var/opt/nginx`**.
Finally, push the created image to **Docker Hub**.

### Tech Stack

* WSL
* Docker
* Docker Compose

---

# Project Structure

```
nginx-docker-task
│
├── Dockerfile
├── docker-compose.yml
├── index.html
├── nginx-data/
└── docker-task3.md
```

---

# Workflow Chart

```
Start
 │
 ▼
Create Project Folder
 mkdir nginx-docker-task
 cd nginx-docker-task
 │
 ▼
Create Required Files
 Dockerfile
 docker-compose.yml
 index.html
 │
 ▼
Build Custom Image
 docker build -t ajaykumar91/custom-nginx:v1 .
 │
 ▼
Check Docker Images
 docker images
 │
 ▼
Run Container
 docker compose up -d
 │
 ▼
Check Running Containers
 docker ps
 │
 ▼
Open Browser
 http://localhost:8080
 │
 ▼
Login to Docker Hub
 docker login
 │
 ▼
Push Image
 docker push ajaykumar91/custom-nginx:v1
 │
 ▼
Stop Container
 docker compose down
```

---

# Step-by-Step Commands

## 1 Create Project Folder

```bash
mkdir nginx-docker-task
cd nginx-docker-task
mkdir nginx-data
```

---

## 2 Create Files

```bash
touch Dockerfile
touch docker-compose.yml
touch index.html
```

Edit files:

```bash
nano Dockerfile
nano docker-compose.yml
nano index.html
```

---

# 3 Dockerfile

```dockerfile
FROM nginx:latest

COPY index.html /usr/share/nginx/html/index.html

EXPOSE 80
```

---

# 4 docker-compose.yml

```yaml
version: '3'

services:

  nginx:
    image: ajaykumar91/custom-nginx:v1
    container_name: custom-nginx

    ports:
      - "8080:80"

    volumes:
      - ./nginx-data:/var/opt/nginx
```

---

# 5 Build Docker Image

```bash
docker build -t ajaykumar91/custom-nginx:v1 .
```

Check images:

```bash
docker images
```

---

# 6 Run Container

```bash
docker compose up -d
```

Check container:

```bash
docker ps
```

---

# 7 Access Nginx Page

Open browser:

```
http://localhost:8080
```

You should see the **custom Nginx HTML page**.

---

# 8 Login to Docker Hub

```bash
docker login
```

---

# 9 Push Image to Docker Hub

```bash
docker push ajaykumar91/custom-nginx:v1
```

---

# 10 Stop Container

```bash
docker compose down
```

---

# Volume Bind Mount

```
./nginx-data:/var/opt/nginx
```

This means:

| Host Path    | Container Path |
| ------------ | -------------- |
| ./nginx-data | /var/opt/nginx |

---

# Output

* Custom Nginx Docker image created
* Container deployed using Docker Compose
* Bind mount volume configured
* Image pushed to Docker Hub

<img width="1918" height="967" alt="image" src="https://github.com/user-attachments/assets/ef018bdc-b2c9-4d78-b0f9-e534e7e48891" />

<img width="1915" height="971" alt="image" src="https://github.com/user-attachments/assets/4ecd4fb2-10ed-4d0d-b0c5-cfc64b81dce0" />





**Ajay Kumar**
DevOps Practice Project
