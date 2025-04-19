# Internship Prep

## 📌 Weekly Overview

| Week | Theme                       | Core Focus                             | Project                             |
|------|-----------------------------|----------------------------------------|-------------------------------------|
| 1    | Linux & Bash Mastery        | CLI tools, scripting, permissions      | System Monitor Script               |
| 2    | Git + CI/CD Basics          | Version control, GitHub Actions        | Java CI/CD Pipeline (GitHub Actions)|
| 3    | Java + Concurrency          | Threading, Executors, Locks            | Multi-threaded Log Analyzer         |
| 4    | Networking + Sockets        | TCP, HTTP, socket programming          | Load Balancer (Round Robin)         |
| 5    | AWS Fundamentals            | EC2, S3, IAM, CloudWatch basics        | Java App Deployment on EC2          |
| 6    | Infrastructure as Code      | Terraform / CloudFormation             | EC2 + S3 Provisioning with Terraform|
| 7    | Monitoring & Observability  | Prometheus, Grafana, CloudWatch        | Monitoring Dashboard for Java App   |
| 8    | Capstone + Wrap-up          | Combine Dev + Ops in one flow          | Auto-healing Deployment Pipeline    |

---

## 📅 Week-by-Week Checklist

### ✅ Week 1: Linux & Bash Mastery
- [ ] Practice CLI: `lsof`, `journalctl`, `systemctl`, `awk`, `sed`
- [ ] Set up `crontab` to automate backups or cleanups
- [ ] Write scripts for system health, CPU/mem/disk
- [ ] Learn file permissions and process management

🔧 **Project**: `system-monitor.sh` — a Bash script that logs uptime, memory usage, and active users

---

### ✅ Week 2: Git + CI/CD Basics
- [ ] Deep dive into Git branching, stashing, cherry-pick
- [ ] Set up GitHub Actions for a Java Maven project
- [ ] Integrate unit tests and build steps
- [ ] Explore Jenkins or CircleCI (optional)

🔧 **Project**: `ci-demo-java` — a Java project with a full CI pipeline using GitHub Actions

---

### ✅ Week 3: Java Concurrency & Internals
- [ ] Explore JVM memory model, GC, JIT
- [ ] Build threaded tasks with `ExecutorService`, `Callable`
- [ ] Use `synchronized`, `Semaphore`, and `BlockingQueue`
- [ ] Handle concurrency bugs (race conditions, deadlocks)

🔧 **Project**: `log-analyzer` — a tool to parse and summarize multiple logs in parallel threads

---

### ✅ Week 4: Networking & Sockets
- [ ] Study TCP/IP stack, HTTP, 3-way handshake
- [ ] Learn Java Sockets (ServerSocket, InputStream)
- [ ] Pipe data between client and backend services
- [ ] Add health checks, multithreading

🔧 **Project**: `custom-load-balancer` — Round-robin TCP load balancer in Java

---

### ✅ Week 5: AWS Fundamentals
- [ ] Set up AWS CLI & IAM roles
- [ ] Launch EC2, configure user-data scripts
- [ ] Deploy a Java web app on EC2
- [ ] Use S3 for static files or backups

🔧 **Project**: `ec2-java-deploy` — deploy a Java app to EC2 with auto-start and monitoring enabled

---

### ✅ Week 6: Infrastructure as Code (IaC)
- [ ] Learn Terraform basics: providers, resources, variables
- [ ] Write a script to create EC2 + S3 + IAM user
- [ ] Test and destroy infra cleanly
- [ ] Explore CloudFormation YAML format

🔧 **Project**: `infra-iac` — deploy full infra stack (EC2 + S3 + CloudWatch agent) using Terraform

---

### ✅ Week 7: Monitoring & Observability
- [ ] Learn Prometheus + Grafana basics
- [ ] Scrape metrics from Java app
- [ ] Set up alert rules (e.g., CPU > 80%)
- [ ] Use CloudWatch Logs and Alarms

🔧 **Project**: `java-metrics-dashboard` — monitor your app with Prometheus + Grafana

---

### ✅ Week 8: Capstone Week
- [ ] Revisit all tools: Bash + Git + Java + AWS + CI/CD
- [ ] Automate instance healing with CloudWatch + Lambda
- [ ] Ensure log collection, monitoring, alerting
- [ ] Polish README, upload all projects to GitHub

🔧 **Project**: `auto-heal-pipeline` — auto-redeploy EC2 when app crashes using CloudWatch + Lambda

---

## 📚 Resources

- **Linux**: The Linux Command Line (William Shotts)
- **Java**: Java Concurrency in Practice (Brian Goetz)
- **Networking**: Computer Networking – A Top-Down Approach
- **AWS**: [AWS SkillBuilder](https://explore.skillbuilder.aws)
- **DevOps**: [Roadmap.sh](https://roadmap.sh/devops)

