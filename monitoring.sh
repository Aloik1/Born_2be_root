# !/bin/bash

#	Architecture of this computer
Architecture=$(uname -a)
#----------------------------------NEXT----------------------------------
#	Number of physical processors is the result of multiplying the number of sockets and the number of CPUs per socket
# Get Cores per socket
cores=$(lscpu | grep "Core(s)" | awk '{print $4}')
# Get number of sockets
sockets=$(lscpu | grep "Socket(s)" | awk '{print $2}')
# Final output in script for Number of CPUs
PhysicalCPU=$((cores * sockets))
#----------------------------------NEXT----------------------------------
#	Virtual CPU count appears in CPU(s): section in lscpu command
# we have 2 instances of CPU(s) we put ^ to indicate we want the first occurence
VCPUs=$(lscpu | grep "^CPU(s):" | awk '{print $2}')
#----------------------------------NEXT----------------------------------
#	Memory usage is displayed by free command. Use --mega to display in MB
Mem_Usage=$(free --mega | grep "Mem" | awk '{print $3}')
# To get % value we need total memory usage
Total_Mem=$(free --mega | grep "Mem" | awk '{print $2}')
# Now we divide and multiply by 100 to get the %value
Division=$(echo "scale=2; $Mem_Usage / $Total_Mem * 100" | bc -l)
#----------------------------------NEXT----------------------------------
#	To display CPU Load we use top command. Top displays all the relevant CPU info related to its processes
CPUload_reading=$(top -b -n 1 | grep "average:" | awk '{print $10}')
CPUload=${CPUload_reading::-1}
# Doesn't word with echo, so we use printf. "%.2f" - there are 2 decimals after ".". Example: 2.00%
CPUload_perc=$(printf "%.2f" "$CPUload * 100")
#----------------------------------NEXT----------------------------------
#	To display last boot info use who -b command, $1=$1 takes off everything repeating at the beginning
# (in our case spaces) and print $0 writes from column 0...in other words, everything
Last_Boot=$(who -b | awk '{$1=$1; print $0}')
#----------------------------------NEXT----------------------------------
#	Let's check if we are using LVM. lsblk is the command.
# > /dev/null directs output from grep and silences the output.
# && means, if > /dev/null succeeds and has something, print yes, othervise print no
LVM_search=$(lsblk | grep "lvm" > /dev/null && echo "yes" || echo "no")
#----------------------------------NEXT----------------------------------
#	Lets display TCP connections. Use netstat(sudo apt install net-tools).
# netstat -n(numeric format) -t(TCP connections), wc (word count) -l(lines) counts lines
TCP_connections=$(netstat -nt | grep "ESTABLISHED" | wc -l)
#----------------------------------NEXT----------------------------------
#	Let's display number of connected users. Use users command
# wc(word count) -w(count words)
Users=$(users | wc -w)
#----------------------------------NEXT----------------------------------
#	Let's display our adresses(ip and MAC). We will use ip link (for MAC) and hostname -I (for ip)
Net_IP=$(hostname -I)
Net_MAC=$(ip link | grep "ether" | awk '{print $2}')
#----------------------------------NEXT----------------------------------
#	Let's count sudo commands. We will use our sudo log, created previously in the project.
# Your log file may vary, mine is called sudolog.log and is located in /var/log/sudo/
Sudo_commands=$(cat /var/log/sudo/sudolog.log | grep "USER=root" | wc -l)
#----------------------------------PRINT_EVERYTHING----------------------
wall	"
	- Architecture:		$Architecture
	- CPU Physical:		$PhysicalCPU
	- CPU Virtual:		$VCPUs
	- Memory Usage:		$Division%
	- CPU Load:		$CPUload_perc%
	- Last boot:		$Last_Boot
	- LVM use:		$LVM_search
	- TCP connections:	$TCP_connections ESTABLISHED
	- User log:		$Users
	- Network:		IP:  $Net_IP
				MAC: ($Net_MAC)
	- Sudo commands:	$Sudo_commands
"

