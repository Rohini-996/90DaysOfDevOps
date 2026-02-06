Day 09 – Linux User & Group Management 🐧

Today’s challenge was all about real Linux admin work — managing users, groups, and permissions just like in real servers.

Goal of the Day

Learn how to:

Create users and groups

Assign users to multiple groups

Manage shared directories

Fix permission issues using Linux basics

👤 Users Created

tokyo

berlin

professor

nairobi

✔️ Home directories created
✔️ Passwords set
✔️ Verified via /etc/passwd and /home

👥 Groups Created

developers

admins

project-team

✔️ Verified using /etc/group

🔗 Group Assignments
User	Groups
tokyo	developers, project-team
berlin	developers, admins
professor	admins
nairobi	project-team

✔️ Checked using groups username

📁 Shared Directories
1. Developer Project

Path: /opt/dev-project

Group: developers

Permissions: 775 (rwxrwxr-x)

✅ Tested by creating files as:

tokyo

berlin

2. Team Workspace

Path: /opt/team-workspace

Group: project-team

Permissions: 775

```
🛠️ Commands Used
# Create users
sudo useradd -m tokyo
sudo useradd -m berlin
sudo useradd -m professor
sudo useradd -m nairobi
```
```
# Set passwords
sudo passwd tokyo
sudo passwd berlin
sudo passwd professor
sudo passwd nairobi
```
```
# Create groups
sudo groupadd developers
sudo groupadd admins
sudo groupadd project-team
```
```
# Assign users to groups
sudo usermod -aG developers tokyo
sudo usermod -aG developers,admins berlin
sudo usermod -aG admins professor
sudo usermod -aG project-team nairobi
sudo usermod -aG project-team tokyo
```
```
# Create directories
sudo mkdir /opt/dev-project
sudo mkdir /opt/team-workspace
```
```
# Set group & permissions
sudo chgrp developers /opt/dev-project
sudo chmod 775 /opt/dev-project
```
```
sudo chgrp project-team /opt/team-workspace
sudo chmod 775 /opt/team-workspace
```
```
# Test access
sudo -u tokyo touch /opt/dev-project/test.txt
sudo -u nairobi touch /opt/team-workspace/test.txt
```
What I Learned

Linux access is controlled by users + groups + permissions

One user can belong to multiple groups

Shared folders work smoothly when group ownership is set correctly

Permission denied errors are usually group or permission issues

🧠 Troubleshooting Tips

❌ Permission denied? → Check chmod and chgrp

❌ User can’t access folder? → Check groups username

❌ Forgot sudo? → Most admin tasks need it 😉
