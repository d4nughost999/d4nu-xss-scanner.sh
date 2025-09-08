# 🔎 XSS Scanner Mini

Author: d4nu-ghost  

Script Bash sederhana untuk melakukan pemeriksaan potensi XSS (Cross-Site Scripting) pada URL dengan parameter.  
⚠️ Note: Gunakan hanya untuk lab pribadi / target legal (bug bounty). Jangan digunakan untuk serangan ilegal.

---

## ✨ Fitur
- Beberapa payload XSS dasar
- Scan otomatis dan cek refleksi payload
- Output hasil langsung di terminal

---

## 🚀 Cara Instalasi
Clone repo:
```bash

git clone https://github.com/d4nughost999/xss-scanner.git

cd xss-scanner

chmod +x xss-scanner.sh

./xss-scanner.sh "http://127.0.0.1/vuln.php?q="
