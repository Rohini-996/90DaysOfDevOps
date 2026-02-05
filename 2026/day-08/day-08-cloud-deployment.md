Today is day-08 of #90DaysOfDevOpsChallenge

Day 08 – Cloud Server Setup 

Today was all about doing real cloud DevOps work — not theory.

The goal was simple:
- Launch a cloud server
- Deploy a web server
- Make it accessible to the public internet

This is exactly what happens in real production environments.

What I Did Today 
1. Launched a Cloud Instance
- Created a Linux instance on AWS EC2
- Choose a basic Ubuntu image
- Configured SSH access using a key pair

2. Connected via SSH 
- Connected to the server from my local machine:
- ssh -i "Day-8-Nginx.pem" ubuntu@ec2-18-219-109-108.us-east-2.compute.amazonaws.com

3. Installed Nginx 
. Installed and started the web server:
- sudo apt update
- sudo apt install nginx -y
- sudo systemctl start nginx


. Checked status:
- systemctl status nginx
- ✔️ Nginx running successfully

4. Opened Port 80 (Web Access) 🔓
- Updated security group / firewall
- Allowed HTTP (port 80) from anywhere
- This step is critical — without it, the website won’t load.

5. Verified Website from Browser 🌐
- Opened the server’s public IP in a browser:
- http://18.219.109.108
- Nginx welcome page loaded successfully

6. Extracted Nginx Logs 🧾
- Saved access logs to a file:
- sudo cat /var/log/nginx/access.log > nginx-logs.txt
- Logs captured successfully
