<img width="992" height="520" alt="image" src="https://github.com/user-attachments/assets/7a13bb7d-2ece-4de9-9dc0-afde75b8c66a" />




<img width="950" height="400" alt="image" src="https://github.com/user-attachments/assets/30df2b7e-508f-4a2b-8c85-d6707d0eb397" />


curl -I -s https://www.guvi.in → fetches only the headers silently.

awk 'NR==1 {print $2}' → extracts the HTTP status code from the first header line.

If the code is 200, it prints “SUCCESS”; otherwise, it prints “FAILURE”.



