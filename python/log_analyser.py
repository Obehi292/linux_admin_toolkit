import collections

log_file = "../logs/system.log"

command_count = collections.Counter()
fail_count = 0
success_count = 0

with open(log_file, "r") as f:
    for line in f:
        if "FAILED" in line:
            fail_count += 1
        if "SUCCESS" in line:
            success_count += 1

        parts = line.strip().split(":")
        if len(parts) > 1:
            command_count[parts[1].strip()] += 1

print("==== Log Summary Report ====")
print(f"Successful operations: {success_count}")
print(f"Failed operations: {fail_count}")
print("\nMost frequent actions:")
for cmd, count in command_count.most_common(5):
    print(f"{cmd} -> {count} times")