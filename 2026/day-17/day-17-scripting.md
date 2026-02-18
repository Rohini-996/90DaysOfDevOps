### Day 17 of #90DaysOfDevOpsChallenge
### Today's Focus is on shell scripting Concepts

### Today's Task 
```
Task 1: For Loop
Create for_loop.sh that:
Loops through a list of 5 fruits and prints each one
Create count.sh that:
Prints numbers 1 to 10 using a for loop
```
<img width="820" height="100" alt="Screenshot 2026-02-18 131313" src="https://github.com/user-attachments/assets/65c6ffa0-c2da-46a0-94d0-0d390688d878" />
<img width="761" height="200" alt="Screenshot 2026-02-18 131410" src="https://github.com/user-attachments/assets/644a04d4-91ae-430b-a51f-35c98d0f1600" />

```
Task 2: While Loop
Create countdown.sh that:
Takes a number from the user
Counts down to 0 using a while loop
Prints "Done!" at the end
```
<img width="761" height="200" alt="Screenshot 2026-02-18 131410" src="https://github.com/user-attachments/assets/6013c04e-2e16-45a2-b0e2-3a0ead68de36" />

```
Task 3: Command-Line Arguments
Create greet.sh that:

Accepts a name as $1
Prints Hello, <name>!
If no argument is passed, prints "Usage: ./greet.sh "
Create args_demo.sh that:

Prints total number of arguments ($#)
Prints all arguments ($@)
Prints the script name ($0)
```
<img width="868" height="100" alt="Screenshot 2026-02-18 131722" src="https://github.com/user-attachments/assets/0fdff190-2312-4a23-bbc4-4b3d1a162857" />
<img width="1058" height="80" alt="Screenshot 2026-02-18 132001" src="https://github.com/user-attachments/assets/9cee7e81-bf2b-4d83-9ec9-78a410e7c27d" />

```
Task 4: Install Packages via Script
Create install_packages.sh that:
Defines a list of packages: nginx, curl, wget
Loops through the list
Checks if each package is installed (use dpkg -s or rpm -q)
Installs it if missing, skips if already present
Prints status for each package
Run as root: sudo -i or sudo su
```
<img width="1056" height="115" alt="Screenshot 2026-02-18 132150" src="https://github.com/user-attachments/assets/f8734e63-8d7a-448d-bd14-b1353c80f196" />

```
Task 5: Error Handling
Create safe_script.sh that:
Uses set -e at the top (exit on error)
Tries to create a directory /tmp/devops-test
Tries to navigate into it
Creates a file inside
Uses || operator to print an error if any step fails
```
<img width="897" height="52" alt="Screenshot 2026-02-18 132328" src="https://github.com/user-attachments/assets/33b9aea1-35de-4b39-a82f-c736f70531a3" />

### What I Learned Today
- How loops work in Bash
- How to accept user input
- How command-line arguments work
- How to automate package installation
- How to handle errors safely in scripts



















