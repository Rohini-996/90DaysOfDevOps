# Day 25 – Git Reset vs Revert & Branching Strategies

Today I learned how to **undo mistakes safely in Git** and explored **branching strategies used by real devops teams**.

---

# Task 1 – Git Reset

Git reset moves the current branch pointer to a previous commit.

### Create commits
```
git add .
git commit -m "Commit A"
git commit -m "Commit B"
git commit -m "Commit C"
```

---

## Soft Reset

```
git reset --soft 
```

Moves back one commit but **keeps changes staged**.

---

## Mixed Reset 

```
git reset --mixed 
```

Moves back one commit and **unstages changes but keeps them in the working directory**.

---

## Hard Reset

```bash
git reset --hard 
```

Moves back one commit and **deletes all changes permanently**.

---

## Difference Between Reset Types

| Reset Type | What Happens |
|------|------|
| --soft | Commit removed but changes stay staged |
| --mixed | Commit removed and changes unstaged |
| --hard | Commit and changes deleted |

---

## Which Reset is Destructive?

`git reset --hard` is destructive because it **permanently deletes changes**.

---

## When to Use Each

- **--soft** → When you want to redo a commit.
- **--mixed** → When you want to unstage files.
- **--hard** → When you want to completely discard changes.

---

## Should You Use Reset on Pushed Commits?

No. Reset rewrites history and can break collaboration if the commits are already pushed.

---

# Task 2 – Git Revert

Git revert creates a **new commit that undo a previous commit**.

### Example commits
```
git commit -m "Commit X"
git commit -m "Commit Y"
git commit -m "Commit Z"
```

### Revert middle commit
```
git revert 8fb1c1f2f52a48b720
```

---

## What Happens After Revert?

- Git creates a **new commit that reverses the changes**.
- The original commit **still exists in history**.

---

## Reset vs Revert

| Feature | git reset | git revert |
|------|------|------|
| What it does | Moves branch pointer back | Creates new commit to undo changes |
| Removes commit from history | Yes | No |
| Safe for shared branches | No | Yes |
| When to use | Local undo before pushing | Undo changes in shared repositories |

---

# Task 3 – Branching Strategies

Branching strategies help teams manage development workflows.

---

## GitFlow

### How it Works
Uses multiple long-term branches such as **main, develop, feature, release, and hotfix**.

### Simple Flow

```
main
 └─ develop
     ├─ feature-login
     ├─ feature-dashboard
     └─ release
```

### Where it's Used
Large projects with scheduled releases.

### Pros
- Structured workflow
- Clear separation of features and releases

### Cons
- More complex
- Slower development process

---

## GitHub Flow

### How it Works
Uses **one main branch and short-lived feature branches**.

### Simple Flow

```
main
 ├─ feature-login
 ├─ feature-payment
 └─ feature-ui
```

Devops Engineers create a branch, open a pull request, review, and merge.

### Where it's Used
Continuous deployment environments.

### Pros
- Simple
- Fast development

### Cons
- Less structured for large releases

---

## Trunk-Based Development

### How it Works
Devops Engineers commit directly to **main (trunk)** or use very short-lived branches.

### Simple Flow

```
main
 ├─ small-feature
 └─ bug-fix
```

Branches are merged quickly.

### Where it's Used
High-speed development teams and CI/CD environments.

### Pros
- Fast integration
- Less merge conflicts

### Cons
- Requires strong testing and CI pipelines

---

# Strategy Questions

### Which strategy for a startup shipping fast?

**GitHub Flow** or **Trunk-Based Development** because they allow faster releases.

---

### Which strategy for a large team with scheduled releases?

**GitFlow** because it provides structured release management.

---

### Example from Open Source

Many open-source projects use **GitHub Flow** because it is simple and works well with pull requests.

---

# Useful Command – Git Reflog

Shows all recent Git actions including resets.

```
git reflog
```

This helps recover commits even after a hard reset.

---

# Summary

Today I learned:

- Git Reset (--soft, --mixed, --hard)
- Git Revert
- Difference between reset and revert
- Branching strategies (GitFlow, GitHub Flow, Trunk-Based Development)

These concepts are important for **managing mistakes and collaborating safely in Git workflows**.

---

# 90 Days of DevOps – Day 25
