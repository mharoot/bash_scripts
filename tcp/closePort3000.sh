#closes port 3000
iptables -A INPUT -p tcp --dport 3000 -j DROP
