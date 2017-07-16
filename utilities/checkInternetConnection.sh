#/!bin/bash

#Checks for connection to internet
#We use ping command here because we can test both DNS and connectivity with one command
function checkConnection {
         echo "Checking Connection"
        ping -w 1 google.com
        if [ $? -eq 0 ]; then
                echo "Connection OK" 
                return 0
        else
                echo "Connection Bad" 
                return 1
        fi
}

# #$? =  return

checkConnection
if [ $? -eq 0 ]; then
	echo "Success!"
else
	echo "failure!"
fi
