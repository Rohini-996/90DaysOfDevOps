# Day 43 – Jobs, Steps, Env Vars & Conditionals

Today I learned how to control the flow of a CI/CD pipeline using GitHub Actions.
This includes working with multiple jobs, passing data between jobs, using environment variables, and applying condition-based execution.

---

## Task 1: Multi-Job Workflow

I created a workflow with 3 jobs:

* **build** → prints "Building the app"
* **test** → runs after build
* **deploy** → runs after test

### ✅ Key Concept: Job Dependency

```yaml
needs: build
```

👉 This ensures:

```
build → test → deploy
```

---

## Task 2: Environment Variables

Used environment variables at 3 levels:

*  Workflow level → `APP_NAME`
*  Job level → `ENVIRONMENT`
*  Step level → `VERSION`

### Example:

```yaml
env:
  APP_NAME: myapp

jobs:
  demo:
    env:
      ENVIRONMENT: staging
    steps:
      - name: Print variables
        env:
          VERSION: 1.0.0
        run: |
          echo $APP_NAME
          echo $ENVIRONMENT
          echo $VERSION
```

### 🔥 Learned:

* Scope matters → Step > Job > Workflow
* Also used GitHub context:

```yaml
${{ github.sha }}
${{ github.actor }}
```

---

## Task 3: Job Outputs

Passed data (today’s date) from one job to another.

### Set Output:

```bash
echo "today=$(date)" >> $GITHUB_OUTPUT
```

### Use Output:

```yaml
${{ needs.job-name.outputs.today }}
```

### Why use outputs?

* Jobs run on different machines (no shared memory)
* Helps pass dynamic data like:

  * version numbers
  * build artifacts
  * deployment info

---

## Task 4: Conditionals

Used conditions to control execution.

### Examples:

✔ Run only on main branch:

```yaml
if: github.ref == 'refs/heads/main'
```

✔ Run only if previous step failed:

```yaml
if: failure()
```

✔ Run job only on push:

```yaml
if: github.event_name == 'push'
```

✔ Allow failure without stopping pipeline:

```yaml
continue-on-error: true
```

### 🔥 What I understood:

* `continue-on-error: true` → step can fail but workflow continues

---

## 🔹 Task 5: Smart Pipeline

Built a real-world style pipeline:

*  Trigger → push to any branch
*  lint + test → run in parallel
*  summary → runs after both

### Branch Detection:

```bash
if [[ "$GITHUB_REF" == "refs/heads/main" ]]
```

### Commit Message:

```yaml
${{ github.event.head_commit.message }}
```

---

## 🧠 Key Learnings

* `needs:` controls job order
* `outputs:` passes data between jobs
* `env:` manages variables at different levels
* `if:` helps create smart, dynamic pipelines

---

## 🎯 Final Thoughts

Today was important because I moved from **basic workflows → real pipeline logic**.

Now I can:

* Control execution flow
* Share data between jobs
* Build smarter CI/CD pipelines

---

✅ All workflow files are added in my repository
📁 Path: `2026/day-43/`

---
