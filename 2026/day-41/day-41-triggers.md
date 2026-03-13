# Day 41 – Triggers & Matrix Builds 🚀

### Today I explored different ways to trigger GitHub Actions workflows and learned how to run jobs across multiple environments using Matrix Builds.
### These features are part of GitHub Actions, which allows automation of CI/CD pipelines.

### Also I have added all this in my Github-Actions Repo

```
Task 1: Trigger on Pull Request
Create .github/workflows/pr-check.yml
Trigger it only when a pull request is opened or updated against main
Add a step that prints: PR check running for branch: <branch name>
Create a new branch, push a commit, and open a PR

name: Trigger on pull request

on:
  pull_request:
    branches:
      - main

jobs:
  trigger-on-pr:
    runs-on: ubuntu-latest

    steps:
      - name: Checking branch
        run: echo "PR check running for branch ${{ github.head_ref }}"
```

```
Task 2: Scheduled Trigger
Add a schedule: trigger to any workflow using cron syntax
Set it to run every day at midnight UTC

name: Scheduled Workflow

on:
  schedule:
    - cron: '0 0 * * *'

jobs:
  schedule-job:
    runs-on: ubuntu-latest

    steps:
      - name: Run scheduled job
        run: echo "This workflow runs every day at midnight UTC"
```

```
Task 3: Manual Trigger
Create .github/workflows/manual.yml with a workflow_dispatch: trigger
Add an input that asks for an environment name (staging/production)
Print the input value in a step

name: Manual Trigger

on:
  workflow_dispatch:
    enviorments:
      description: "choose enviorment"
      required: true
      default: "staging"


jobs:
  run-manual:
    runs-on: ubuntu-latest

    steps:
      - name: Print selected environment
        run: echo "Deployment environment is ${{ github.event.inputs.environment }}"
```

```
Task 4: Matrix Builds
Create .github/workflows/matrix.yml that:

Uses a matrix strategy to run the same job across:
Python versions: 3.10, 3.11, 3.12
Each job installs Python and prints the version
Watch all 3 run in parallel
name: Python lint 

on:
    workflow_dispatch: 

jobs:
    validate:
        runs-on: ubuntu-latest 
        strategy:
            fail-fast: false
            matrix:
                python-version: ["3.10", "3.11", "3.12"]

        steps:
            - name: checkout code 
              uses: actions/checkout@v4
            
            - name: setup python ${{ matrix.python-version}}
              uses: actions/setup-python@v5 
              with:
                python-version: ${{ matrix.python-version}}

            - name: install dependencies
              run: pip install -r requirements.txt 

            - name: run linter 
              run: flake8 app.py
```

```
Task 5: Exclude & Fail-Fast
In your matrix, exclude one specific combination (e.g., Python 3.10 on Windows)
Set fail-fast: false — trigger a failure in one job and observe what happens to the rest
Write in your notes: What does fail-fast: true (the default) do vs false?

jobs:
    validate:
        runs-on: ubuntu-latest 
        strategy:
            fail-fast: false
            matrix:
                python-version: ["3.10", "3.11", "3.12"]
```
🎯 Learning Goals

Today I learned how to:

- Trigger workflows on Pull Requests
- Schedule workflows using Cron
- Run workflows manually
- Execute jobs across multiple environments using matrix strategy
- Control failures using fail-fast



