#
# Makefile	Main Makefile for the net-tools Package

# path to the net-lib support library. Default: lib
NET_LIB_PATH = lib
NET_LIB_NAME = net-tools

PROGS := ifconfig netstat

#-include config.make
#ifeq ($(HAVE_IP_TOOLS),1)
#PROGS   += iptunnel ipmaddr
#endif

# Compiler and Linker Options
# You may need to uncomment and edit these if you are using libc5 and IPv6.
#COPTS = -D_GNU_SOURCE -O2 -Wall -g -DHACKR0X # -I/usr/inet6/include
COPTS = -D_GNU_SOURCE -O2 -Wall -g -I/usr/inet6/include
ifeq ($(origin LOPTS), undefined)
LOPTS = 
endif
RESLIB = # -L/usr/inet6/lib -linet6

ifeq ($(HAVE_AFDECnet),1)
DNLIB = -ldnet
endif

# -------- end of user definitions --------

MAINTAINER = Philip.Blundell@pobox.com
RELEASE	   = 1.55

.EXPORT_ALL_VARIABLES:

ifeq ("$(NET_LIB_PATH)","lib2")
TOPDIR   = ..
else
TOPDIR  := $(shell if [ "$$PWD" != "" ]; then echo $$PWD; else pwd; fi)
endif

NET-LIB = $(NET_LIB_PATH)/lib$(NET_LIB_NAME).a

CFLAGS	= $(COPTS) -I. -idirafter ./include/ -I$(NET_LIB_PATH)
LDFLAGS	= $(LOPTS) -L$(NET_LIB_PATH)

SUBDIRS	=	$(NET_LIB_PATH)/

ifeq ($(origin CC), undefined)
CC	= gcc
endif
LD	= $(CC)

NLIB	= -l$(NET_LIB_NAME)

MDEFINES = COPTS='$(COPTS)' LOPTS='$(LOPTS)' TOPDIR='$(TOPDIR)'

%.o:		%.c config.h version.h intl.h net-features.h $<
		$(CC) $(CFLAGS) -c $<

all:		config.h version.h subdirs $(PROGS)

config: 	cleanconfig config.h

mostlyclean:
		rm -f *.o DEADJOE config.new *~ *.orig lib/*.o

clean: mostlyclean
		rm -f $(PROGS)
		@for i in $(SUBDIRS); do (cd $$i && $(MAKE) clean) ; done
#		@cd po && $(MAKE) clean

cleanconfig:
		rm -f config.h

clobber: 	clean
		rm -f $(PROGS) config.h version.h config.status config.make
		@for i in $(SUBDIRS); do (cd $$i && $(MAKE) clobber) ; done


dist: 		clobber
		@echo Creating net-tools-$(RELEASE) in ..
		@tar -cvz -f ../net-tools-$(RELEASE).tar.gz -C .. net-tools


config.h: 	config.in Makefile 
		@echo "Configuring the Linux net-tools (NET-3 Base Utilities)..." ; echo
		@if [ config.status -nt config.in ]; \
			then ./configure.sh config.status; \
		   else ./configure.sh config.in; \
		 fi


version.h:	Makefile
		@echo "#define RELEASE \"net-tools $(RELEASE)\"" >version.h


$(NET-LIB):	config.h version.h intl.h libdir

libdir:
		@$(MAKE) -C $(NET_LIB_PATH) $(MDEFINES)

subdirs:
		@for i in $(SUBDIRS); do $(MAKE) -C $$i $(MDEFINES) ; done

ifconfig:	$(NET-LIB) ifconfig.o
		$(CC) $(LDFLAGS) -o ifconfig ifconfig.o $(NLIB) $(RESLIB)

route:		$(NET-LIB) route.o
		$(CC) $(LDFLAGS) -o route route.o $(NLIB) $(RESLIB)

netstat:	$(NET-LIB) netstat.o statistics.o
		$(CC) $(LDFLAGS) -o netstat netstat.o statistics.o $(NLIB) $(RESLIB)
