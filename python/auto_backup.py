import subprocess
import sys
from datetime import datetime

if len(sys.argv) != 2:
    print("Usage: python auto_backup.py <directory>")
    sys.exit(1)

directory = sys.argv[1]

result = subprocess.run(
    ["bash", "../scripts/backup.sh", directory],
    capture_output=True,
    text=True
)

if result.returncode == 0:
    print("Backup successful.")
else:
    print("Backup failed.")

print(f"Executed at {datetime.now()}")