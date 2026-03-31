# 📂 File Creation Task (Shell Script)

## 🧾 Task Description

* Create a directory `my_folder`
* Navigate into it
* Create files and add content
* Concatenate files
* Create multiple files
* Rename some files
* Display latest files

---

## 🚀 Step-by-Step Commands

### 🔹 1. Create directory and navigate into it

```bash
mkdir my_folder
cd my_folder
```

---

### 🔹 2. Create `my_file.txt`

```bash
echo "This is my_file content" > my_file.txt
```

---

### 🔹 3. Create `another_file.txt`

```bash
echo "This is another_file content" > another_file.txt
```

---

### 🔹 4. Concatenate content

```bash
cat another_file.txt >> my_file.txt
```

---

### 🔹 5. Display updated content

```bash
cat my_file.txt
```

---

### 🔹 6. List all files

```bash
ls -l
```

---

### 🔹 7. Create 20 `.txt` files

```bash
for i in {1..20}
do
  touch file$i.txt
done
```

---

### 🔹 8. Rename first 5 files to `.yml`

```bash
for i in {1..5}
do
  mv file$i.txt file$i.yml
done
```

---

### 🔹 9. Show latest 5 files

```bash
ls -lt | head -5
```

---

## 🧠 Complete Script Version

```bash
#!/bin/bash

mkdir my_folder
cd my_folder

echo "This is my_file content" > my_file.txt
echo "This is another_file content" > another_file.txt

cat another_file.txt >> my_file.txt

echo "Updated content:"
cat my_file.txt

echo "All files:"
ls -l

for i in {1..20}
do
  touch file$i.txt
done

for i in {1..5}
do
  mv file$i.txt file$i.yml
done

echo "Latest 5 files:"
ls -lt | head -5
```

---

## ✅ Output Summary

* Directory created: `my_folder`
* Files created: `my_file.txt`, `another_file.txt`, `file1.txt` → `file20.txt`
* Renamed: `file1.yml` → `file5.yml`
* Concatenated content displayed
* Latest 5 files listed

---
