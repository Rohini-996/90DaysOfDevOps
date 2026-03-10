# Day 24 – Advanced Git: Merge, Rebase, Stash & Cherry Pick

Today I practiced advanced Git commands used in real development workflows such as **merge, rebase, stash, and cherry-pick**.

These commands help devops engineers combine branches, manage unfinished work, and move specific commits between branches.

---

# Task 1 – Git Merge

Git merge combines changes from one branch into another branch.

### Create branch
```
git checkout -b feature-login
```

### Add commits
```
git add .
git commit -m "Add login feature"
```

### Switch back to main
```
git switch main
```

### Merge branch
```
git merge feature-login
```

---

## What is a Fast-Forward Merge?

A **fast-forward merge** happens when the main branch has no new commits and Git simply moves the branch pointer forward.

---

## When does Git create a Merge Commit?

Git creates a **merge commit** when both branches have new commits and Git needs to combine their histories.

---

## What is a Merge Conflict?

A **merge conflict** happens when two branches modify the same line in a file and Git cannot decide which change to keep.

Example fix:

```
git add file.txt
git commit
```

---

# Task 2 – Git Rebase

Rebase moves commits from one branch to another base commit.

### Create branch
```
git checkout -b feature-dashboard
```

### Add commits
```
git add .
git commit -m "Add dashboard feature"
```

### Update main branch
```
git switch main
git commit -am "Update main branch"
```

### Rebase feature branch
```
git switch feature-dashboard
git rebase main
```

---

## What does Rebase do?

Rebase **moves or replays your commits on top of another branch**, creating a cleaner commit history.

---

## How is history different from Merge?

| Merge | Rebase |
|------|------|
| Keeps branch history | Creates linear history |
| Creates merge commit | Rewrites commit order |

---

## Why should you not rebase shared commits?

Rebasing changes commit history, which can break other developers' work if the branch is already shared.

---

## When to use Rebase vs Merge?

Use **merge** when working with shared branches.  
Use **rebase** to keep your local commit history clean.

---

# Task 3 – Squash Merge

Squash merge combines multiple commits into a single commit.

### Create branch
``
git checkout -b feature-profile
```

### Create multiple commits

git commit -m "Fix typo"
git commit -m "Update formatting"
git commit -m "Improve profile UI"
```

### Squash merge
```
git merge --squash feature-profile
git commit -m "Add profile feature"
```

---

## What does Squash Merge do?

Squash merge **combines all commits from a branch into one commit before merging**.

---

## When to use Squash Merge?

Squash merge is useful when a feature branch has many small commits and you want a clean history.

---

## Trade-off of Squashing

You lose the detailed commit history from the feature branch.

---

# Task 4 – Git Stash

Git stash temporarily saves uncommitted changes.

### Save current changes
```
git stash
```

### Stash with message
```
git stash push -m "work in progress"
```

### List stashes
```
git stash list
```

### Apply stash
```
git stash pop
```

### Apply specific stash
```
git stash apply stash@{1}
```

---

## Difference between stash pop and stash apply

| Command | Description |
|------|------|
| git stash pop | Applies stash and removes it |
| git stash apply | Applies stash but keeps it |

---

## When would you use Stash?

Stash is used when you need to **quickly switch branches without committing unfinished work**.

---

# Task 5 – Git Cherry Pick

Cherry-pick copies a specific commit from one branch to another.

### Create branch
```
git checkout -b feature-hotfix
```

### Make commits
```
git commit -m "Fix bug 1"
git commit -m "Fix bug 2"
git commit -m "Fix bug 3"
```

### Switch to main
```
git switch main
```

### Cherry-pick commit
```
git cherry-pick <commit-hash>
```

---

## What does Cherry Pick do?

Cherry-pick **applies a specific commit from one branch to another branch**.

---

## When would you use Cherry Pick?

It is useful when you want to apply **a single bug fix without merging the entire branch**.

---

## What can go wrong with Cherry Picking?

Cherry-picking can create duplicate commits and conflicts if the same changes exist in multiple branches.

---

# Useful Command to View Git History

```
git log --oneline --graph --all
```

This command shows the commit history in a visual graph format.

---

# Summary

Today I learned advanced Git concepts:

- Git Merge
- Fast-forward merge
- Merge conflicts
- Git Rebase
- Squash merge
- Git Stash
- Git Cherry Pick

These commands are important for **branch management and collaboration in real DevOps workflows**.

---
