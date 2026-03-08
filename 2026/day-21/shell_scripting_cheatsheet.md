### Day 21 of #90DaysOfDevOpsChallenge 
### Shell Scripting Cheat Sheet

Quick reference for common **Bash shell scripting** commands and syntax.

---

## Quick Reference

| Topic | Syntax | Example |
|------|------|------|
| Variable | `VAR=value` | `NAME="DevOps"` |
| Argument | `$1 $2` | `./script.sh file.txt` |
| If | `if [ condition ]` | `if [ -f file ]` |
| Loop | `for i in list` | `for i in 1 2 3` |
| Function | `name(){}` | `greet(){}` |
| Grep | `grep pattern file` | `grep error log.txt` |

---

## 1. Basics

### Shebang
Defines which shell should execute the script.

```bash
#!/bin/bash
```

### Run Script
Give execute permission and run the script.

```bash
chmod +x script.sh
./script.sh
```

### Comments
Used to explain code inside scripts.

```bash
# This is a comment
```

### Variables
Store values used inside scripts.

```bash
NAME="Rohini"
echo $NAME
```

### User Input
`read` takes input from the user.

```bash
read NAME
echo "Hello $NAME"
```

### Command Arguments
Used to pass values when running scripts.

```bash
$0  # script name
$1  # first argument
$#  # number of arguments
$@  # all arguments
$?  # last command status
```

Example:

```bash
echo "First arg: $1"
```

---

## 2. Operators and Conditionals

### String Comparison
Compares two text values.

```bash
[ "$a" = "$b" ]
[ -z "$var" ]   # empty
[ -n "$var" ]   # not empty
```

### Integer Comparison
Used for numeric comparisons.

```bash
[ $a -eq $b ]
[ $a -lt $b ]
[ $a -gt $b ]
```

### File Tests
Checks file properties.

```bash
-f file   # file exists
-d dir    # directory exists
-r file   # readable
-w file   # writable
```

### If Statement
Runs code if condition is true.

```bash
if [ condition ]; then
echo "True"
else
echo "False"
fi
```

### Logical Operators
Combine conditions.

```bash
&&   # AND
||   # OR
!    # NOT
```

### Case Statement
Used for multiple condition checks.

```bash
case $opt in
start) echo "Start";;
stop) echo "Stop";;
*) echo "Invalid";;
esac
```

---

## 3. Loops

### For Loop
Iterates through a list.

```bash
for i in 1 2 3
do
echo $i
done
```

### While Loop
Runs while condition is true.

```bash
i=1
while [ $i -le 5 ]
do
echo $i
((i++))
done
```

### Until Loop
Runs until condition becomes true.

```bash
until [ $i -gt 5 ]
do
echo $i
done
```

### Loop Control

```bash
break     # exit loop
continue  # skip iteration
```

### Loop Files

```bash
for file in *.log
do
echo $file
done
```

---

## 4. Functions

### Define Function
Functions group reusable code.

```bash
greet() {
echo "Hello"
}
```

### Call Function

```bash
greet
```

### Function Arguments

```bash
greet(){
echo "Hello $1"
}
```

### Local Variables

```bash
local var="value"
```

---

## 5. Text Processing

### grep
Search text patterns in files.

```bash
grep "error" log.txt
grep -i "error" log.txt
grep -n "error" log.txt
```

### awk
Process and print columns.

```bash
awk '{print $1}' file.txt
awk -F: '{print $1}' /etc/passwd
```

### sed
Edit and replace text.

```bash
sed 's/foo/bar/' file.txt
sed -i 's/foo/bar/g' file.txt
```

### cut
Extract columns from text.

```bash
cut -d: -f1 file.txt
```

### sort

```bash
sort file.txt
sort -n file.txt
```

### uniq

```bash
uniq file.txt
uniq -c file.txt
```

### tr

```bash
tr 'a-z' 'A-Z'
```

### wc
Count lines, words, characters.

```bash
wc -l file.txt
```

### head / tail

```bash
head -n 5 file.txt
tail -n 5 file.txt
```

---

## 6. Useful One-Liners

Delete files older than 7 days.

```bash
find . -type f -mtime +7 -delete
```

Count lines in log files.

```bash
wc -l *.log
```

Replace text in multiple files.

```bash
sed -i 's/old/new/g' *.txt
```

Check service status.

```bash
systemctl is-active nginx
```

Show errors from logs.

```bash
tail -f app.log | grep ERROR
```

---

## 7. Error Handling and Debugging

### Exit Code
Shows status of last command.

```bash
echo $?
```

### Exit Script

```bash
exit 0
exit 1
```

### Exit on Error

```bash
set -e
```

### Unset Variable Error

```bash
set -u
```

### Debug Mode

```bash
set -x
```

## This Cheatsheet helps you while debugging  
