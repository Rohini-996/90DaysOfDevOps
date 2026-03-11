## Day 26 – GitHub CLI (gh): Manage GitHub from Your Terminal

Today I learned how to use the **GitHub CLI (gh)** to manage GitHub directly from the terminal without opening the browser.

This helps developers and DevOps engineers automate workflows and work faster.

---

## Task 1 – Install and Authenticate

### Install GitHub CLI

Ubuntu example:

```
sudo apt install gh
```

Check installation:

```
gh --version
```

---

### Authenticate with GitHub

```
gh auth login
```

Follow the prompts to login.

---

### Check Login Status

```
gh auth status
```

---

### Authentication Methods Supported by gh

- GitHub **web browser login**
- **Personal Access Token (PAT)**
- **SSH authentication**

---

## Task 2 – Working with Repositories

### Create a Repository from Terminal

```
gh repo create my-test-repo --public --clone --add-readme
```

Creates a public repo and clones it locally.

---

### Clone Repository Using gh

```
gh repo clone username/repository-name
```

---

### View Repository Details

```
gh repo view
```

---

### List Your Repositories

```
gh repo list
```

---

### Open Repository in Browser

```
gh repo view --web
```

---

### Delete a Repository

```
gh repo delete username/repository-name
```

---

## Task 3 – Issues

GitHub CLI allows managing issues directly from the terminal.

---

### Create an Issue

```
gh issue create --title "Bug in login" --body "Login button not working"
```

---

### List Issues

```
gh issue list
```

---

### View Specific Issue

```
gh issue view 1
```

---

### Close an Issue

```bash
gh issue close 1
```

---

### Using gh Issue in Automation

`gh issue` commands can be used in **scripts to automatically create or manage issues** during deployments, testing, or monitoring.

Example: automatically creating an issue when a deployment fails.

---

## Task 4 – Pull Requests

Pull requests can also be managed completely from the terminal.

---

### Create a Branch

```
git checkout -b feature-update
```

---

### Commit Changes

```
git add .
git commit -m "Update README"
```

---

### Push Branch

```
git push origin feature-update
```

---

### Create Pull Request

```
gh pr create --fill
```

Automatically fills PR title and description.

---

### List Pull Requests

```
gh pr list
```

---

### View Pull Request Details

```
gh pr view
```

---

### Merge Pull Request

```
gh pr merge
```

---

### Merge Methods Supported

- **merge** (default merge commit)
- **squash**
- **rebase**

---

### Reviewing Someone's PR

You can review PRs by:

```
gh pr view
gh pr checkout <PR-number>
```

This lets you review code locally before approving.

---

## Task 5 – GitHub Actions (Preview)

GitHub CLI can also interact with **GitHub Actions workflows**.

---

### List Workflow Runs

```
gh run list
```

---

### View Workflow Run

```
gh run view <run-id>
```

---

### Use in CI/CD Pipelines

`gh run` and `gh workflow` commands can help:

- monitor CI/CD pipelines
- check build status
- trigger workflows from scripts

---

## Task 6 – Useful gh Commands

Some powerful GitHub CLI features:

---

### Make GitHub API Calls

```
gh api repos/:owner/:repo
```

Allows direct interaction with the GitHub API.

---

### Create GitHub Gists

```
gh gist create file.txt
```

---

### Create Releases

```
gh release create v1.0
```

---

### Create Command Aliases

```
gh alias set prl "pr list"
```

Now you can run:

```
gh prl
```

---

### Search Repositories

```
gh search repos devops
```

---

# Summary

Today I learned how to use **GitHub CLI (gh)** to manage GitHub directly from the terminal.

Key things I practiced:

- Installing and authenticating GitHub CLI
- Creating and managing repositories
- Creating and managing issues
- Creating and merging pull requests
- Viewing GitHub Actions workflow runs
- Using advanced gh commands for automation

GitHub CLI makes it easier to **work faster and automate GitHub tasks without leaving the terminal**.

---
