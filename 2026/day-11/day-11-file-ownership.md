- Today is Day-11 of #90DaysOfDevOpsChallenge 

- Today's goal is master file and directory ownership in Linux.

# Task 1: Understanding Ownership
```
1. Run ls -l in your home directory ,Identify the owner and group columns, Check who owns your files
Answer: -rw-r--r-- 1 ubuntu ubuntu   69 Feb  9 08:06 devops-file.txt
   Owner is ubuntu And Group is also ubuntu, Ubuntu user owns the file
2. Document: What's the difference between owner and group?
Answer:  Owner: The user who owns the file and has primary control over its permissions.
         Group: A set of users who share specific permissions on the file.
```

# Task 2: Basic chown Operations 
```
1. Create file devops-file.txt, Check current owner: ls -l devops-file.txt, Change owner to tokyo,
   Verify the changes
Answer: . ls -l 
        . -rw-r--r-- 1 tokyo  ubuntu   69 Feb  9 08:06 devops-file.txt
```
# Task 3: Basic chgrp Operations (15 minutes)
```
1. Create file team-notes.txt, Check current group: ls -l team-notes.txt, Create group: sudo groupadd heist-team,
   Change file group to heist-team, Verify the change
- Answer: Current output
         -rw-r--r-- 1 ubuntu ubuntu 0 Feb  9 08:16 team-notes.txt
          After adding group heist-team output
         -rw-r--r-- 1 ubuntu heist-team 0 Feb  9 08:16 team-notes.txt
```

# Task 4: Combined Owner & Group Change
```
1. Create file project-config.yaml, change owner to professor and group to heist-team in one command
Answer:  Before change:
         -rw-r--r-- 1 ubuntu ubuntu 0 Feb  9 08:20 project-config.yaml
          After using sudo chown professor:heist-team project-config.yaml:
          -rw-r--r-- 1 professor heist-team 0 Feb  9 08:20 project-config.yaml
2. Create directory app-logs/, change owner to berlin and group to heist-team
Answer:  After ownership change:
         drwxr-xr-x 2 berlin heist-team 4096 Feb  9 08:22 app-logs/
```
# Task 5: Recursive Ownership
```
1. Create directory structure and files, Create group planners, Change ownership of entire heist-project/ directory recursively
Answer: After running:
        sudo chown -R professor:planners heist-project/
```
```
- Verification output:
- heist-project/:
ubuntu@LAPTOP-6F2K1CME:~/heist-project$ ls -l
total 8
drwxr-xr-x 2 professor planners 4096 Feb  9 08:49 plans
drwxr-xr-x 2 professor planners 4096 Feb  9 08:49 vault
```
```
ubuntu@LAPTOP-6F2K1CME:~/heist-project/vault$ ls -l
total 0
-rw-r--r-- 1 professor planners 0 Feb  9 08:49 gold.txt
```
```
ubuntu@LAPTOP-6F2K1CME:~/heist-project/plans$ ls -l
total 0
-rw-r--r-- 1 professor planners 0 Feb  9 08:49 strategy.conf
```

# Task 6: Practice Challenge
```
1. Create users tokyo, berlin, nairobi, Create groups vault-team, tech-team, Create directory bank-heist/ and files
   Set different ownership for each file
Answer:
. After setting ownership:
ubuntu@LAPTOP-6F2K1CME:~/bank-heist$ ls -l
total 0
-rw-r--r-- 1 ubuntu  ubuntu     0 Feb  9 08:53 access-codes.txt
-rw-r--r-- 1 berlin  tech-team  0 Feb  9 08:53 blueprints.pdf
-rw-r--r-- 1 nairobi vault-team 0 Feb  9 08:53 escape-plan.txt
```




