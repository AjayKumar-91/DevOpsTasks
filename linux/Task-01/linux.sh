#!/bin/bash

mkdir my_folder
cd my_folder

echo "This is my_file content" > my_file.txt
echo "This is another_file content" > another_file.txt

cat another_file.txt >> my_file.txt

echo "Updated my_file.txt content:"
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
