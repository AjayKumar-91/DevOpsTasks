**Docker Task on AWS EC2**

**1. Launch an EC2 Instance**

Go to AWS Console → EC2 → Launch Instance

Choose:

AMI: Amazon Linux 2 (recommended)

Instance type: t2.micro (Free Tier)

Configure:

Create / select key pair

Security Group → Allow SSH (22)

Launch the instance

ssh -i key.pem ec2-user@<EC2-PUBLIC-IP>

<img width="1600" height="706" alt="image" src="https://github.com/user-attachments/assets/4579c881-98b9-4865-8513-ad719055b07e" />


<img width="1600" height="863" alt="image" src="https://github.com/user-attachments/assets/46db217d-2a86-4cc2-a453-34714ef04d92" />



**2.   Install Docker on EC2**

sudo apt update -y

sudo apt install docker -y

Start & enable Docker:

sudo systemctl start docker

sudo systemctl enable docker

sudo systemctl status docker

Verify:

docker --version

<img width="1600" height="473" alt="image" src="https://github.com/user-attachments/assets/d5121cff-911c-4479-8b1c-99c0fb7c75a7" />

<img width="1237" height="774" alt="image" src="https://github.com/user-attachments/assets/05d52f6c-749e-4c7b-b9aa-5ba8b76e59a7" />


**3. Explore Docker Images**

Check available images:

docker images

Pull an image:

docker pull nginx

Remove image:

docker rmi nginx

<img width="1026" height="604" alt="image" src="https://github.com/user-attachments/assets/8547877f-5dfa-4d3e-91bc-0b13e3379e08" />


**4. Explore Docker Containers**

Run a container:

docker run -d -p 80:80 --name web-nginx

List running containers:

docker ps

List all containers:

docker ps -a

<img width="1600" height="386" alt="image" src="https://github.com/user-attachments/assets/e68eda16-63fa-4893-a67e-1c619b73509f" />


Stop & remove:

docker stop c992ac884f18 && docker rm c992ac884f18

<img width="1373" height="430" alt="image" src="https://github.com/user-attachments/assets/a605c83c-cafc-4406-9da5-f5ca177159d0" />


**5. Explore Docker Volumes**

Create a volume:

docker volume create my-neginx-volume

List volumes:

docker volume ls

Inspect volume:

docker volume inspect my-neginx-volume

Run container with volume:

docker run -d -v my-neginx-volume:/usr/share/nginx/html -p 8080:80 nginx

<img width="1600" height="477" alt="image" src="https://github.com/user-attachments/assets/4c682c7f-cfab-4b05-b4b9-8476cc9a621b" />


<img width="1594" height="334" alt="image" src="https://github.com/user-attachments/assets/218d5e2e-a26f-44ad-9904-83670383f57f" />



**6. Explore Docker Networks**

   List networks:

   docker network ls

   Create a custom network:

   docker network create my-nginx-network

   Run containers in the same network:

   docker run -d --name app1 --network my-nginx-network nginx
   
  docker run -d --name app2 --network my-nginx-network nginx

  <img width="1191" height="235" alt="image" src="https://github.com/user-attachments/assets/320f868c-b5f3-435e-917c-f18112804e70" />


Inspect network:

docker network inspect my-nginx-network

<img width="1600" height="861" alt="image" src="https://github.com/user-attachments/assets/ee215932-8e7f-410f-a199-a0d10cd3b435" />



| Command                            | Purpose                  |
| ---------------------------------- | ------------------------ |
| `docker info`                      | Docker system info       |
| `docker logs <container>`          | View logs                |
| `docker exec -it <container> bash` | Enter container          |
| `docker system df`                 | Disk usage               |
| `docker system prune`              | Cleanup unused resources |


**Expected Learning Outcome**

 Install Docker on AWS EC2

 Understand Images, Containers, Volumes, Networks

 Run & manage containers in cloud

 Hands-on DevOps fundamentals

   
