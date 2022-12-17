#!bin/bash
<<comment
This shell scripts kills ft_lock proccess that runs into 42 São Paulo Ubuntu
that locks your screen from time to time, if you want to be okay and go around
help some people without your screen locking, run this is script and it will
kill the proccess, if you want the proccess to start running again, just restart
your session, use this script but keep contributing within 42 community, have
common sense.
comment
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[31m'
RESETCOLOR='\033[0m'
ftlockpid=$(top -bn1 | grep ft_lock | awk '{print $1}')
ftlockrunning=$(top -bn1 | grep -c ft_lock)
if (($ftlockrunning > 0))
then
	echo -e "Do you really want to ${RED}kill${RESETCOLOR} ft_lock? (Y/n)"
	read -rsn1 shouldkill
	while [ "$shouldkill" != "Y" -a "$shouldkill" != "y" -a "$shouldkill" != "n" -a "$shouldkill" != "N" ]
	do
		echo -e "Invalid input, try again. (Y/n)"
		read -rsn1 shouldkill
	done
	if [ $shouldkill = "Y" -o $shouldkill = "y" ]
	then
		kill "$ftlockpid"
		echo -e "${GREEN}ft_lock killed successfully${RESETCOLOR}"
		exit 0
	else
		echo -e "${YELLOW}ft_lock was not killed.${RESET}"
		exit 0
	fi
else
	echo -e "${YELLOW}ft_lock not running currently.${RESETCOLOR}"
	exit 1
fi
