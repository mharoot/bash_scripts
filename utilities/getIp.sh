#-o  show only the part of a line matching PATTERN
#-E  PATTERN is an extended regular expression (ERE) 
ifconfig | grep -o "inet addr:.* B" | grep -Eo "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"

# | pipe the output to grep

