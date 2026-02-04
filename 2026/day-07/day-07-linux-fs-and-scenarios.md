Today is day-07 of #90DaysOfDevOpsChallenge 

Today's goal is to understand where things live in Linux and practice troubleshooting like a DevOps engineer.

I have to create notes covering:

- Linux File System Hierarchy
- Practice solving real-world scenarios step by step

There are mainly two parts of this assignment are there:

## Part 1: Linux File System Hierarchy
- Root Commands 
1. / (root) –
Answer: This is the starting point of everything in Linux. All files and folders live under this.
I would use this when I need to understand where all files and directories start in Linux.

2. /home –
. Answer: This is where normal users’ files are stored (documents, downloads, projects).
. Example: /home/rohini
. I would use this when I’m working with a normal user’s personal files and projects.

3. /root –
. Answer: This is the home folder of the root (admin) user.
. Different from /home and usually restricted.
. I would use this when I’m logged in as the root user and managing system-level tasks.

4. /etc –
. Answer: Contains system configuration files.
. Used to control how services and the OS behave.
. I would use this when I need to view or change configuration files for services.

8. /var/log –
. Answer: Stores log files from the system and services.
. Very important for debugging and troubleshooting in DevOps.
. I would use this when I’m troubleshooting issues by checking application or system logs.

9. /tmp –
. Answer: Used for temporary files created by applications.
. Files here are usually deleted automatically after restart.
. I would use this when an application needs short-term files that don’t need to be saved permanently.

## Part 2: Scenario-Based Practice
# Scenario 1: Service Not Starting

```
A web application service called 'myapp' failed to start after a server reboot.
What commands would you run to diagnose the issue?
Write at least 4 commands in order.
```
. Step 1:  First i will check the service is running or failed
- Command = systemctl status myapp
- Why this command? It shows if the service is active, failed, or stopped

. Step 2: Then check: What do the logs say?
- Command = journalctl -u myapp -n 50
- Why this command? It shows logs where error happens

. Step 3: Check if service is enabled on boot
- Command = systemctl is-enabled myapp
- Why this command? To know if it will start automatically after reboot
. Then solve the particular issue

. Step 4: Again run 
- Command = systemctl status myapp 
- Why this command? It will show now my app is running or not
  
# Scenario 2: High CPU Usage
```
Your manager reports that the application server is slow.
You SSH into the server. What commands would you run to identify
which process is using high CPU?
```
. Step 1: Check live CPU usage
- Command = top
. Shows real-time CPU and memory usage
. Processes are sorted by CPU by default
. Press q to quit

. Step 2: List top CPU-consuming processes
- Command: ps aux --sort=-%cpu | head -10
- Shows top 10 processes using the most CPU
- Useful for quick checks

 . Step 3: 
- Identify the process name
- Note the PID of the process using high CPU

# Scenario 3: Finding Service Logs
```
A developer asks: "Where are the logs for the 'docker' service?"
The service is managed by systemd.
What commands would you use?
```
. Step 1: Check service status first
- systemctl status docker
- Confirms whether the service is running
- Shows recent log messages

. Step 2:  View last 50 log lines
- journalctl -u docker -n 50
- Shows recent logs only
- Good for quick debugging

. Step 3: Follow logs in real-time
- journalctl -u docker -f
- Similar to tail -f
- When to use this
- Service is failing
- Containers are not starting
- You need real-time logs during debugging

# Scenario 4: File Permissions Issue
```
A script at /home/user/backup.sh is not executing.
When you run it: ./backup.sh
You get: "Permission denied"
```
What commands would you use to fix this?

Step-by-step Solution

. Step 1: Check current permissions
- ls -l /home/user/backup.sh
- Example output:
- -rw-r--r-- backup.sh
- No x permission → cannot execute

. Step 2: Add execute permission
- chmod +x /home/user/backup.sh
- Adds execute permission to the file

. Step 3: Verify permissions
- ls -l /home/user/backup.sh
- Expected output:
- -rwxr-xr-x backup.sh
- x permission is now present

. Step 4: Run the script again
- ./backup.sh
- Script should now run successfully
