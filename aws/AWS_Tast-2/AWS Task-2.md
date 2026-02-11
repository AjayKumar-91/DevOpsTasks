Architecture (What we are building)

VPC: 10.0.0.0/16

Public Subnet: 10.0.1.0/24 → 256 IPs

Private Subnet: 10.0.2.0/24 → 256 IPs

Internet Gateway attached to VPC

Route Table connecting IGW → Public Subnet

Linux EC2 launched in Public Subnet



Step 1: Create a VPC

<img width="1600" height="735" alt="image" src="https://github.com/user-attachments/assets/a27a1806-d120-4a64-9993-14e58a356c72" />

<img width="1600" height="737" alt="image" src="https://github.com/user-attachments/assets/e6cd3933-5e35-44f2-868e-6532ab3fd22e" />

<img width="1600" height="722" alt="image" src="https://github.com/user-attachments/assets/ee756765-ef0b-4be7-b870-67a6659cbd55" />



Step 2: Create Internet Gateway (IGW)

<img width="1600" height="706" alt="image" src="https://github.com/user-attachments/assets/b82aa4f4-e9a7-4b7f-b253-86f39c7593b9" />

<img width="1600" height="728" alt="image" src="https://github.com/user-attachments/assets/a5ae36f1-9c23-469e-a9e4-e1417511bb65" />

<img width="1600" height="708" alt="image" src="https://github.com/user-attachments/assets/5507c512-d277-4156-a09f-a4f8a47dcdac" />

<img width="1600" height="732" alt="image" src="https://github.com/user-attachments/assets/e7bd2748-48e6-40a6-ab38-72cef52d2eca" />


Step 3: Create Public Subnet (256 IPs)

<img width="1599" height="729" alt="image" src="https://github.com/user-attachments/assets/25109aed-dbbc-4255-82b5-33ec72f56e93" />

<img width="1600" height="711" alt="image" src="https://github.com/user-attachments/assets/aea931c6-c0bd-4e2a-acfd-fbee39ca8fbe" />

<img width="1600" height="707" alt="image" src="https://github.com/user-attachments/assets/3c9e14ce-547e-4c67-9049-929acfec7d3d" />

<img width="1600" height="712" alt="image" src="https://github.com/user-attachments/assets/2a664fea-cf53-45d6-baaa-f73a97398203" />


Step 4: Create Private Subnet (256 IPs)


<img width="1600" height="710" alt="image" src="https://github.com/user-attachments/assets/84f46dad-85ed-4dfe-9f24-1925f62ef645" />

<img width="1597" height="706" alt="image" src="https://github.com/user-attachments/assets/17893b90-ecc1-4dce-a4ff-8138a60b357c" />

<img width="1598" height="703" alt="image" src="https://github.com/user-attachments/assets/db78ad83-ce9b-47fb-b05d-c0ea0c1f3e00" />



Step 5: Create a Route Table for Public Subnet


<img width="1600" height="702" alt="image" src="https://github.com/user-attachments/assets/8de78e13-5cbc-4549-9705-a9986f8b7296" />

<img width="1600" height="707" alt="image" src="https://github.com/user-attachments/assets/36c267af-9cd0-41bd-9f2d-f57feb761d12" />

<img width="1600" height="683" alt="image" src="https://github.com/user-attachments/assets/0ed3ad0e-a205-4dc5-b386-919d12f5abae" />



Step 6: Associate Route Table with Public Subnet

<img width="1600" height="704" alt="image" src="https://github.com/user-attachments/assets/99f7f83f-5e56-4737-8b01-b9e201cad4e8" />

<img width="1600" height="735" alt="image" src="https://github.com/user-attachments/assets/49a6ab5b-c98d-4eb3-bc8f-5ffbf56e69d8" />

<img width="1600" height="708" alt="image" src="https://github.com/user-attachments/assets/6f708a04-9ba7-49d5-9353-9f29525d7628" />

<img width="1599" height="712" alt="image" src="https://github.com/user-attachments/assets/3d5c28a2-34b5-48c3-b450-8126a9e39539" />



Step 7: Enable Auto-Assign Public IP (Important)

<img width="1600" height="706" alt="image" src="https://github.com/user-attachments/assets/675851b4-3111-4d98-bc4c-5095c1256f1e" />

<img width="1600" height="709" alt="image" src="https://github.com/user-attachments/assets/1d2a0bff-9b9c-4886-978e-282f0dac07d4" />


Step 8: Launch Linux EC2 in Public Subnet

<img width="1600" height="726" alt="image" src="https://github.com/user-attachments/assets/6d74f97d-ec4a-4d4a-9780-0ea554af948d" />

<img width="1600" height="703" alt="image" src="https://github.com/user-attachments/assets/b9cd9b72-f02c-4569-9705-a8dcd2b5898e" />

<img width="1600" height="710" alt="image" src="https://github.com/user-attachments/assets/2e71f088-5173-457b-be7b-fc42d7acf70d" />

<img width="624" height="575" alt="image" src="https://github.com/user-attachments/assets/248cb5fd-9428-4189-a64f-85b2fb59cb63" />

<img width="1600" height="708" alt="image" src="https://github.com/user-attachments/assets/ae47c6ff-7d88-493a-aac2-b79d1471bdd4" />

<img width="1600" height="703" alt="image" src="https://github.com/user-attachments/assets/85a011df-414d-492a-ba10-b7d2e857c041" />

<img width="1600" height="706" alt="image" src="https://github.com/user-attachments/assets/decde0a3-5834-402d-ac61-bdebc42d6c1a" />

<img width="1600" height="714" alt="image" src="https://github.com/user-attachments/assets/a152577c-ec0d-470a-9b09-19b0d0e8432a" />

<img width="1600" height="856" alt="image" src="https://github.com/user-attachments/assets/3d31fdbf-4e9c-4465-a7d0-3a4b41ddcfc3" />


<img width="1600" height="859" alt="image" src="https://github.com/user-attachments/assets/58f83d98-e4ef-4295-a2f6-b81e38edd80d" />

