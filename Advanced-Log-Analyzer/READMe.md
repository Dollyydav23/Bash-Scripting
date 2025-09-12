cat > README.md << 'EOF'
# 📊 Advanced Log Analyzer

This project is a **Bash script** that parses log files (e.g., `/var/log/syslog`) and generates a summary of log levels (`ERROR`, `WARNING`, `INFO`) with percentages.

---

## 🔹 Features
- Reads a large log file.  
- Counts occurrences of:
  - **ERROR**
  - **WARNING**
  - **INFO**
- Prints a summary report with percentages.  

---

## 🛠️ Concepts Used
- `awk` → pattern scanning & processing.  
- `grep` → filtering log messages.  
- **Arrays & String Manipulation** → store and calculate counts.  

---

## 🚀 Usage

### 1. Make Script Executable
```bash
chmod +x log_analyzer.sh
