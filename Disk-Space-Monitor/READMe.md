# 💾 Disk Space Monitor with Alert (Bash Script)

This project is a **Bash script** that monitors disk usage and generates an alert when usage exceeds a defined threshold (default: **80%**).  
It is ideal for **system administrators and DevOps engineers** to prevent servers from running out of disk space.

---

## 🔹 Features
- Checks disk usage using `df -h`.  
- Compares usage against a threshold (default **80%**).  
- Writes alerts to a **warning log file**.  
- Can be extended to **send email notifications**.  
- Works well with **cron jobs** for periodic monitoring.  

---

## 🛠️ Concepts Used
- **Arithmetic Comparison** → check usage percentage.  
- **Conditions (`if`)** → trigger alerts only above threshold.  
- **Logging** → write results to a warning log.  
- **Cron Integration** → automate periodic checks.  

---

## 🚀 Usage

### 1. Clone Repository
```bash
git clone https://github.com/yourusername/disk-space-monitor.git
cd disk-space-monitor
