#!/bin/sh

#  Hostbased Firewall.sh
#  
#
#  Created by Stuart Harrop on 2017-03-23.
#

CHECK=`/usr/bin/defaults read /Library/Preferences/com.apple.alf globalstate`

echo Checking Firewall state before IF is $CHECK

if [ "$CHECK" = "0" ]; then
    /usr/bin/defaults write /Library/Preferences/com.apple.alf globalstate "1"
# update inventory for reporting purposes
    jamf recon
else
    echo Firewall state is still $CHECK 
fi

RECHECK=`/usr/bin/defaults read /Library/Preferences/com.apple.alf globalstate`

echo Rechecked firewall state is $RECHECK