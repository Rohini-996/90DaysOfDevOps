- Today is Day 10 of #90DaysOfDevOpsChallenge
- Today's goal is master file permissions and basic file operations in Linux.

# Task 1: Create Files
  1. touch devops.txt
  2. echo "This is my DevOps notes file" > notes.txt
  3. vim script.sh Inside vim echo "Hello DevOps"
  4. Verify files and permissions
```
-rw-r--r-- devops.txt
-rw-rw-r-- notes.txt
-rwxrw-r-- script.sh
```

# Task 2: Read Files
  
1. Read notes.txt using cat
- Answer: Command = cat notes.txt
2. View script.sh in vim read-only mode
- Answer: vim -R script.sh
3. Display first 5 lines of /etc/passwd using head
- Answer: head -n 5 /etc/passwd
4. Display last 5 lines of /etc/passwd using tail
- Answer: tail -n 5 /etc/passwd

# Task 3: Understand Permissions

1. Check your files: ls -l devops.txt notes.txt script.sh
Answer: What are current permissions? Who can read/write/execute?
```
-rw-r--r-- devops.txt
-rw-rw-r-- notes.txt
-rwxrw-r-- script.sh
```
- devops.txt = owner can read,write groups can read only and other have read only 
- notes.txt = owner can read,write groups can read,write and other have read only 
- script.sh = owner can read,write,execute groups can read,write and other have read only 

# Task 4: Make script.sh executable
Answer: - chmod +x script.sh
        - Run it:
        - ./script.sh
        - Output:
        - Hello DevOps


