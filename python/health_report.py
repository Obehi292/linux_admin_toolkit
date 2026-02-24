import subprocess
from datetime import datetime

output_file = "../logs/health_report.txt"

def run_command(cmd):
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    return result.stdout

with open(output_file, "w") as f:
    f.write("==== System Health Report ====\n")
    f.write(f"Generated at: {datetime.now()}\n\n")

    f.write("CPU Info:\n")
    f.write(run_command("top -bn1 | grep 'Cpu(s)'"))

    f.write("\nMemory Info:\n")
    f.write(run_command("free -h"))

    f.write("\nDisk Info:\n")
    f.write(run_command("df -h"))

print("Health report generated.")