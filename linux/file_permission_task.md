
Create a file:
sudo touch /home/demo.txt

Change permissions:
sudo chmod 764 /home/demo.txt
chmod u+x demo.txt


Check permissions:
ls -l /home/demo.txt





Permission meaning:
Owner  : read, write, execute
Group  : read, write
Others : read only

More examples


chmod g+w demo.txt   # add write to group
chmod o-r demo.txt   # remove read from others
chmod a+x demo.txt   # add execute to all
