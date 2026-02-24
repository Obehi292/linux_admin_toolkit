#!/bin/bash

LOG_FILE="../logs/system.log"

log_action() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}

create_user() {
    read -p "Enter username to create: " username
    if id "$username" &>/dev/null; then
        echo "User '$username' already exists."
        log_action "Failed to create user '$username': User already exists."
    else
        sudo useradd "$username" && \
        echo "User '$username' created successfully." && \
        log_action "SUCCESS: Created user $username"
    fi
}

delete_user() {
    read -p "Enter username to delete: " username
    if id "$username" &>/dev/null; then
        sudo userdel "$username" && \
        echo "User deleted successfully." && \
        log_action "SUCCESS: Deleted user $username"
    else
        echo "User does not exist."
        log_action "FAILED to delete user $username: (not found)"
    fi
}

lock_user() {
    read -p "Enter username to lock: " username
    sudo usermod -L "$username" && \
    log_action "SUCCESS: Locked user $username"
}

unlock_user() {
    read -p "Enter username to unlock: " username
    sudo usermod -U "$username" && \
    log_action "SUCCESS: Unlocked user $username"
}

cpu_usage() {
    top -bn1 | grep "Cpu(s)"
    log_action "INFO: Checked CPU usage"
}

memory_usage() {
    free -h
    log_action "INFO: Checked memory usage"
}

disk_report() {
    df -h
    log_action "INFO: Generated disk usage report"
}

backup_directory() {
    read -p "Enter directory to backup: " dir
    ./backup.sh "$dir"
}

view_logs() {
    tail -n 20 "$LOG_FILE"
}

while true; do
    echo "====== Linux Admin Toolkit ======="
    echo "1. Create User"
    echo "2. Delete User"
    echo "3. Lock User"
    echo "4. Unlock User"
    echo "5. Check CPU Usage"
    echo "6. Check Memory Usage"
    echo "6. Check Meomory Usage"
    echo "7. Generate Disk Usage Report"
    echo "8. Backup Directory"
    echo "9. View System Logs"
    echo "0. Exit"
    echo "=================================="
    read -p "Select an option: " choice

    case $choice in
        1) create_user ;;
        2) delete_user ;;
        3) lock_user ;;
        4) unlock_user ;;
        5) cpu_usage ;;
        6) memory_usage ;;
        7) disk_report ;;
        8) backup_directory ;;
        9) view_logs ;;
        0) exit 0 ;;
        *) echo "Invalid option." ;;
    esac 
done
