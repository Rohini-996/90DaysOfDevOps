# Day 44 – Secrets, Artifacts & Running Real Tests in CI

Today was a big step, my pipeline started doing **real-world work** 🔥
I learned how to securely manage secrets, store build outputs, and run actual tests inside CI.

---

## Task 1: GitHub Secrets

* Created a secret: `MY_SECRET_MESSAGE`
* Used it safely inside workflow without exposing it

✅ Output:

```
The secret is set: true
```

❌ When trying to print it directly:

```
***
```
```
name: secrets demo

on:
  workflow_dispatch

jobs:
  secret-job:
    runs-on: ubuntu-latest

    steps:
      - name: Check if secret exists
        run: |
          if [ -z "${{ secrets.MY_SECRET_MESSAGE }}" ]; then
            echo "The secret is set: false"
          else
            echo "The secret is set: true"
          fi

      - name: Try printing secret (not recommended)
        run: echo "${{ secrets.MY_SECRET_MESSAGE }}"
```

👉 GitHub automatically **masks secrets**

### 💡 What I Learned

* Never print secrets in logs
* Logs are visible to others → can leak sensitive data

---

## Task 2: Using Secrets as Environment Variables

* Passed secrets as environment variables
* Used them in commands without hardcoding

Example:

```yaml
env:
  MY_SECRET: ${{ secrets.MY_SECRET_MESSAGE }}
```

* Also added:

  * `DOCKER_USERNAME`
  * `DOCKER_TOKEN`

---
```
name: use secrets as Env variables

on:
  workflow_dispathch

jobs:
  sec-vars:
    runs-on: ubuntu-latest

    steps:
      - name: use secrets safely
        env:
          DOCKER_USER: ${{ secrets.DOCKER_USERNAME }}
          DOCKER_TOKEN: ${{ secrets.DOCKER_TOKEN }}

        run: |
          echo "Username is set: ${DOCKER_USER:+true}"
          echo "Token is set: ${DOCKER_TOKEN:+true}"
```
## Task 3: Upload Artifacts

* Generated a file (log/report)
* Uploaded using:

```yaml
uses: actions/upload-artifact@v4
```

✅ Verified:

* Artifact visible in Actions tab
* Successfully downloaded it

---
```
name: upload artifact demo

on:
  workflow_dispatch

jobs:
  artifact-job:
    runs-on: ubuntu-latest

    steps:
      - name: create a test report
        run: |
          echo "Created a test report - Day 44" > report.txt
          echo "All test passed" >> report.txt

      - name: upload artifact
        uses: actions/upload-artifact@v4
        with:
          name: test-report
          path: report.txt
```

## Task 4: Share Artifacts Between Jobs

* Job 1 → Created & uploaded file
* Job 2 → Downloaded & used it

### Real Use Case

* Share build outputs between stages
* Example: build → test → deploy pipeline

---
```
name: Artifacts Between Jobs

on:
  workflow_dispatch

jobs:
  job1:
    runs-on: ubuntu-latest

    steps:
      - name: create a file
        run: |
          echo "hello from me!" > msg.txt

      - name: upload artifact
        uses: actions/upload-artifact@v4
        with:
          name: shared-file
          path: msg.txt


  job2:
    runs-on: ubuntu-latest
    needs: job1  # ensures job1 runs first

    steps:

      - name: download artifact
        uses: actions/download-artifact@v4
        with:
          name: shared-file

      - name: read file
        run: cat msg.txt
```
##  Task 5: Run Real Tests in CI

* Added a script (Python/Shell)
* Workflow:

  * Checkout code
  * Install dependencies
  * Run script

✅ Observed:

* Script failure → pipeline ❌ (red)
* Fixed script → pipeline ✅ (green)

---
```
name: Run Tests

on:
  workflow_dispath

jobs:
  run-script-using-ci:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout Code
        uses: actions/checkout@v4

      - name: Set up python
        uses: actions/setup-python@v5
        with:
          python-version: '3.x'

      - name: Run script
        run: python test_script.py
```
## Task 6: Caching

* Used:

```yaml
uses: actions/cache@v4
```

### What I Learned

* Dependencies are cached
* Stored on GitHub runners
* Second run is much faster 

---
```
name: Cache Demo

on: push

jobs:
  cache-job:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Set up Python
        uses: actions/setup-python@v5
        with:
          python-version: '3.x'

      - name: Cache pip dependencies
        uses: actions/cache@v4
        with:
          path: ~/.cache/pip
          key: pip-${{ runner.os }}-${{ hashFiles('**/requirements.txt') }}
          restore-keys: |
            pip-${{ runner.os }}-

      - name: Install dependencies
        run: pip install -r requirements.txt
```
## Key Learnings

* Secrets must **never be exposed**
* Artifacts help **store & share files across jobs**
* CI pipelines should run **real tests, not just echo**
* Caching improves **performance significantly**

---

## Final Result

✅ Secure pipeline
✅ Artifacts working
✅ Tests running in CI
✅ Faster builds with caching

---
