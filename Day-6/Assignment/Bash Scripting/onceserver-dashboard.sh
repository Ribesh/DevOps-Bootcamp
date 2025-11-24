#!/bin/bash


# ---------- Colors ----------
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
MAGENTA="\e[35m"
CYAN="\e[36m"
BOLD="\e[1m"
RESET="\e[0m"


command_exists() {
	command -v "$1" > /dev/null 2>&1
}

get_external_ip() {
	if command_exists curl; then
		curl -s icanhazip.com
	else
		echo "curl command not found"
	fi
}


get_cpu_usage() {
	if command_exists top; then
		top -bn1 | awk '/%Cpu/ {printf "%.1f%%", 100 - $8; exit}'
	else
		echo "top command not found"
	fi
}

get_memory_usage() {
	if command_exists free; then
		free -h
	else
		echo "free commond not found"
	fi
}


get_disk_usage() {
	if command_exists df; then
		df -h
	else
		echo "df command not found"
	fi
}

get_logins() {
	if command_exists last; then
		last -n 3
	else
		echo "last command not found"
	fi
}

# ----------------------- Main UI--------------------
clear
echo -e "${BOLD}${CYAN}====================== SERVER DASHBOARD ======================${RESET}"
echo

HOSTNAME=$(hostname 2> /dev/null || echo "Unknown host")
if command_exists uptime; then
	UPTIME=$(uptime -p 2> /dev/null || uptime 2> /dev/null || echo "Unknown Uptime")
else
	echo "uptime command doesn't exits"
fi

echo -e "${BOLD}${BLUE}Server:${RESET}   ${YELLOW}${HOSTNAME}${RESET}"
echo -e "${BOLD}${BLUE}Uptime:${RESET}   ${GREEN}${UPTIME}${RESET}"
echo

CURRENT_USER=$(whoami 2>/dev/null || echo "$USER")
CURRENT_DATE=$(date "+%Y-%m-%d %H:%M:%S")


echo -e "${BOLD}${BLUE}User:${RESET}	${MAGENTA}${CURRENT_USER}${RESET}"
echo -e "${BOLD}${BLUE}Date:${RESET}	${MAGENTA}${CURRENT_DATE}${RESET}"
echo

echo -e "${BOLD}${CYAN} ------------------ DISK USAGE(/) ------------------ ${RESET}"
get_disk_usage
echo

echo -e "${BOLD}${CYAN} ------------------ FREE MEMORY -------------------- ${RESET}"
get_memory_usage
echo

echo -e "${BOLD}${CYAN} ------------------ CPU USAGE ---------------------- ${RESET}"
CPU_USAGE=$(get_cpu_usage)
echo -e "Current CPU Usage: ${GREEN}${CPU_USAGE}${RESET}"
echo


echo -e "${BOLD}${CYAN} ----------------- EXTERNAL IP --------------------- ${RESET}"
EXTERNAL_IP=$(get_external_ip)
echo -e "External IP: ${YELLOW}${EXTERNAL_IP}${RESET}"
echo

echo -e "${BOLD}${CYAN} ---------------- LAST LOGINS ---------------------- ${RESET}"
get_logins
echo

echo -e "${BOLD}${CYAN}============================================================${RESET}"