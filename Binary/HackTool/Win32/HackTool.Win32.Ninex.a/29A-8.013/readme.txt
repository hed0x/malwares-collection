

Package: 9xrx.rar
Date: October 17th, 2004
Author: archphase archphase[at]hackermail.com
Site: http://archphase.united.net.kg
Team: http://www.censorednet.org

Summary:  9xRX (9x - RootXit) is a rootkit for
9x systems hiding Files, Processes, and Registry
entries.  Recently ('04) Gergely Erdélyi of F-Secure
wrote a paper documenting how stealth malware never
seemed to really effect the 9x market.  To date
there are 0 kernel rootkits so with 9xRX I hope
to spur a change in that.  9xRX operates on the
kernel level installing an IFS Hook and monitoring
FIND_NEXT calls, unfortunally this was undocumented.
9xRX hides processes by rounding the PDB and then
hunting for the desired string, Process32First/Next
will fail if given a strlen of 0.  Registry entries
are hooked with the common and known Hook_Device_Service
which was demonstrated in phreedom magazine in an
article by Solar Eclipse.

 Notes:
  - File Hiding
     a. The way 9x sends the string of the file were
       hiding is akward and thus you need to corspond
       to the exact file name, it's not a case insenstive
       match.
     b. Don't combine RX.VxD and RXFile.VxD into one, IFS
       functions appear to not function if such a condition
       is met.
  - Process Hiding
     a. Again the search is case insenstive, I hope to get
       Numega's CVXD kit and thus can develop with strcmpi
       in the next (?) version.
  - Registry Hiding:
     a. I experinced an odd bug, however it doesn't appear
       to persist on my Virtual Machine or my ME box now, since
       I use SEH i believe I knocked off the handler while monitoring
       please report this as a bug if your affected.

  Infos:
   - I wrote this more as POC, it's not ment to be fully deployed
    and the question always was and still is why deploy a rootkit
    on a 9x machine, it's true, no corporate company is going to
    rely on a 9x machine, however if they do this is here, this can
    also be used for us virus writers.
   - 9xRX uses Pid2PDB, Copyright (c) 1995-2004 Matt Pietrek
   - 9xRX uses a derogative of Solar Eclipses RegEnumHook.
   - 9xRX uses a derogative of Iczelion's Dynamic VxD Example.

  Regards,
  archphase
    ("www.censorednet.org - akcom, drocon, stm, ... join if you can H$X")
	
	<drocon> ok release 9xrx
	<archphase> alright
	<archphase> let me rar it