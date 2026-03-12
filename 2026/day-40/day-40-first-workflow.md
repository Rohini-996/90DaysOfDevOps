## Day 40 - My First GitHub Actions Workflow 

Today I created my first GitHub Actions workflow and watched my pipeline run in the cloud.
This was the moment where CI/CD became real for me instead of just theory.

Today's task 
```
## Task 1: Set Up

I created a new repository:
Github-Actions
Then cloned it locally and created the workflow folder:
.github/workflows/

```
```
Task 2: Hello Workflow
Create .github/workflows/hello.yml with a workflow
name: Hello

on:
  push:
    branches: [main]
    paths:
      - '**.html'

jobs:
  greet:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout the code
        uses: actions/checkout@v4

      - name: Say hello to GitHub Actions
        run: echo "Hello from GitHub Actions!"
```
#### What this workflow does

- Runs when code is pushed to main branch
- GitHub starts a Linux runner
- The repository is checked out
- A message is printed Hello from GitHub Actions!

```
Task 3: Understand the Anatomy
Look at your workflow file and write in your notes what each key does:

on: Defines when the workflow should run
    Example: push, pull request, or manual trigger.
jobs: Defines the tasks the workflow will execute.
runs-on:Specifies the operating system of the runner
        Example: ubuntu-latest.
steps: Each job is having it's own steps
uses: Used to run prebuilt GitHub Actions.
      Example: actions/checkout@v4
run: Executes shell commands in the runner.
name: (on a step) Gives a readable name to a step or workflow.
```

```
Task 4: Add More Steps
Create cicd.yml to also:
 1. checkout code
 2. Build code
 3. deploy code
 4. Show version ex: Python & Docker

name: cicd-manual

on:
  workflow_dispatch:

jobs:

  Code:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        run: echo "code Clone ho gaya"

  Build:
    needs: [Code]
    runs-on: ubuntu-latest
    steps:
      - name: Build code
        run: echo "code Build ho gaya"

  Deploy:
    needs: [Code, Build]
    runs-on: ubuntu-latest
    steps:
      - name: Deploy code
        run: echo "code Deploy ho gaya"

  show_versions:
    runs-on: ubuntu-latest
    steps:
      - name: Checks Docker & Python Version
        run: docker --version & python3 --version
```
<img width="800" height="300" alt="Screenshot 2026-03-12 105552" src="https://github.com/user-attachments/assets/3d6497e0-fb85-424b-855c-1d2c7515db4c" />

```
Task 5: Break It On Purpose
Add a step that runs a command that will fail (e.g., exit 1 or a misspelled command)
Push and observe what happens in the Actions tab
Fix it and push again

code:

  Build:
    needs: [Code]
    runs-on: ubuntu-latest
    steps:
      - name: Build code
        run: echo "code Build ho gaya"
      - name: Break pipeline intentionally
        run: exit 1
Question: What does a failed pipeline look like? How do you read the error?
Answer: The failed job shows a red mark in the Actions tab. The pipeline stops at the step where the error occurred.

```
<img width="800" height="300" alt="Screenshot 2026-03-12 105957" src="https://github.com/user-attachments/assets/aa862b2f-c2bd-42ef-b111-da4eedf6d035" />

### Today I learned how to:

- Create GitHub Actions workflows
- Trigger workflows on push
- Run commands inside GitHub runners
- Understand workflow structure
- Debug pipeline failures
- Build a simple CI/CD pipeline

