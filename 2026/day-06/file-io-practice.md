# This is Day-06 of #90DaysOfDevOpsChallenge 

## Output
Practice basic file input/output using fundamental Linux commands.

## File named
I have to create a empty file called notes.txt 
Command = touch notes.txt

## Commands Practiced

### 1. Create an empty file
touch notes.txt  
Creates a new empty file named notes.txt.

### 2. Write text to the file
echo "Line 1: Linux is very powerful OS" > notes.txt  
Writes the first line to the file. (`>` overwrites content)

### 3. Append a new line
echo "Line 2: Files are easy to manage" >> notes.txt  
Adds a second line without removing existing data.

### 4. Write and display at the same time
echo "Line 3: Practice makes perfect" | tee -a notes.txt  
Displays the line and appends it to the file.

### 5. Read the full file
cat notes.txt  
Displays all content of the file.

### 6. Read first lines
head -n 2 notes.txt  
Shows the first 2 lines.

### 7. Read last lines
tail -n 2 notes.txt  
Shows the last 2 lines.

## Outcome
- Learned basic file creation
- Practiced writing and appending text
- Read full and partial file content
