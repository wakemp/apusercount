!#/usr/local/bin/bash
street vicap 
awk '{print $1}' 
xargs -t -I {} snmpwalk -v 2c -c XXX {} .1.3.6.1.4.1.9.9.273.1.1.2 
grep -v "Gauge32: 0"