## Day 22 – Introduction to Git

Today I started my Git journey. Git is the most important tool for version control in DevOps and software development.
It helps track changes, collaborate with teams, and maintain project history.

---

## 1. Install and Configure Git

## Check if Git is installed

`git --version`  
Shows the installed Git version.

Example:
```
git --version
```

---

## Configure Git username

`git config --global user.name "Your Name"`  
Sets your Git username.

```bash
git config --global user.name "Rohini"
```

---

## Configure Git email

`git config --global user.email "you@gmail.com"`  
Sets your Git email.

```bash
git config --global user.email "rohini@gmail.com"
```

---

## Verify configuration

`git config --list`  
Displays all Git configuration settings.

```bash
git config --list
```

---

## 2. Create Your Git Project

### Create project folder

```bash
mkdir devops-git-practice
cd devops-git-practice
```

Creates a new folder and moves inside it.

---

### Initialize Git repository

`git init`  
Creates a new Git repository in the current folder.

```bash
git init
```

---

### Check repository status

`git status`  
Shows file changes and staging status.

```bash
git status
```

---

### Explore .git folder

`.git` folder stores all Git history, commits, and configuration.

```bash
ls -a
```

---

## 3. Git Commands Reference

## Setup & Configuration

| Command | Description | Example |
|-------|-------------|--------|
| `git --version` | Shows Git version | `git --version` |
| `git config --global user.name` | Set username | `git config --global user.name "Rohini"` |
| `git config --global user.email` | Set email | `git config --global user.email "email"` |
| `git config --list` | View configuration | `git config --list` |

---

## Basic Workflow

| Command | Description | Example |
|-------|-------------|--------|
| `git init` | Create new repository | `git init` |
| `git add` | Add files to staging area | `git add file.txt` |
| `git commit` | Save staged changes | `git commit -m "message"` |

Example:

```bash
git add git-commands.md
git commit -m "Add git commands reference"
```

---
### viewing changes
Example:

```bash
git log --oneline
```

---

## 4. Stage and Commit Example

Stage file:

```bash
git add git-commands.md
```

Commit changes:

```bash
git commit -m "Add initial git commands"
```

View history:

```bash
git log --oneline
```

---

## 5. Git Workflow

Git workflow has three main stages:

1. **Working Directory** – where you edit files.
2. **Staging Area** – where you prepare files for commit.
3. **Repository** – where commits are stored permanently.

Workflow example:

```bash
edit file → git add → git commit
```

---

## 6. Understand the Git Workflow

### What is the difference between `git add` and `git commit`?

`git add` moves changes to the staging area, while `git commit` saves those staged changes permanently in the repository.

---

### What does the staging area do?

The staging area lets you choose which changes should be included in the next commit instead of committing everything at once.

---

### What information does `git log` show?

It shows commit history including commit ID, author, date, and commit message.

---

### What is the `.git` folder?

The `.git` folder stores all repository data like commits, branches, and configuration.  
If it is deleted, the project will no longer be a Git repository.

---

### Difference between working directory, staging area, and repository?

Working directory → where files are edited.  
Staging area → where files are prepared for commit.  
Repository → where committed changes are permanently stored.

---

## 7. Example Commit History

Example output of:

```bash
git log --oneline
```

```
a3f4c21 Update git commands
92ab341 Add git commands reference
1c2d3e4 Initial commit
```

---

### Day 22 Summary

Today I learned:

- What Git is and why it is important
- How to configure Git
- How to create a repository
- Git workflow (add → commit)
- How to view commit history

This is the start of my Git learning journey and I will keep updating my **Git commands reference** as I learn more.

---
