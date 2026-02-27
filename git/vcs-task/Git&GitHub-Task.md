**1. Create a New Directory & Script Files (Local Machine)**

mkdir vcs-task

cd vcs-task


**Create some shell scripts:**

touch app.sh deploy.sh test.sh


**Add simple content:**

echo "echo Running App" > app.sh

echo "echo Deploying App" > deploy.sh

echo "echo Testing App" > test.sh


**2. Initialize Local Git Repository**

git init

**Check status:**

git status

**Add & commit files:**

git add .

git commit -m "Initial commit with shell scripts."


<img width="1600" height="858" alt="image" src="https://github.com/user-attachments/assets/eb81dcd4-40ad-445f-a60c-d8b4b80c7f52" />


**Link Local Repo to GitHub & Push**

git branch -M main
git remote set-url origin git@github.com:AjayKumar-91/vcs-task.git
git push -u origin main


**Branching for Merge & Rebase Practice**

**Create a feature branch:**
git checkout -b feature-login

**Modify file:**
echo "echo Login Feature Added" >> app.sh
git add app.sh
git commit -m "Add login feature."

**Switch back to main:**
git checkout main

<img width="1600" height="865" alt="image" src="https://github.com/user-attachments/assets/f022ab20-f50b-4d1b-8c21-4c44552d6422" />

**Create another change on main:**
echo "echo Hotfix applied" >> deploy.sh
git add deploy.sh
git commit -m "Hotfix in deploy script"

**Merge Operation**

**Merge feature branch into main:**
git merge feature-login

<img width="1600" height="868" alt="image" src="https://github.com/user-attachments/assets/01a8c6c5-ee5b-469f-992d-ce9349199b6e" />


**If conflict happens:**
git status
# Fix file manually
git add .
git commit -m "Resolve merge conflict"

**Rebase Operation**

**Create another branch:**
git checkout -b feature-ui


<img width="1600" height="852" alt="image" src="https://github.com/user-attachments/assets/d2c09d7c-cba8-415f-9f8a-a9e9d36fc9eb" />


**Make change:**
echo "echo UI update" >> app.sh
git add app.sh
git commit -m "UI update"

**Rebase onto main:**
git rebase main

**If conflict:**

# Fix conflict
git add app.sh
git rebase --continue

<img width="1600" height="860" alt="image" src="https://github.com/user-attachments/assets/7a351e1e-52d7-40c7-98bf-23e1e81ecbf3" />



**Push rebased branch:**
git checkout main
git merge feature-ui


**Stash Operation**

**Make temporary changes:**
echo "echo Temporary debug" >> test.sh

git status

**Stash changes:**
git stash

**Check stash list:**
git stash list

**Or remove stash after applying:**
git stash pop


<img width="1600" height="858" alt="image" src="https://github.com/user-attachments/assets/01fa71e4-bfc9-494e-bfaa-aa819c534a04" />
