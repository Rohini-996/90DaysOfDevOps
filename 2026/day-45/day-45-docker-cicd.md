# Day 45 – Docker CI/CD with GitHub Actions

Today I built a complete CI/CD pipeline where pushing code to GitHub automatically builds a Docker image and pushes it to Docker Hub 
just like real production workflows.

---

## What This Project Does

* Builds a Docker image on every push
* Tags the image with:
  
   * `latest`

* Pushes the image to Docker Hub (only from `main` branch)
* Shows build status using a badge

---

## ⚙️ Workflow File

📂 `.github/workflows/docker-publish.yml`

```yaml
name: Docker Build & Push

on:
  push:
    branches:
      - main
      - feature/*

jobs:
  docker:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout Code
        uses: actions/checkout@v4

      - name: Extract Short SHA
        run: echo "SHORT_SHA=${GITHUB_SHA::7}" >> $GITHUB_ENV

      - name: Build Docker Image
        run: |
          docker build -t ${{ secrets.DOCKER_USERNAME }}/my-app:latest .
          docker build -t ${{ secrets.DOCKER_USERNAME }}/my-app:sha-${{ env.SHORT_SHA }} .

      - name: Login to Docker Hub
        if: github.ref == 'refs/heads/main'
        uses: docker/login-action@v3
        with:
          username: ${{ secrets.DOCKER_USERNAME }}
          password: ${{ secrets.DOCKER_TOKEN }}

      - name: Push Image
        if: github.ref == 'refs/heads/main'
        run: |
          docker push ${{ secrets.DOCKER_USERNAME }}/my-app:latest
          docker push ${{ secrets.DOCKER_USERNAME }}/my-app:sha-${{ env.SHORT_SHA }}
```

---

## 🐳 Docker Image

👉 docker push rohinidivekar123/myapp:latest

---

## 🧪 How It Works (Simple Flow)

1. Push code to GitHub
2. Workflow starts automatically
3. Docker image gets built
4. Image is tagged (`latest` + commit SHA)
5. If branch = `main` → image pushed to Docker Hub
6. You can pull and run it anywhere

---

## ▶️ Run the Container

```bash
docker pull <your-username>/my-app:latest
docker run -d -p 5000:5000 <your-username>/my-app:latest
```

---

## 🎯 Key Learnings

* Automated Docker builds using GitHub Actions
* Secure login using GitHub Secrets
* Conditional execution (only push on main branch)
* Real-world CI/CD pipeline flow

---

✅ This is exactly how modern DevOps pipelines work in production.
