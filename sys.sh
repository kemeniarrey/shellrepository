#!/bin/bash

clear
sleep 9 
echo "                     Student's name = ARREY EGBE KEMENI                                  "
echo "                               Id = 16B730FS"
echo " "  
echo "                          Welcome to my project SYS                                      "
echo " "
echo "                              Make your choice                                           " 
echo " "                                                                     
echo "               a) Informations about users registered 3 days ago                         "
echo " " 
echo "          b) acquisition, installation and running  of  xampp's environment              "
echo " " 
echo " c) Archiving of the elements of the personal directory that were modified by the        " 
echo "                                 sudoer 2 days ago                                       "
echo " " 
echo "                  d)Disk usage, processor memory, and swap information"
echo " " 
echo "                                     Exit(Q/q)                                           "

           

       
read -r entry

case $entry in 
	

	'a') cut -d : -f 1 /etc/passwd>all_user
	

	ls /home>user_foders
	
	while read line 
	do
		while read line1
		do	
		if [ $line == $line1 ] ; then 
		echo $line1>user1
		fi
		done<user_foders
	done<all_users
	find /home/* -type d -ctime 3 -print>userx

	while read line1
	do
	   while read user
	   do 
	      if [ $line1 == '/home/'$user ] ; then 
		echo $user >3days_user.txt
		echo " was created 3 days ago."
	      fi

	    done<user1 
	done<userx
	cat 3days_users.txt
	
 ;;
	'b') echo "XAMPP"
	     echo "downloading Xampp..."
	 wget https://downloadsapachefriends.global.ssl.fastly.net/xampp-files/5.6.30/xampp-linux-x64-5.6.30-1-installer.run?from_af=true
	     echo "installation..."
	 ./xampp-linux-x64-5.6.30-1-installer.run
	     echo "running..."
	 sudo su
	/opt/lampp/lampp start


;;
	'c') echo "ARCHIVING"
	mkdir -p /home/seed/archive
	find /home/seed/ -type f -mtime 2 -print>/home/seed/ficmodi
	while read line
	do
	cp $line archive
	done </home/seed/ficmodi
	tar -czvf archive.tar.gz archive
	mv archive.tar.gz /media/seed/usb/*/archive.tar.gz
	;;
	'd') echo "Disk usage, processor memory, and swap information."
		 echo "Disk Usage"
		df -h |grep /dev/sd
		 echo "Processor Memory and swap"
		free -h 
;;
	* )  exit;;
	
esac