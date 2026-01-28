Set permission with a numeric value
r (read) = 4
w (write) = 2
x (execute) = 1

Step 1: Create the file

touch /home/demo.txt


Step 2: Change file permissions

chmod 764 /home/demo.txt


Step 3: Check permissions (optional)
ls -l /home/demo.txt


<img width="685" height="204" alt="image" src="https://github.com/user-attachments/assets/766f6762-82c2-4fc2-bba4-bb82465ffa0f" />


You will see something like:
-rwxrw-r-- 1 root root 0 Jan 28 17:09 /home/demo.txt


Permission breakdown

rwx  → owner
rw-  → group
r--  → others


What does 764 mean? (Beginner)

7 (owner) → read, write, execute

6 (group) → read, write

4 (others / any user) → read only
