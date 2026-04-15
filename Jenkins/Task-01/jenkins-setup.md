# Connect to EC2

<img width="1918" height="827" alt="image" src="https://github.com/user-attachments/assets/c94fe0f4-0ec3-4e1d-bcff-bd6fa3bca274" />

<img width="1917" height="801" alt="image" src="https://github.com/user-attachments/assets/984c923e-6199-4c51-bde5-4852da592ada" />


# Install Java (Required for Jenkins)

sudo apt update

sudo apt install openjdk-21-jdk -y

java -version

<img width="1170" height="115" alt="image" src="https://github.com/user-attachments/assets/b20a4fab-7923-408a-809e-25a2a93c3ac2" />


# Install Jenkins

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]  https://pkg.jenkins.io/debian binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt update

sudo apt install jenkins -y




# Start Jenkins

sudo systemctl start jenkins

sudo systemctl enable jenkins

## Check status:

sudo systemctl status jenkins

# Access Jenkins UI

<img width="1918" height="970" alt="image" src="https://github.com/user-attachments/assets/58485cf4-fccb-4c67-823b-3fba135236be" />


# Unlock Jenkins

sudo cat /var/lib/jenkins/secrets/initialAdminPassword



# Install Plugins

Click Install Suggested Plugins

Wait until installation completes

<img width="1912" height="970" alt="image" src="https://github.com/user-attachments/assets/8c95b73e-5faa-4f2c-a8b6-2540ed563541" />


# Create Admin User

Fill:

Username

Password

Email

<img width="1918" height="957" alt="image" src="https://github.com/user-attachments/assets/f8da85f2-4e6f-4f1d-b62d-44a1bfd736e5" />

<img width="1918" height="972" alt="image" src="https://github.com/user-attachments/assets/89b4729c-13fb-4a61-8ce0-7dfb073d828e" />


<img width="1918" height="972" alt="image" src="https://github.com/user-attachments/assets/6fb16f9f-49a6-4517-bd3d-fcc15b20dac3" />


# Create Jenkins Project (Job)

## Steps:

Dashboard → New Item

Enter name → my-first-job

Select → Freestyle Project

Click OK

<img width="1918" height="967" alt="image" src="https://github.com/user-attachments/assets/82f12109-4f85-4a57-a22d-45abe829e730" />


## Configure:

Scroll to Build Section

Click Execute Shell

## Add:

echo "Hello from Jenkins"

date


## Save & Run:

Click Build Now

Click build → Console Output

<img width="1918" height="961" alt="image" src="https://github.com/user-attachments/assets/f85f33b4-c623-428a-8658-29a54f4470e5" />

<img width="1918" height="962" alt="image" src="https://github.com/user-attachments/assets/dee55a21-0571-4d0c-a076-ab39c01bf3f7" />


# Create Users in Jenkins

## Steps:

Manage Jenkins → Manage Users

Click Create User

<img width="1918" height="971" alt="image" src="https://github.com/user-attachments/assets/27eabdc6-c108-49f4-95fe-590a814353c0" />


## Fill:

Username

Password

Full Name

Email

<img width="1918" height="968" alt="image" src="https://github.com/user-attachments/assets/7eda30d2-6e12-4904-99b0-5868aa414317" />


# Role-Based Access (Optional Advanced)

Manage Jenkins → Plugin Manager

<img width="1918" height="1017" alt="image" src="https://github.com/user-attachments/assets/6d48826d-b02e-4df2-a1da-9f93d38a7ba1" />


## Install:

Role-based Authorization Strategy

<img width="1918" height="1013" alt="image" src="https://github.com/user-attachments/assets/4fb04034-85ab-482c-9ecb-2eec503c0025" />


## Configure:

Manage Jenkins → Configure Global Security

Select Role-Based Strategy

## Assign roles:

Admin

Developer

Viewer



