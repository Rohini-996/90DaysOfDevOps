# Day 42 – Runners: GitHub-Hosted & Self-Hosted

##  Overview

Today I learned about **GitHub Actions runners** — the machines that actually execute CI/CD jobs.

I explored:

* GitHub-hosted runners (managed by GitHub)
* Self-hosted runners (my own machine/VM)

---

## ✅ Task 1: GitHub-Hosted Runners

I created a workflow with 3 parallel jobs:

* `ubuntu-latest`
* `windows-latest`
* `macos-latest`

### 🔧 What each job prints:

* OS name
* Hostname
* Current user

### 💡 Key Learning

👉 A **GitHub-hosted runner** is a virtual machine provided and managed by GitHub.
👉 It automatically spins up, runs the job, and shuts down.

---

## ✅ Task 2: Pre-installed Tools

On `ubuntu-latest`, I checked:

* Docker version
* Python version
* Node version
* Git version

### 💡 Why this matters?

* No need to install tools manually
* Saves time 
* Faster CI/CD pipelines
* Consistent environments across runs

---

## ✅ Task 3: Self-Hosted Runner Setup

I set up my own runner on my machine/VM.

### Steps:

1. Went to:

   ```
   Settings → Actions → Runners → New self-hosted runner
   ```
2. Selected Linux
3. Ran setup commands in terminal
4. Started runner:

   ```bash
   ./run.sh
   ```

### ✅ Verification:

* Runner shows as **Idle (green dot)** in GitHub

---

## ✅ Task 4: Using Self-Hosted Runner

Created workflow:

```
.github/workflows/self-hosted.yml
```

### What it does:

* Prints hostname (my machine)
* Prints working directory
* Creates a file
* Verifies file exists

### ✅ Result:

✔ Job ran on my machine
✔ File was created successfully

---

## ✅ Task 5: Labels

I added a custom label:

```
my-linux-runner
```

Updated workflow:

```yaml
runs-on: [self-hosted, my-linux-runner]
```

### 💡 Why Labels Are Useful?

* Target specific machines
* Separate environments (dev/staging/prod)
* Use different hardware (GPU, high RAM)
* Better control over job execution
* Improves security and isolation

---

## ✅ Task 6: GitHub-Hosted vs Self-Hosted

| Feature                 | GitHub-Hosted                    | Self-Hosted                           |
| ----------------------- | -------------------------------- | ------------------------------------- |
| **Who manages it?**     | GitHub                           | You                                   |
| **Cost**                | Free (limited) / Paid for usage  | Your infrastructure cost              |
| **Pre-installed tools** | Yes (Docker, Node, Python, etc.) | You install manually                  |
| **Good for**            | Quick setup, standard CI/CD      | Custom environments, private infra    |
| **Security concern**    | Managed by GitHub                | Full control, but your responsibility |

---

## 📸 Screenshots

### 🟢 Self-Hosted Runner (Idle)

*(Add your screenshot here)*

### ⚙️ Job Running on Self-Hosted Runner

*(Add your screenshot here)*

---

## 🎯 Key Takeaways

* Every GitHub Actions job runs on a **runner**
* GitHub-hosted runners are easy and fast 🚀
* Self-hosted runners give **full control & flexibility**
* Labels help manage multiple runners efficiently

---

## 🔥 DevOps Insight

> Self-hosted runners are widely used in companies to run secure, customized, and resource-heavy workloads on private infrastructure.

---

✨ Day 42 completed!
