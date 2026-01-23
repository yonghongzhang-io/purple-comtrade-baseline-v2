#!/bin/bash
set -e

echo "[START.SH] Purple agent starting..."
echo "[START.SH] Working directory: $(pwd)"
echo "[START.SH] Files in /app:"
ls -la /app/

echo "[START.SH] Python version:"
python --version

echo "[START.SH] Checking if run_a2a.py exists:"
if [ -f "/app/run_a2a.py" ]; then
    echo "[START.SH] run_a2a.py found"
else
    echo "[START.SH] ERROR: run_a2a.py NOT FOUND"
    exit 1
fi

echo "[START.SH] Starting Python script with args: $@"
exec python /app/run_a2a.py "$@"
