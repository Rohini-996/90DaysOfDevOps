## Day 23 - Git Branching & Working with GitHub

Today I learned about **Git branching and working with GitHub**.  
Branches allow developers to work on features or experiments without affecting the main code.

---

## Task 1: 
## 1. Understanding Branches

### What is a branch in Git?

A **branch** is a separate line of development that allows you to work on changes without affecting the main project.

---

### Why do we use branches instead of committing everything to main?

Branches allow developers to **develop features safely**, test changes, and merge them later without breaking the main code.

---

### What is HEAD in Git?

**HEAD** is a pointer that shows the **current branch and latest commit you are working on**.

---

### What happens to files when you switch branches?

When switching branches, Git **updates your working directory** to match the files from that branch.

---

## Task 2:
## 2. Git Branching Commands

### List all branches

Shows all branches in the repository.

```bash
git branch
```

---

### Create a new branch

Creates a new branch called `feature-1`.

```
git branch feature-1
```

---

### Switch to a branch

Moves to the specified branch.

```
git checkout feature-1
```

or using modern command:

```
git switch feature-1
```

---

### Create and switch branch in one command

Creates `feature-2` and switches to it.

```
git checkout -b feature-2
```

---

### Make a commit on a branch

```
git add .
git commit -m "Add changes in feature branch"
```

---

### Switch back to main branch

```
git switch main
```

---

### Delete a branch

Deletes an unused branch.

```
git branch -d feature-2
```

---

## Task 3:
## 3. Push Repository to GitHub

### Add GitHub remote repository

Connect local repository to GitHub.

```
git remote add origin https://github.com/username/devops-git-practice.git
```

---

### Push main branch to GitHub

```
git push -u origin main
```

---

### Push feature branch

```
git push -u origin feature-1
```

---

### View remote repositories

```
git remote -v
```

---

### Difference between origin and upstream

| Term | Meaning |
|-----|------|
| origin | Default name for your remote repository |
| upstream | Original repository you forked from |

---

## Task 4:
## 4. Pull Changes from GitHub

### Pull latest changes

Downloads and merges changes from GitHub.

```
git pull origin main
```

---

### Fetch changes

Downloads updates but does not merge them.

```
git fetch
```

---

### Difference between fetch and pull

| Command | Description |
|------|------|
| git fetch | Downloads changes but does not merge |
| git pull | Fetches changes and merges automatically |

---

## Task 5:
## 5. Clone vs Fork

### Clone Repository

Creates a local copy of a GitHub repository.

```
git clone https://github.com/user/repo.git
```

---

### Fork Repository

A **fork** creates your own copy of someone else's repository on GitHub.

---

### Difference between Clone and Fork

| Feature | Clone | Fork |
|------|------|------|
| Location | Local machine | GitHub account |
| Purpose | Work locally | Contribute to someone else's project |

---

### When to use Clone vs Fork

Clone → When you just want a **local copy of a repo**.  
Fork → When you want to **contribute to someone else's project**.

---

### Sync fork with original repository

Add upstream repository.

```
git remote add upstream https://github.com/original/repo.git
```

Fetch updates.

```
git fetch upstream
```

Merge updates.

```
git merge upstream/main
```

---

## 6. Summary

Today I learned:

- What Git branches are
- How to create and switch branches
- How to push branches to GitHub
- Difference between **origin and upstream**
- Difference between **git fetch and git pull**
- Difference between **clone and fork**

Git branching makes it easy to work on **features without breaking the main code**.

---
