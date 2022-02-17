# make file for the IP/TCP/POP3 server for VAX/UNIX 4.3BSD (now Linux)

# Set the c compiler and optimizing options
CC = gcc
COPTS = -O3 -m486 -fomit-frame-pointer

# Set the directory prefix for install
# This is a master value usually left blank.  It is mainly used for 
# testing so that in.pop3d and the work directory will be in a temporary
# area.
DESTDIR =

# -DTACACS_AUTH for that form of authentication.
# -DSHADOWPWD   for shadow authentication
# -DLINUX       for Linux (not tested anywhere else lately?)
# -DVIRTUAL	for VIRTUAL hosting (new, not functional yet).
# -DQMAIL	for ~/Mailbox QMAIL machines
# -DSTANDALONE	for standalone, non-inetd server
#CFLAGS= -O3 -m486 -fomit-frame-pointer -DSHADOWPWD -DLINUX 
CFLAGS= $(COPTS) -DSHADOWPWD -DLINUX -DSTANDALONE

# Set the mail spool directory for your OS.  Usually one of the following:
#MAILDIR= /var/spool/mail/
MAILDIR= /usr/spool/mail/

# Set the POP temporary work directory.  A copy of the mail spool file is
# put in this directory while the mail is being read.
# Comment out if using -DQMAIL
POPWORK= /usr/tmp/.pop/

CFLAGS+= -DDEF_MAIL_DIR=\"$(MAILDIR)\" -DDEF_POP3_DIR=\"$(POPWORK)\"

# LIBS = -lshadow for shadow authentication, Add -lcrypt here when compiling
# on a glibc system with an own libcrypt in /lib
LIBS  = -lshadow #-lcrypt
# On RedHat 6.x, comment out above, and uncomment the line below instead
#   (since separate shadow library is not needed, only crypt):
# LIBS  = -lcrypt

# Set the installation directory for the binary.  If you are upgrading,
# this should match the directory where the current version lives.
BINDIR = usr/sbin

# Where should the man page live?
MANDIR = usr/man/man1

# Set the executable name.  This must match whatever is in /etc/inetd.conf
EXENAME= in.pop3d

OBJS  = server.o main.o folder.o util.o md5.o apop.o tacacs_auth.o virtual.o md5/md5.o

all: $(EXENAME)

install: all
	install -c -m 700 $(EXENAME) $(DESTDIR)/$(BINDIR)/$(EXENAME)
	install -c -m 644 pop3d.1 $(DESTDIR)/$(MANDIR)
ifdef POPWORK
	install -d -m 1775 $(DESTDIR)/$(POPWORK)
endif

clean:
	rm -f *.o */*.o *~ core $(EXENAME)


$(EXENAME): $(OBJS)
	$(CC) -o $(EXENAME) $(OBJS) $(LIBS)

server.o: server.c
main.o:	main.c pop3.h
folder.o: folder.c pop3.h
util.o: util.c pop3.h
md5/md5.o: md5/md5.c md5/md5.h
md5.o: md5.c md5/md5.h pop3.h
apop.o: apop.c pop3.h
tacacs_auth.o: tacacs_auth.c tacacs.h
virtual.o: virtual.c pop3.h
