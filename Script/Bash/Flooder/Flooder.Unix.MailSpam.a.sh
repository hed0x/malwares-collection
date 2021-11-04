#!/bin/sh

# A very simple mass emailer (spoofer) with attachment support. You must supply
# your own email lists, as well as smtp server w/ relaying
# Coded 02/02/02 by Merlion .::Parenthesis / Are You Fearless::. 
#  http://fraggle.ath.cx | http://www.areyoufearless.com


relayserv="$1"
if [ $1 = "" ]; then
echo "Usage is: filename <relay IP>"
exit 1
fi

# Replace the following address with your email
LOGNAME=email@webpage.com

# Replace the following with a path to a textfile containing
# the text you wish to send in the message body
TXTFILE=/home/loww/textfile

# Replace the following with a path to the file to attach		
ATTFILE=/home/loww/Red2.jpg.pif	

# Replace the following with the subject of the message
SUBJECT="New webpage!"

# Replace the following with the path to a text file containing
# the list of email adresses (newline seperated)
EMAILLIST=/home/loww/email.txt
		
for addy in `cat $EMAILLIST`; do
MAILTO=$addy
echo "From: $LOGNAME\nTo: $MAILTO\nSubject: $SUBJECT\n\
Mime-Version: 1.0\nContent-Type: text/plain\n" > /tmp/file
cat $TXTFILE >> /tmp/file
sendmail -t -oi < /tmp/file
done
rm -f /tmp/file
exit 0
