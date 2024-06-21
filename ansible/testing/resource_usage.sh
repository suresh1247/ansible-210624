
#/bin/bash
output_file="server_usage.txt"
echo -e "###########################################################\n" >> $output_file
echo -e 'Processes which are consuming more than 75% CPU \n' >> $output_file
top -bn1 | awk 'NR>7 && $9 > 75 {print}' >> $output_file
echo -e "###########################################################\n" >> $output_file
echo -e ' Top 7 processes which are consuming high CPU: \n' >> $output_file
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 7 >> $output_file
echo -e "###########################################################\n" >> $output_file
echo -e 'mount points which are consuming more than 75% from the server and their detaile usage: ' >> $output_file
df -h | awk '$5 > "75%"' >> $output_file
echo -e "###########################################################\n" >> $output_file
df -h | tail -n +2 | awk '$5 > "75%" { print $6 }' | xargs -I{} du -sh {} >> $output_file
echo -e "###########################################################\n" >> $output_file
echo -e ' Processes which are consuming high memory in the server:' >> $output_file
top -o %MEM -b -n 1 | tail -n +4 | head -n 15 >> $output_file
echo -e "###########################################################\n" >> $output_file
echo -e ' \n' >> $output_file
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 7 >> $output_file
echo -e "###########################################################\n" >> $output_file
echo -e 'ping status \n' >> $output_file
ping -c 4 google.com >> $output_file
echo -e " \n\n" >> $output_file
ping -c 4 localhost >> $output_file
echo -e "###########################################################\n" >> $output_file
echo -e ' uptime \n' >> $output_file
uptime >> $output_file
echo -e '\n' >> $output_file 
echo -e "###########################################################\n" >> $output_file
echo -e '\n CMD: df -hT \n' >> $output_file
df -hT >> $output_file
echo -e '\n' >> $output_file 
echo -e "###########################################################\n" >> $output_file
echo -e ' fstab entries & samba shares information ' >> $output_file
cat /etc/fstab >> $output_file
echo -e '\n' >> $output_file
cat /etc/exports >> $output_file
echo -e "###########################################################\n\n" >> $output_file
echo -e '\n CMD detailed disk usage in server : \n' >> $output_file
du -h / | grep ^[0-9.]*G | sort -nr >> $output_file
echo -e '\n' >> $output_file 
echo -e "###########################################################\n\n" >> $output_file
echo -e 'CMD: CPU usage core wise \n' >> $output_file
top -b -n 1 -H | head -n 30 >> $output_file
echo -e '\n' >> $output_file 
echo -e "###########################################################\n\n" >> $output_file
echo -e 'CMD: network information \n' >> $output_file
ip r l >> $output_file
echo -e '\n\n ' >> $output_file
ifconfig -a >> $output_file
echo -e ' \n routes information \n' >> $output_file
route -n >> $output_file
echo -e '\n' >> $output_file 
echo -e "###########################################################\n" >> $output_file
echo -e '\n \n CMD: lscpu | grep -i Core \n' >> $output_file
echo -e '\n\n' >> $output_file 
lscpu | grep Core CPU Thread Socket >> $output_file
echo -e "###########################################################\n" >> $output_file
echo -e '\n \n \n CMD: ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head\n' >> $output_file
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head >> $output_file
echo -e "###########################################################\n" >> $output_file
echo -e '\n CMD: free -m \n' >> $output_file
free -m  >> $output_file
echo -e '\n CMD: sar \n' >> $output_file
sar >> $output_file
echo -e "###########################################################\n" >> $output_file
echo -e ' \n Load on server: \n \n ' >> $output_file
sar -q >> $output_file
echo -e "###########################################################\n" >> $output_file
echo -e 'CMD: top \n' >> $output_file
top -o %MEM -b -n 1 | head -n 30 >> $output_file
echo -e "###########################################################\n" >> $output_file
echo -e '\n CMD: ps aux --sort=-%mem | head\n' >> $output_file
ps aux --sort=-%mem | head echo -e '\n \n \n CMD: vmstat -s\n' >> $output_file
vmstat -s >> $output_file
echo -e "###########################################################\n" >> $output_file
echo -e '\n CMD: sar -r\n' >> $output_file
sar -r >> $output_file
echo -e "###########################################################\n" >> $output_file
echo -e 'kernel information \n' >> $output_file
uname -r >> $output_file
echo -e '\n' >> $output_file 
echo -e "###########################################################\n" >> $output_file
echo -e '\n last reboot information \n' >> $output_file
last | grep -i boot >> $output_file
echo -e '\n' >> $output_file 
echo -e "###########################################################\n" >> $output_file
echo -e '\n list of kernels available \n' >> $output_file
rpm -q kernel >> $output_file
echo -e '\n' >> $output_file 
echo -e "###########################################################\n" >> $output_file
echo -e 'last patch updated in server: \n' >> $output_file
ls -lt --time-style=long-iso /boot | grep vmlinuz | head -n 1 >> $output_file


